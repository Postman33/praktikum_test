package com_test.service;

import com_test.entity.*;

import java.util.List;
import java.util.function.Predicate;

public interface IService {
    //                        CLIENTS
    // ==============================================================
    // ==============================================================
    public List<Client> getClients();

    public void SaveClient(Client client);

    Client getClientById(int id);

    public void deleteClient(int id);



    //                        TEACHERS
    // ==============================================================
    // ==============================================================
    public List<Teacher> getAllTeachers();

    public void SaveTeacher(Teacher teacher);

    public Teacher getTeacherById(int id);

    public void deleteTeacher(int id);


    //                        COURSES
    // ==============================================================
    // ==============================================================
    public List<Course> getAllCourses();

    public void SaveCourse(Course course);

    public Course getCourseById(int id);

    public void deleteCourse(int id);
    void persistcourse(Course course);


    //                        MARKS
    // ==============================================================
    // ==============================================================



    public List<Mark> getAllMarks();

    public List<Mark> filterByClient(int clientid);
    public List<Mark> filterByCourse(int courseid);
    public List<Mark> filterCustom(Predicate<Mark> predicate);


    public void SaveMark(Mark mark);

    public Mark getMarkByID(MarkKey id);

    public void deleteMark(MarkKey id);
}
