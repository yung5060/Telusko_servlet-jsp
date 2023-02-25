package com.kbank.yung.service;

import java.util.Arrays;
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
			try {
				mapper.saveByText(custInfo);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	public void deleteMemberClean(String custInfo) {
		
		Whitelist whitelist = new Whitelist();
		whitelist.setCUST_INFO(custInfo);
		try {
			mapper.deleteMemberClean(whitelist);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public void modifyMember(Whitelist whitelist) {
		if (whitelist.getCHNL_DV_CD() == null) {
			mapper.deleteMemberClean(whitelist);
			return;
		}
		String[] allCodes = {"K", "L", "M", "S"};
		String[] memberCodes = whitelist.getCHNL_DV_CD().split(",");
		for (String code : allCodes) {
			if (Arrays.asList(memberCodes).contains(code)) {
				try {
					mapper.saveMember(new Whitelist(code, whitelist.getCUST_INFO()));
				} catch (Exception e) {
					e.printStackTrace();
				}
			} else {
				try {
					mapper.deleteMember(new Whitelist(code, whitelist.getCUST_INFO()));
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
	}
}
