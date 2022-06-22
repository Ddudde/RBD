package ru.mirea.data.model;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.util.Date;

@Getter
@Setter
@NoArgsConstructor
@Entity(name = "администратор")
@Table(name = "администратор")
public class Admin {
    @Id
    @Column(name = "Код_пользователя")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "Дата_регистрации")
    private Date date;

    @Column(name = "Почтовый_адрес")
    private String email;

    @Override
    public String toString() {
        return "Admin{" +
                "id=" + id +
                ", date=" + date +
                ", email='" + email + '\'' +
                '}';
    }
}
