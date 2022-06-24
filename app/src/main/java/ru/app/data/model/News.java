package ru.app.data.model;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;

@Getter
@Setter
@NoArgsConstructor
@Entity(name = "новости")
@Table(name = "новости")
public class News {
    @Id
    @Column(name = "Код_новости")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "Ссылка_на_превью")
    private String url_prev;

    @Column(name = "Ссылка_на_новость")
    private String url_news;

    @Column(name = "Администратор")
    private Integer id_admin;

    @Override
    public String toString() {
        return "News{" +
                "id=" + id +
                ", url_prev='" + url_prev + '\'' +
                ", url_news='" + url_news + '\'' +
                ", id_admin=" + id_admin +
                '}';
    }
}
