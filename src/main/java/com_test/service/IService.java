package com_test.service;

import com_test.entity.Client;
import com_test.entity.Teacher;

import java.util.List;

public interface IService {
    // CLIENTS
    public List<Client> getClients();

    public void SaveClient(Client client);

    Client getClientById(int id);

    public void deleteClient(int id);



    // TEACHERS
    public List<Teacher> getAllTeachers();

    public void SaveTeacher(Teacher teacher);

    public Teacher getTeacherById(int id);

    public void deleteTeacher(int id);

}
