package com.kbank.yung.dto;

public class WhitelistDto {
	
	private String rowNum;
	private String channelCodes;
	private String searchNumber;
	
	
	
	public String getSearchNumber() {
		return searchNumber;
	}


	public void setSearchNumber(String searchNumber) {
		this.searchNumber = searchNumber;
	}


	public WhitelistDto(String channelCodes) {
		super();
		this.channelCodes = channelCodes;
	}
	
	
	public WhitelistDto() {
		super();
	}

	

	public String getRowNum() {
		return rowNum;
	}


	public void setRowNum(String rowNum) {
		this.rowNum = rowNum;
	}


	public String getChannelCodes() {
		return channelCodes;
	}
	public void setChannelCodes(String channelCodes) {
		this.channelCodes = channelCodes;
	}
	
	
}
