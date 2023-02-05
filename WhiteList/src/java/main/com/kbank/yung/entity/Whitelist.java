package com.kbank.yung.entity;

import java.sql.Timestamp;

public class Whitelist {
	
	private String UMS_VAL;
	private String CUST_INFO;
	private Timestamp CREATED_AT;
	
	
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
	public Timestamp getCREATED_AT() {
		return CREATED_AT;
	}
	public void setCREATED_AT(Timestamp cREATED_AT) {
		CREATED_AT = cREATED_AT;
	}
	
	
}
