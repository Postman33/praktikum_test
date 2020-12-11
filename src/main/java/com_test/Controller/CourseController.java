package com_test.Controller;

import com_test.entity.Client;
import com_test.entity.Course;
import com_test.entity.Teacher;
import com_test.service.IService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Set;

@Controller
public class CourseController {


    @Autowired
    private IService service;

    @RequestMapping("/courses")
    public String getAllTeachers(Model model) {
        List<Course> teachers = service.getAllCourses();

        for (Course course : teachers){
            System.out.println("Clients = "+course.getClients());

        }
        model.addAttribute("courses", teachers);
        return "course/courses";
    }
    @RequestMapping(value = "/saveCourse", method = RequestMethod.POST)
    public String saveTeacher(@ModelAttribute("course_info") Course course, @RequestParam("exists") boolean exists) {
//        Course course2 = service.getCourseById( course.getId() );
    if(exists) {
        Course course2 = service.getCourseById( course.getId() );
        course2.setName(course.getName());
        course2.setDescription(course.getDescription());
        course2.setPrice(course.getPrice());
        service.SaveCourse(course2);
    }else {
        service.SaveCourse(course);
    }

        return "redirect:/courses";
    }


    @RequestMapping("/updateCourse")
    public String updateTeacher(@RequestParam("course_id") int id, Model model) {
        Course course   = service.getCourseById( id );
        model.addAttribute("course_info",course);
        model.addAttribute("all_clients",service.getClients());
        model.addAttribute("exists",true);
        return "course/course_info";
    }

    @RequestMapping("/deleteCourse")
    public String deleteTeacher(@RequestParam("course_id") int id, Model model) {
        service.deleteCourse( id );

        return "redirect:/courses";
    }

    @RequestMapping("/addCourse")
    public String addCl(Model model) {
        Course course  = new Course();
        model.addAttribute("course_info",course);
        model.addAttribute("exists",false);
        return "course/course_info";
    }

}
