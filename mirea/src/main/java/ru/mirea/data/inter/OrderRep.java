package ru.mirea.data.inter;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.mirea.data.model.News;
import ru.mirea.data.model.Order;

public interface OrderRep extends JpaRepository<Order, Integer> {
}
