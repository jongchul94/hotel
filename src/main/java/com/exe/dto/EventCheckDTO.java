package com.exe.dto;

public class EventCheckDTO {
	
	private String eventTitle;
	private String startDate;
	private String endDate;
	private String time;
	private String location;
	private String price;
	private String content1;
	private String savefileName;
	
	private int eventBookingNum;
	private String userRequest;
	private String eventBookingDate;
	
	//새로추가된 항목
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
	public String getEventTitle() {
		return eventTitle;
	}
	public void setEventTitle(String eventTitle) {
		this.eventTitle = eventTitle;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getContent1() {
		return content1;
	}
	public void setContent1(String content1) {
		this.content1 = content1;
	}
	public String getSavefileName() {
		return savefileName;
	}
	public void setSavefileName(String savefileName) {
		this.savefileName = savefileName;
	}
	public int getEventBookingNum() {
		return eventBookingNum;
	}
	public void setEventBookingNum(int eventBookingNum) {
		this.eventBookingNum = eventBookingNum;
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
