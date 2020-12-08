package com_test.service;

import com_test.dao.IClientDAO;
import com_test.entity.Client;
import org.springframework.beans.factory.annotation.Autowired;

import javax.transaction.Transactional;
import java.util.List;
@org.springframework.stereotype.Service
public class MainServiceCOM implements  IService{
    @Autowired
    private IClientDAO clientDAO;

    @Transactional
    @Override
    public List<Client> getClients() {
        return clientDAO.getAllClients();
    }
}
