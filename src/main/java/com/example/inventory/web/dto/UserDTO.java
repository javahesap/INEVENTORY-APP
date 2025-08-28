package com.example.inventory.web.dto;



import lombok.*;
import java.time.LocalDateTime;

@Getter @Setter @NoArgsConstructor @AllArgsConstructor @Builder
public class UserDTO {
    private Long id;
    private String username;
    private String roles; // "ROLE_ADMIN,ROLE_USER"
    private LocalDateTime createdAt;
}