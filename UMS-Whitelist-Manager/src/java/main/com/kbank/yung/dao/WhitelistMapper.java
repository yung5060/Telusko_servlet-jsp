package com.kbank.yung.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kbank.yung.dto.WhitelistDto;
import com.kbank.yung.entity.Whitelist;
import com.kbank.yung.util.MyBatisUtil;
import com.kbank.yung.util.PagingVO;

@Repository
public class WhitelistMapper {
	
	
	public int countAll() {
		
		SqlSession session = MyBatisUtil.getSqlSessionFactory().openSession();
		int count = (int) session.selectOne("countAll");
		session.commit();
		session.close();
		return count;
	}
	
	public int countSearch(String searchNumber) {
		
		SqlSession session = MyBatisUtil.getSqlSessionFactory().openSession();
		int count = (int) session.selectOne("countSearch", searchNumber);
		session.commit();
		session.close();
		return count;
	}
	
	public List<Whitelist> getWhiteMembersAll(PagingVO paging) {
		
		SqlSession session = MyBatisUtil.getSqlSessionFactory().openSession();
		List<Whitelist> whitelist = session.selectList("getWhiteMembersAll", paging);
		session.commit();
		session.close();
		return whitelist;
	}
	
	public List<Whitelist> getWhiteMembersSearch(PagingVO paging) {
		
		SqlSession session = MyBatisUtil.getSqlSessionFactory().openSession();
		List<Whitelist> whitelist = session.selectList("getWhiteMembersSearch", paging);
		session.commit();
		session.close();
		return whitelist;
	}
	
	public void saveMember(WhitelistDto whitelistDto) {
		
		SqlSession session = MyBatisUtil.getSqlSessionFactory().openSession();
		if (whitelistDto.getSearchNumber() == "") {
			session.insert("insertMember", whitelistDto);
		} else {
			session.insert("insertMemberSearch", whitelistDto);
		}
		session.commit();
		session.close();
	}
	
	public void saveByText(String custInfo) {
		
		SqlSession session = MyBatisUtil.getSqlSessionFactory().openSession();
		session.insert("insertByText", custInfo);
		session.commit();
		session.close();
	}
	
	public void deleteMemberClean(WhitelistDto whitelistDto) {
		
		SqlSession session = MyBatisUtil.getSqlSessionFactory().openSession();
		session.delete("deleteMemberClean", whitelistDto);
		session.commit();
		session.close();
	}
	
	public void deleteMemberCleanSearch(WhitelistDto whitelistDto) {
		SqlSession session = MyBatisUtil.getSqlSessionFactory().openSession();
		session.delete("deleteMemberCleanSearch", whitelistDto);
		session.commit();
		session.close();
	}
	
	public void deleteMember(WhitelistDto whitelistDto) {
		
		SqlSession session = MyBatisUtil.getSqlSessionFactory().openSession();
		if (whitelistDto.getSearchNumber() == "") {
			session.delete("deleteMember", whitelistDto);
		} else {
			session.delete("deleteMemberSearch", whitelistDto);
		}
		session.commit();
		session.close();
	}
}
