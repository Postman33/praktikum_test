package com_test.entity;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;
import org.hibernate.validator.constraints.NotBlank;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import javax.validation.constraints.*;
import java.sql.Date;
import java.time.LocalDate;
import java.util.*;

@Entity
@Table(name="client")
public class Client {

    @Column(name = "ClientID")
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;


    @NotBlank(message = "Не должно быть пустым")
    @Size(min = 3, message = "Минимум 3 символа")
    @Column(name = "FIO")
    private String name;


    @NotNull(message = "Не может быть пустым")
    @Column(name = "Birthday")
    private Date Birthday;

    @ManyToMany(cascade = CascadeType.PERSIST,fetch = FetchType.EAGER, mappedBy = "clients")

    //@Cascade({org.hibernate.annotations.CascadeType.SAVE_UPDATE,org.hibernate.annotations.CascadeType.REFRESH, org.hibernate.annotations.CascadeType.MERGE})
    // @OnDelete(action = OnDeleteAction.NO_ACTION)

    private Set<Course> courses = new HashSet<>();




    @OneToMany( cascade = CascadeType.ALL, fetch = FetchType.EAGER, orphanRemoval = true)
    @JoinColumn(name = "ClientID", updatable = false, nullable = true)
    private List<Mark> marks = new ArrayList<>();


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

    public List<Mark> getMarks() {
        return marks;
    }

    public void setMarks(List<Mark> marks) {
        this.marks = marks;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Client client = (Client) o;
        return id == client.id;
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, name, Birthday);
    }
}
