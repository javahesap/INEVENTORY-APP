package com.example.inventory.web;

import com.example.inventory.model.Stock;
import com.example.inventory.repo.StockRepository;
import com.example.inventory.repo.spec.StockSpecifications;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.http.*;
import org.springframework.web.bind.annotation.*;

import java.io.ByteArrayOutputStream;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.List;

@RestController
@RequestMapping("/api/stocks")
public class StockExportController {

    private final StockRepository repo;

    public StockExportController(StockRepository repo) {
        this.repo = repo;
    }

    // /api/stocks/export.xlsx?q=aaa&sort=warehouse.name,desc
    @GetMapping("/export.xlsx")
    public ResponseEntity<byte[]> exportExcel(
            @RequestParam(required=false) String q,
            @RequestParam(required=false, defaultValue="id,asc") String sort
    ) throws Exception {

        Specification<Stock> spec = StockSpecifications.searchLike(q);
        String[] sortParts = sort.split(",",2);
        String prop = sortParts[0];
        Sort.Direction dir = (sortParts.length>1 && "desc".equalsIgnoreCase(sortParts[1]))
                ? Sort.Direction.DESC : Sort.Direction.ASC;

        List<Stock> list = repo.findAll(spec, Sort.by(dir, prop));

        try (Workbook wb = new XSSFWorkbook(); ByteArrayOutputStream bos = new ByteArrayOutputStream()) {
            Sheet sh = wb.createSheet("Stocks");
            int r = 0;
            Row header = sh.createRow(r++);
            String[] cols = {"ID", "Ürün", "Depo", "Miktar"};
            for (int i=0;i<cols.length;i++) header.createCell(i).setCellValue(cols[i]);

            for (Stock s : list) {
                Row row = sh.createRow(r++);
                row.createCell(0).setCellValue(s.getId());
                row.createCell(1).setCellValue(s.getProduct()!=null? s.getProduct().getName() : "");
                row.createCell(2).setCellValue(s.getWarehouse()!=null? s.getWarehouse().getName() : "");
                row.createCell(3).setCellValue(s.getQuantity());
            }
            for (int i=0;i<cols.length;i++) sh.autoSizeColumn(i);

            wb.write(bos);
            String filename = URLEncoder.encode("stoklar.xlsx", StandardCharsets.UTF_8).replace("+","%20");
            return ResponseEntity.ok()
                    .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename*=UTF-8''"+filename)
                    .contentType(MediaType.parseMediaType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"))
                    .body(bos.toByteArray());
        }
    }
}
