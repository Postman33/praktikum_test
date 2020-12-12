package com_test.entity;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

import javax.persistence.*;
import java.util.*;

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



    @ManyToMany(mappedBy = "courses", fetch = FetchType.LAZY)
    @Cascade({org.hibernate.annotations.CascadeType.SAVE_UPDATE})
    private Set<Teacher> teachers;


    @ManyToMany(cascade = CascadeType.ALL,fetch = FetchType.EAGER)
    @JoinTable(name = "course_client",
            joinColumns = {
                    @JoinColumn(name = "coursesid")},
            inverseJoinColumns = {
                    @JoinColumn(name = "clientsid")})

    @Cascade({org.hibernate.annotations.CascadeType.SAVE_UPDATE,org.hibernate.annotations.CascadeType.REFRESH, org.hibernate.annotations.CascadeType.MERGE})
    private Set<Client> clients= new HashSet<>();


//    @OneToMany()
//    @JoinColumn(name = "courseid")
//    @Cascade({org.hibernate.annotations.CascadeType.SAVE_UPDATE})
//    private Set<Shedule> sheduleList;



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

    public Set<Teacher> getTeachers() {
        return teachers;
    }

    public void setTeachers(Set<Teacher> teachers) {
        this.teachers = teachers;
    }

    public Set<Client> getClients() {
        return clients;
    }

    public void setClients(Set<Client> clients) {

        this.clients = clients;
    }

//    public Set<Shedule> getSheduleList() {
//        return sheduleList;
//    }
//
//    public void setSheduleList(Set<Shedule> sheduleList) {
//        this.sheduleList = sheduleList;
//    }
    public void addClient(Client client){
        if (clients==null) clients=new HashSet<>();
        clients.add(client);
    }
    public void removeClient(Client client){
        if (clients==null) clients=new HashSet<>();
        clients.remove(client);
    }

    public void addTeacher(Teacher teacher){
        if (teachers==null) teachers=new HashSet<>();
        teachers.add(teacher);
    }
    public void removeTeacher(Teacher teacher){
        if (teachers==null) teachers=new HashSet<>();
        teachers.remove(teacher);
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

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Course course = (Course) o;
        return id == course.id && Double.compare(course.price, price) == 0 && Objects.equals(name, course.name) && Objects.equals(description, course.description);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, name, description, price);
    }
}
