package com.example.inventory.web;


import com.example.inventory.model.User;
import com.example.inventory.repo.UserRepository;
import com.example.inventory.security.JwtService;
import com.example.inventory.web.dto.AuthRequest;
import com.example.inventory.web.dto.AuthResponse;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@RestController
@RequestMapping("/auth")
public class AuthController {

    private final AuthenticationManager authManager;
    private final JwtService jwtService;
    private final UserRepository userRepository;
    private final PasswordEncoder passwordEncoder;

    public AuthController(
            AuthenticationManager authManager,
            JwtService jwtService,
            UserRepository userRepository,
            PasswordEncoder passwordEncoder
    ) {
        this.authManager = authManager;
        this.jwtService = jwtService;
        this.userRepository = userRepository;
        this.passwordEncoder = passwordEncoder;
    }

    @PostMapping("/login")
    public ResponseEntity<?> login(@RequestBody AuthRequest req) {
        try {
            authManager.authenticate(
                    new UsernamePasswordAuthenticationToken(req.getUsername(), req.getPassword())
            );
        } catch (BadCredentialsException e) {
            return ResponseEntity.status(401).body(Map.of("error", "Bad credentials"));
        }

        User u = userRepository.findByUsername(req.getUsername()).orElseThrow();
        String token = jwtService.generateToken(u.getUsername(), Map.of("roles", u.getRoles()));

        AuthResponse resp = AuthResponse.builder()
                .token(token)
                .username(u.getUsername())
                .roles(u.getRoles())
                .build();

        return ResponseEntity.ok(resp);
    }

    @PostMapping("/register")
    public ResponseEntity<?> register(@RequestBody AuthRequest req) {
        if (userRepository.findByUsername(req.getUsername()).isPresent()) {
            return ResponseEntity.badRequest().body(Map.of("error", "Username taken"));
        }
        User u = User.builder()
                .username(req.getUsername())
                .password(passwordEncoder.encode(req.getPassword()))
                .roles("ROLE_USER")
                .build();

        userRepository.save(u);
        return ResponseEntity.ok(Map.of("message", "Registered"));
    }
}
