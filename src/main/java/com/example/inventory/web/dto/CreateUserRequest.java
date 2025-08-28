package com.example.inventory.web.dto;

import lombok.*;
import java.time.LocalDateTime;

@Getter @Setter @NoArgsConstructor @AllArgsConstructor @Builder
public class CreateUserRequest {
    private String username;
    private String password;      // zorunlu
    private boolean admin;        // true ise ROLE_ADMIN ekler
}