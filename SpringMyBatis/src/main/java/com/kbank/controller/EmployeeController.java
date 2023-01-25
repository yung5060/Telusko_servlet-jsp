package com.kbank.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kbank.dao.EmployeeMapper;

@Controller
public class EmployeeController {
	
	@Autowired
	EmployeeMapper mapper;

	@RequestMapping("/")
	public ModelAndView index() {
		System.out.println("index page called!");
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
}
