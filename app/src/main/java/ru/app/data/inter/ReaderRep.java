package ru.app.data.inter;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.app.data.model.Reader;

public interface ReaderRep extends JpaRepository<Reader, Integer> {
}
