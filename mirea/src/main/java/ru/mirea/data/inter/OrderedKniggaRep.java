package ru.mirea.data.inter;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.mirea.data.model.Ordered_knigga;

public interface OrderedKniggaRep extends JpaRepository<Ordered_knigga, Integer> {
}
