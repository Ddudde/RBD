package ru.mirea.data.inter;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.mirea.data.model.Pasport;

public interface PasportRep extends JpaRepository<Pasport, Integer> {
}
