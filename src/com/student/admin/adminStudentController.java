package com.student.admin;


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
 * Servlet implementation class adminStudentController
 */
@WebServlet("/adminStudentController")
public class adminStudentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
	
	private adminstudentdbutil adminstudentdbutil;
	
	@Resource (name="jdbc/onlinehelpdesk")
	private DataSource dataSource;
	
	
	
    @Override
	public void init() throws ServletException {
		// TODO Auto-generated method stub
		super.init();
		
		
		try {
		
			adminstudentdbutil = new adminstudentdbutil(dataSource); 
		
		}
		catch( Exception exc) {
			throw new ServletException(exc);
		}
	
    }

	
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// list the students ... in mvc fashion
		
		
		try {
				String theCommand = request.getParameter("command");
				String stdID1 = request.getParameter("stdid");
				
				if(theCommand == null) {
					theCommand="LIST";
				}
				
				switch (theCommand) {
				case "LIST":
					listStudent(request, response);
					break;
				case "LIST2":
					listStudent2(request, response,stdID1);
					break;
				case "ADD":
					addStudent(request, response);
					break;
					
				case "LOAD":
					loadStudent(request,response);
					break;
				case "LOAD2":
					loadStudent2(request,response);
					break;
					
				case "UPDATE":
					updateStudent(request,response);
					break;
				case "PROUPDATE":
					updateStudent2(request,response,stdID1);
					break;
					
				case "DELETE":
					deleteStudent(request,response);
					break;
				case "REG":
					registerStudent(request,response);
					break;
					default:
						listStudent(request, response);
				}
			
			
		} catch (Exception exc) {
			throw new ServletException(exc);
		}		
		
	}
	
	private void updateStudent2(HttpServletRequest request, HttpServletResponse response,String stdID1)  throws Exception {
		// TODO Auto-generated method stub
		
		int id = Integer.parseInt(request.getParameter("studentId"));
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String regno = request.getParameter("regno");
		String nic = request.getParameter("nic");
		String tel = request.getParameter("tel");
		String dob = request.getParameter("dob");
		String address = request.getParameter("address");
		String pass = request.getParameter("pass");
		String repass = request.getParameter("repass");
		
 		adminshowstudent theAdminshowstudent = new adminshowstudent(id,nic,  name,  email,  regno, tel, dob, address,  pass,  repass);
	
 		adminstudentdbutil.updateStudent2(theAdminshowstudent);
 		
 		listStudent2(request, response,stdID1);
 		
 		HttpSession session = request.getSession();
        Object stdid = null;
        session.setAttribute("stdid", stdid);
	}



	private void loadStudent2(HttpServletRequest request, HttpServletResponse response) throws Exception{
		// TODO Auto-generated method stub
		String theStudentId = request.getParameter("studentId");
		adminshowstudent theAdminshowstudent = adminstudentdbutil.getStudents(theStudentId);	
		request.setAttribute("THE_STUDENT", theAdminshowstudent);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("editprofileStd.jsp");
		dispatcher.forward(request, response);
	}



	private void listStudent2(HttpServletRequest request, HttpServletResponse response,String stdID1)  throws Exception{
				
		List<adminshowstudent> students = adminstudentdbutil.getStudent(stdID1);

				request.setAttribute("STUDENT_LIST", students);
						
				RequestDispatcher dispatcher = request.getRequestDispatcher("/profileStd.jsp");
				dispatcher.forward(request, response);
				
				
				HttpSession session = request.getSession();
			        Object lecid = null;
			        session.setAttribute("lecid", lecid);
				
	}

	private void registerStudent(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String regno = request.getParameter("regno");
		String nic = request.getParameter("nic");
		String tel = request.getParameter("tel");
		String dob = request.getParameter("dob");
		String address = request.getParameter("address");
		String pass = request.getParameter("pass");
		String repass = request.getParameter("repass");
		
		
		adminshowstudent theAdminshowstudent = new adminshowstudent(nic,  name,  email,  regno, tel, dob, address,  pass,  repass);
		
		adminstudentdbutil.registerStudent(theAdminshowstudent);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("stlogin.jsp");
		dispatcher.forward(request, response);
		
	}



	private void deleteStudent(HttpServletRequest request, HttpServletResponse response) throws Exception{
		// TODO Auto-generated method stub
		String theStudentId = request.getParameter("studentId");
		
		adminstudentdbutil.deleteStudent(theStudentId);
		
		listStudent(request, response);
	}



	private void updateStudent(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		int id = Integer.parseInt(request.getParameter("studentId"));
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String regno = request.getParameter("regno");
		String nic = request.getParameter("nic");


		
 		adminshowstudent theAdminshowstudent = new adminshowstudent(id, name, email, regno, nic);
	
 		adminstudentdbutil.updateStudent(theAdminshowstudent);
 		
 		listStudent(request, response);
	}



	private void loadStudent(HttpServletRequest request, HttpServletResponse response) throws Exception{
		// TODO Auto-generated method stub
		String theStudentId = request.getParameter("studentId");
		adminshowstudent theAdminshowstudent = adminstudentdbutil.getStudents(theStudentId);	
		request.setAttribute("THE_STUDENT", theAdminshowstudent);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("updateStudent.jsp");
		dispatcher.forward(request, response);
	}



	private void addStudent(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String regno = request.getParameter("regno");
		String nic = request.getParameter("nic");
		
		
		adminshowstudent theAdminshowstudent = new adminshowstudent(name, email, regno, nic);
		
		adminstudentdbutil.addStudent(theAdminshowstudent);
		
		listStudent(request, response);
	}



	private void listStudent(HttpServletRequest request, HttpServletResponse response)  
		// TODO Auto-generated method stub
		
		throws Exception{
					List<adminshowstudent> students = adminstudentdbutil.getStudents();
	
					request.setAttribute("STUDENT_LIST", students);
							
					RequestDispatcher dispatcher = request.getRequestDispatcher("liststudent.jsp");
					dispatcher.forward(request, response);
					
		}
		
	
	
}

	


	

	

