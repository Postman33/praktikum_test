package com_test.entity;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

import javax.persistence.*;
import java.sql.Date;
import java.time.LocalDate;
import java.util.*;

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
    private Date Birthday;

    @ManyToMany(cascade = CascadeType.MERGE,fetch = FetchType.EAGER, mappedBy = "clients")

    @Cascade({org.hibernate.annotations.CascadeType.SAVE_UPDATE,org.hibernate.annotations.CascadeType.REFRESH, org.hibernate.annotations.CascadeType.MERGE})
   // @OnDelete(action = OnDeleteAction.NO_ACTION)
    private Set<Course> courses = new HashSet<>();;







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

    public Set<Course> getCourses() {
        return courses;
    }

    public void setCourses(Set<Course> courses) {

        this.courses = courses;
    }
    public void addCourse(Course course){
        if (courses==null) courses=new HashSet<>();
        courses.add(course);
    }
    public void removeCourse(Course course){
        if (courses==null) courses=new HashSet<>();
        courses.remove(course);
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Client client = (Client) o;
        return Objects.equals(name, client.name) &&
                Objects.equals(Birthday, client.Birthday);
    }

    @Override
    public int hashCode() {
        return Objects.hash(name, Birthday);
    }
}
