package com.example.inventory.service;

import com.example.inventory.model.Stock;
import com.example.inventory.model.StockMovement;
import com.example.inventory.repo.StockMovementRepository;
import com.example.inventory.repo.StockRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Optional;

@Service
public class StockService {

    private final StockRepository stockRepo;
    private final StockMovementRepository moveRepo;

    public StockService(StockRepository stockRepo, StockMovementRepository moveRepo) {
        this.stockRepo = stockRepo;
        this.moveRepo = moveRepo;
    }

    @Transactional
    public StockMovement createMovement(StockMovement movement) {
        // Find or create stock row
        Optional<Stock> stockOpt = stockRepo.findAll().stream()
                .filter(s -> s.getProduct().getId().equals(movement.getProduct().getId())
                        && s.getWarehouse().getId().equals(movement.getWarehouse().getId()))
                .findFirst();

        Stock stock = stockOpt.orElseGet(() -> {
            Stock s = new Stock();
            s.setProduct(movement.getProduct());
            s.setWarehouse(movement.getWarehouse());
            s.setQuantity(0.0);
            return s;
        });

        double q = stock.getQuantity();
        if (movement.getMovementType() == StockMovement.MovementType.IN) {
            stock.setQuantity(q + movement.getQuantity());
        } else {
            if (q < movement.getQuantity()) {
                throw new IllegalStateException("Yetersiz stok: mevcut " + q + ", istenen " + movement.getQuantity());
            }
            stock.setQuantity(q - movement.getQuantity());
        }

        stockRepo.save(stock);
        return moveRepo.save(movement);
    }
}
