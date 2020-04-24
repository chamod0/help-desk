package com.student.appointment;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;





public class AppointmentDbUtil {
	private static DataSource dataSource;

	public AppointmentDbUtil(DataSource theDataSource) {
		dataSource = theDataSource;
	}
	
	public List<appointment> getappointments(String leid) throws Exception {
		
		List<appointment> appointments = new ArrayList<>();
		
		
		Connection myConn = null;
		Statement myStmt = null;
		ResultSet myRs = null;
		
		try {
			// get a connection
			myConn = dataSource.getConnection();
			
			// create sql statement
			String sql = "select * from appointment where lecture='"+leid+"' order by appid";
			
			
			myStmt = myConn.createStatement();
			
			// execute query
			myRs = myStmt.executeQuery(sql);
			
			// process result set
			while (myRs.next()) {
				
				// retrieve data from result set row
				int appid = myRs.getInt("appid");
				
				String module= myRs.getString("module");
				String lecture= myRs.getString("lecture");
				String datetime= myRs.getString("datetime");
				String comment= myRs.getString("comment");
				String status = myRs.getString("status");
				// create new student object
				
				appointment tempAppointment = new appointment( appid, module, lecture, datetime, comment,status);
				
				// add it to the list of students
				appointments.add(tempAppointment);				
			}
			
			
			return appointments;		
		}
		finally {
			// close JDBC objects
			close(myConn, myStmt, myRs);
		}		
	}
public List<appointment> getappointments() throws Exception {
		
		List<appointment> appointments = new ArrayList<>();
		
		
		Connection myConn = null;
		Statement myStmt = null;
		ResultSet myRs = null;
		
		try {
			// get a connection
			myConn = dataSource.getConnection();
			
			// create sql statement
			String sql = "select * from appointment order by appid";
			
			
			myStmt = myConn.createStatement();
			
			// execute query
			myRs = myStmt.executeQuery(sql);
			
			// process result set
			while (myRs.next()) {
				
				// retrieve data from result set row
				int appid = myRs.getInt("appid");
				
				String module= myRs.getString("module");
				String lecture= myRs.getString("lecture");
				String datetime= myRs.getString("datetime");
				String comment= myRs.getString("comment");
				String status = myRs.getString("status");
				// create new student object
				
				appointment tempAppointment = new appointment( appid, module, lecture, datetime, comment,status);
				
				// add it to the list of students
				appointments.add(tempAppointment);				
			}
			
			
			return appointments;		
		}
		finally {
			// close JDBC objects
			close(myConn, myStmt, myRs);
		}		
	}

	private static void close(Connection myConn, Statement myStmt, ResultSet myRs) {

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

	public void addAppointment(appointment theAppointment) throws Exception {
		

		Connection myConn = null;
		PreparedStatement myStmt = null;
		
		try {
			// get db connection
			myConn = dataSource.getConnection();
			
			// create sql for insert
			
						String sql = "insert into appointment "
								   + "(module, lecture, datetime, comment) "
								   + "values ( ?,?, ?, ?)";
						
						myStmt = myConn.prepareStatement(sql);
						
						// set the param values for the student
						myStmt.setString(1, theAppointment.getModule());
						myStmt.setString(2, theAppointment.getLecture());
						myStmt.setString(3, theAppointment.getDatetime());
						myStmt.setString(4, theAppointment.getComment());
					
						
			// execute sql insert
			myStmt.execute();
		}
		finally {
			// clean up JDBC objects
			close(myConn, myStmt, null);
		}
		
	}

	public static void deleteAppointment(String theAppointment) throws Exception{
		Connection myConn = null;
		PreparedStatement myStmt = null;
		
		try {
			// convert student id to int
			int appId = Integer.parseInt(theAppointment);
			
			// get connection to database
			myConn = dataSource.getConnection();
			
			// create sql to delete student
			String sql = "delete from appointment where appid=?";
			
			// prepare statement
			myStmt = myConn.prepareStatement(sql);
			
			// set params
			myStmt.setInt(1, appId);
			
			// execute sql statement
			myStmt.execute();
		}
		finally {
			// clean up JDBC code
			close(myConn, myStmt, null);
		}	
		
	}

	public static appointment getappointment(String theAppointmentId)throws Exception {

		appointment theAppointment = null;
		
		Connection myConn = null;
		PreparedStatement myStmt = null;
		ResultSet myRs = null;
		int appId;
		
		try {
			// convert student id to int
			appId = Integer.parseInt(theAppointmentId);
			
			// get connection to database
			myConn = dataSource.getConnection();
			
			// create sql to get selected student
			String sql = "select * from appointment where appid=?";
			
			// create prepared statement
			myStmt = myConn.prepareStatement(sql);
			
			// set params
			myStmt.setInt(1, appId);
			
			// execute statement
			myRs = myStmt.executeQuery();
			
			// retrieve data from result set row
			if (myRs.next()) {
				String module= myRs.getString("module");
				String lecture= myRs.getString("lecture");
				String datetime= myRs.getString("datetime");
				String comment= myRs.getString("comment");
				String status = myRs.getString("status");
				// create new student object
				
				theAppointment = new appointment( appId, module, lecture, datetime, comment,status);
			}
			else {
				throw new Exception("Could not find student id: " + appId);
			}				
			
			return theAppointment;
		}
		finally {
			// clean up JDBC objects
			close(myConn, myStmt, myRs);
		}
	}

	public void updateAppointment(appointment theAppointment) throws Exception {
		Connection myConn = null;
		PreparedStatement myStmt = null;

		try {
			// get db connection
			myConn = dataSource.getConnection();
			
			// create SQL update statement
			String sql = "update appointment "
						+ "set  status=?"
						+ "where appid=?";
			
			// prepare statement
			myStmt = myConn.prepareStatement(sql);
			
			// set paramsHeader

			myStmt.setString(1, theAppointment.getStatus());
			myStmt.setInt(2, theAppointment.getAppid());

			
			// execute SQL statement
			myStmt.execute();
		}
		finally {
			// clean up JDBC objects
			close(myConn, myStmt, null);
		}
		
	}


		
		
}


	

	

