package ru.app.data.inter;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.app.data.model.User;

public interface UserRep extends JpaRepository<User, Integer> {
    User findByUsername(String username);
}
