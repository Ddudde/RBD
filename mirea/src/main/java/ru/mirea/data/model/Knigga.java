package ru.mirea.data.model;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;

@Getter
@Setter
@NoArgsConstructor
@Entity(name = "книга")
@Table(name = "книга")
public class Knigga {
    @Id
    @Column(name = "Код_книги")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "Название")
    private String nazv;

    @Column(name = "Издательство")
    private String izd;

    @Column(name = "Год_издания")
    private int god_izd;

    @Column(name = "Код_тематики")
    private int kod_tem;

    @Column(name = "Администратор")
    private int id_admin;

    @Column(name = "Автор")
    private int id_author_po_kniggam;

    @Column(name = "Код_автора")
    private int id_author;

    @Column(name = "ID")
    private int idid;

    @Column(name = "Превью")
    private String prev;

    @Override
    public String toString() {
        return "Knigga{" +
                "id=" + id +
                ", nazv='" + nazv + '\'' +
                ", izd='" + izd + '\'' +
                ", god_izd=" + god_izd +
                ", kod_tem=" + kod_tem +
                ", id_admin=" + id_admin +
                ", id_author_po_kniggam=" + id_author_po_kniggam +
                ", id_author=" + id_author +
                ", idid=" + idid +
                ", prev='" + prev + '\'' +
                '}';
    }
}
