package com.student.admin;


import java.sql.Connection;




import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import javax.sql.DataSource;

import java.sql.PreparedStatement;




public class adminstudentdbutil {

	private DataSource dataSource;
	
	public adminstudentdbutil(DataSource theDataSource) {
		dataSource = theDataSource;
	}
	
	public List <adminshowstudent> getStudent(String stid) throws Exception{
		
		List<adminshowstudent> students = new ArrayList<>();
		
		Connection myConn = null;
		Statement myStmt = null;
		ResultSet myRs = null;
		
		try {
			 myConn = dataSource.getConnection();
			 String sql = "select * from student where regno='"+stid+"' order by id";
			 myStmt = myConn.createStatement();
			 myRs = myStmt.executeQuery(sql);
			 
			 while(myRs.next()) {
				 int id=Integer.parseInt(myRs.getString("id"));
				 String name = myRs.getString("name");
				 String email = myRs.getString("email");
				 String regno = myRs.getString("regno");
				 String nic = myRs.getString("nic");
				 String tel = myRs.getString("tel");
				 String dob = myRs.getString("dob");
				 String address = myRs.getString("address");
				 String pass = myRs.getString("pass");
				 String repass = myRs.getString("repass");
				 //int id1 = Integer.parseInt(id);
			
			 
				 adminshowstudent tempstudent = new adminshowstudent(id,  nic, name,email,regno,tel,dob,address,pass, repass);
				 students.add(tempstudent);
			
			 }
			
			 return students;
		}
		
		finally {
			
			close(myConn, myStmt, myRs);
		}
		
		
	}

	public List <adminshowstudent> getStudents() throws Exception{
		
		List<adminshowstudent> students = new ArrayList<>();
		
		Connection myConn = null;
		Statement myStmt = null;
		ResultSet myRs = null;
		
		try {
			 myConn = dataSource.getConnection();
			 String sql = "select * from student order by id";
			 myStmt = myConn.createStatement();
			 myRs = myStmt.executeQuery(sql);
			 
			 while(myRs.next()) {
				 int id=Integer.parseInt(myRs.getString("id"));
				 String name = myRs.getString("name");
				 String email = myRs.getString("email");
				 String regno = myRs.getString("regno");
				 String nic = myRs.getString("nic");
				 //int id1 = Integer.parseInt(id);
			
			 
				 adminshowstudent tempstudent = new adminshowstudent(id, name, email, regno, nic);
				 students.add(tempstudent);
			
			 }
			
			 return students;
		}
		
		finally {
			
			close(myConn, myStmt, myRs);
		}
		
		
	}


	private void close(Connection myConn, Statement myStmt, ResultSet myRs) {
		// TODO Auto-generated method stub
		
		try {
			if(myRs !=null) {
				myRs.close();
			}
			if(myStmt !=null) {
				myRs.close();
			}
			if(myConn !=null) {
				myRs.close();
			}
		}
		catch (Exception exc) {
			// TODO: handle exception
			exc.printStackTrace();
		}
	
	
	}


	public void addStudent(adminshowstudent theAdminshowstudent) throws Exception{
		
		Connection myConn = null;
		PreparedStatement myStmt = null;
		
		try {
			myConn = dataSource.getConnection();
			
			String sql = "insert into student" 
						 + "(name, email, regno, nic)" 
						 + "values(?,?,?,?)";
	
			myStmt = myConn.prepareStatement(sql);
			
			myStmt.setString(1, theAdminshowstudent.getName());
			myStmt.setString(2, theAdminshowstudent.getEmail());
			myStmt.setString(3, theAdminshowstudent.getRegno());
			myStmt.setString(4, theAdminshowstudent.getNic());
			
			myStmt.execute();
		}
		finally {
			close(myConn, myStmt, null);
		}
		
	}


	public adminshowstudent getStudents(String theStudentId) throws Exception {
		// TODO Auto-generated method stub
		adminshowstudent theAdminshowstudent = null;
		
		Connection myConn = null;
		PreparedStatement myStmt = null;
		ResultSet myRs = null;
		int studentId;
		
		try {
				studentId = Integer.parseInt(theStudentId);
			
				myConn = dataSource.getConnection();
				
				String sql = "select * from student where id=?";
			
				myStmt = myConn.prepareStatement(sql);
				
				myStmt.setInt(1, studentId);
				
				myRs = myStmt.executeQuery();
				
				if(myRs.next()) 
				{
					
					 String name = myRs.getString("name");
					 String email = myRs.getString("email");
					 String regno = myRs.getString("regno");
					 String nic = myRs.getString("nic");
					 String tel = myRs.getString("tel");
					 String dob = myRs.getString("dob");
					 String address = myRs.getString("address");
					 String pass = myRs.getString("pass");
					 String repass = myRs.getString("repass");
				
					theAdminshowstudent = new  adminshowstudent (studentId, nic,  name,  email,  regno, tel, dob, address,  pass,  repass);
					
				}else{
						
						throw new Exception("Could not find Student ID " + studentId);
					}
				
					return theAdminshowstudent;
				
				
			
		}
		finally {
		
			close(myConn, myStmt, myRs);
		}
		
		
		
	}


	public void updateStudent(adminshowstudent theAdminshowstudent) throws Exception {
		// TODO Auto-generated method stub
		Connection myConn = null;
		
		PreparedStatement myStmt = null;
		
		try {
		myConn = dataSource.getConnection();
		
		String sql = "update student "
					+ "set nic =?,  name=?,  email= ?,  regno=?"
					+ "where id=?";
	
		myStmt = myConn.prepareStatement(sql);
		
	
		myStmt.setString(1, theAdminshowstudent.getNic());
		myStmt.setString(2, theAdminshowstudent.getName());
		myStmt.setString(3, theAdminshowstudent.getEmail());
		
		myStmt.setString(4, theAdminshowstudent.getRegno());
		

		myStmt.setInt(5, theAdminshowstudent.getId());
		
			myStmt.execute();
		}
		finally {
			
			close(myConn, myStmt, null);
		}
		
	}


	public void deleteStudent(String theStudentId) throws Exception{
		
		Connection myConn = null;
		PreparedStatement myStmt = null;
		
		try {
			
			int studentId = Integer.parseInt(theStudentId);
			
			myConn = dataSource.getConnection();
			
			
			String sql = "delete from student where id= ? ";
			
			myStmt = myConn.prepareStatement(sql);
			
			myStmt.setInt(1, studentId);
			
			myStmt.execute();
			
		}
		finally {
			
				close(myConn, myStmt, null);
			
		}
		
	}


	public void registerStudent(adminshowstudent theAdminshowstudent) throws Exception{
		
		Connection myConn = null;
		PreparedStatement myStmt = null;
		
		try {
			myConn = dataSource.getConnection();
			
			String sql = "insert into student" 
					 + "(nic,  name,  email,  regno, tel, dob, address,  pass,  repass)" 
					 + "values(?,?,?,?,?,?,?,?,?)";

		myStmt = myConn.prepareStatement(sql);
		myStmt.setString(1, theAdminshowstudent.getNic());
		myStmt.setString(2, theAdminshowstudent.getName());
		myStmt.setString(3, theAdminshowstudent.getEmail());
		
		myStmt.setString(4, theAdminshowstudent.getRegno());
		
		myStmt.setString(5, theAdminshowstudent.getTel());
		myStmt.setString(6, theAdminshowstudent.getDob());
		myStmt.setString(7, theAdminshowstudent.getAddress());
		myStmt.setString(8, theAdminshowstudent.getPass());
		myStmt.setString(9, theAdminshowstudent.getRepass());
		myStmt.execute();
		}
		finally {
			close(myConn, myStmt, null);
		}
		
	}
	public void updateStudent2(adminshowstudent theAdminshowstudent) throws Exception {
		// TODO Auto-generated method stub
		Connection myConn = null;
		
		PreparedStatement myStmt = null;
		
		try {
		myConn = dataSource.getConnection();
		
		String sql = "update student "
					+ "set nic =?,  name=?,  email= ?,  regno=?, tel=?, dob=?, address=?,  pass=?,  repass=?"
					+ "where id=?";
	
		myStmt = myConn.prepareStatement(sql);
		
	
		myStmt.setString(1, theAdminshowstudent.getNic());
		myStmt.setString(2, theAdminshowstudent.getName());
		myStmt.setString(3, theAdminshowstudent.getEmail());
		
		myStmt.setString(4, theAdminshowstudent.getRegno());
		
		myStmt.setString(5, theAdminshowstudent.getTel());
		myStmt.setString(6, theAdminshowstudent.getDob());
		myStmt.setString(7, theAdminshowstudent.getAddress());
		myStmt.setString(8, theAdminshowstudent.getPass());
		myStmt.setString(9, theAdminshowstudent.getRepass());
		
		myStmt.setInt(10, theAdminshowstudent.getId());
			myStmt.execute();
		}
		finally {
			
			close(myConn, myStmt, null);
		}
		
	}

}
	


