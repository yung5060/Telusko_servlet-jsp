package com.kbank.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class EmployeeController {

	@RequestMapping("/")
	public String index() {
		System.out.println("index page called!");
		return "list-employees";
	}
}
