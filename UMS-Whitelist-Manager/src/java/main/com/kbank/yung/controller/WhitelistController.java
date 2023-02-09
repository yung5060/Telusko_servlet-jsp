package com.kbank.yung.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kbank.yung.dao.WhitelistMapper;
import com.kbank.yung.dto.WhitelistDto;
import com.kbank.yung.service.WhitelistService;

@Controller
public class WhitelistController {
	
	@Autowired
	WhitelistMapper mapper;
	
	@Autowired
	WhitelistService service;

	@RequestMapping("/")
	public ModelAndView index() {
		ModelAndView mv = new ModelAndView("whitelist-table");
		mv.addObject("whitelist", mapper.getAllWhiteMembers());
		return mv;
	}
	
	@RequestMapping("/showFormForAddWhiteMember")
	public ModelAndView showForm() {
		
		ModelAndView mv = new ModelAndView("add-whitelist");
		mv.addObject("whitelistDto", new WhitelistDto("K,L,M,S"));
		return mv;
	}
	
	@RequestMapping("/saveProcess")
	public String saveProcess(@ModelAttribute("whitelistDto") WhitelistDto whitelistDto) {
		
		service.saveWhiteMember(whitelistDto);
		
		return "redirect:/";
	}
	
	@RequestMapping("/deleteWhiteMember")
	public String deleteWhiteMember(@RequestParam("umsVal") String umsVal, @RequestParam("custInfo") String custInfo) {
		
		service.deleteWhiteMember(umsVal, custInfo);
		
		return "redirect:/";
	}
}
