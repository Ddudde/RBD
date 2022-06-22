package ru.mirea.data.inter;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.mirea.data.model.Knigga;

import java.util.List;

public interface KniggaRep extends JpaRepository<Knigga, Integer> {
    List<Knigga> findByIdid(int idid);
}
