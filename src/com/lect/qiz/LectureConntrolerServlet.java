package com.lect.qiz;



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
 * Servlet implementation class LectureConntrolerServlet
 */
@WebServlet("/LectureConntrolerServlet")
public class LectureConntrolerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

private LectureDbUtil studentDbUtil;
	
	@Resource(name="jdbc/onlinehelpdesk")
	private DataSource dataSource;
	
	@Override
	public void init() throws ServletException {
		super.init();
		
		// create our student db util ... and pass in the conn pool / datasource
		try {
			studentDbUtil = new LectureDbUtil(dataSource);
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
				listStudents2(request, response,lecID1);
				break;
			case "LIST3":
				listStudents(request, response);
				break;
				
			case "ADD":
				addStudent(request, response);
				break;
			
			case "LOAD":
				loadStudent(request, response);
				break;
				
			case "UPDATE":
				updateStudent(request, response,lecID1);
				break;
			case "DELETE":
				deleteStudent(request, response,lecID1);
				break;
			case "LIST2":
				listQiz(request, response,lecID1);
				break;
			
			case "LOAD2":
				loadStudent2(request, response);
				break;
				
			default:
				listStudents(request, response);
				
			
			}
				
		
			
			
			
			
			listStudents2(request, response,lecID1);
		} catch (Exception exc) {
			// TODO Auto-generated catch block
			throw new ServletException(exc);
		}			
		
	}

	



	
	private void listStudents(HttpServletRequest request, HttpServletResponse response) throws Exception {

		List<Lecture> students = studentDbUtil.getLectures();
			
	request.setAttribute("STUDENT_LIST", students);
		

		RequestDispatcher dispatcher = request.getRequestDispatcher("/lecquestion.jsp");

		dispatcher.forward(request, response);
		
		listStudents(request, response);
		
		HttpSession session = request.getSession();
        Object lecid = null;
		session.setAttribute("lecid", lecid);
		
		
	}

	private void loadStudent2(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String theStudentId = request.getParameter("studentId");
		

		Lecture theStudent = studentDbUtil.getLecture(theStudentId);
	
		request.setAttribute("THE_STUDENT", theStudent);
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/lecAnswerUpdate.jsp");
		dispatcher.forward(request, response);
		listStudents(request, response);
		
		HttpSession session = request.getSession();
        Object lecid = null;
		session.setAttribute("lecid", lecid);
	}

	
	private void listQiz(HttpServletRequest request, HttpServletResponse response,String lecID1) throws Exception {

		// get students from db util
		List<Lecture> students = studentDbUtil.getLectures(lecID1);
		
		// add students to the request
	

	
		
	request.setAttribute("STUDENT_LIST", students);
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/lecAnswerviwe.jsp");

		dispatcher.forward(request, response);
		
		HttpSession session = request.getSession();
        Object lecid = null;
		session.setAttribute("lecid", lecid);
		
	}

	private void deleteStudent(HttpServletRequest request, HttpServletResponse response,String lecID1) throws Exception {
	
				String theStudentId = request.getParameter("studentId");
				
				
				studentDbUtil.deleteStudent(theStudentId);
				
				
				listStudents2(request, response,lecID1);
				
				HttpSession session = request.getSession();
		        Object stdid = null;
		        session.setAttribute("lecid", stdid);
			}

	private void updateStudent(HttpServletRequest request, HttpServletResponse response,String lecID1) throws Exception {
	
				int id = Integer.parseInt(request.getParameter("studentId"));
				String module = request.getParameter("module");
				String topic = request.getParameter("topic");
				String qiz = request.getParameter("qiz");
				String attachment = request.getParameter("attachment");	
				String header = request.getParameter("header");
				String answer = request.getParameter("answer");
				String lecattachment = request.getParameter("lecattachment");
				
				String stdid = request.getParameter("stdid");
				Lecture theStudent = new Lecture(id,topic, qiz, attachment, header, answer, lecattachment,module,stdid);
			
				studentDbUtil.updateStudent(theStudent);
				
			
				listStudents2(request, response,lecID1);
				
				HttpSession session = request.getSession();
		        Object lecid = null;
				session.setAttribute("lecid", lecid);
				
		
	}

	private void loadStudent(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
				String theStudentId = request.getParameter("studentId");
				
				
				Lecture theStudent = studentDbUtil.getLecture(theStudentId);
				
				
				request.setAttribute("THE_STUDENT", theStudent);
				
				
				RequestDispatcher dispatcher = 
						request.getRequestDispatcher("/reply.jsp");
				dispatcher.forward(request, response);
				
				HttpSession session = request.getSession();
		        Object lecid = null;
				session.setAttribute("lecid", lecid);
		
		
	}

	private void addStudent(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// read student info from form data
		String module = request.getParameter("module");
		String topic = request.getParameter("topic");
		String qiz = request.getParameter("qiz");
		String attachment = request.getParameter("attachment");	
		String header = request.getParameter("header");
		String answer = request.getParameter("answer");
		String lecattachment = request.getParameter("lecattachment");
		String stdid = request.getParameter("stdid");
		String lecture = request.getParameter("lecture");	
		// create a new student object
		Lecture theStudent = new Lecture(module,topic, qiz, attachment, header, answer, lecattachment,stdid,lecture);
		
		// add the student to the database
		studentDbUtil.addStudent(theStudent);
				
		// send back to main page (the student list)
		listStudents(request, response);
		
	}

	private void listStudents2(HttpServletRequest request, HttpServletResponse response,String lecID1) 
		throws Exception {
		
		

		
		List<Lecture> students = studentDbUtil.getLectures(lecID1);
			
	request.setAttribute("STUDENT_LIST", students);
		

		RequestDispatcher dispatcher = request.getRequestDispatcher("/lecquestion.jsp");

		dispatcher.forward(request, response);
		
		HttpSession session = request.getSession();
	        Object lecid = null;
			session.setAttribute("lecid", lecid);
		
	
			
	}

}