package com.example.inventory.config;

import com.example.inventory.model.User;
import com.example.inventory.repo.UserRepository;
import org.springframework.boot.CommandLineRunner;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.crypto.password.PasswordEncoder;

@Configuration
public class InitialDataLoader {

    @Bean
    CommandLineRunner initUsers(UserRepository userRepo, PasswordEncoder encoder) {
        return args -> {
            if (userRepo.findByUsername("admin").isEmpty()) {
                User admin = User.builder()
                        .username("admin")
                        .password(encoder.encode("admin123"))
                        .roles("ROLE_ADMIN,ROLE_USER")
                        .build();
                userRepo.save(admin);
            }
        };
    }
}
