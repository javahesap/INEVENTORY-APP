package com.example.inventory.repo.spec;


import com.example.inventory.model.Stock;
import org.springframework.data.jpa.domain.Specification;

import jakarta.persistence.criteria.JoinType;

public class StockSpecifications {

    public static Specification<Stock> searchLike(String q) {
        return (root, query, cb) -> {
            if (q == null || q.isBlank()) return cb.conjunction();
            var like = "%" + q.toLowerCase() + "%";

            var productJoin = root.join("product", JoinType.LEFT);
            var warehouseJoin = root.join("warehouse", JoinType.LEFT);

            // quantity sayısal: stringe çevrilmiş q ile eşleştirmeyelim; sadece ürün/depo adı arayalım
            return cb.or(
                cb.like(cb.lower(productJoin.get("name")), like),
                cb.like(cb.lower(warehouseJoin.get("name")), like)
            );
        };
    }
}
