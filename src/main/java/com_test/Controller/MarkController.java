package com_test.Controller;

import com_test.entity.*;
import com_test.service.IService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.validation.Valid;
import java.sql.Date;
import java.time.LocalDate;
import java.util.*;
import java.util.function.Predicate;

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

    @RequestMapping("/viewCourseReport")
    public String getReportCourse(@RequestParam(value = "courseid") int courseid, Model model){

        List<Mark> marks = service.filterMarksCustom(Mark->Mark.getCourseid()==courseid);
        Mark min = new Mark();
        min.setMark(0);
        min.setHeader("null");
        if (marks.size() != 0){
         min = marks.stream().min(new Comparator<Mark>() {
            @Override
            public int compare(Mark o1, Mark o2) {
                return Double.compare(o1.getMark(), o2.getMark());
            }
        }).get();

        model.addAttribute("min_mark", min);
        model.addAttribute("min_client", service.getClientById(min.getClientid()));
        model.addAttribute("min_course", service.getCourseById(min.getCourseid()));
    }

        Set<Client> clients = service.getCourseById(courseid).getClients();
        int k = 0;
        Double global_mark = 0d;
        Map<Client,Double> avgPoints = new HashMap<>();
        for( Client client : clients) {
            Double avg_mark = 0d;
            int j = 0;
            List<Mark> client_marks = client.getMarks();

                for(Mark cm : client_marks){
                    if( cm.getCourseid() != courseid) continue;
                    avg_mark+=cm.getMark();
                    global_mark+=cm.getMark();
                    j++;
                    k++;
                }
                avg_mark /= j;
            avgPoints.put(client,avg_mark);
        }
        global_mark/=k;


        Map<Date,Double> averageMarks = new TreeMap<>();
        HashMap<Date,Integer> averageCountMarks = new HashMap<>();
        for( Mark m : marks) {
            if( m.getCourseid() != courseid) continue;

            if (averageMarks.get(m.getDate())==null){
                averageMarks.put(m.getDate(),m.getMark());
                averageCountMarks.put(m.getDate(),1);
            } else {
                averageMarks.put(m.getDate(),averageMarks.get(m.getDate())+ m.getMark());
                averageCountMarks.put(m.getDate(),averageCountMarks.get(m.getDate())+1);
            }

        }

        Map<Date,Double> averageMarksForDate = new TreeMap<>();
        int count = 0;
        Double sum_point_course = 0d;
        for( Map.Entry<Date,Double> entry : averageMarks.entrySet()){
            count++;
            sum_point_course = sum_point_course + entry.getValue()/averageCountMarks.get(entry.getKey());

            averageMarksForDate.put(entry.getKey(),sum_point_course / count);

        }




        model.addAttribute("courseid",courseid);


        model.addAttribute("course_marks_for_dates",averageMarksForDate);

        model.addAttribute("avg_points",avgPoints);
        model.addAttribute("clients",clients);
        model.addAttribute("global_mark",Math.max(0,global_mark));

        model.addAttribute("max_param",Math.max(0,Math.min(100,100/(global_mark- min.getMark()))));
        return "marks/reports/course";
    }
    @RequestMapping("/viewCourseClientReport")
    public String getReportClient(@RequestParam(value = "courseid") int courseid){
        return "";
    }

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
    public String saveTeacher(@Validated @ModelAttribute("marks") MarkContainer marks, @RequestParam("action") String actionResult,
                              @RequestParam("Header_") String header,
                              @RequestParam("Mark_") Double Mark,
                              @RequestParam("Date_") Date date, @RequestParam("courseid_") Integer courseid,
                              @RequestParam("clientid_") Integer clientid, Model model, BindingResult result) {

//        if (result.hasErrors()){
//            return "redirect:/viewCourse?courseid="+courseid + "&clientid="+clientid;
//        }r

    if (result.hasErrors()) {
        return "redirect:/viewCourse?courseid="+courseid + "&clientid="+clientid;
    }

        System.out.println(actionResult);

        Client client = service.getClientById(clientid);
        Course course = service.getCourseById(courseid);
        model.addAttribute("client", client);
        model.addAttribute("course", course);

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
