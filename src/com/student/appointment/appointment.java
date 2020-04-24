package com.student.appointment;

public class appointment {
	private int appid;
	private String module;
	private String lecture;
	private String datetime;
	private String comment;
	private String status;
	
	
	
	
	
	public appointment(String module, String lecture, String datetime, String comment) {
		super();
		this.module = module;
		this.lecture = lecture;
		this.datetime = datetime;
		this.comment = comment;
		
	}





	public appointment(int appid, String status) {
		super();
		this.appid = appid;
		
		this.status = status;
	}

	public appointment(int appid, String module, String lecture, String datetime, String comment, String status) {
		super();
		this.appid = appid;
		this.module = module;
		this.lecture = lecture;
		this.datetime = datetime;
		this.comment = comment;
		this.status = status;
	}









	public int getAppid() {
		return appid;
	}





	public void setAppid(int appid) {
		this.appid = appid;
	}





	public String getModule() {
		return module;
	}





	public void setModule(String module) {
		this.module = module;
	}





	public String getLecture() {
		return lecture;
	}





	public void setLecture(String lecture) {
		this.lecture = lecture;
	}





	public String getDatetime() {
		return datetime;
	}





	public void setDatetime(String datetime) {
		this.datetime = datetime;
	}





	public String getComment() {
		return comment;
	}





	public void setComment(String comment) {
		this.comment = comment;
	}





	public String getStatus() {
		return status;
	}





	public void setStatus(String status) {
		this.status = status;
	}





	@Override
	public String toString() {
		return "appointment [appid=" + appid + ", module=" + module + ", lecture=" + lecture + ", datetime=" + datetime + ", comment=" + comment +" , status=" + status +"]";
	}
	

}
