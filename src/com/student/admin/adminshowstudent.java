package com.student.admin;


public class adminshowstudent {
	private int id;
	private String nic;
	private String name;
	private String email;
	private String regno;
	
	private String tel;
	
	private String lecmodule;
	private String dob;
	private String address;
	private String pass;
	private String repass;
	
	
	
	
	









	public adminshowstudent(int id, String nic, String name, String email, String regno, String tel, String dob,
			String address, String pass, String repass) {
		
		this.id = id;
		this.nic = nic;
		this.name = name;
		this.email = email;
		this.regno = regno;
		this.tel = tel;
		this.dob = dob;
		this.address = address;
		this.pass = pass;
		this.repass = repass;
	}
	public adminshowstudent( String nic, String name, String email, String regno, String tel, String dob,
			String address, String pass, String repass) {
		
		this.nic = nic;
		this.name = name;
		this.email = email;
		this.regno = regno;
		this.tel = tel;
		this.dob = dob;
		this.address = address;
		this.pass = pass;
		this.repass = repass;
	}





	public adminshowstudent(int id, String name, String email, String regno, String nic) {
		
		this.name = name;
		this.email = email;
		this.regno = regno;
		this.nic = nic;
		this.id= id;
	}
	

	


	public adminshowstudent(String pass, String repass, String name, String email, String nic, String tel,
			String lecmodule) {
		super();
		this.pass = pass;
		this.repass = repass;
		this.name = name;
		this.email = email;
		this.nic = nic;
		this.tel = tel;
		this.lecmodule = lecmodule;
	}





	public adminshowstudent(String name, String email, String regno, String nic) {
		
		this.name = name;
		this.email = email;
		this.regno = regno;
		this.nic = nic;
	}





	public adminshowstudent(String pass, String repass, String name, String email,String nic) {
		
		this.pass = pass;
		this.repass = repass;
		this.name = name;
		this.email = email;
		
		this.nic = nic;
	
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



	public String getEmail() {
		return email;
	}



	public void setEmail(String email) {
		this.email = email;
	}



	public String getRegno() {
		return regno;
	}



	public void setRegno(String regno) {
		this.regno = regno;
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





	public String getTel() {
		return tel;
	}





	public void setTel(String tel) {
		this.tel = tel;
	}





	public String getLecmodule() {
		return lecmodule;
	}





	public void setLecmodule(String lecmodule) {
		this.lecmodule = lecmodule;
	}





	public String getDob() {
		return dob;
	}





	public void setDob(String dob) {
		this.dob = dob;
	}





	public String getAddress() {
		return address;
	}





	public void setAddress(String address) {
		this.address = address;
	}





	@Override
	public String toString() {
		return "adminshowstudent [pass=" + pass + ", repass=" + repass + ", name=" + name + ", email=" + email
				+ ", regno=" + regno + ", nic=" + nic + ", tel=" + tel + ", lecmodule=" + lecmodule + ", dob=" + dob
				+ ", address=" + address + ", id=" + id + "]";
	}





	



	

}
