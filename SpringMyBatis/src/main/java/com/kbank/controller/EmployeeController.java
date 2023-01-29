package com.kbank.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kbank.dao.EmployeeMapper;
import com.kbank.entity.Employee;

@Controller
public class EmployeeController {

    @Autowired
    private EmployeeMapper mapper;

    @RequestMapping("/")
    public ModelAndView index() {
        ModelAndView mv = new ModelAndView("list-employees");
        mv.addObject("listemployees", mapper.getAllEmployees());
        return mv;
    }

//	@RequestMapping("/")
//	public String index() {
//		System.out.println("index page called!");
//		System.out.println(mapper.getAllEmployees());
//		return "list-employees";
//	}

    @RequestMapping("/showFormForAddEmployee")
    public ModelAndView showForm() {
        ModelAndView mv = new ModelAndView("add-employee");
        mv.addObject("employee", new Employee());
        return mv;
    }

    @RequestMapping("/saveProcess")
    public String saveProcess(@ModelAttribute("employee") Employee employee) {

        mapper.saveEmployee(employee);
        return "redirect:/";
    }

    @RequestMapping("/deleteEmployee")
    public String deleteEmployee(@RequestParam("employeeId") int employeeId) {
        
        System.out.println("EmployeeId : " + employeeId);
        
        return "redirect:/";
    }
}
