package com.lect.qiz;



import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import javax.sql.DataSource;

import com.lect.qiz.Lecture;

public class LectureDbUtil {

	private DataSource dataSource;

	public LectureDbUtil(DataSource theDataSource) {
		dataSource = theDataSource;
	}
	
	public List<Lecture> getLectures(String lid) throws Exception {
		
		List<Lecture> students = new ArrayList<>();
		
		Connection myConn = null;
		Statement myStmt = null;
		ResultSet myRs = null;
		
		try {
			// get a connection
			myConn = dataSource.getConnection();
			
			// create sql statement
			String sql = "select * from qiz where lecture='"+lid+"' order by id";
			
			
			myStmt = myConn.createStatement();
			
			// execute query
			myRs = myStmt.executeQuery(sql);
			
			// process result set
			while (myRs.next()) {
				
				// retrieve data from result set row
				int id = myRs.getInt("id");
				String module =myRs.getString("module");
				String topic = myRs.getString("topic");
				String qiz = myRs.getString("qiz");
				String attachment = myRs.getString("attachment");
				String header= myRs.getString("header");
				String answer = myRs.getString("answer");
				String lecattachment = myRs.getString("lecattachment");
				String stdid = myRs.getString("stdid");
				// create new student object
				Lecture tempStudent = new Lecture(id, topic, qiz, attachment,header,answer,lecattachment,module,stdid);
				
				// add it to the list of students
				students.add(tempStudent);				
			}
			
			
			return students;		
		}
		finally {
			// close JDBC objects
			close(myConn, myStmt, myRs);
		}		
	}
public List<Lecture> getLectures() throws Exception {
		
		List<Lecture> students = new ArrayList<>();
		
		Connection myConn = null;
		Statement myStmt = null;
		ResultSet myRs = null;
		
		try {
			// get a connection
			myConn = dataSource.getConnection();
			
			// create sql statement
			String sql = "select * from qiz order by id";
			
			
			myStmt = myConn.createStatement();
			
			// execute query
			myRs = myStmt.executeQuery(sql);
			
			// process result set
			while (myRs.next()) {
				
				// retrieve data from result set row
				int id = myRs.getInt("id");
				String module =myRs.getString("module");
				String topic = myRs.getString("topic");
				String qiz = myRs.getString("qiz");
				String attachment = myRs.getString("attachment");
				String header= myRs.getString("header");
				String answer = myRs.getString("answer");
				String lecattachment = myRs.getString("lecattachment");
				String stdid = myRs.getString("stdid");
				// create new student object
				Lecture tempStudent = new Lecture(id, topic, qiz, attachment,header,answer,lecattachment,module,stdid);
				
				// add it to the list of students
				students.add(tempStudent);				
			}
			
			
			return students;		
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

	public void addStudent(Lecture theStudent) throws Exception {

		Connection myConn = null;
		PreparedStatement myStmt = null;
		
		try {
			// get db connection
			myConn = dataSource.getConnection();
			
			// create sql for insert
			String sql = "insert into qiz "
					   + "(module,topic,qiz,attachment,stdid) "
					   + "values (?,?, ?, ?,?)";
			
			myStmt = myConn.prepareStatement(sql);
			
			// set the param values for the student
		
			myStmt.setString(1, theStudent.getFirstName());
			myStmt.setString(2, theStudent.getLastName());
			myStmt.setString(3, theStudent.getEmail());
			myStmt.setString(4, theStudent.getModule());
			myStmt.setString(5, theStudent.getStdid());
			// execute sql insert
			myStmt.execute();
		}
		finally {
			// clean up JDBC objects
			close(myConn, myStmt, null);
		}
	}

	public Lecture getLecture(String theStudentId) throws Exception {
Lecture theStudent = null;
		
		Connection myConn = null;
		PreparedStatement myStmt = null;
		ResultSet myRs = null;
		int studentId;
		
		try {
			// convert student id to int
			studentId = Integer.parseInt(theStudentId);
			
			// get connection to database
			myConn = dataSource.getConnection();
			
			// create sql to get selected student
			String sql = "select * from qiz where id=?";
			
			// create prepared statement
			myStmt = myConn.prepareStatement(sql);
			
			// set params
			myStmt.setInt(1, studentId);
			
			// execute statement
			myRs = myStmt.executeQuery();
			
			// retrieve data from result set row
			if (myRs.next()) {
				String module = myRs.getString("module");
				String topic = myRs.getString("topic");
				String qiz = myRs.getString("qiz");
				String attachment = myRs.getString("attachment");
				String header= myRs.getString("header");
				String answer = myRs.getString("answer");
				String lecattachment = myRs.getString("lecattachment");
				String stdid = myRs.getString("stdid");
				// use the studentId during construction
				theStudent = new Lecture(studentId, topic, qiz, attachment,header,answer,lecattachment,module,stdid);
			}
			else {
				throw new Exception("Could not find student id: " + studentId);
			}				
			
			return theStudent;
		}
		finally {
			// clean up JDBC objects
			close(myConn, myStmt, myRs);
		}
	}

	public void updateStudent(Lecture theStudent) throws Exception {
		Connection myConn = null;
		PreparedStatement myStmt = null;

		try {
			// get db connection
			myConn = dataSource.getConnection();
			
			// create SQL update statement
			String sql = "update qiz "
						+ "set header=?, answer=?, lecattachment=? "
						+ "where id=?";
			
			// prepare statement
			myStmt = myConn.prepareStatement(sql);
			
			// set paramsHeader
			myStmt.setString(1, theStudent.getHeader());
			myStmt.setString(2, theStudent.getAnswer());
			myStmt.setString(3, theStudent.getLecattachment());
			myStmt.setInt(4, theStudent.getId());
			
			// execute SQL statement
			myStmt.execute();
		}
		finally {
			// clean up JDBC objects
			close(myConn, myStmt, null);
		}
		
	}

	public void deleteStudent(String theStudentId) throws Exception {
		Connection myConn = null;
		PreparedStatement myStmt = null;
		
		try {
			// convert student id to int
			int studentId = Integer.parseInt(theStudentId);
			
			// get connection to database
			myConn = dataSource.getConnection();
			
			// create sql to delete student
			String sql = "delete from qiz where id=?";
			
			// prepare statement
			myStmt = myConn.prepareStatement(sql);
			
			// set params
			myStmt.setInt(1, studentId);
			
			// execute sql statement
			myStmt.execute();
		}
		finally {
			// clean up JDBC code
			close(myConn, myStmt, null);
		}	
	}

	

	
		
		
	
}
















