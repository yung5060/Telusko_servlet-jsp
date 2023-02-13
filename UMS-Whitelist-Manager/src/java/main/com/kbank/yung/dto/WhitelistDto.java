package com.kbank.yung.dto;

public class WhitelistDto {
	
	private String phoneNumber;
	private String channelCodes;
	
	public WhitelistDto(String channelCodes) {
		super();
		this.channelCodes = channelCodes;
	}
	
	
	public WhitelistDto() {
		super();
	}


	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public String getChannelCodes() {
		return channelCodes;
	}
	public void setChannelCodes(String channelCodes) {
		this.channelCodes = channelCodes;
	}
	
	
}
