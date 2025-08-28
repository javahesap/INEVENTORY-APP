package com.example.inventory.web;

import com.example.inventory.model.Customer;
import com.example.inventory.repo.CustomerRepository;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@RestController
@RequestMapping("/api/customers")
public class CustomerController {
    private final CustomerRepository repo;
    public CustomerController(CustomerRepository repo) { this.repo = repo; }

    @GetMapping public List<Customer> all() { return repo.findAll(); }
    @PostMapping public Customer create(@RequestBody Customer c) { return repo.save(c); }
    @PutMapping("/{id}") public Customer update(@PathVariable Long id, @RequestBody Customer c) {
        c.setId(id); return repo.save(c);
    }
    @DeleteMapping("/{id}") public void delete(@PathVariable Long id) { repo.deleteById(id); }
}
