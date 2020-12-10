package com_test.dao;

import com_test.entity.Client;
import com_test.entity.Course;

import java.util.List;

public interface ICourseDAO {

    public List<Course> getAllCourses();

    public void SaveOrUpdate(Course course);

    public Course getCourseById(int id);

    public void deleteCourse(int id);

    void persists(Course course);
}
