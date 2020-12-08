package com_test.Controller;


import com_test.entity.Client;
import com_test.service.IService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


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
    public String getInfoForAlMan(Model model) {


        List<Client> emps = service.getClients();
        model.addAttribute("clients", emps);

        return "clients";
    }

    @RequestMapping("/test")
    public String  test(){

    return "/";




        // Send Message!

    }

}
