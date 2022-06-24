package ru.app.data.inter;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.app.data.model.Abonement;

public interface AbonementRep extends JpaRepository<Abonement, Integer> {
}
