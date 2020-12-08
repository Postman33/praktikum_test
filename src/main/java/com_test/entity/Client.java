package com_test.entity;

import javax.persistence.*;
import java.time.LocalDate;

@Entity
@Table(name="Client")
public class Client {

    @Column(name = "ClientID")
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;


    @Column(name = "FIO")
    private String name;


    @Column(name = "Birthday")
    private LocalDate Birthday;

    public Client(String name, LocalDate birthday) {
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

    public LocalDate getBirthday() {
        return Birthday;
    }

    public void setBirthday(LocalDate birthday) {
        Birthday = birthday;
    }
}
