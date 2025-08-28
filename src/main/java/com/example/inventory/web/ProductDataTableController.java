package com.example.inventory.web;



import com.example.inventory.model.Product;
import com.example.inventory.repo.ProductRepository;
import com.example.inventory.repo.spec.ProductSpecifications;
import com.example.inventory.web.dto.datatables.*;
import org.springframework.data.domain.*;
import org.springframework.web.bind.annotation.*;

import java.util.*;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/api/products")
public class ProductDataTableController {

    private final ProductRepository repo;

    public ProductDataTableController(ProductRepository repo) {
        this.repo = repo;
    }

    @PostMapping("/datatable")
    public DTResponse<Map<String,Object>> datatable(@RequestBody DTRequest req) {
        int page = req.getStart() / Math.max(1, req.getLength());
        String sortProp = "id";
        Sort.Direction dir = Sort.Direction.ASC;

        if (req.getOrder()!=null && !req.getOrder().isEmpty()) {
            var ord = req.getOrder().get(0);
            var col = req.getColumns().get(ord.getColumn());
            sortProp = mapColumn(col.getData());
            dir = "desc".equalsIgnoreCase(ord.getDir()) ? Sort.Direction.DESC : Sort.Direction.ASC;
        }
        Pageable pageable = PageRequest.of(page, Math.max(1, req.getLength()), Sort.by(dir, sortProp));

        String q = (req.getSearch()!=null) ? req.getSearch().getValue() : null;
        var spec = ProductSpecifications.searchLike(q);

        long total = repo.count();
        Page<Product> pageData = repo.findAll(spec, pageable);
        long filtered = pageData.getTotalElements();

        List<Map<String,Object>> rows = pageData.getContent().stream().map(p -> {
            Map<String,Object> m = new java.util.HashMap<>();
            m.put("id", p.getId());
            m.put("productCode", p.getProductCode());
            m.put("name", p.getName());
            m.put("category", p.getCategory()!=null ? p.getCategory().getName() : "");
            m.put("unit", p.getUnit()!=null ? p.getUnit() : "");
            m.put("createdAt", p.getCreatedAt()!=null ? p.getCreatedAt().toString() : "");
            return m;
        }).collect(java.util.stream.Collectors.toList());

        return DTResponse.<Map<String,Object>>builder()
                .draw(req.getDraw())
                .recordsTotal(total)
                .recordsFiltered(filtered)
                .data(rows)
                .build();
    }


    private String mapColumn(String dataKey) {
        // DataTables columns[].data -> entity alanı (join sahaları için özel ad veriyoruz)
        return switch (dataKey) {
            case "productCode" -> "productCode";
            case "name" -> "name";
            case "category" -> "category.name"; // Spring Data JPA nested sort destekliyor
            case "unit" -> "unit";
            case "createdAt" -> "createdAt";
            default -> "id";
        };
    }
}
