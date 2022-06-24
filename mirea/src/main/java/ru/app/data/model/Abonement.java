package ru.mirea.data.model;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.util.Date;

@Getter
@Setter
@NoArgsConstructor
@Entity(name = "абонемент")
@Table(name = "абонемент")
public class Abonement {
    @Id
    @Column(name = "Код_абонемента")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "Читателя")
    private Integer id_reader;

    @Column(name = "Библиотекаря")
    private Integer id_librarian;

    @Column(name = "Выговоры")
    private Integer reprimands;

    @Column(name = "ID")
    private Integer id_id;

    @Override
    public String toString() {
        return "Abonement{" +
                "id=" + id +
                ", id_reader=" + id_reader +
                ", id_librarian=" + id_librarian +
                ", reprimands=" + reprimands +
                ", id_id=" + id_id +
                '}';
    }
}
