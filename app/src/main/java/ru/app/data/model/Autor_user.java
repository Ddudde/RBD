package ru.app.data.model;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;

@Getter
@Setter
@NoArgsConstructor
@Entity(name = "автор_пользователь")
@Table(name = "автор_пользователь")
public class Autor_user {
    @Id
    @Column(name = "Код_пользователя")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "Код_автора")
    private Integer id_autor;

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
