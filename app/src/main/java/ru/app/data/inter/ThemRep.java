package ru.app.data.inter;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.app.data.model.Them;

public interface ThemRep extends JpaRepository<Them, Integer> {
}
