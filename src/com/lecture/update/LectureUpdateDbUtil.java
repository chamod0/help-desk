package com.lecture.update;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;





public class LectureUpdateDbUtil {

	private DataSource dataSource;

	public LectureUpdateDbUtil(DataSource theDataSource) {
		dataSource = theDataSource;
	}
	
	
	public List<Lecture> getLectures(String leid) throws Exception {
		
		List<Lecture> lectures = new ArrayList<>();
		
		Connection myConn = null;
		Statement myStmt = null;
		ResultSet myRs = null;
		
		
		try {
			// get a connection
			myConn = dataSource.getConnection();
			
			// create sql statement
			String sql = "select * from lecture  where lecid='"+leid+"' order by id";
			
			
			myStmt = myConn.createStatement();
			
			// execute query
			myRs = myStmt.executeQuery(sql);
			
			// process result set
			while (myRs.next()) {
				
				// retrieve data from result set row
				int id = myRs.getInt("id");
				String name =myRs.getString("name");
				String nic = myRs.getString("nic");
				String lecmodule = myRs.getString("lecmodule");
				String email = myRs.getString("email");
				String tel = myRs.getString("tel");
				String lecid = myRs.getString("lecid");
				// create new student object
				Lecture tempStudent = new Lecture(id,name, nic, lecmodule ,email, tel, lecid);
				
				// add it to the list of students
				lectures.add(tempStudent);				
			}
			
			
			return lectures;		
		}
		finally {
			// close JDBC objects
			close(myConn, myStmt, myRs);
		}		
	}
	
	
	
public List<Lecture> getLecture() throws Exception {
	
	List<Lecture> lectures = new ArrayList<>();
	
	Connection myConn = null;
	Statement myStmt = null;
	ResultSet myRs = null;
	
	
	try {
		// get a connection
		myConn = dataSource.getConnection();
		
		// create sql statement
		String sql = "select * from lecture";
		
		
		myStmt = myConn.createStatement();
		
		// execute query
		myRs = myStmt.executeQuery(sql);
		
		// process result set
		while (myRs.next()) {
			
			// retrieve data from result set row
			int id = myRs.getInt("id");
			String name =myRs.getString("name");
			String nic = myRs.getString("nic");
			String lecmodule = myRs.getString("lecmodule");
			String email = myRs.getString("email");
			String tel = myRs.getString("tel");
			String lecid = myRs.getString("lecid");
			// create new student object
			Lecture tempStudent = new Lecture(id,name, nic, lecmodule ,email, tel, lecid);
			
			// add it to the list of students
			lectures.add(tempStudent);				
		}
		
		
		return lectures;		
	}
	finally {
		// close JDBC objects
		close(myConn, myStmt, myRs);
	}		
}
	private void close(Connection myConn, Statement myStmt, ResultSet myRs) {

		try {
			if (myRs != null) {
				myRs.close();
			}
			
			if (myStmt != null) {
				myStmt.close();
			}
			
			if (myConn != null) {
				myConn.close();   // doesn't really close it ... just puts back in connection pool
			}
		}
		catch (Exception exc) {
			exc.printStackTrace();
		}
	}

	public Lecture getLecture(String theLectureId) throws Exception {
		
		Lecture theLecture = null;
		
		
		Connection myConn = null;
		PreparedStatement myStmt = null;
		ResultSet myRs = null;
		int lectureId;
		
		try {
			// convert student id to int
			lectureId = Integer.parseInt(theLectureId);
			
			// get connection to database
			myConn = dataSource.getConnection();
			
			// create sql to get selected student
			String sql = "select * from lecture where id=?";
			
			// create prepared statement
			myStmt = myConn.prepareStatement(sql);
			
			// set params
			myStmt.setInt(1, lectureId);
			
			// execute statement
			myRs = myStmt.executeQuery();
			
			// retrieve data from result set row
			if (myRs.next()) {
				String name =myRs.getString("name");
				String nic = myRs.getString("nic");
				String lecmodule = myRs.getString("lecmodule");
				String email = myRs.getString("email");
				String tel = myRs.getString("tel");
				String lecid = myRs.getString("lecid");
				// create new student object
				// use the studentId during construction
				theLecture = new Lecture(lectureId, name, nic, lecmodule ,email, tel, lecid);
			}
			else {
				throw new Exception("Could not find student id: " + lectureId);
			}				
			
			return theLecture;
		}
		finally {
			// clean up JDBC objects
			close(myConn, myStmt, myRs);
		}
	}

	public void updateLecture(Lecture theLecture) throws Exception {
		Connection myConn = null;
		PreparedStatement myStmt = null;

		try {
			// get db connection
			myConn = dataSource.getConnection();
			
			// create SQL update statement
			String sql = "update lecture "
						+ "set name=?, nic=?, lecmodule=? ,email=?, tel=?, lecid=?"
						+ "where id=?";
			
			// prepare statement
			myStmt = myConn.prepareStatement(sql);
			
			// set paramsHeader
			myStmt.setString(1, theLecture.getName());
			myStmt.setString(2, theLecture.getNic());
			myStmt.setString(3, theLecture.getLecmodule());
			myStmt.setString(4, theLecture.getEmail());
			myStmt.setString(5, theLecture.getTel());
			myStmt.setString(6, theLecture.getLecid());
			myStmt.setInt(7, theLecture.getId());
			
	
			myStmt.execute();
		}
		finally {
			// clean up JDBC objects
			close(myConn, myStmt, null);
		}
		
	}

	public void deleteLecture(String theLectureId) throws Exception {
		
		Connection myConn = null;
		PreparedStatement myStmt = null;
		
		try {
			
			int lectureId = Integer.parseInt(theLectureId);
			
			
			myConn = dataSource.getConnection();
			
		
			String sql = "delete from lecture where id=?";
			
		
			myStmt = myConn.prepareStatement(sql);
			
		
			myStmt.setInt(1, lectureId);
			
		
			myStmt.execute();
		}
		finally {
			
			close(myConn, myStmt, null);
		}	
	}

	public void addLecture(Lecture theLecture) throws Exception {

		Connection myConn = null;
		PreparedStatement myStmt = null;
		
		try {
			
			myConn = dataSource.getConnection();
			
			
			String sql = "insert into lecture "
					   + "(name, nic, lecmodule ,email, tel,pass,repass, lecid) "
					   + "values (?,?,?,?,?,?,?,?)";
			
			myStmt = myConn.prepareStatement(sql);
			
			
		
			myStmt.setString(1, theLecture.getName());
			myStmt.setString(2, theLecture.getNic());
			myStmt.setString(3, theLecture.getLecmodule());
			myStmt.setString(4, theLecture.getEmail());
			myStmt.setString(5, theLecture.getTel());
			myStmt.setString(6, theLecture.getPass());
			myStmt.setString(7, theLecture.getRepass());
			myStmt.setString(8, theLecture.getLecid());
			
			myStmt.execute();
		}
		finally {
			
			close(myConn, myStmt, null);
		}
	}


	public void updateLecture2(Lecture theLecture) throws Exception {
		Connection myConn = null;
		PreparedStatement myStmt = null;

		try {
			// get db connection
			myConn = dataSource.getConnection();
			
			// create SQL update statement
			String sql = "update lecture "
						+ "set name=?, nic=?, lecmodule=? ,email=?, tel=?"
						+ "where id=?";
			
			// prepare statement
			myStmt = myConn.prepareStatement(sql);
			
			// set paramsHeader
			myStmt.setString(1, theLecture.getName());
			myStmt.setString(2, theLecture.getNic());
			myStmt.setString(3, theLecture.getLecmodule());
			myStmt.setString(4, theLecture.getEmail());
			myStmt.setString(5, theLecture.getTel());

			myStmt.setInt(6, theLecture.getId());
			
	
			myStmt.execute();
		}
		finally {
			// clean up JDBC objects
			close(myConn, myStmt, null);
		}
		
	}

	
	
	
	
}














