package com.example.inventory.web;


import net.sf.jasperreports.engine.*;
import net.sf.jasperreports.engine.export.ooxml.JRXlsxExporter;
import net.sf.jasperreports.export.*;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.*;
import org.springframework.web.bind.annotation.*;

import javax.sql.DataSource;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.sql.Connection;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

@RestController
@RequestMapping("/reportsfx") // yeni controller
public class ReportFxController {

    private final DataSource dataSource;
    private static final String BASE = "reportsparam/"; // resources/reports/...

    // compile cache
    private final ConcurrentHashMap<String, JasperReport> cache = new ConcurrentHashMap<>();

    public ReportFxController(DataSource dataSource) {
        this.dataSource = dataSource;
    }

    // -----------------------------------------------------------
    // PUBLIC ENDPOINTS (örnek): products body + seçilebilir header/footer
    // header=1/2 , footer=1/2
    // -----------------------------------------------------------
@GetMapping("/products.pdf")
public ResponseEntity<byte[]> productsPdf(
        @RequestParam(defaultValue = "1") int header,
        @RequestParam(defaultValue = "1") int footer,
        @RequestParam(required = false) String q,
        @RequestParam(defaultValue = "Ürünler Raporu") String title,
        @RequestParam(defaultValue = "") String subtitle
) throws Exception {

    Map<String,Object> bodyParams = new HashMap<>();
    if (q != null && !q.isBlank()) {
        bodyParams.put("P_QUERY", " AND p.name LIKE '%" + q + "%'");
    } else {
        bodyParams.put("P_QUERY", "");
    }

    JasperPrint jp = buildReport(
            title,
            subtitle,
            selectHeaderPath(header),
            selectFooterPath(footer),
            BASE + "products_body.jrxml",
            bodyParams   // 🔴 doğru map burada!
    );

    byte[] pdf = JasperExportManager.exportReportToPdf(jp);
    return ResponseEntity.ok()
            .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename*=UTF-8''" + fn("urunler.pdf"))
            .contentType(MediaType.APPLICATION_PDF)
            .body(pdf);
}


    @GetMapping("/products.xlsx")
    public ResponseEntity<byte[]> productsXlsx(
            @RequestParam(defaultValue = "1") int header,
            @RequestParam(defaultValue = "1") int footer,
            @RequestParam(required = false) String q,
            @RequestParam(defaultValue = "Ürünler Raporu") String title,
            @RequestParam(defaultValue = "") String subtitle
    ) throws Exception {


       Map<String,Object> bodyParams = new HashMap<>();
if (q != null && !q.isBlank()) {
    bodyParams.put("P_QUERY", " AND p.name LIKE '%" + q + "%'");
} else {
    bodyParams.put("P_QUERY", "");
}

JasperPrint jp = buildReport(
        title, subtitle,
        selectHeaderPath(header),
        selectFooterPath(footer),
        BASE + "products_body.jrxml",
        bodyParams   // ✅ burası düzeldi
);
        byte[] xlsx = exportXlsx(jp, "Ürünler");
        return ResponseEntity.ok()
                .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename*=UTF-8''" + fn("urunler.xlsx"))
                .contentType(MediaType.parseMediaType(
                        "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"))
                .body(xlsx);
    }

    // -----------------------------------------------------------
    // CORE: master + (header subreport) + (footer subreport) + (body subreport)
    // -----------------------------------------------------------
    private JasperPrint buildReport(
            String title,
            String subtitle,
            String headerJrxml,
            String footerJrxml,
            String bodyJrxml,
            Map<String,Object> bodyParams
    ) throws Exception {

        JasperReport master = compile(BASE + "master_page.jrxml");
        JasperReport header = compile(headerJrxml);
        JasperReport footer = compile(footerJrxml);
        JasperReport body   = compile(bodyJrxml);

        Map<String,Object> masterParams = new HashMap<>();
        masterParams.put("P_TITLE",  nz(title));
        masterParams.put("P_SUBTITLE", nz(subtitle));
        masterParams.put("REPORT_CONNECTION", dataSource.getConnection());


        // --- HEADER PARAMS (mutable + null-safe)
        Map<String,Object> headerParams = new HashMap<>();
        headerParams.put("HP_TITLE", nz(title));
        headerParams.put("HP_SUBTITLE", nz(subtitle));
        masterParams.put("P_HEADER_REPORT", header);
        masterParams.put("P_HEADER_PARAMS", headerParams);

        // --- BODY PARAMS (mutable + null-safe)
        Map<String,Object> bodyParamsMutable = new HashMap<>();
        if (bodyParams != null) bodyParamsMutable.putAll(bodyParams);
        masterParams.put("P_BODY_REPORT", body);
        masterParams.put("P_BODY_PARAMS", bodyParamsMutable);

        // --- FOOTER PARAMS (mutable)
        Map<String,Object> footerParams = new HashMap<>();
        footerParams.put("FP_NOTE", "© " + java.time.Year.now().getValue() + " Company");
        masterParams.put("P_FOOTER_REPORT", footer);
        masterParams.put("P_FOOTER_PARAMS", footerParams);

        try (Connection conn = dataSource.getConnection()) {
            return JasperFillManager.fillReport(master, masterParams, conn);
        }
    }

    // Küçük yardımcı
    private static String nz(String s){ return (s == null) ? "" : s; }


    // -----------------------------------------------------------
    // Helpers
    // -----------------------------------------------------------
    private JasperReport compile(String path) throws Exception {
        return cache.computeIfAbsent(path, p -> {
            try (InputStream in = getClass().getClassLoader().getResourceAsStream(p)) {
                if (in == null) throw new RuntimeException("JRXML bulunamadı: " + p);
                return JasperCompileManager.compileReport(in);
            } catch (Exception e) {
                throw new RuntimeException("Derlenemedi: " + p + " -> " + e.getMessage(), e);
            }
        });
    }

    private static String fn(String name) {
        return URLEncoder.encode(name, StandardCharsets.UTF_8).replace("+","%20");
    }

    private byte[] exportXlsx(JasperPrint jp, String sheetName) throws JRException {
        ByteArrayOutputStream bos = new ByteArrayOutputStream();
        JRXlsxExporter ex = new JRXlsxExporter();
        ex.setExporterInput(new SimpleExporterInput(jp));
        ex.setExporterOutput(new SimpleOutputStreamExporterOutput(bos));
        SimpleXlsxReportConfiguration cfg = new SimpleXlsxReportConfiguration();
        cfg.setDetectCellType(true);
        cfg.setSheetNames(new String[]{sheetName});
    ex.setConfiguration(cfg);
    return bos.toByteArray();
    }

    private String selectHeaderPath(int header) {
        return switch (header) {
            case 2 -> BASE + "header_logo_title.jrxml";
            case 1 -> BASE + "header_simple.jrxml";
            default -> BASE + "header_simple.jrxml";
        };
    }

    private String selectFooterPath(int footer) {
        return switch (footer) {
            case 2 -> BASE + "footer_signature.jrxml";
            case 1 -> BASE + "footer_pagenum.jrxml";
            default -> BASE + "footer_pagenum.jrxml";
        };
    }
}
