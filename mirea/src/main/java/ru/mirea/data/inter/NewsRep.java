package ru.mirea.data.inter;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.mirea.data.model.News;

public interface NewsRep extends JpaRepository<News, Integer> {
}
