package ru.app.data.model;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.util.Date;

@Getter
@Setter
@NoArgsConstructor
@Entity(name = "автор_по_книгам")
@Table(name = "автор_по_книгам")
public class Autor_po_kniggam {
    @Id
    @Column(name = "Код_автора")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "Фамилия")
    private String last_name;

    @Column(name = "Имя")
    private String name;

    @Column(name = "Отчество")
    private String patronymic;

    @Column(name = "Дата_рождения")
    private Date date;

    @Column(name = "Инициалы")
    private String initials;

    @Override
    public String toString() {
        return "Autor_po_kniggam{" +
                "id=" + id +
                ", last_name='" + last_name + '\'' +
                ", name='" + name + '\'' +
                ", patronymic='" + patronymic + '\'' +
                ", date=" + date +
                ", initials='" + initials + '\'' +
                '}';
    }
}
