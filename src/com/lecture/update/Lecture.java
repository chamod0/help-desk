package com.lecture.update;


public class Lecture {
	
	private int id;
	private String name;
	private String nic;
	private String pass;
	private String repass;
	private String lecmodule;
	private String email;
	private String tel;
	private String lecid;
	
	
	
	
	
	
	public Lecture(int id, String name, String nic, String pass, String repass, String lecmodule, String email,
			String tel, String lecid) {

		this.id = id;
		this.name = name;
		this.nic = nic;
		this.pass = pass;
		this.repass = repass;
		this.lecmodule = lecmodule;
		this.email = email;
		this.tel = tel;
		this.lecid = lecid;
	}
	
	
	
	
	public Lecture(String name, String nic, String lecmodule, String email, String tel, String pass, String repass,String lecid) {
		
		this.name = name;
		this.nic = nic;
		this.pass = pass;
		this.repass = repass;
		this.lecmodule = lecmodule;
		this.email = email;
		this.tel = tel;
		this.lecid = lecid;
	}




	




	public Lecture(int id, String name, String nic, String lecmodule, String email, String tel, String lecid) {
		
		this.id = id;
		this.name = name;
		this.nic = nic;
		this.lecmodule = lecmodule;
		this.email = email;
		this.tel = tel;
		this.lecid = lecid;
	}
	public Lecture(int id, String name, String nic, String lecmodule, String email, String tel) {
		
		this.id = id;
		this.name = name;
		this.nic = nic;
		this.lecmodule = lecmodule;
		this.email = email;
		this.tel = tel;
		
	}



	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getNic() {
		return nic;
	}
	public void setNic(String nic) {
		this.nic = nic;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getRepass() {
		return repass;
	}
	public void setRepass(String repass) {
		this.repass = repass;
	}
	public String getLecmodule() {
		return lecmodule;
	}
	public void setLecmodule(String lecmodule) {
		this.lecmodule = lecmodule;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getLecid() {
		return lecid;
	}
	public void setLecid(String lecid) {
		this.lecid = lecid;
	}
	
	
	
	@Override
	public String toString() {
		return "Lecture [id=" + id + ", name=" + name + ", nic=" + nic + ", pass=" + pass + ", repass=" + repass
					+ ", lecmodule=" + lecmodule + ", email=" + email + ", tel=" + tel + ", lecid=" + lecid + "]";
	}
	

}
