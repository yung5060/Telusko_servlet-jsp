package com.kbank.yung.entity;

import java.sql.Date;

public class Whitelist {
	
	private String CHNL_DV_CD;
	private String CUST_INFO;
	private Date PPRT_DTM;
	
	public String getCHNL_DV_CD() {
		return CHNL_DV_CD;
	}
	public void setCHNL_DV_CD(String cHNL_DV_CD) {
		CHNL_DV_CD = cHNL_DV_CD;
	}
	public String getCUST_INFO() {
		return CUST_INFO;
	}
	public void setCUST_INFO(String cUST_INFO) {
		CUST_INFO = cUST_INFO;
	}
	public Date getPPRT_DTM() {
		return PPRT_DTM;
	}
	public void setPPRT_DTM(Date pPRT_DTM) {
		PPRT_DTM = pPRT_DTM;
	}
	public Whitelist(String cHNL_DV_CD, String cUST_INFO) {
		super();
		CHNL_DV_CD = cHNL_DV_CD;
		CUST_INFO = cUST_INFO;
	}
	public Whitelist() {
		super();
	}
	
	
	
}
