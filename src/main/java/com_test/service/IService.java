package com_test.service;

import com_test.entity.Client;

import java.util.List;

public interface IService {
    public List<Client> getClients();

    public void SaveClient(Client client);

    Client getClientById(int id);

    public void deleteClient(int id);
}
