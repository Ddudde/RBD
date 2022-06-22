package ru.mirea.data.inter;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.mirea.data.model.Librarian;

public interface LibrarianRep extends JpaRepository<Librarian, Integer> {
}
