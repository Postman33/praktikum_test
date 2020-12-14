package com_test.entity;

import javax.persistence.*;
import java.sql.Date;
import java.util.Objects;

@Entity
@Table(name = "Progress")
public class Mark {

    @Column(name = "MarkID")
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;


    @Column(name = "Date_offset")
    private Date date;

    @Column(name = "Mark")
    private double mark;

    @Column(name = "ClientID")
    private int clientid;


    @Column(name = "CourseID")
    private int courseid;

    @Column(name = "Header")
    private String header;



    public Mark() {
    }

    public Mark(Date date, double mark, int clientid, int courseid, String header) {
        this.date = date;
        this.mark = mark;
        this.clientid = clientid;
        this.courseid = courseid;
        this.header = header;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public double getMark() {
        return mark;
    }

    public void setMark(double mark) {
        this.mark = mark;
    }

    public int getClientid() {
        return clientid;
    }

    public void setClientid(int clientid) {
        this.clientid = clientid;
    }

    public int getCourseid() {
        return courseid;
    }

    public void setCourseid(int courseid) {
        this.courseid = courseid;
    }

    public String getHeader() {
        return header;
    }

    public void setHeader(String header) {
        this.header = header;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Mark markKey = (Mark) o;
        return Double.compare(markKey.mark, mark) == 0 &&
                clientid == markKey.clientid &&
                courseid == markKey.courseid &&
                Objects.equals(date, markKey.date) &&
                Objects.equals(header, markKey.header);
    }

    @Override
    public int hashCode() {
        return Objects.hash(date, mark, clientid, courseid, header);
    }

    @Override
    public String toString() {
        return "key{" +
                "date=" + date +
                ", mark=" + mark +
                ", clientid=" + clientid +
                ", courseid=" + courseid +
                ", header='" + header + '\'' +
                '}';
    }
}