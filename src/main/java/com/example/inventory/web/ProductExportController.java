package com.example.inventory.web;



import com.example.inventory.model.Product;
import com.example.inventory.repo.ProductRepository;
import com.example.inventory.repo.spec.ProductSpecifications;
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
@RequestMapping("/api/products")
public class ProductExportController {

    private final ProductRepository repo;

    public ProductExportController(ProductRepository repo) {
        this.repo = repo;
    }

    // Basit: ?q= araması ve sort=alan,dir (örn: sort=name,asc)
    @GetMapping(value="/export.xlsx")
    public ResponseEntity<byte[]> exportExcel(
            @RequestParam(required=false) String q,
            @RequestParam(required=false, defaultValue="id,asc") String sort
    ) throws Exception {
        Specification<Product> spec = ProductSpecifications.searchLike(q);

        String[] sortParts = sort.split(",",2);
        String prop = sortParts[0];
        Sort.Direction dir = (sortParts.length>1 && "desc".equalsIgnoreCase(sortParts[1]))
                ? Sort.Direction.DESC : Sort.Direction.ASC;

        List<Product> list = repo.findAll(spec, Sort.by(dir, prop));

        try (Workbook wb = new XSSFWorkbook(); ByteArrayOutputStream bos = new ByteArrayOutputStream()) {
            Sheet sh = wb.createSheet("Products");
            int r = 0;
            Row header = sh.createRow(r++);
            String[] cols = {"ID","Kod","Ad","Kategori","Birim","Oluşturma"};
            for (int i=0;i<cols.length;i++) header.createCell(i).setCellValue(cols[i]);

            for (Product p: list) {
                Row row = sh.createRow(r++);
                row.createCell(0).setCellValue(p.getId());
                row.createCell(1).setCellValue(nvl(p.getProductCode()));
                row.createCell(2).setCellValue(nvl(p.getName()));
                row.createCell(3).setCellValue(p.getCategory()!=null ? nvl(p.getCategory().getName()) : "");
                row.createCell(4).setCellValue(nvl(p.getUnit()));
                row.createCell(5).setCellValue(p.getCreatedAt()!=null ? p.getCreatedAt().toString() : "");
            }
            for (int i=0;i<cols.length;i++) sh.autoSizeColumn(i);

            wb.write(bos);
            String filename = URLEncoder.encode("urunler.xlsx", StandardCharsets.UTF_8).replace("+","%20");
            return ResponseEntity.ok()
                    .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename*=UTF-8''"+filename)
                    .contentType(MediaType.parseMediaType(
                            "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"))
                    .body(bos.toByteArray());
        }
    }

    private String nvl(String s){ return s==null? "": s; }
}
