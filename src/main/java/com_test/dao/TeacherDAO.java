package com_test.dao;

import com_test.entity.Client;
import com_test.entity.Teacher;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class TeacherDAO implements ITeacherDAO{
    @Autowired
    private SessionFactory sessionFactory;



    @Override
    public List<Teacher> getAllTeachers() {
        Session session = sessionFactory.getCurrentSession();
        List<Teacher> teachers = session.createQuery("from Teacher ", Teacher.class).getResultList();
        return teachers;
    }

    @Override
    public void SaveOrUpdate(Teacher teacher) {
        Session session = sessionFactory.getCurrentSession();
        session.saveOrUpdate(teacher);
    }

    @Override
    public Teacher getTeacherById(int id) {
        Session session = sessionFactory.getCurrentSession();
        Teacher teacher=    session.createQuery("from Teacher where id = :et",Teacher.class).setParameter("et",id).getSingleResult();

        return teacher;
    }

    @Override
    public void deleteTeacher(int id) {
        Session session = sessionFactory.getCurrentSession();
        Teacher teacher=    session.createQuery("from Teacher where id = :et",Teacher.class).setParameter("et",id).getSingleResult();
        session.delete(teacher);
    }
}
