package ru.mirea.data.model;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.util.Date;

@Getter
@Setter
@NoArgsConstructor
@Entity(name = "читатель")
@Table(name = "читатель")
public class Reader {
    @Id
    @Column(name = "Код_пользователя")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "Дата_регистрации")
    private Date date;

    @Override
    public String toString() {
        return "Reader{" +
                "id=" + id +
                ", date=" + date +
                '}';
    }
}
