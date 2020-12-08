package com_test.dao;

import com_test.entity.Client;
import com_test.entity.Teacher;

import java.util.List;

public interface ITeacherDAO {
    public List<Teacher> getAllTeachers();

    public void SaveOrUpdate(Teacher teacher);

    public Teacher getTeacherById(int id);

    public void deleteTeacher(int id);
}
