package com.exe.dto;

public class EventReviewDTO {
	
	private int eventReviewNum; 
	private int eventIndex;
	private String userId;
	private String name;
	private String email;
	private String content;
	private String created;
	
	
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	public int getEventReviewNum() {
		return eventReviewNum;
	}
	public void setEventReviewNum(int eventReviewNum) {
		this.eventReviewNum = eventReviewNum;
	}
	public int getEventIndex() {
		return eventIndex;
	}
	public void setEventIndex(int eventIndex) {
		this.eventIndex = eventIndex;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getCreated() {
		return created;
	}
	public void setCreated(String created) {
		this.created = created;
	}
	
	
	
	
	
	
	

}
