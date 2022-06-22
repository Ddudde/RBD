package ru.mirea.data.model;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.util.Date;

@Getter
@Setter
@NoArgsConstructor
@Entity(name = "заказ")
@Table(name = "заказ")
public class Order {
    @Id
    @Column(name = "Код_заказа")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "Дата_заказа")
    private Date date_order;

    @Column(name = "Код_абонемента")
    private Integer id_abon;

    @Column(name = "Код_книги")
    private Integer id_kniggi;

    @Column(name = "ID")
    private Integer id_id;

    @Override
    public String toString() {
        return "Order{" +
                "id=" + id +
                ", date_order=" + date_order +
                ", id_abon=" + id_abon +
                ", id_kniggi=" + id_kniggi +
                ", id_id=" + id_id +
                '}';
    }
}
