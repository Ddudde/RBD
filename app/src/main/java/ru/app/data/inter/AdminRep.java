package ru.app.data.inter;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.app.data.model.Admin;

public interface AdminRep extends JpaRepository<Admin, Integer> {
}
