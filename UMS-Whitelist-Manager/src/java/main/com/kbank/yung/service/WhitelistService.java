package com.kbank.yung.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kbank.yung.dao.WhitelistMapper;
import com.kbank.yung.dto.AddByTextDto;
import com.kbank.yung.dto.WhitelistDto;
import com.kbank.yung.entity.Whitelist;
import com.kbank.yung.util.Aes128Crypt;
import com.kbank.yung.util.PagingVO;

@Service
public class WhitelistService {
	
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	WhitelistMapper mapper;
	
	@Autowired
	Aes128Crypt aes256Crypt;

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
			whitelistDto.setEncrypted_CUST_INFO(aes256Crypt.encAES(whitelist.getCUST_INFO()));
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
			if (custInfo.isEmpty()) {
				continue;
			}
			String tmp = mapper.getNewChannelCodes(custInfo);
			String phone = custInfo.replace("-", "").replace("_", "").replace(" ", "");
			String masked = phone.substring(0, 3) + "-****-" + phone.substring(7, 11);
			try {
				mapper.saveByText(custInfo);
				if (tmp == null) {
					result += (phone + " : " + "���� ����\n");
					logger.info(masked + " : " + "���� ���� (����)");
				} else {
					result += (phone + " : " + tmp + " �߰� (����)\n");
					logger.info(masked + " : " + tmp + " �߰� (����)");
				}
			} catch (Exception e) {
				e.printStackTrace();
				if (tmp == null) {
					result += (phone + " : " + "���� ���� (����)\n");
					logger.warn(masked + " : " + "���� ���� (����)");
				} else {
					result += (phone + " : " + tmp + " �߰� (����)\n");
					logger.warn(masked + " : " + tmp + " �߰� (����)");
				}
			}
		}
		return result.trim();
	}

	public void deleteMemberClean(String custInfo) throws Exception {
		String phone = aes256Crypt.decAES(custInfo);
		String masked = phone.substring(0, 3) + "-****-" + phone.substring(7, 11);
		Whitelist whitelist = new Whitelist();
		whitelist.setCUST_INFO(phone);		
		try {
			mapper.deleteMemberClean(whitelist);
			logger.info(masked + " : " + "���� ���� (����)");
		} catch (Exception e) {
			e.printStackTrace();
			logger.warn(masked + " : " + "���� ���� (����)");
		}
	}

	public void modifyMember(Whitelist whitelist) throws Exception {
		String phone = aes256Crypt.decAES(whitelist.getCUST_INFO());
		String masked = phone.substring(0, 3) + "-****-" + phone.substring(7, 11);
		whitelist.setCUST_INFO(phone);
		if (whitelist.getCHNL_DV_CD() == null) {
			try {
				mapper.deleteMemberClean(whitelist);
				logger.info(masked + " : " + "���� ���� (����)");
			} catch (Exception e) {
				e.printStackTrace();
				logger.warn(masked + " : " + "���� ���� (����)");
			}
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
					logger.info(masked + " : " + code + " �߰� (����)");
				} catch (Exception e) {
					e.printStackTrace();
					logger.info(masked + " : " + code + " �߰� ��� (�ߺ�)");
				}
			} else {
				try {
					mapper.deleteMember(tmp);
					logger.info(masked + " : " + code + " ���� (����)");
				} catch (Exception e) {
					e.printStackTrace();
					logger.info(masked + " : " + code + " ���� ��� (�ߺ�)");
				}
			}
		}
	}
}
