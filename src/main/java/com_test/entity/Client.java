package com_test.entity;

import javax.persistence.*;
import java.sql.Date;
import java.time.LocalDate;

@Entity
@Table(name="client")
public class Client {

    @Column(name = "ClientID")
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;


    @Column(name = "FIO")
    private String name;


    @Column(name = "Birthday")
    private Date Birthday;

    public Client(String name, Date birthday) {
        this.name = name;
        Birthday = birthday;
    }

    public int getId() {
        return id;
    }

    public Client() {
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Date getBirthday() {
        return Birthday;
    }

    public void setBirthday(Date birthday) {
        Birthday = birthday;
    }

    @Override
    public String toString() {
        return "Client{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", Birthday=" + Birthday +
                '}';
    }
}
