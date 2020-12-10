package com_test.dao;

import com_test.entity.Client;
import com_test.entity.Course;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public class CourseDAO implements ICourseDAO {
    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public List<Course> getAllCourses() {
        Session session = sessionFactory.getCurrentSession();
        List<Course> courses = session.createQuery("from Course ",Course.class).getResultList();
        return courses;
    }

    @Override
    public void SaveOrUpdate(Course course) {
        Session session = sessionFactory.getCurrentSession();
        session.saveOrUpdate(course);
    }

    @Override
    public Course getCourseById(int id) {
        Session session = sessionFactory.getCurrentSession();
        Course course=    session.createQuery("from Course where id = :et",Course.class).setParameter("et",id).getSingleResult();
        return course;
    }

    @Override
    public void deleteCourse(int id) {
        Session session = sessionFactory.getCurrentSession();
        Course course=    session.createQuery("from Course where id = :et",Course.class).setParameter("et",id).getSingleResult();
        session.delete(course);
    }

    @Override
    public void persists(Course course) {
        Session session = sessionFactory.getCurrentSession();
        session.saveOrUpdate(course);
    }
}
