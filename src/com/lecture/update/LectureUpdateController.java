package com.lecture.update;


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
 * Servlet implementation class LectureUpdateController
 */
@WebServlet("/LectureUpdateController")
public class LectureUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;

private LectureUpdateDbUtil lectureDbUtil;
	
	@Resource(name="jdbc/onlinehelpdesk")
	private DataSource dataSource;
	
	@Override
	public void init() throws ServletException {
		super.init();
		
		
		try {
			
			lectureDbUtil = new LectureUpdateDbUtil(dataSource);
		
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
				listLecture(request, response);
				break;
			case "LIST2":
				listLecture2(request, response,lecID1);
				break;
			case "LOAD":
				loadLecture(request, response);
				break;
			case "LOAD2":
				loadLecture2(request, response);
				break;
			case "UPDATE":
				updateLecture(request, response);
				break;
			case "PROUPDATE":
				updateLecture2(request, response, lecID1);
				break;
			case "DELETE":
				deleteLecture(request, response);
				break;
			case "ADD":
				addLecture(request, response);
				break;
			case "REG":
				regLecture(request, response);
				break;
			
			default:
				listLecture(request, response);
			
			}

			listLecture2(request, response,lecID1);
			
		} catch (Exception exc) {
			
			throw new ServletException(exc);
		}			
		
	}

	private void listLecture2(HttpServletRequest request, HttpServletResponse response, String lecID1) throws Exception{
		
		List<Lecture> lectures = lectureDbUtil.getLectures(lecID1);
			
	request.setAttribute("LECTURE_LIST", lectures);
		

		RequestDispatcher dispatcher = request.getRequestDispatcher("/profile.jsp");

		dispatcher.forward(request, response);
		
		HttpSession session = request.getSession();
	        Object stdid = null;
	        session.setAttribute("stdid", stdid);
		
	}

	private void regLecture(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String name = request.getParameter("name");
		String nic = request.getParameter("nic");
		String lecmodule = request.getParameter("lecmodule");
		String email = request.getParameter("email");	
		String tel = request.getParameter("tel");	
		String pass = request.getParameter("pass");
		String repass = request.getParameter("repass");
		String lecid = request.getParameter("lecid");
	
		Lecture theLecture = new Lecture(name, nic, lecmodule ,email, tel,pass,repass, lecid);
		
		lectureDbUtil.addLecture(theLecture);
		

		RequestDispatcher dispatcher = request.getRequestDispatcher("/leclog.jsp");

		dispatcher.forward(request, response);
		
		listLecture(request, response);
		
		
		
		HttpSession session = request.getSession();
        Object aname = null;
        session.setAttribute("aname", aname);
		
	}


		

	private void addLecture(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String name = request.getParameter("name");
		String nic = request.getParameter("nic");
		String lecmodule = request.getParameter("lecmodule");
		String email = request.getParameter("email");	
		String tel = request.getParameter("tel");	
		String pass = request.getParameter("pass");
		String repass = request.getParameter("repass");
		String lecid = request.getParameter("lecid");
	
		Lecture theLecture = new Lecture(name, nic, lecmodule ,email, tel,pass,repass, lecid);
		
		lectureDbUtil.addLecture(theLecture);
		

		listLecture(request, response);
		

		HttpSession session = request.getSession();
        Object aname = null;
        session.setAttribute("aname", aname);
		
	}

	private void deleteLecture(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String theLectureId = request.getParameter("lectureId");
	

		lectureDbUtil.deleteLecture(theLectureId);
		
		
		
		listLecture(request, response);
		
		HttpSession session = request.getSession();
        Object name = null;
        session.setAttribute("name", name);
		
	}



	private void updateLecture(HttpServletRequest request, HttpServletResponse response)  throws Exception {
	
		int id = Integer.parseInt(request.getParameter("lectureId"));
		String name = request.getParameter("name");
		String nic = request.getParameter("nic");
		String lecmodule = request.getParameter("lecmodule");
		String email = request.getParameter("email");	
		String tel = request.getParameter("tel");
		String lecid = request.getParameter("lecid");

	
		Lecture theLecture = new Lecture(id,name, nic, lecmodule ,email, tel, lecid);
		
	
		lectureDbUtil.updateLecture(theLecture);
		

		listLecture(request, response);
		

		HttpSession session = request.getSession();
        Object aname = null;
        session.setAttribute("aname", aname);
	}
	private void updateLecture2(HttpServletRequest request, HttpServletResponse response, String lecID1)  throws Exception {
		
		int id = Integer.parseInt(request.getParameter("lectureId"));
		String name = request.getParameter("name");
		String nic = request.getParameter("nic");
		String lecmodule = request.getParameter("lecmodule");
		String email = request.getParameter("email");	
		String tel = request.getParameter("tel");
		

	
		Lecture theLecture = new Lecture(id,name, nic, lecmodule ,email, tel);
		
	
		lectureDbUtil.updateLecture2(theLecture);
		
	
		listLecture2(request, response,lecID1);
			HttpSession session = request.getSession();
	        Object lecid = null;
	        session.setAttribute("lecid", lecid);
	}
	private void loadLecture(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String theLectureId = request.getParameter("lectureId");
		

		Lecture theLecture = lectureDbUtil.getLecture(theLectureId);
		
	
		request.setAttribute("THE_LECTURE", theLecture);
		
	
		RequestDispatcher dispatcher = request.getRequestDispatcher("/updateLecture.jsp"); 
		
		dispatcher.forward(request, response);
		
	}
	private void loadLecture2(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String theLectureId = request.getParameter("lectureId");
		

		Lecture theLecture = lectureDbUtil.getLecture(theLectureId);
		
	
		request.setAttribute("THE_LECTURE", theLecture);
		
	
		RequestDispatcher dispatcher = request.getRequestDispatcher("/editprofile.jsp"); 
		
		dispatcher.forward(request, response);
		
		HttpSession session = request.getSession();
        Object lecid = null;
        session.setAttribute("lecid", lecid);
		
	}
	private void listLecture(HttpServletRequest request, HttpServletResponse response) 
			throws Exception {
			
			
			List<Lecture> lectures = lectureDbUtil.getLecture();
				
		request.setAttribute("LECTURE_LIST", lectures);
			

			RequestDispatcher dispatcher = request.getRequestDispatcher("/listlecture.jsp");

			dispatcher.forward(request, response);
			
			HttpSession session = request.getSession();
		        Object stdid = null;
		        session.setAttribute("stdid", stdid);
			
		
				
		}
}