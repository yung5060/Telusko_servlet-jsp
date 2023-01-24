package com.kbank;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kbank.service.AddService;

@Controller
public class AddController {

//	@RequestMapping("/add")
//	public ModelAndView add(@RequestParam String t1, @RequestParam String t2) {
//		
//		int i = Integer.parseInt(t1), j = Integer.parseInt(t2);
//		int k = i + j;
//		
//		ModelAndView mv = new ModelAndView();
//		mv.setViewName("display.jsp");
//		mv.addObject("result", k);
//		
//		return mv;
//	}
	
	@RequestMapping("/add")
	public ModelAndView add(HttpServletRequest req, HttpServletResponse res) {
		
		int i = Integer.parseInt(req.getParameter("t1")), j = Integer.parseInt(req.getParameter("t2"));
		
		AddService as = new AddService();
		int k = as.add(i, j);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("display.jsp");
		mv.addObject("result", k);
		
		return mv;
	}
}
