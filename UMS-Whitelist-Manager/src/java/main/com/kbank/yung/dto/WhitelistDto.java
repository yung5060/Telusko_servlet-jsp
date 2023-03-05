package com.kbank.yung.dto;

import java.sql.Date;

public class WhitelistDto {
	
	private String CHNL_DV_CD;
	private String CUST_INFO;
	private String encrypted_CUST_INFO;
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
	public String getEncrypted_CUST_INFO() {
		return encrypted_CUST_INFO;
	}
	public void setEncrypted_CUST_INFO(String encrypted_CUST_INFO) {
		this.encrypted_CUST_INFO = encrypted_CUST_INFO;
	}
	public Date getPPRT_DTM() {
		return PPRT_DTM;
	}
	public void setPPRT_DTM(Date pPRT_DTM) {
		PPRT_DTM = pPRT_DTM;
	}
	
	
}
