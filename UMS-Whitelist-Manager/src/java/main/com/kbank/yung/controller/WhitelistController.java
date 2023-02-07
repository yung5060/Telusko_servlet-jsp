package com.kbank.yung.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kbank.yung.dao.WhitelistMapper;

@Controller
public class WhitelistController {
	
	@Autowired
	WhitelistMapper mapper;

	@RequestMapping("/")
	public ModelAndView index() {
		ModelAndView mv = new ModelAndView("whitelist-table");
		mv.addObject("whitelist", mapper.getAllWhiteMembers());
		return mv;
	}
}
