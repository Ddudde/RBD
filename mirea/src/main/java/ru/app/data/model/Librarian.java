package ru.mirea.data.model;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.util.Date;

@Getter
@Setter
@NoArgsConstructor
@Entity(name = "библиотекарь")
@Table(name = "библиотекарь")
public class Librarian {
    @Id
    @Column(name = "Код_пользователя")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "Дата_регистрации")
    private Date date;

    @Column(name = "Почтовый_адрес")
    private String email;

    @Override
    public String toString() {
        return "Librarian{" +
                "id=" + id +
                ", date=" + date +
                ", email='" + email + '\'' +
                '}';
    }
}
