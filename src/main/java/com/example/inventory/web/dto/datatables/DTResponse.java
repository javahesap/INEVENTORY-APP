package com.example.inventory.web.dto.datatables;

import java.util.List;
import java.util.Map;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter @Setter @NoArgsConstructor @AllArgsConstructor @Builder
public class DTResponse<T> {
    private int draw;
    private long recordsTotal;     // tüm kayıt sayısı (filtre olmadan)
    private long recordsFiltered;  // filtre sonrası kayıt sayısı
    private List<T> data;          // sayfadaki satırlar
    private Map<String,Object> error; // opsiyonel
}