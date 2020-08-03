package com.exe.dto;


 
public class EventBookingDTO {
	
	
	//총6개의 데이터
	private int eventBookingNum;
	private int eventIndex;
	private String userId;
	private String userName;
	private String userRequest;
	private String eventBookingDate;
	
	//추가된 컬럼(12월 04일)
	private String companionNumber;
	private String userSelectedDate;
	
	
	public String getCompanionNumber() {
		return companionNumber;
	}
	public void setCompanionNumber(String companionNumber) {
		this.companionNumber = companionNumber;
	}
	public String getUserSelectedDate() {
		return userSelectedDate;
	}
	public void setUserSelectedDate(String userSelectedDate) {
		this.userSelectedDate = userSelectedDate;
	}
	public int getEventBookingNum() {
		return eventBookingNum;
	}
	public void setEventBookingNum(int eventBookingNum) {
		this.eventBookingNum = eventBookingNum;
	}

	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	public int getEventIndex() {
		return eventIndex;
	}
	public void setEventIndex(int eventIndex) {
		this.eventIndex = eventIndex;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserRequest() {
		return userRequest;
	}
	public void setUserRequest(String userRequest) {
		this.userRequest = userRequest;
	}
	public String getEventBookingDate() {
		return eventBookingDate;
	}
	public void setEventBookingDate(String eventBookingDate) {
		this.eventBookingDate = eventBookingDate;
	}
	
	
	
	

}
