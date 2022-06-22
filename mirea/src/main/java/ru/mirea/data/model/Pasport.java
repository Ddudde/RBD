package ru.mirea.data.model;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.util.Date;

@Getter
@Setter
@NoArgsConstructor
@Entity(name = "паспортные_данные")
@Table(name = "паспортные_данные")
public class Pasport {
    @Id
    @Column(name = "Koд_паспорта")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "Фамилия")
    private String familya;

    @Column(name = "Имя")
    private String imya;

    @Column(name = "Отчество")
    private String otchestvo;

    @Column(name = "Серия")
    private int seriya;

    @Column(name = "Номер")
    private int nomer;

    @Column(name = "Дата_рождения")
    private Date date_of_birthday;

    @Override
    public String toString() {
        return "PasportDannble{" +
                "id=" + id +
                ", familya='" + familya + '\'' +
                ", imya='" + imya + '\'' +
                ", otchestvo='" + otchestvo + '\'' +
                ", seriya=" + seriya +
                ", nomer=" + nomer +
                ", date_of_birthday=" + date_of_birthday +
                '}';
    }
}
