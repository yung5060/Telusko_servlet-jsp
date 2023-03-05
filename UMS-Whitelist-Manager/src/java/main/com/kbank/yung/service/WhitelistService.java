package com.kbank.yung.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kbank.yung.dao.WhitelistMapper;
import com.kbank.yung.dto.AddByTextDto;
import com.kbank.yung.dto.WhitelistDto;
import com.kbank.yung.entity.Whitelist;
import com.kbank.yung.util.Aes256Crypt;
import com.kbank.yung.util.PagingVO;

@Service
public class WhitelistService {
	
	private static final String key = "32fakecodingsecretinyouranykey32";

	@Autowired
	WhitelistMapper mapper;
	
	@Autowired
	Aes256Crypt aes256Crypt;

	public int countAll() {
		return mapper.countAll();
	}

	public int countSearch(String searchNumber) {
		return mapper.countSearch(searchNumber);
	}

	public List<WhitelistDto> getWhiteMembersAllOrSearch(PagingVO paging) throws Exception {
		List<Whitelist> tmp = null;
		List<WhitelistDto> result = new ArrayList<WhitelistDto>();
		if (paging.getSearchNumber() == null) {
			tmp = mapper.getWhiteMembersAll(paging);
		} else {
			tmp = mapper.getWhiteMembersSearch(paging);
		}
		for (Whitelist whitelist : tmp) {
			WhitelistDto whitelistDto = new WhitelistDto();
			whitelistDto.setCHNL_DV_CD(whitelist.getCHNL_DV_CD());
			whitelistDto.setCUST_INFO(whitelist.getCUST_INFO());
			whitelistDto.setPPRT_DTM(whitelist.getPPRT_DTM());
			whitelistDto.setEncrypted_CUST_INFO(aes256Crypt.aes256Encode(whitelist.getCUST_INFO(), key));
			result.add(whitelistDto);
		}
		return result;
	}

	public String saveByText(AddByTextDto addByTextDto) {
		String result = "";
		String text = addByTextDto.getPhoneNumbers().trim();
		String[] phoneNumbers = text.split("\r?\n|\r");
		for (String custInfo : phoneNumbers) {
			custInfo = custInfo.trim();
			if (custInfo == "") {
				continue;
			}
			String tmp = mapper.getNewChannelCodes(custInfo);
			
			try {
				mapper.saveByText(custInfo);
				if (tmp == null) {
					result += (custInfo.replace("-", "").replace("_", "").replace(" ", "") + " : " + "변경 없음\n");
				} else {
					result += (custInfo.replace("-", "").replace("_", "").replace(" ", "") + " : " + tmp + " 추가 (성공)\n");
				}
			} catch (Exception e) {
				e.printStackTrace();
				if (tmp == null) {
					result += (custInfo.replace("-", "").replace("_", "").replace(" ", "") + " : " + "변경 없음 (실패)\n");
				} else {
					result += (custInfo.replace("-", "").replace("_", "").replace(" ", "") + " : " + tmp + " 추가 (실패)\n");
				}
			}
		}
		return result.trim();
	}

	public void deleteMemberClean(String custInfo) throws Exception {
		Whitelist whitelist = new Whitelist();
		whitelist.setCUST_INFO(aes256Crypt.aes256Decode(custInfo, key));
		try {
			mapper.deleteMemberClean(whitelist);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void modifyMember(Whitelist whitelist) throws Exception {
		whitelist.setCUST_INFO(aes256Crypt.aes256Decode(whitelist.getCUST_INFO(), key));
		if (whitelist.getCHNL_DV_CD() == null) {
			mapper.deleteMemberClean(whitelist);
			return;
		}
		String[] allCodes = { "K", "L", "M", "S" };
		String[] memberCodes = whitelist.getCHNL_DV_CD().split(",");
		for (String code : allCodes) {
			Whitelist tmp = new Whitelist();
			tmp.setCHNL_DV_CD(code);
			tmp.setCUST_INFO(whitelist.getCUST_INFO());
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
