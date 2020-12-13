package com_test.dao;

import com_test.entity.Client;
import com_test.entity.Mark;
import com_test.entity.MarkKey;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.function.Predicate;
import java.util.stream.Collectors;

@Repository
public class MarkDAO implements IMarkDAO{

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public List<Mark> getAllMarks() {
        Session session = sessionFactory.getCurrentSession();
        List<Mark> marks = session.createQuery("from Mark",Mark.class).getResultList();
        return marks;
    }

    @Override
    public List<Mark> filterByClient(int clientid) {
        return null;
    }

    @Override
    public List<Mark> filterByCourse(int courseid) {
        return null;
    }

    @Override
    public List<Mark> filterCustom(Predicate<Mark> predicate) {
        Session session = sessionFactory.getCurrentSession();
        List<Mark> marks = session.createQuery("from Mark",Mark.class).getResultList();
        return marks.stream().filter(predicate).collect(Collectors.toList());

    }

    @Override
    public void SaveMark(Mark mark) {
        Session session = sessionFactory.getCurrentSession();
        session.saveOrUpdate(mark);
    }

    @Override
    public Mark getMarkByID(MarkKey id) {
        return null;
    }

    @Override
    public void deleteMark(MarkKey id) {

    }
}
