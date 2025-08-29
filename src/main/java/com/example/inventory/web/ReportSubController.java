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
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

@RestController
@RequestMapping("/reportssub")
public class ReportSubController {

    private final DataSource dataSource;

    // --- Basit compile cache (classpath'ten JRXML -> JasperReport) ---
    private final ConcurrentHashMap<String, JasperReport> reportCache = new ConcurrentHashMap<>();

    public ReportSubController(DataSource dataSource) {
        this.dataSource = dataSource;
    }

    // -----------------------
    // Yardımcı: Master + Body
    // -----------------------
    private JasperPrint fillMasterWithBody(String title,
                                           String bodyJrxmlClasspath,
                                           Map<String, Object> bodyParams) throws Exception {

        JasperReport master = loadReportFromClasspath("raprotscommon/common_master.jrxml");
        JasperReport body   = loadReportFromClasspath(bodyJrxmlClasspath);

        Map<String, Object> masterParams = new HashMap<>();
        masterParams.put("P_TITLE", title);
        masterParams.put("P_SUBREPORT", body);
        masterParams.put("P_SUBREPORT_PARAMS", bodyParams != null ? bodyParams : new HashMap<>());

        try (Connection conn = dataSource.getConnection()) {
            return JasperFillManager.fillReport(master, masterParams, conn);
        }
    }

    private JasperReport loadReportFromClasspath(String classpathLocation) throws Exception {
        return reportCache.computeIfAbsent(classpathLocation, path -> {
            try (InputStream in = getClass().getClassLoader().getResourceAsStream(path)) {
                if (in == null) {
                    throw new RuntimeException("JRXML bulunamadı: " + path);
                }
                return JasperCompileManager.compileReport(in);
            } catch (Exception e) {
                throw new RuntimeException("JRXML derlenemedi: " + path + " -> " + e.getMessage(), e);
            }
        });
    }

    private byte[] exportPdf(JasperPrint jp) throws JRException {
        return JasperExportManager.exportReportToPdf(jp);
    }

    private byte[] exportXlsx(JasperPrint jp, String sheetName) throws JRException {
        ByteArrayOutputStream bos = new ByteArrayOutputStream();
        JRXlsxExporter exporter = new JRXlsxExporter();
        exporter.setExporterInput(new SimpleExporterInput(jp));
        exporter.setExporterOutput(new SimpleOutputStreamExporterOutput(bos));
        SimpleXlsxReportConfiguration cfg = new SimpleXlsxReportConfiguration();
        cfg.setDetectCellType(true);
        if (sheetName != null && !sheetName.isBlank()) {
            cfg.setSheetNames(new String[]{sheetName});
        }
        exporter.setConfiguration(cfg);
        exporter.exportReport();
        return bos.toByteArray();
    }

    private static String fn(String name) {
        return URLEncoder.encode(name, StandardCharsets.UTF_8).replace("+", "%20");
    }

    // ----------------------------------------------------
    // 1) ÜRÜNLER (PDF) -> common_master + products_body
    // ----------------------------------------------------
    @GetMapping("/products.pdf")
    public ResponseEntity<byte[]> productsPdf(@RequestParam(required = false) String q) throws Exception {
        Map<String, Object> bodyParams = new HashMap<>();
        bodyParams.put("P_QUERY", q);

        JasperPrint jp = fillMasterWithBody("Ürünler Raporu", "raprotscommon/products_body.jrxml", bodyParams);
        byte[] pdf = exportPdf(jp);

        return ResponseEntity.ok()
                .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename*=UTF-8''" + fn("urunler.pdf"))
                .contentType(MediaType.APPLICATION_PDF)
                .body(pdf);
    }

    // ----------------------------------------------------
    // 2) ÜRÜNLER (XLSX) -> common_master + products_body
    // ----------------------------------------------------
    @GetMapping("/products.xlsx")
    public ResponseEntity<byte[]> productsXlsx(@RequestParam(required = false) String q) throws Exception {
        Map<String, Object> bodyParams = new HashMap<>();
        bodyParams.put("P_QUERY", q);

        JasperPrint jp = fillMasterWithBody("Ürünler Raporu", "raprotscommon/products_body.jrxml", bodyParams);
        byte[] xlsx = exportXlsx(jp, "Ürünler");

        return ResponseEntity.ok()
                .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename*=UTF-8''" + fn("urunler.xlsx"))
                .contentType(MediaType.parseMediaType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"))
                .body(xlsx);
    }

    // -----------------------------------------------------------------
    // 3) STOK HAREKETLERİ (PDF) -> common_master + stock_movements_body
    // -----------------------------------------------------------------
    @GetMapping("/movements.pdf")
    public ResponseEntity<byte[]> movementsPdf(
            @RequestParam(required = false) @DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME) LocalDateTime from,
            @RequestParam(required = false) @DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME) LocalDateTime to,
            @RequestParam(required = false) Long warehouseId
    ) throws Exception {

        Map<String, Object> bodyParams = new HashMap<>();
        bodyParams.put("P_FROM", from != null ? Timestamp.valueOf(from) : null);
        bodyParams.put("P_TO",   to   != null ? Timestamp.valueOf(to)   : null);
        bodyParams.put("P_WAREHOUSE_ID", warehouseId);

        JasperPrint jp = fillMasterWithBody("Stok Hareketleri Raporu",
                "raprotscommon/stock_movements_body.jrxml", bodyParams);
        byte[] pdf = exportPdf(jp);

        return ResponseEntity.ok()
                .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename*=UTF-8''" + fn("stok_hareketleri.pdf"))
                .contentType(MediaType.APPLICATION_PDF)
                .body(pdf);
    }

    // ----------------------------------------------------
    // 4) ÜRÜNLER + KATEGORİ (PDF/XLSX)
    // ----------------------------------------------------
    @GetMapping("/productswithcategory.pdf")
    public ResponseEntity<byte[]> productsWithCategoryPdf(
            @RequestParam(required = false) String q) throws Exception {

        Map<String, Object> bodyParams = new HashMap<>();
        bodyParams.put("P_QUERY", q);

        JasperPrint jp = fillMasterWithBody("Ürünler (Kategori Bilgisi)",
                "raprotscommon/productWithCategory_body.jrxml", bodyParams);
        byte[] pdf = exportPdf(jp);

        return ResponseEntity.ok()
                .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename*=UTF-8''" + fn("urunler_kategori.pdf"))
                .contentType(MediaType.APPLICATION_PDF)
                .body(pdf);
    }

    @GetMapping("/productswithcategory.xlsx")
    public ResponseEntity<byte[]> productsWithCategoryXlsx(
            @RequestParam(required = false) String q) throws Exception {

        Map<String, Object> bodyParams = new HashMap<>();
        bodyParams.put("P_QUERY", q);

        JasperPrint jp = fillMasterWithBody("Ürünler (Kategori Bilgisi)",
                "raprotscommon/productWithCategory_body.jrxml", bodyParams);
        byte[] xlsx = exportXlsx(jp, "ÜrünlerKategori");

        return ResponseEntity.ok()
                .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename*=UTF-8''" + fn("urunler_kategori.xlsx"))
                .contentType(MediaType.parseMediaType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"))
                .body(xlsx);
    }

    // -----------------------------------------------------------------
    // 5) STOK HAREKETLERİ (XLSX) -> common_master + stock_movements_body
    // -----------------------------------------------------------------
    @GetMapping("/movements.xlsx")
    public ResponseEntity<byte[]> movementsXlsx(
            @RequestParam(required = false) @DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME) LocalDateTime from,
            @RequestParam(required = false) @DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME) LocalDateTime to,
            @RequestParam(required = false) Long warehouseId
    ) throws Exception {

        Map<String, Object> bodyParams = new HashMap<>();
        bodyParams.put("P_FROM", from != null ? Timestamp.valueOf(from) : null);
        bodyParams.put("P_TO",   to   != null ? Timestamp.valueOf(to)   : null);
        bodyParams.put("P_WAREHOUSE_ID", warehouseId);

        JasperPrint jp = fillMasterWithBody("Stok Hareketleri Raporu",
                "raprotscommon/stock_movements_body.jrxml", bodyParams);
        byte[] xlsx = exportXlsx(jp, "Hareketler");

        return ResponseEntity.ok()
                .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename*=UTF-8''" + fn("stok_hareketleri.xlsx"))
                .contentType(MediaType.parseMediaType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"))
                .body(xlsx);
    }
}
