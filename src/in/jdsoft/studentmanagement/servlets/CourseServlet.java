package in.jdsoft.studentmanagement.servlets;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import in.jdsoft.studentmanagement.controller.CourseController;
import in.jdsoft.studentmanagement.model.Courses;

/**
 * Servlet implementation class CourseServlet
 */
@WebServlet("/CourseServlet")
public class CourseServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		
		if(request.getParameter("action").equals("save")){
			Courses course=new Courses();
			CourseController courseController=new CourseController();
			String courseName=request.getParameter("course-name");	
			int durationInyears=Integer.parseInt(request.getParameter("years"));
			int durationInsem=Integer.parseInt(request.getParameter("sems"));
			String courseDescrirption=request.getParameter("description");
				course.setCourseName(courseName);
				course.setDurationInYears(durationInyears);
				course.setDurationInSemester(durationInsem);
				course.setCourseImage("courses.png");
				course.setCourseDescription(courseDescrirption);	
				courseController.addCourse(course);  
	    }
		else if(request.getParameter("action").equals("update")){
			Courses course=new Courses();
			CourseController courseController=new CourseController();
			
			String courseName=request.getParameter("editcoursename");	
			int durationInyears=Integer.parseInt(request.getParameter("edityear"));
			int durationInsem=Integer.parseInt(request.getParameter("editsem"));
			int courseId=Integer.parseInt(request.getParameter("courseId"));
			
				course.setCourseName(courseName);
				course.setDurationInYears(durationInyears);
				course.setDurationInSemester(durationInsem);
				course.setCourseId(courseId);
				courseController.updateCourse(course);
		}
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//doPost(request, response);
		
		if(request.getParameter("action").equals("delete")){
			int courseId=Integer.parseInt(request.getParameter("courseId"));
			Courses course=new Courses();
			CourseController courseController=new CourseController();
			course.setCourseId(courseId);
		    courseController.deleteCourse(course);
			response.sendRedirect("course.jsp");
		}
		else if(request.getParameter("action").equals("reterive")){
			int courseId=Integer.parseInt(request.getParameter("courseId"));
			CourseController courseController=new CourseController();
			Map<String,Object> courseDetails= courseController.courseDetailsFromId(courseId);
			String json = null;
            json = new Gson().toJson(courseDetails);
            
            response.setContentType("application/json");
            response.getWriter().write(json);
			
		}
	}

}
