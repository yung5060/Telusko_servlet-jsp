package com.kbank;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AddController {

	@RequestMapping("add")
	public ModelAndView add(@RequestParam("t1") int i, @RequestParam("t2") int j) {
		
//		int i = Integer.parseInt(t1), j = Integer.parseInt(t2);
		int k = i + j;
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("display.jsp");
		mv.addObject("result", k);
		
		return mv;
	}
	
//	@RequestMapping("/add")
//	public ModelAndView add(HttpServletRequest req, HttpServletResponse res) {
//		
//		int i = Integer.parseInt(req.getParameter("t1")), j = Integer.parseInt(req.getParameter("t2"));
//		
//		AddService as = new AddService();
//		int k = as.add(i, j);
//		
//		ModelAndView mv = new ModelAndView();
//		mv.setViewName("display");
//		mv.addObject("result", k);
//		
//		return mv;
//	}
}
