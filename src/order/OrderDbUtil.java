package order;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;





public class OrderDbUtil {

	private static DataSource dataSource;

	public OrderDbUtil(DataSource theDataSource) {
		dataSource = theDataSource;
	}
	
	
	public List<order> getOrder(String OrID) throws Exception {
		
		List<order> orders = new ArrayList<>();
		
		Connection myConn = null;
		Statement myStmt = null;
		ResultSet myRs = null;
		
		
		try {
			// get a connection
			myConn = dataSource.getConnection();
			
			// create sql statement
			String sql = "select * from order1 where price='"+OrID+"' ";
			
			
			myStmt = myConn.createStatement();
			
			// execute query
			myRs = myStmt.executeQuery(sql);
			
			// process result set
			while (myRs.next()) {
				
				// retrieve data from result set row
				int id = myRs.getInt("id");
				String price =myRs.getString("price");
				String chackingdate = myRs.getString("chackingdate");
				String chackoutdate = myRs.getString("chackoutdate");
							// create new student object
				order tempOrder = new order(id,price,chackingdate ,chackoutdate);
				
				// add it to the list of students
				orders.add(tempOrder);				
			}
			
			
			return orders;		
		}
		finally {
			// close JDBC objects
			close(myConn, myStmt, myRs);
		}		
	}
	
	
	

	private static  void close(Connection myConn, Statement myStmt, ResultSet myRs) {

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

	

	public void addOrder(order theOrder) throws Exception {

		Connection myConn = null;
		PreparedStatement myStmt = null;
		
		try {
			
			myConn = dataSource.getConnection();
			
			
			String sql = "insert into order1"
					   + "(price, chackingdate ,chackoutdate) "
					   + "values (?,?,?)";
			
			myStmt = myConn.prepareStatement(sql);
			
			
		
			myStmt.setString(1, theOrder.getPrice());
			myStmt.setString(2, theOrder.getChackingdate());
			myStmt.setString(3, theOrder.getChackoutdate());
		
		
			
			myStmt.execute();
		}
		finally {
			
			close(myConn, myStmt, null);
		}
	}


	public static order getOder(String theid) throws Exception {
			order theOrder = null;
		
		Connection myConn = null;
		PreparedStatement myStmt = null;
		ResultSet myRs = null;
		int id;
		
		try {
			// convert student id to int
			id = Integer.parseInt(theid);
			
			// get connection to database
			myConn = dataSource.getConnection();
			
			// create sql to get selected student
			String sql = "select * from order where id=?";
			
			// create prepared statement
			myStmt = myConn.prepareStatement(sql);
			
			// set params
			myStmt.setInt(1, id);
			
			// execute statement
			myRs = myStmt.executeQuery();
			
			// retrieve data from result set row
			if (myRs.next()) {
				String price = myRs.getString("price");
				String chackingdate = myRs.getString("chackingdate");
				String chackoutdate = myRs.getString("chackoutdate");
				
				theOrder = new order(id, price, chackingdate,chackoutdate);
			}
			else {
				throw new Exception("Could not find student id: " + id);
			}				
			
			return theOrder;
		}
		finally {
			// clean up JDBC objects
			close(myConn, myStmt, myRs);
		}
	}


	public void deleteOrder(String theid)  throws Exception {
		Connection myConn = null;
		PreparedStatement myStmt = null;
		
		try {
			// convert student id to int
			int id = Integer.parseInt(theid);
			
			// get connection to database
			myConn = dataSource.getConnection();
			
			// create sql to delete student
			String sql = "delete from order1 where id=?";
			
			// prepare statement
			myStmt = myConn.prepareStatement(sql);
			
			// set params
			myStmt.setInt(1, id);
			
			// execute sql statement
			myStmt.execute();
		}
		finally {
			// clean up JDBC code
			close(myConn, myStmt, null);
		}	
	}

	
	
	
	
}














