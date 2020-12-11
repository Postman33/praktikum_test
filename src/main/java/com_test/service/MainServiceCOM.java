package com_test.service;

import com_test.dao.IClientDAO;
import com_test.dao.ICourseDAO;
import com_test.dao.IMarkDAO;
import com_test.dao.ITeacherDAO;
import com_test.entity.*;
import org.springframework.beans.factory.annotation.Autowired;

import javax.transaction.Transactional;
import java.util.List;
import java.util.function.Predicate;

@org.springframework.stereotype.Service
public class MainServiceCOM implements  IService{
    @Autowired
    private IClientDAO clientDAO;
    @Autowired
    private ITeacherDAO teacherDAO;
    @Autowired
    private ICourseDAO courseDAO;
    @Autowired
    private IMarkDAO markDAO;


    //                        CLIENTS
    // ==============================================================
    // ==============================================================
    @Transactional
    @Override
    public List<Client> getClients() {
        return clientDAO.getAllClients();
    }

    @Transactional
    @Override
    public void SaveClient(Client client) {
        clientDAO.SaveOrUpdate(client);
    }

    @Transactional
    @Override
    public Client getClientById(int id) {
        return clientDAO.getClientById(id);
    }

    @Transactional
    @Override
    public void deleteClient(int id) {
        clientDAO.deleteClient( id );
    }




    //                        TEACHERS
    // ==============================================================
    // ==============================================================
    @Transactional
    @Override
    public List<Teacher> getAllTeachers() {
        return teacherDAO.getAllTeachers();
    }
    @Transactional
    @Override
    public void SaveTeacher(Teacher teacher) {
        teacherDAO.SaveOrUpdate(teacher);
    }
    @Transactional
    @Override
    public Teacher getTeacherById(int id) {
        return teacherDAO.getTeacherById(id);
    }
    @Transactional
    @Override
    public void deleteTeacher(int id) {
        teacherDAO.deleteTeacher(id);
    }




    //                        COURSES
    // ==============================================================
    // ==============================================================
    @Transactional
    @Override
    public List<Course> getAllCourses() {
        return courseDAO.getAllCourses();
    }

    @Transactional
    @Override
    public void SaveCourse(Course course) {
    courseDAO.SaveOrUpdate(course);
    }

    @Transactional
    @Override
    public Course getCourseById(int id) {
        return courseDAO.getCourseById(id);
    }

    @Transactional
    @Override
    public void deleteCourse(int id) {
        courseDAO.deleteCourse(id);
    }

    @Transactional
    @Override
    public void persistcourse(Course course) {
        courseDAO.persists(course);
    }



    //                        MARKS
    // ==============================================================
    // ==============================================================

    @Transactional
    @Override
    public List<Mark> getAllMarks() {
        return markDAO.getAllMarks();
    }

    @Transactional
    @Override
    public List<Mark> filterByClient(int clientid) {
        return markDAO.filterByClient(clientid);
    }

    @Transactional
    @Override
    public List<Mark> filterByCourse(int courseid) {
        return markDAO.filterByCourse(courseid);
    }

    @Transactional
    @Override
    public List<Mark> filterCustom(Predicate<Mark> predicate) {
        return markDAO.filterCustom(predicate);
    }

    @Transactional
    @Override
    public void SaveMark(Mark mark) {
        markDAO.SaveMark(mark);
    }

    @Transactional
    @Override
    public Mark getMarkByID(MarkKey id) {
        return markDAO.getMarkByID(id);
    }

    @Transactional
    @Override
    public void deleteMark(MarkKey id) {
        markDAO.deleteMark( id );
    }



}
