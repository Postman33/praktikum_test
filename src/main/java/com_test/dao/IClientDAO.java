package com_test.dao;

import com_test.entity.Client;

import java.util.List;

public interface IClientDAO {
    public List<Client> getAllClients();

    public void SaveOrUpdate(Client client);

    public Client getClientById(int id);

    public void deleteClient(int id);
}
