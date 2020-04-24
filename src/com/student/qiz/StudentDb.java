package com.student.qiz;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import javax.sql.DataSource;

public class StudentDb {

	private DataSource dataSource;

	public StudentDb(DataSource theDataSource) {
		dataSource = theDataSource;
	}
	
public List<Student> getStudents(String sId) throws Exception {
		
		List<Student> students = new ArrayList<>();
		
		Connection myConn = null;
		Statement myStmt = null;
		ResultSet myRs = null;
		
		
		try {
			// get a connection
			myConn = dataSource.getConnection();
			
			// create sql statement
			String sql = "select * from qiz where stdid='"+sId+"' order by id";
			
			
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
				String header = myRs.getString("header");
				String answer = myRs.getString("answer");
				String lecattachment = myRs.getString("lecattachment");
				String lecture = myRs.getString("lecture");
				// create new student object
				Student tempStudent = new Student(id,topic, qiz, attachment ,header, answer, lecattachment,module, lecture);
				
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
public List<Student> getStudents2() throws Exception {
	
	List<Student> students = new ArrayList<>();
	
	Connection myConn = null;
	Statement myStmt = null;
	ResultSet myRs = null;
	
	
	try {
		// get a connection
		myConn = dataSource.getConnection();
		
		// create sql statement
		String sql = "select * from qiz";
		
		
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
			String header = myRs.getString("header");
			String answer = myRs.getString("answer");
			String lecattachment = myRs.getString("lecattachment");
			String lecture = myRs.getString("lecture");
			// create new student object
			Student tempStudent = new Student(id,topic, qiz, attachment ,header, answer, lecattachment,module,lecture);
			
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


	public void addStudent(Student theStudent) throws Exception {

		Connection myConn = null;
		PreparedStatement myStmt = null;
		
		try {
			// get db connection
			myConn = dataSource.getConnection();
			
			// create sql for insert
			String sql = "insert into qiz "
					   + "(module,topic,qiz,attachment,stdid,lecture) "
					   + "values (?,?, ?, ?,?,?)";
			
			myStmt = myConn.prepareStatement(sql);
			
			// set the param values for the student
		
			myStmt.setString(1, theStudent.getFirstName());
			myStmt.setString(2, theStudent.getLastName());
			myStmt.setString(3, theStudent.getEmail());
			myStmt.setString(4, theStudent.getModule());
			myStmt.setString(5, theStudent.getStdid());
			myStmt.setString(6, theStudent.getLecture());
			// execute sql insert
			myStmt.execute();
		}
		finally {
			// clean up JDBC objects
			close(myConn, myStmt, null);
		}
	}

	public void updateStudent1(Student theStudent) throws Exception {
		Connection myConn = null;
		PreparedStatement myStmt = null;

		try {
			// get db connection
			myConn = dataSource.getConnection();
			
			// create SQL update statement
			String sql = "update qiz "
						+ "set topic=?, qiz=?, attachment=?"
						+ "where id=?";
			
			// prepare statement
			myStmt = myConn.prepareStatement(sql);
			
			// set paramsHeader
			myStmt.setString(1, theStudent.getFirstName());
			myStmt.setString(2, theStudent.getLastName());
			myStmt.setString(3, theStudent.getEmail());
	
			myStmt.setInt(4, theStudent.getId());
			
	
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
	public Student getStudent(String theStudentId) throws Exception {
		
				Student theStudent = null;
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
						String lecture = myRs.getString("lecture");
						// use the studentId during construction
						theStudent = new Student(studentId, topic, qiz, attachment,header,answer,lecattachment,module,stdid,lecture);
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
}














