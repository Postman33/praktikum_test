package com_test.service;

import com_test.dao.IClientDAO;
import com_test.dao.ICourseDAO;
import com_test.dao.ITeacherDAO;
import com_test.entity.Client;
import com_test.entity.Course;
import com_test.entity.Teacher;
import org.springframework.beans.factory.annotation.Autowired;

import javax.transaction.Transactional;
import java.util.List;
@org.springframework.stereotype.Service
public class MainServiceCOM implements  IService{
    @Autowired
    private IClientDAO clientDAO;
    @Autowired
    private ITeacherDAO teacherDAO;
    @Autowired
    private ICourseDAO courseDAO;

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


}
