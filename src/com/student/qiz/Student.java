package com.student.qiz;




public class Student {

	private int id;
	private String module;
	private String topic;
	private String qiz;
	private String attachment;
	private String header;
	private String answer;
	private String lecattachment;
	private String stdid;
	private String lecture;
	
	public Student(String topic, String qiz, String attachment,String header,String answer,String lecattachment,String module) {
		this.module=module;
		this.topic = topic;
		this.qiz = qiz;
		this.attachment = attachment;
		
	
	}

	public Student(int id, String topic, String qiz, String attachment,String header,String answer,String lecattachment, String module,String stdid,String lecture) {
		this.id = id;
		this.module=module;
		this.topic = topic;
		this.qiz = qiz;
		this.attachment = attachment;
		this.header = header;
		this.answer = answer;
		this.lecattachment = lecattachment;
		this.lecture = lecture;
		this.stdid = stdid;
	}
	public Student( String topic, String qiz, String attachment,String header,String answer,String lecattachment, String module,String stdid,String lecture) {
		
		this.module=module;
		this.topic = topic;
		this.qiz = qiz;
		this.attachment = attachment;
		this.header = header;
		this.answer = answer;
		this.lecattachment = lecattachment;
		this.lecture = lecture;
		this.stdid = stdid;
	}
	public Student(int id,String header,String answer,String lecattachment, String module) {
		this.id = id;
		this.module=module;
		this.header = header;
		this.answer = answer;
		this.lecattachment = lecattachment;
	

	}
	public Student(int id, String topic, String qiz, String attachment,String header,String answer,String lecattachment, String module,String lecture) {
		this.id = id;
		this.module=module;
		this.topic = topic;
		this.qiz = qiz;
		this.attachment = attachment;
		this.header = header;
		this.answer = answer;
		this.lecattachment = lecattachment;
		this.lecture = lecture;
		
	}
	

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	public String getModule() {
		return module;
	}

	public void setModule(String module) {
		this.module = module;
	}
	public String getFirstName() {
		return topic;
	}

	public void setFirstName(String topic) {
		this.topic = topic;
	}

	public String getLastName() {
		return qiz;
	}

	public void setLastName(String qiz) {
		this.qiz = qiz;
	}

	public String getEmail() {
		return attachment;
	}

	public void setEmail(String attachment) {
		this.attachment = attachment;
	}

	public String getHeader() {
		return header;
	}

	public void setHeader(String header) {
		this.header = header;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public String getLecattachment() {
		return lecattachment;
	}

	public void setLecattachment(String lecattachment) {
		this.lecattachment = lecattachment;
	}

	public String getStdid() {
		return stdid;
	}

	public void setStdid(String stdid) {
		this.stdid = stdid;
	}

	public String getLecture() {
		return lecture;
	}

	public void setLecture(String lecture) {
		this.lecture = lecture;
	}

	@Override
	public String toString() {
		return "Student [id=" + id + ", module=" + module + ", topic=" + topic + ", qiz=" + qiz + ", attachment=" + attachment + ", header=" + header + ", answer=" + answer + ", lecattachment="
	+ lecattachment + ", stdid=" + stdid +", lecture=" + lecture +"]";
	}

	
}
