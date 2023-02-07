package com.kbank.yung.entity;

import java.sql.Date;

public class Whitelist {
	
	private String UMS_VAL;
	private String CUST_INFO;
	private Date CREATED_AT;
	
	
	public String getUMS_VAL() {
		return UMS_VAL;
	}
	public void setUMS_VAL(String uMS_VAL) {
		UMS_VAL = uMS_VAL;
	}
	public String getCUST_INFO() {
		return CUST_INFO;
	}
	public void setCUST_INFO(String cUST_INFO) {
		CUST_INFO = cUST_INFO;
	}
	public Date getCREATED_AT() {
		return CREATED_AT;
	}
	public void setCREATED_AT(Date cREATED_AT) {
		CREATED_AT = cREATED_AT;
	}
	
	
	
	
}
