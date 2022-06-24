package ru.app.data.inter;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.app.data.model.Knigga;

import java.util.List;

public interface KniggaRep extends JpaRepository<Knigga, Integer> {
    List<Knigga> findByIdid(Integer idid);
}
