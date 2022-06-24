package ru.app.data.model;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;

@Getter
@Setter
@NoArgsConstructor
@Entity(name = "тематика")
@Table(name = "тематика")
public class Them {
    @Id
    @Column(name = "Код_тематики")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "Название")
    private String nazv;

    @Column(name = "Примечание")
    private String primechanie;

    @Override
    public String toString() {
        return "Them{" +
                "id=" + id +
                ", nazv='" + nazv + '\'' +
                ", primechanie='" + primechanie + '\'' +
                '}';
    }
}
