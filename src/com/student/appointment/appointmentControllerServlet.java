package com.student.appointment;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;







/**
 * Servlet implementation class appointmentControllerServlet
 */
@WebServlet("/appointmentControllerServlet")
public class appointmentControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

private AppointmentDbUtil apponintmentDbUtil;
	
	@Resource(name="jdbc/onlinehelpdesk")
	private DataSource dataSource;
	
	@Override
	public void init() throws ServletException {
		super.init();
		
		// create our student db util ... and pass in the conn pool / datasource
		try {
			apponintmentDbUtil = new AppointmentDbUtil(dataSource);
		}
		catch (Exception exc) {
			throw new ServletException(exc);
		}
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	
		try {
			String theCommand = request.getParameter("command");
			String lecID1 = request.getParameter("lecid");
			
			
			if (theCommand == null) {
				theCommand = "LIST";
			}
			
			
			switch (theCommand) {
			
			case "LIST":
				listAppointment(request, response,lecID1);
				break;
			case "ADDAPPO":
				addAppointment(request, response);
				break;
			case "LIST2":
				listAppointmentSTD(request, response);
				break;
			case "DELETE":
				deleteAppointmentSTD(request, response,lecID1);
			break;
			case "LOAD":
				loadappointment(request, response);
				break;
			case "UPDATE":
				updateAppointment(request, response,lecID1);
				break;
			default:
				listAppointment(request, response,lecID1);
			
			
			}
				
		
			
			
			listAppointment(request, response,lecID1);
			
		
		} catch (Exception exc) {
		
			throw new ServletException(exc);
		}			
		
	}

	

	private void updateAppointment(HttpServletRequest request, HttpServletResponse response,String lecID1) throws Exception {

		int appId = Integer.parseInt(request.getParameter("appId"));
		

		String status = request.getParameter("status");
		
	
		
		
		appointment theAppointment = new appointment(appId,status);
		
		
		apponintmentDbUtil.updateAppointment(theAppointment);
				
	
		listAppointment(request, response,lecID1);

		HttpSession session = request.getSession();
        Object lecid = null;
		session.setAttribute("lecid", lecid);
		
	}

	private void loadappointment(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String theAppointmentId = request.getParameter("appId");
		
		appointment theAppointment = AppointmentDbUtil.getappointment(theAppointmentId);
		
		
		request.setAttribute("THE_APPOINTMENT", theAppointment);
		

		RequestDispatcher dispatcher = 
				request.getRequestDispatcher("/lecAppointmentAccapt.jsp");
		dispatcher.forward(request, response);
		

		HttpSession session = request.getSession();
        Object lecid = null;
		session.setAttribute("lecid", lecid);
	}

	private void deleteAppointmentSTD(HttpServletRequest request, HttpServletResponse response,String lecID1) throws Exception {
		
		String theAppointment = request.getParameter("appId");
		
	
		AppointmentDbUtil.deleteAppointment(theAppointment);
		
	
		listAppointment(request, response,lecID1);
		
	}

	private void listAppointmentSTD(HttpServletRequest request, HttpServletResponse response) throws Exception {


		List<appointment> appointments = apponintmentDbUtil.getappointments();
		
	
		request.setAttribute("APPOINTMENT_LIST", appointments);
		

		RequestDispatcher dispatcher = request.getRequestDispatcher("/stdAppointment.jsp");

		dispatcher.forward(request, response);
		
		HttpSession session = request.getSession();
	        Object name = null;
			session.setAttribute("name", name);
		
	}

	private void addAppointment(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
		String module =request.getParameter("module");
		String lecture = request.getParameter("lecture");
		String datetime = request.getParameter("datetime");
		String comment = request.getParameter("comment");	
	
		
		
		appointment theAppointment = new appointment(module, lecture, datetime, comment);
		
		
		apponintmentDbUtil.addAppointment(theAppointment);
				
	
		listAppointmentSTD(request, response);
		
	}

	private void listAppointment(HttpServletRequest request, HttpServletResponse response,String lecID1) throws Exception {
	
		


		List<appointment> appointments = apponintmentDbUtil.getappointments(lecID1);
		
	
		request.setAttribute("APPOINTMENT_LIST", appointments);
		

		RequestDispatcher dispatcher = request.getRequestDispatcher("/lecAppointment.jsp");

		dispatcher.forward(request, response);
		

		HttpSession session = request.getSession();
        Object lecid = null;
		session.setAttribute("lecid", lecid);
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	
}
