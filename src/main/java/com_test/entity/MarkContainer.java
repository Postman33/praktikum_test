package com_test.entity;



import javax.validation.Valid;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class MarkContainer{
    @Valid
    private List<Mark> marks;


    public List< Mark> getMarks() {
        return marks;
    }

    public void setMarks(List<Mark> marks) {
        this.marks = marks;
    }


}
