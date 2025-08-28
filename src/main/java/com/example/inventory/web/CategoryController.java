package com.example.inventory.web;

import com.example.inventory.model.Category;
import com.example.inventory.repo.CategoryRepository;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/categories")
public class CategoryController {
    private final CategoryRepository repo;
    public CategoryController(CategoryRepository repo) { this.repo = repo; }

    @GetMapping 
    public List<Category> all() { return repo.findAll(); }
    @PostMapping 
    public Category create(@RequestBody Category c) { return repo.save(c); }
    @PutMapping("/{id}")
    public Category update(@PathVariable Long id, @RequestBody Category c) {
        c.setId(id); return repo.save(c);
    }
    @DeleteMapping("/{id}") 
    public void delete(@PathVariable Long id) { repo.deleteById(id); }
}
