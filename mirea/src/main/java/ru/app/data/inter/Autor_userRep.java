package ru.mirea.data.inter;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.mirea.data.model.Autor_user;

public interface Autor_userRep extends JpaRepository<Autor_user, Integer> {
}
