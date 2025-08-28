package com.example.inventory.repo.spec;



import com.example.inventory.model.Product;
import com.example.inventory.model.Category;
import org.springframework.data.jpa.domain.Specification;

import jakarta.persistence.criteria.JoinType;

public class ProductSpecifications {

    public static Specification<Product> searchLike(String q) {
        return (root, query, cb) -> {
            if (q == null || q.isBlank()) return cb.conjunction();
            var like = "%" + q.toLowerCase() + "%";
            var categoryJoin = root.join("category", JoinType.LEFT);
            return cb.or(
                cb.like(cb.lower(root.get("productCode")), like),
                cb.like(cb.lower(root.get("name")), like),
                cb.like(cb.lower(root.get("description")), like),
                cb.like(cb.lower(categoryJoin.get("name")), like)
            );
        };
    }
}

