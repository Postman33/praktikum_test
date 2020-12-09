package com_test.entity;

import org.hibernate.annotations.Cascade;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "Course")
public class Course {

    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "CourseID")
    private int id;

    @Column(name = "Name")
    private String name;


    @Column(name = "Description")
    private String description;

    @Column(name = "Price")
    private double price;



    @ManyToMany( cascade = {CascadeType.DETACH,CascadeType.MERGE,CascadeType.PERSIST,CascadeType.REFRESH})
    @JoinTable( name = "CourseTeachers",
            inverseJoinColumns = @JoinColumn(name = "teacher_id"),
            joinColumns = @JoinColumn(name = "course_id") )
    private List<Teacher> teachers;


//    @OneToMany(cascade = {CascadeType.ALL})
//    @JoinColumn(name="Shedule_id")
//
//    private List<Shedule> sheduleList;



    public Course() {
    }




    public Course(String name, String description, double price) {
        this.name = name;
        this.description = description;
        this.price = price;
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

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public List<Teacher> getTeachers() {
        return teachers;
    }

    public void setTeachers(List<Teacher> teachers) {
        this.teachers = teachers;
    }

    @Override
    public String toString() {
        return "Course{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", description='" + description + '\'' +
                ", price=" + price +
                '}';
    }
}
