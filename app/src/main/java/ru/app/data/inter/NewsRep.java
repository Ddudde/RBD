package ru.app.data.inter;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.app.data.model.News;

public interface NewsRep extends JpaRepository<News, Integer> {
}
