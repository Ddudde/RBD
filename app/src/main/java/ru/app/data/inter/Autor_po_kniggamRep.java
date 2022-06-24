package ru.app.data.inter;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.app.data.model.Autor_po_kniggam;

public interface Autor_po_kniggamRep extends JpaRepository<Autor_po_kniggam, Integer> {
}
