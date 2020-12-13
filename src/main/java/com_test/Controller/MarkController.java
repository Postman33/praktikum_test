package com_test.Controller;

import com_test.entity.Client;
import com_test.entity.Course;
import com_test.entity.Mark;
import com_test.entity.MarkKey;
import com_test.service.IService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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

        MarkKey key = new MarkKey(Date.valueOf(LocalDate.now()), 6, 13, 7, "Контрольная  работа");
        MarkKey key2 = new MarkKey(Date.valueOf(LocalDate.now()), 12, 7, 7, "ыры  работа №2");
        MarkKey key3 = new MarkKey(Date.valueOf(LocalDate.now()), 6, 7, 7, "Саып работа");
        MarkKey key4 = new MarkKey(Date.valueOf(LocalDate.now()), 6, 13, 5, "rfg  работа");

        Mark mark = new Mark(key);
        Mark mark2 = new Mark(key2);
        Mark mark3 = new Mark(key3);
        Mark mark4 = new Mark(key4);

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
        }
        else {
        List<Mark> marks=    service.filterMarksCustom( Mark -> {return Mark.getPrimaryKey().getClientid() == clientid.get() && Mark.getPrimaryKey().getCourseid() == courseid;});
            System.out.println("SIZE ="+marks.size());
        model.addAttribute("marks", marks);

        return "marks/marks";
        }

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
