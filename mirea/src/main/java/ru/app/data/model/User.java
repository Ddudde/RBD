package ru.mirea.data.model;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;

@Getter
@Setter
@NoArgsConstructor
@Entity(name = "пользователь")
@Table(name = "пользователь")
public class User {
    @Id
    @Column(name = "Код_пользователя")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "Имя_пользователя")
    private String username;

    @Column(name = "Пароль")
    private String password;

    @Column(name = "Номер_иконки")
    private Integer icons;

    @Column(name = "Код_паспорта")
    private Integer id_passport;

    @Column(name = "Телефон")
    private String tel;

    @Transient
    private boolean ch_u = false;

    public boolean conf_auth(String pass)
    {
        return password.equals(pass);
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", icons=" + icons +
                ", id_passport=" + id_passport +
                ", tel='" + tel + '\'' +
                '}';
    }

    public String toSave() {
        StringBuilder res = new StringBuilder();
        //res.append(id).append("\n").append(username).append("\n").append(password).append("\n").append(icons).append("\n").append(sohr);
        return res.toString();
    }
}