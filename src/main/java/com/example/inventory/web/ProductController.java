package com.example.inventory.web;

import com.example.inventory.model.Product;
import com.example.inventory.repo.ProductRepository;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@RestController
@RequestMapping("/api/products")
public class ProductController {
    private final ProductRepository repo;
    public ProductController(ProductRepository repo) { this.repo = repo; }

    @GetMapping public List<Product> all(@RequestParam(required = false) Long categoryId) {
        if (categoryId != null) return repo.findByCategoryId(categoryId);
        return repo.findAll();
    }
    @PostMapping public Product create(@RequestBody Product p) { return repo.save(p); }
    @PutMapping("/{id}") public Product update(@PathVariable Long id, @RequestBody Product p) {
        p.setId(id); return repo.save(p);
    }
    @DeleteMapping("/{id}") public void delete(@PathVariable Long id) { repo.deleteById(id); }
}
