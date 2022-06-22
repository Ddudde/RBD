package ru.mirea.data.model;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.util.Date;

@Getter
@Setter
@NoArgsConstructor
@Entity(name = "автор_пользователь")
@Table(name = "автор_пользователь")
public class Autor_user {
    @Id
    @Column(name = "Код_пользователя")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "Код_автора")
    private int id_autor;

    @Column(name = "Почтовый_адрес")
    private String email;

    @Override
    public String toString() {
        return "Autor_user{" +
                "id=" + id +
                ", id_autor=" + id_autor +
                ", email='" + email + '\'' +
                '}';
    }
}
