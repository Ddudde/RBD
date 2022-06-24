package ru.app.data.model;

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
    private Integer id;

    @Column(name = "Название")
    private String nazv;

    @Column(name = "Издательство")
    private String izd;

    @Column(name = "Год_издания")
    private Integer god_izd;

    @Column(name = "Код_тематики")
    private Integer id_tem;

    @Column(name = "Администратор")
    private Integer id_admin;

    @Column(name = "Автор")
    private Integer id_author_po_kniggam;

    @Column(name = "Код_автора")
    private Integer id_author;

    @Column(name = "ID")
    private Integer idid;

    @Column(name = "Превью")
    private String prev;

    @Override
    public String toString() {
        return "Knigga{" +
                "id=" + id +
                ", nazv='" + nazv + '\'' +
                ", izd='" + izd + '\'' +
                ", god_izd=" + god_izd +
                ", id_tem=" + id_tem +
                ", id_admin=" + id_admin +
                ", id_author_po_kniggam=" + id_author_po_kniggam +
                ", id_author=" + id_author +
                ", idid=" + idid +
                ", prev='" + prev + '\'' +
                '}';
    }
}
