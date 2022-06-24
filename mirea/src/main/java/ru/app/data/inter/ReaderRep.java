package ru.mirea.data.inter;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.mirea.data.model.Reader;

public interface ReaderRep extends JpaRepository<Reader, Integer> {
}
