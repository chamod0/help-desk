package order;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javax.sql.DataSource;









/**
 * Servlet implementation class orderController
 */
@WebServlet("/orderController")
public class orderController extends HttpServlet {
	private static final long serialVersionUID = 1L;

private OrderDbUtil orderDbUtil;
	
	@Resource(name="jdbc/onlinehelpdesk")
	private DataSource dataSource;
	
	@Override
	public void init() throws ServletException {
		super.init();
		
		
		try {
			
			orderDbUtil = new OrderDbUtil(dataSource);
		
		}
		
		catch (Exception exc) {
		
			throw new ServletException(exc);
		
		}
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		try {
			
			String theCommand = request.getParameter("command");
			
			String OrderID = request.getParameter("price");
			if (theCommand == null) {
				theCommand = "LIST";
			}
			
			
			switch (theCommand) {
			
		
			case "LIST":
				listOrder(request, response,OrderID);
				break;
			case "ADD":
				addOrder(request, response,OrderID);
				break;
			case "DELETE":
				deleteStudent(request, response,OrderID);
			
			default:
				listOrder(request, response,OrderID);
			
			}

			
		} catch (Exception exc) {
			
			throw new ServletException(exc);
		}			
		
	}





		

	private void deleteStudent(HttpServletRequest request, HttpServletResponse response, String orderID)throws Exception {
		
		String theid = request.getParameter("id");
		
		
				orderDbUtil.deleteOrder(theid);
		


				RequestDispatcher dispatcher = request.getRequestDispatcher("/index.jsp");

				dispatcher.forward(request, response);
	}

	private void addOrder(HttpServletRequest request, HttpServletResponse response,String OrderID)throws Exception {
		String price = request.getParameter("price");
		String chackingdate = request.getParameter("chackingdate");
		String chackoutdate = request.getParameter("chackoutdate");
		
		order theOrder = new order(price, chackingdate ,chackoutdate);
		
		orderDbUtil.addOrder( theOrder);
		

		listOrder(request, response,OrderID);
		

	}

	private void listOrder(HttpServletRequest request, HttpServletResponse response,String OrderID) throws Exception {
		
		
		
		List<order> orders = orderDbUtil.getOrder(OrderID);
		
		// add students to the request
	

	
		
		request.setAttribute("ORDER_LIST", orders);
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/orderDisplay.jsp");

		dispatcher.forward(request, response);
		
	
		
			
		
	}


	
}