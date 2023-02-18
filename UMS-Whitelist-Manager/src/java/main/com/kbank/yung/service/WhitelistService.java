package com.kbank.yung.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kbank.yung.dao.WhitelistMapper;
import com.kbank.yung.dto.AddByTextDto;
import com.kbank.yung.dto.WhitelistDto;
import com.kbank.yung.entity.Whitelist;
import com.kbank.yung.util.PagingVO;

@Service
public class WhitelistService {

	@Autowired
	WhitelistMapper mapper;
	
	public int countAll() {
		return mapper.countAll();
	}
	
	public int countSearch(String searchNumber) {
		return mapper.countSearch(searchNumber);
	}
	
	public List<Whitelist> getWhiteMembersAllOrSearch(PagingVO paging) {
		if (paging.getSearchNumber() == null) {
			return mapper.getWhiteMembersAll(paging);
		} else {
			return mapper.getWhiteMembersSearch(paging);
		}
	}
	
	
	public void saveMember(WhitelistDto whitelistDto) {
		
		for (int i = 0; i < whitelistDto.getChannelCodes().length(); i += 2) {
			Whitelist whitelist = new Whitelist();
			whitelist.setCHNL_DV_CD(String.valueOf(whitelistDto.getChannelCodes().charAt(i)));
			whitelist.setCUST_INFO(whitelistDto.getPhoneNumber());
			try {
				mapper.saveMember(whitelist);
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println(e.toString());
			}
		}
	}
	
	public void saveByText(AddByTextDto addByTextDto) {
		
		String text = addByTextDto.getPhoneNumbers().trim();
		String[] phoneNumbers = text.split("\r?\n|\r");
		for (String custInfo : phoneNumbers) {
			mapper.saveByText(custInfo);
		}
	}
	
	public void deleteMember(String custInfo) {
		
		Whitelist whitelist = new Whitelist();
		whitelist.setCUST_INFO(custInfo);
		try {
			mapper.deleteMember(whitelist);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
}
