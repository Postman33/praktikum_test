package com_test.dao;

import com_test.entity.Client;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;
import java.util.List;
@Repository
public class ClientDAO implements IClientDAO{
    @Autowired
    private SessionFactory sessionFactory;



    @Override
    public List<Client> getAllClients() {
        Session session = sessionFactory.getCurrentSession();
        List<Client> clients = session.createQuery("from Client",Client.class).getResultList();
        return clients;
    }

    @Override
    public void SaveOrUpdate(Client client) {
        Session session = sessionFactory.getCurrentSession();
        session.saveOrUpdate(client);
    }

    @Override
    public Client getClientById(int id) {
        Session session = sessionFactory.getCurrentSession();
    Client client=    session.createQuery("from Client where id = :et",Client.class).setParameter("et",id).getSingleResult();

    return client;
    }

    @Override
    public void deleteClient(int id) {
        Session session = sessionFactory.getCurrentSession();
        Client client=    session.createQuery("from Client where id = :et",Client.class).setParameter("et",id).getSingleResult();
        session.delete(client);
    }
}
