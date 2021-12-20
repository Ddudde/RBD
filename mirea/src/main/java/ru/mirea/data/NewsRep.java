package ru.mirea.data;

import org.springframework.data.jpa.repository.JpaRepository;

public interface NewsRep extends JpaRepository<News, Integer> {
}
