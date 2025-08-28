package com.example.inventory.web;

import com.example.inventory.model.Supplier;
import com.example.inventory.repo.SupplierRepository;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@RestController
@RequestMapping("/api/suppliers")
public class SupplierController {
    private final SupplierRepository repo;
    public SupplierController(SupplierRepository repo) { this.repo = repo; }

    @GetMapping public List<Supplier> all() { return repo.findAll(); }
    @PostMapping public Supplier create(@RequestBody Supplier s) { return repo.save(s); }
    @PutMapping("/{id}") public Supplier update(@PathVariable Long id, @RequestBody Supplier s) {
        s.setId(id); return repo.save(s);
    }
    @DeleteMapping("/{id}") public void delete(@PathVariable Long id) { repo.deleteById(id); }
}
