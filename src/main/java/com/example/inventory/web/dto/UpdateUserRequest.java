package com.example.inventory.web.dto;

import lombok.*;
import java.time.LocalDateTime;
@Getter @Setter @NoArgsConstructor @AllArgsConstructor @Builder
public class UpdateUserRequest {
    private String roles;         // "ROLE_ADMIN,ROLE_USER" gibi
    private String password;      // opsiyonel: doluysa günceller
}