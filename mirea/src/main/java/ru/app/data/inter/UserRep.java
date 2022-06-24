package ru.mirea.data.inter;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.mirea.data.model.User;

public interface UserRep extends JpaRepository<User, Integer> {
    User findByUsername(String username);
}
