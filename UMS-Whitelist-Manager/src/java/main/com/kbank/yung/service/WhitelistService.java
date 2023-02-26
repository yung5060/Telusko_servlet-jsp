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
	
	public void deleteMemberClean(String rowNum, String searchNumber) {
		
		WhitelistDto whitelistDto = new WhitelistDto();
		whitelistDto.setRowNum(rowNum);
		whitelistDto.setSearchNumber(searchNumber);
		if (searchNumber == null) {
			try {
				mapper.deleteMemberClean(whitelistDto);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			try {
				mapper.deleteMemberCleanSearch(whitelistDto);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	public void modifyMember(WhitelistDto whitelistDto) {
		if (whitelistDto.getChannelCodes() == null) {
			if (whitelistDto.getSearchNumber() == "") {
				mapper.deleteMemberClean(whitelistDto);
			} else {
				mapper.deleteMemberCleanSearch(whitelistDto);
			}
			return;
		}
		String[] allCodes = {"K", "L", "M", "S"};
		String[] memberCodes = whitelistDto.getChannelCodes().split(",");
		for (String code : allCodes) {
			WhitelistDto tmp = new WhitelistDto();
			tmp.setChannelCodes(code);
			tmp.setRowNum(whitelistDto.getRowNum());
			tmp.setSearchNumber(whitelistDto.getSearchNumber());
			if (Arrays.asList(memberCodes).contains(code)) {
				try {
					mapper.saveMember(tmp);
				} catch (Exception e) {
					e.printStackTrace();
				}
			} else {
				try {
					mapper.deleteMember(tmp);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
	}
}
