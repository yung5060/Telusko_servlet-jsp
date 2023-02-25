package com.kbank.yung.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kbank.yung.dto.AddByTextDto;
import com.kbank.yung.dto.WhitelistDto;
import com.kbank.yung.entity.Whitelist;
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
			cntPerPage = "15";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "15";
		}
		if (searchNumber == null) {
			total = service.countAll();
			vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		} else {
			total = service.countSearch(searchNumber);
			vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage), searchNumber);
		}
		
		model.addAttribute("paging", vo);
		model.addAttribute("addByTextDto", new AddByTextDto());
		model.addAttribute("whitelist", new Whitelist());
		model.addAttribute("viewAll", service.getWhiteMembersAllOrSearch(vo));
		
		return "whitelist-table";
	}
	
	
	@RequestMapping("/saveProcess")
	public String saveProcess(@ModelAttribute("whitelistDto") WhitelistDto whitelistDto, HttpServletRequest request) {
		
		service.saveMember(whitelistDto);
		
		String referer = request.getHeader("Referer");
		
		return "redirect:" + referer;
	}
	
	@RequestMapping("/saveByText")
	public String saveByText(@ModelAttribute("addByTextDto") AddByTextDto addByTextDto, HttpServletRequest request) {
		
		service.saveByText(addByTextDto);
		String referer = request.getHeader("Referer");
		
		return "redirect:" + referer;
	}
	
	@RequestMapping("/deleteProcess")
	public String deleteWhiteMember(@RequestParam("custInfo") String custInfo
			, @RequestParam(value="searchNumber", required=false)String searchNumber) {
		
		service.deleteMemberClean(custInfo);
		if (searchNumber != null) {
			return "redirect:/list?searchNumber=" + searchNumber;
		} else {
			return "redirect:/list";
		}
	}
	
	@RequestMapping("/modifyProcess")
	public String modifyWhiteMember(@ModelAttribute("whitelist") Whitelist whitelist, HttpServletRequest request) {
		service.modifyMember(whitelist);
		String referer = request.getHeader("Referer");
		return "redirect:" + referer;
	}
}
