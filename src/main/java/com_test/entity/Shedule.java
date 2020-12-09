package com_test.entity;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Objects;

@Embeddable
class CompositeKey implements Serializable {


    @Column(name = "CourseID")
    private int id;

    @Column(name = "HEADER")
    private String header;


    @Column(name = "S_WEEK")
    private int week;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        CompositeKey that = (CompositeKey) o;
        return id == that.id &&
                week == that.week &&
                Objects.equals(header, that.header);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, header, week);
    }

    @Override
    public String toString() {
        return "CompositeKey{" +
                "id=" + id +
                ", header='" + header + '\'' +
                ", week=" + week +
                '}';
    }
}

@Entity
@Table(name = "Shedule")
public class Shedule {
    @EmbeddedId
    private CompositeKey id;

    @Column(name = "MAX_MARK")
    private double max_mark;


    public Shedule() {
    }

    public Shedule(CompositeKey id, double max_mark) {
        this.id = id;
        this.max_mark = max_mark;
    }

    public CompositeKey getId() {
        return id;
    }

    public void setId(CompositeKey id) {
        this.id = id;
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
                ", max_mark=" + max_mark +
                '}';
    }
}
