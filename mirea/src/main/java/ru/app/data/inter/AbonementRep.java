package ru.mirea.data.inter;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.mirea.data.model.Abonement;

public interface AbonementRep extends JpaRepository<Abonement, Integer> {
}
