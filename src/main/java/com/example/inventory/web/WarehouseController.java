package com.example.inventory.web;

import com.example.inventory.model.Warehouse;
import com.example.inventory.repo.WarehouseRepository;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@RestController
@RequestMapping("/api/warehouses")
public class WarehouseController {
    private final WarehouseRepository repo;
    public WarehouseController(WarehouseRepository repo) { this.repo = repo; }

    @GetMapping public List<Warehouse> all() { return repo.findAll(); }
    @PostMapping public Warehouse create(@RequestBody Warehouse w) { return repo.save(w); }
    @PutMapping("/{id}") public Warehouse update(@PathVariable Long id, @RequestBody Warehouse w) {
        w.setId(id); return repo.save(w);
    }
    @DeleteMapping("/{id}") public void delete(@PathVariable Long id) { repo.deleteById(id); }
}
