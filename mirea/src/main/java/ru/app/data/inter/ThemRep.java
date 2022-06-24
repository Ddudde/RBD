package ru.mirea.data.inter;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.mirea.data.model.Them;

public interface ThemRep extends JpaRepository<Them, Integer> {
}
