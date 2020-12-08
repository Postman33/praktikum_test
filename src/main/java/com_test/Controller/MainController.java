package com_test.Controller;


import com_test.entity.Client;
import com_test.service.IService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


import java.util.List;


@Controller
public class MainController {

    @Autowired
    private IService service;

    @RequestMapping("/")
    public String getInfoForAllEmps(){
       return "view_for_all_emp" ;
    }

    @RequestMapping("/hr")
    public String getInfoForAlHR(){
        return "view_for_all_hr" ;
    }


    @RequestMapping("/mn")
    public String getAllClients(Model model) {
        List<Client> emps = service.getClients();
        model.addAttribute("clients", emps);
        return "clients";
    }
    @RequestMapping("/saveClient")
    public String saveEmployee(@ModelAttribute("client_info") Client client) {
        System.out.println("test");
        System.out.println(client);
        service.SaveClient(client);
        return "redirect:/mn";
    }
    @RequestMapping("/updateClient")
    public String updateClient(@RequestParam("client_id") int id, Model model) {
        Client client= service.getClientById( id );
        model.addAttribute("client_info",client);
        return "client_info2";
    }

    @RequestMapping("/deleteClient")
    public String deleteClient(@RequestParam("client_id") int id, Model model) {
       service.deleteClient( id );

        return "redirect:/mn";
    }

    @RequestMapping("/addClient")
    public String addCl(Model model) {
        Client client = new Client();

        client.setName("Test");
        model.addAttribute("client_info",client);
        return "client_info2";
    }


    @RequestMapping("/test")
    public String  test(){

    return "/";




        // Send Message!

    }

}
