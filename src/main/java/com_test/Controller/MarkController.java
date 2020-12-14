package com_test.Controller;

import com_test.entity.*;
import com_test.service.IService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.sql.Date;
import java.time.LocalDate;
import java.util.List;
import java.util.Optional;
import java.util.Set;

@Controller
public class MarkController {
    @Autowired
    private IService service;


    @RequestMapping("/test_marks")
    public String saveMarks() {


        Mark mark = new Mark(Date.valueOf(LocalDate.now()), 6, 13, 7, "Контрольная  работа");
        Mark mark2 = new Mark(Date.valueOf(LocalDate.now()), 12, 7, 7, "ыры  работа №2");
        Mark mark3 = new Mark(Date.valueOf(LocalDate.now()), 6, 7, 7, "Саып работа");
        Mark mark4 = new Mark(Date.valueOf(LocalDate.now()), 6, 13, 5, "rfg  работа");

        service.SaveMark(mark);
        service.SaveMark(mark2);
        service.SaveMark(mark3);
        service.SaveMark(mark4);


        return "marks/marks";
    }

//    @RequestMapping("/viewCourse/{clientid}&{courseid}")
//    public String getMarks(Model model, @PathVariable int clientid, @PathVariable int courseid) {
//        List<Mark> markList = service.getAllMarks();
//        for (Mark mark : markList) {
//            System.out.println("Mark = " + mark);
//        }
//        model.addAttribute("marks", markList);
//        return "marks/marks";
//    }

    @RequestMapping("/viewCourse")
    public String getMarks2(Model model, @RequestParam(value = "courseid", required = true) int courseid,
                            @RequestParam(value = "clientid", required = false) Optional<Integer> clientid) {
        if (!clientid.isPresent()) {
            Set<Client> clients = service.getCourseById(courseid).getClients();
            model.addAttribute("clients", clients);
            model.addAttribute("courseid", courseid);
            return "marks/clients";
        } else {

            List<Mark> marks = service.filterMarksCustom(Mark -> {
                return Mark.getClientid() == clientid.get() && Mark.getCourseid() == courseid;
            });

            MarkContainer container = new MarkContainer();
            container.setMarks(marks);
            model.addAttribute("marks", container);

            Client client = service.getClientById(clientid.get());
            Course course = service.getCourseById(courseid);
            model.addAttribute("client", client);
            model.addAttribute("course", course);
            return "marks/marks";
        }

    }

    @RequestMapping("/deleteMark")
    public String deleteClient(@RequestParam("mark_id") int id,@RequestParam("client_id") int client_id,
                               @RequestParam("course_id") int course_id, Model model) {
        service.deleteMark( id );

        return "redirect:/viewCourse?courseid="+course_id + "&clientid="+client_id;
    }

    @RequestMapping("/updateMark")
    public String saveTeacher(@ModelAttribute("marks") MarkContainer marks, @RequestParam("action") String actionResult,
                              @RequestParam("Header_") String header,
                              @RequestParam("Mark_") Double Mark,
                              @RequestParam("Date_") Date date, @RequestParam("courseid_") Integer courseid,
                              @RequestParam("clientid_") Integer clientid, Model model ) {
        System.out.println(actionResult);


        if (marks.getMarks() != null) {
            for (Mark mark0 : marks.getMarks()) {
                System.out.println(mark0);
                service.SaveMark(mark0);
            }
        }
        if(actionResult.equals("addnew")){
            System.out.println("Date = " + date);
            Mark marknew = new Mark();
            marknew.setHeader(header);
            marknew.setDate(date);
            marknew.setMark(Mark);
            marknew.setClientid(clientid);
            marknew.setCourseid(courseid);
            service.SaveMark(marknew);

            Client client = service.getClientById(clientid);
            Course course = service.getCourseById(courseid);
            model.addAttribute("client", client);
            model.addAttribute("course", course);

            List<Mark> marks2 = service.filterMarksCustom(Mark3 -> {
                return Mark3.getClientid() == clientid && Mark3.getCourseid() == courseid;
            });

            MarkContainer container = new MarkContainer();
            container.setMarks(marks2);
            model.addAttribute("marks", container);


            return "redirect:/viewCourse?courseid="+courseid + "&clientid="+clientid;
        }

        if(actionResult.split("\\s")[0].equals("delete")){
            service.deleteMark(Integer.parseInt(actionResult.split("\\s")[1]));
            return "redirect:/viewCourse?courseid="+courseid + "&clientid="+clientid;
        }


        return "marks/marks";
    }


    @RequestMapping("/getMarks")
    public String getMarks(Model model) {
        List<Mark> markList = service.getAllMarks();
        model.addAttribute("marks", markList);

        List<Course> courses = service.getAllCourses();
        model.addAttribute("courses", courses);


        return "marks/courses";
    }
}
