package com.example.inventory.web;



import com.example.inventory.model.User;
import com.example.inventory.repo.UserRepository;
import com.example.inventory.web.dto.UserDTO;
import com.example.inventory.web.dto.CreateUserRequest;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.*;
import com.example.inventory.web.dto.UpdateUserRequest; 

import java.util.List;

@RestController
@RequestMapping("/api/users")
@PreAuthorize("hasRole('ADMIN')") // Bu controller'daki tüm uçlar admin ister
public class UserController {

    private final UserRepository userRepo;
    private final PasswordEncoder encoder;

    public UserController(UserRepository userRepo, PasswordEncoder encoder) {
        this.userRepo = userRepo;
        this.encoder = encoder;
    }

    @GetMapping
    public List<UserDTO> all() {
        return userRepo.findAll().stream().map(this::toDTO).toList();
    }

    @PostMapping
    public ResponseEntity<?> create(@RequestBody CreateUserRequest req) {
        if (userRepo.findByUsername(req.getUsername()).isPresent()) {
            return ResponseEntity.badRequest().body(
                java.util.Map.of("error", "Username taken")
            );
        }
        String roles = req.isAdmin() ? "ROLE_ADMIN,ROLE_USER" : "ROLE_USER";
        User u = User.builder()
                .username(req.getUsername())
                .password(encoder.encode(req.getPassword()))
                .roles(roles)
                .build();
        userRepo.save(u);
        return ResponseEntity.ok(toDTO(u));
    }

    @PutMapping("/{id}")
    public ResponseEntity<?> update(@PathVariable Long id, @RequestBody UpdateUserRequest req) {
        User u = userRepo.findById(id).orElseThrow();
        if (req.getRoles() != null && !req.getRoles().isBlank()) {
            u.setRoles(req.getRoles().trim());
        }
        if (req.getPassword() != null && !req.getPassword().isBlank()) {
            u.setPassword(encoder.encode(req.getPassword()));
        }
        userRepo.save(u);
        return ResponseEntity.ok(toDTO(u));
    }

    @DeleteMapping("/{id}")
    public void delete(@PathVariable Long id) {
        userRepo.deleteById(id);
    }

    private UserDTO toDTO(User u) {
        return UserDTO.builder()
                .id(u.getId())
                .username(u.getUsername())
                .roles(u.getRoles())
                .createdAt(u.getCreatedAt())
                .build();
    }
}
