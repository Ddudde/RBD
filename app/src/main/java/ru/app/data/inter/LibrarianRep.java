package ru.app.data.inter;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.app.data.model.Librarian;

public interface LibrarianRep extends JpaRepository<Librarian, Integer> {
}
