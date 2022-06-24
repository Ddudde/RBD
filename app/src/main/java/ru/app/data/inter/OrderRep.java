package ru.app.data.inter;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.app.data.model.Order;

public interface OrderRep extends JpaRepository<Order, Integer> {
}
