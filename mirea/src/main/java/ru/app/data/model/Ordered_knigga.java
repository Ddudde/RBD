package ru.mirea.data.model;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.util.Date;

@Getter
@Setter
@NoArgsConstructor
@Entity(name = "заказанная_книга")
@Table(name = "заказанная_книга")
public class Ordered_knigga {
    @Column(name = "Отметка_о_возврате")
    private String otmet_vozvr;

    @Column(name = "Дата_возврата")
    private Date data_vozvr;

    @Column(name = "Фактическая_дата_возврата")
    private Date fakt_data_vozvr;

    @Column(name = "Код_пользователя")
    private Integer id_user;

    @Id
    @Column(name = "Код_книги")
    private Integer id_knigga;

    @Override
    public String toString() {
        return "Ordered_knigga{" +
                "otmet_vozvr='" + otmet_vozvr + '\'' +
                ", data_vozvr='" + data_vozvr + '\'' +
                ", fakt_data_vozvr=" + fakt_data_vozvr +
                ", id_user=" + id_user +
                ", id_knigga=" + id_knigga +
                '}';
    }
}
