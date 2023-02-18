package com.kbank.yung.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kbank.yung.dto.AddByTextDto;
import com.kbank.yung.dto.WhitelistDto;
import com.kbank.yung.service.WhitelistService;
import com.kbank.yung.util.PagingVO;

@Controller
public class WhitelistController {
	
	@Autowired
	WhitelistService service;
	

	@RequestMapping("/list")
	public String list(PagingVO vo, Model model
			, @RequestParam(value="nowPage", required=false)String nowPage
			, @RequestParam(value="cntPerPage", required=false)String cntPerPage
			, @RequestParam(value="searchNumber", required=false)String searchNumber) {
		
		int total = 0;
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "20";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "20";
		}
		if (searchNumber == null) {
			total = service.countAll();
			vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		} else {
			total = service.countSearch(searchNumber);
			vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage), searchNumber);
		}
		
		model.addAttribute("paging", vo);
		model.addAttribute("viewAll", service.getWhiteMembersAllOrSearch(vo));
		
		return "whitelist-table";
	}
	
	
	@RequestMapping("/showFormForAddWhiteMember")
	public ModelAndView showForm() {
		
		ModelAndView mv = new ModelAndView("add-whitelist");
		mv.addObject("whitelistDto", new WhitelistDto());
		mv.addObject("addByTextDto", new AddByTextDto());
		return mv;
	}
	
	@RequestMapping("/saveProcess")
	public String saveProcess(@ModelAttribute("whitelistDto") WhitelistDto whitelistDto) {
		
		service.saveMember(whitelistDto);
		
		return "redirect:/list";
	}
	
	@RequestMapping("/saveByText")
	public String saveByText(@ModelAttribute("addByTextDto") AddByTextDto addByTextDto) {
		
		service.saveByText(addByTextDto);
		
		return "redirect:/list";
	}
	
	@RequestMapping("/deleteProcess")
	public String deleteWhiteMember(@RequestParam("custInfo") String custInfo
			, @RequestParam(value="searchNumber", required=false)String searchNumber) {
		
		service.deleteMember(custInfo);
		if (searchNumber != null) {
			return "redirect:/list?searchNumber=" + searchNumber;
		} else {
			return "redirect:/list";
		}
	}
}
