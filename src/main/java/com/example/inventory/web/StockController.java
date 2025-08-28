package com.example.inventory.web;

import com.example.inventory.model.Stock;
import com.example.inventory.repo.StockRepository;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@RestController
@RequestMapping("/api/stocks")
public class StockController {
    private final StockRepository repo;
    public StockController(StockRepository repo) { this.repo = repo; }

    @GetMapping public List<Stock> all() { return repo.findAll(); }
}
