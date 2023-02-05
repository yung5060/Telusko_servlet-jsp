package com.kbank.yung.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kbank.yung.entity.Whitelist;
import com.kbank.yung.util.MyBatisUtil;

@Repository
public class WhitelistMapper {
	
	public List<Whitelist> getAllWhiteMembers() {
		
		SqlSession session = MyBatisUtil.getSqlSessionFactory().openSession();
		List<Whitelist> whitelist = session.selectList("getAllWhiteMembers");
		session.commit();
		session.close();
		
		return whitelist;
	}
}
