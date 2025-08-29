package com.example.inventory.web;

import com.example.inventory.report.JasperReportService;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.export.ooxml.JRXlsxExporter;
import net.sf.jasperreports.export.*;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.*;
import org.springframework.web.bind.annotation.*;

import java.io.ByteArrayOutputStream;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/reports")
public class ReportController {

    private final JasperReportService jasper;

    public ReportController(JasperReportService jasper) {
        this.jasper = jasper;
    }

    // 1) Products raporu (PDF)
    @GetMapping("/products.pdf")
    public ResponseEntity<byte[]> productsPdf(@RequestParam(required = false) String q) throws Exception {
        Map<String,Object> params = new HashMap<>();
        params.put("P_QUERY", q);

        JasperPrint jp = jasper.fillWithJdbc("reports/products.jrxml", params);
        byte[] pdf = jasper.exportPdf(jp);

        String filename = URLEncoder.encode("urunler.pdf", StandardCharsets.UTF_8).replace("+","%20");
        return ResponseEntity.ok()
            .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename*=UTF-8''"+filename)
            .contentType(MediaType.APPLICATION_PDF)
            .body(pdf);
    }

    // 2) Products raporu (XLSX)
    @GetMapping("/products.xlsx")
    public ResponseEntity<byte[]> productsXlsx(@RequestParam(required = false) String q) throws Exception {
        Map<String,Object> params = new HashMap<>();
        params.put("P_QUERY", q);

        JasperPrint jp = jasper.fillWithJdbc("reports/products.jrxml", params);

        ByteArrayOutputStream bos = new ByteArrayOutputStream();
        JRXlsxExporter exporter = new JRXlsxExporter();
        exporter.setExporterInput(new SimpleExporterInput(jp));
        exporter.setExporterOutput(new SimpleOutputStreamExporterOutput(bos));
        SimpleXlsxReportConfiguration cfg = new SimpleXlsxReportConfiguration();
        cfg.setDetectCellType(true);
        cfg.setSheetNames(new String[]{"Ürünler"});
        exporter.setConfiguration(cfg);
        exporter.exportReport();

        String filename = URLEncoder.encode("urunler.xlsx", StandardCharsets.UTF_8).replace("+","%20");
        return ResponseEntity.ok()
            .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename*=UTF-8''"+filename)
            .contentType(MediaType.parseMediaType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"))
            .body(bos.toByteArray());
    }

    // 3) Stock Movements raporu (PDF) - tarih/warehouse filtreli
    @GetMapping("/movements.pdf")
    public ResponseEntity<byte[]> movementsPdf(
        @RequestParam(required=false) @DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME) LocalDateTime from,
        @RequestParam(required=false) @DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME) LocalDateTime to,
        @RequestParam(required=false) Long warehouseId
    ) throws Exception {

        Map<String,Object> params = new HashMap<>();
        params.put("P_FROM", from != null ? Timestamp.valueOf(from) : null);
        params.put("P_TO",   to   != null ? Timestamp.valueOf(to)   : null);
        params.put("P_WAREHOUSE_ID", warehouseId);

        JasperPrint jp = jasper.fillWithJdbc("reports/stock_movements.jrxml", params);
        byte[] pdf = jasper.exportPdf(jp);

        String filename = URLEncoder.encode("stok_hareketleri.pdf", StandardCharsets.UTF_8).replace("+","%20");
        return ResponseEntity.ok()
            .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename*=UTF-8''"+filename)
            .contentType(MediaType.APPLICATION_PDF)
            .body(pdf);
    }
    
    
    
    
    @GetMapping("/productswithcategory.pdf")
    public ResponseEntity<byte[]> productsPdf() throws Exception {
        Map<String,Object> params = new HashMap<>();
        // jrxml’de parametre yok, o yüzden boş bırakabiliriz

        JasperPrint jp = jasper.fillWithJdbc("reports/pruductWithCategory.jrxml", params);
        byte[] pdf = jasper.exportPdf(jp);

        String filename = URLEncoder.encode("urunler.pdf", StandardCharsets.UTF_8).replace("+","%20");
        return ResponseEntity.ok()
            .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename*=UTF-8''"+filename)
            .contentType(MediaType.APPLICATION_PDF)
            .body(pdf);
    }

    
    
    
    
    
    
    
}
