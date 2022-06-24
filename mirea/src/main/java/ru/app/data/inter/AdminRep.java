package ru.mirea.data.inter;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.mirea.data.model.Admin;

public interface AdminRep extends JpaRepository<Admin, Integer> {
}
