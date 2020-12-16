package com_test.dao;


import com_test.entity.Mark;
import com_test.entity.MarkKey;
import com_test.entity.Teacher;

import java.util.List;
import java.util.function.Predicate;

public interface IMarkDAO {

    public List<Mark> getAllMarks();

    public List<Mark> filterByClient(int clientid);
    public List<Mark> filterByCourse(int courseid);
    public List<Mark> filterCustom(Predicate<Mark> predicate);


    public void SaveMark(Mark mark);

    public Mark getMarkByID(int id);

    public void deleteMark(int id);
}
