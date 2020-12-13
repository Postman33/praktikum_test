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

    @RequestMapping("/updateMark")
    public String saveTeacher(@ModelAttribute("marks") MarkContainer marks) {
        System.out.println("Not EMPTY!");
        for (Mark mark : marks.getMarks()) {
            System.out.println(mark);
            service.SaveMark(mark);
        }
        System.out.println(marks.getMarks());
        return "redirect:/teachers";
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
