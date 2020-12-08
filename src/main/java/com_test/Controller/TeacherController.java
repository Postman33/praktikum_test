package com_test.Controller;

import com_test.entity.Client;
import com_test.entity.Teacher;
import com_test.service.IService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
@Controller
public class TeacherController {

    @Autowired
    private IService service;


    @RequestMapping("/teachers")
    public String getAllTeachers(Model model) {
        List<Teacher> teachers = service.getAllTeachers();
        model.addAttribute("teachers", teachers);
        return "teacher/teachers";
    }
    @RequestMapping("/saveTeacher")
    public String saveTeacher(@ModelAttribute("teacher_info") Teacher teacher) {
        service.SaveTeacher(teacher);
        return "redirect:/teachers";
    }
    @RequestMapping("/updateTeacher")
    public String updateTeacher(@RequestParam("teacher_id") int id, Model model) {
        Teacher teacher   = service.getTeacherById( id );
        model.addAttribute("teacher_info",teacher);
        return "teacher/teacher_info";
    }

    @RequestMapping("/deleteTeacher")
    public String deleteTeacher(@RequestParam("teacher_id") int id, Model model) {
        service.deleteTeacher( id );

        return "redirect:/teachers";
    }

    @RequestMapping("/addTeacher")
    public String addCl(Model model) {
        Teacher teacher  = new Teacher();
        model.addAttribute("teacher_info",teacher);
        return "teacher/teacher_info";
    }



}
