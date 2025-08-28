package com.example.inventory.web;



import com.example.inventory.model.Stock;
import com.example.inventory.repo.StockRepository;
import com.example.inventory.repo.spec.StockSpecifications;
import com.example.inventory.web.dto.datatables.DTRequest;
import com.example.inventory.web.dto.datatables.DTResponse;
import org.springframework.data.domain.*;
import org.springframework.web.bind.annotation.*;

import java.util.*;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/api/stocks")
public class StockDataTableController {

    private final StockRepository repo;

    public StockDataTableController(StockRepository repo) {
        this.repo = repo;
    }

    @PostMapping("/datatable")
    public DTResponse<Map<String,Object>> datatable(@RequestBody DTRequest req) {
        // sayfa/sıralama
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

        // arama
        String q = (req.getSearch()!=null) ? req.getSearch().getValue() : null;
        var spec = StockSpecifications.searchLike(q);

        long total = repo.count();
        Page<Stock> pageData = repo.findAll(spec, pageable);
        long filtered = pageData.getTotalElements();

        // satırlar
        List<Map<String,Object>> rows = pageData.getContent().stream().map(s -> {
            Map<String,Object> m = new HashMap<>();
            m.put("id", s.getId());
            m.put("product", s.getProduct()!=null ? s.getProduct().getName() : "");
            m.put("warehouse", s.getWarehouse()!=null ? s.getWarehouse().getName() : "");
            m.put("quantity", s.getQuantity());
            return m;
        }).collect(Collectors.toList());

        return DTResponse.<Map<String,Object>>builder()
                .draw(req.getDraw())
                .recordsTotal(total)
                .recordsFiltered(filtered)
                .data(rows)
                .build();
    }

    private String mapColumn(String dataKey) {
        // DataTables columns[].data -> entity property path
        return switch (dataKey) {
            case "product" -> "product.name";     // nested sort
            case "warehouse" -> "warehouse.name"; // nested sort
            case "quantity" -> "quantity";
            default -> "id";
        };
    }
}
