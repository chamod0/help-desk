package com.student.qiz;


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

import com.student.qiz.StudentDb;

/**
 * Servlet implementation class StudentControllerServlet
 */
@WebServlet("/StudentControllerServlet")

public class StudentControllerServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	private StudentDb studentDbUtil;
	
	@Resource(name="jdbc/onlinehelpdesk")
	private DataSource dataSource;
	
	@Override
	public void init() throws ServletException {
		super.init();
		
		
		try {
			
			studentDbUtil = new StudentDb(dataSource);
		
		}
		
		catch (Exception exc) {
		
			throw new ServletException(exc);
		
		}
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		try {
			
			String theCommand = request.getParameter("command");
			
			String stdID1 = request.getParameter("stdid");
		
			if (theCommand == null) {
				theCommand = "LIST";
			}
			
			
			switch (theCommand) {
			
			case "LIST":
				listStudents2(request, response,stdID1);
				break;
			case "LIST2":
				listStudents(request, response);
				break;
			case "ADD":
				addStudent(request, response);
				break;
			case "STDLOAD":
				loadStudent(request, response);
				break;
			case "UPDATE":
				updateStudent1(request, response,stdID1);
				break;
			case "STDDELETE":
				deleteStudent(request, response,stdID1);
				break;
			default:
				listStudents(request, response);
			
			}
				
		
			
			
			
			
			listStudents2(request, response,stdID1);
		} catch (Exception exc) {
			
			throw new ServletException(exc);
		}			
		
	}

	

		
		
	private void deleteStudent(HttpServletRequest request, HttpServletResponse response,String stdID1) throws Exception {
		
		String theStudentId = request.getParameter("studentId");
	
	
		studentDbUtil.deleteStudent(theStudentId);
		
		
		listStudents2(request, response,stdID1);
		
		HttpSession session = request.getSession();
        Object stdid = null;
        session.setAttribute("regno", stdid);
		
	}



	

	private void updateStudent1(HttpServletRequest request, HttpServletResponse response ,String stdID1) throws Exception {
	
		int id = Integer.parseInt(request.getParameter("studentId"));
		String module = request.getParameter("module");
		String topic = request.getParameter("topic");
		String qiz = request.getParameter("qiz");
		String attachment = request.getParameter("attachment");	
		String header = request.getParameter("header");
		String answer = request.getParameter("answer");
		String lecattachment = request.getParameter("lecattachment");
		
		String lecture = request.getParameter("lecture");
	
		Student theStudent = new Student(id,topic, qiz, attachment, header, answer, lecattachment,module,lecture);
		
	
		studentDbUtil.updateStudent1(theStudent);
		

		listStudents2(request, response,stdID1);
		

		HttpSession session = request.getSession();
        Object stdid = null;
        session.setAttribute("stdid", stdid);

		
	}

	private void loadStudent(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String theStudentId = request.getParameter("studentId");
		

		Student theStudent = studentDbUtil.getStudent(theStudentId);
		
	
		request.setAttribute("THE_STUDENT", theStudent);
		
	
		RequestDispatcher dispatcher = 
				request.getRequestDispatcher("/stdShow.jsp");
		dispatcher.forward(request, response);
		
	}

	private void addStudent(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// read student info from form data
		String module =request.getParameter("module");
		String topic = request.getParameter("topic");
		String qiz = request.getParameter("qiz");
		String attachment = request.getParameter("attachment");	
		String header = request.getParameter("header");
		String answer = request.getParameter("answer");
		String lecattachment = request.getParameter("lecattachment");
		String stdid = request.getParameter("stdid");
		String lecture = request.getParameter("lecture");
		// create a new student object
		Student theStudent = new Student( module,topic, qiz, attachment,header, answer, lecattachment,stdid,lecture);
		
		// add the student to the database
		studentDbUtil.addStudent(theStudent);
				
		// send back to main page (the student list)
		/*listStudents(request, response);*/
		
	}

	private void listStudents2(HttpServletRequest request, HttpServletResponse response, String stdID1) 
		throws Exception {
		

		// get students from db util
		List<Student> students = studentDbUtil.getStudents(stdID1);
		
		// add students to the request
	

	
		
	request.setAttribute("STUDENT_LISTL", students);
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/stdsendque.jsp");

		dispatcher.forward(request, response);
		
		HttpSession session = request.getSession();
	        
			Object stdid =null;
			session.setAttribute("regno", stdid);
			
		
	
			
	}
	private void listStudents(HttpServletRequest request, HttpServletResponse response) 
			throws Exception {
			
			

			
			List<Student> students = studentDbUtil.getStudents2();
				
		request.setAttribute("STUDENT_LIST", students);
			

			RequestDispatcher dispatcher = request.getRequestDispatcher("/stdsendque.jsp");

			dispatcher.forward(request, response);
			
			HttpSession session = request.getSession();
		        Object stdid = null;
		        session.setAttribute("stdid", stdid);
			
		
				
		}
}