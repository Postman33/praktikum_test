package com_test.entity;

import javax.persistence.*;


@Entity
@Table(name = "Shedule")
public class Shedule {

    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "SheduleID")
    private int id;

    @Column(name = "CourseID")
    private int courseid;

    @Column(name = "HEADER")
    private String header;


    @Column(name = "S_WEEK")
    private int week;


    @Column(name = "MAX_MARK")
    private double max_mark;



    public Shedule() {
    }

    public Shedule(int courseID, String header, int week, double max_mark) {
        this.courseid = courseID;
        this.header = header;
        this.week = week;
        this.max_mark = max_mark;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getCourseid() {
        return courseid;
    }

    public void setCourseid(int courseID) {
        this.courseid = courseID;
    }

    public String getHeader() {
        return header;
    }

    public void setHeader(String header) {
        this.header = header;
    }

    public int getWeek() {
        return week;
    }

    public void setWeek(int week) {
        this.week = week;
    }

    public double getMax_mark() {
        return max_mark;
    }

    public void setMax_mark(double max_mark) {
        this.max_mark = max_mark;
    }

    @Override
    public String toString() {
        return "Shedule{" +
                "id=" + id +
                ", courseID='" + courseid + '\'' +
                ", header='" + header + '\'' +
                ", week=" + week +
                ", max_mark=" + max_mark +
                '}';
    }
}
