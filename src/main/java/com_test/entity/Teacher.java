package com_test.entity;

import javax.persistence.*;
import java.sql.Date;

@Entity
@Table(name = "teacher")
public class Teacher {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="TeacherID")
    private int id;

    @Column(name = "FIO")
    private String name;


    @Column(name = "Birthday")
    private Date Birthday;

    public Teacher() {
    }

    public Teacher(int id, String name, Date birthday) {
        this.id = id;
        this.name = name;
        Birthday = birthday;
    }

    public int getId() {
        return id;
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
        return "Teacher{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", Birthday=" + Birthday +
                '}';
    }
}
