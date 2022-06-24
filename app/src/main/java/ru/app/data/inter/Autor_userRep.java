package ru.app.data.inter;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.app.data.model.Autor_user;

public interface Autor_userRep extends JpaRepository<Autor_user, Integer> {
}
