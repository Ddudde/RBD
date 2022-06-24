package ru.app.data.inter;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.app.data.model.Pasport;

public interface PasportRep extends JpaRepository<Pasport, Integer> {
}
