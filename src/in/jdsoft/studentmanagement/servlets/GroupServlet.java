package in.jdsoft.studentmanagement.servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import in.jdsoft.studentmanagement.controller.GroupController;
import in.jdsoft.studentmanagement.controller.GroupMappingController;
import in.jdsoft.studentmanagement.model.CourseSemester;
import in.jdsoft.studentmanagement.model.Group;

@WebServlet("/GroupServlet")
public class GroupServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		
		if(request.getParameter("action").equals("save")){
			Group group=new Group();
			GroupController groupController=new GroupController();
			GroupMappingController groupMappingController=new GroupMappingController();
			ArrayList<CourseSemester> courseSemesters=new ArrayList<>();
			String groupName=request.getParameter("group-name");
			String courseSemesterId[]=request.getParameterValues("courseSemList");
			
			
			for(String courseSemId:courseSemesterId){
				CourseSemester courseSemester=new CourseSemester();
				courseSemester.setCourseSemesterId(Integer.parseInt(courseSemId));
			    courseSemesters.add(courseSemester);	
			}
			      group.setGroupName(groupName);
			      groupMappingController.addGroupMapping(groupController.addGroup(group), courseSemesters);
			      groupController.addGroup(group);
				 
	    }
		else if(request.getParameter("action").equals("update")){
			Group group=new Group();
			GroupController groupController=new GroupController();
			GroupMappingController groupMappingController=new GroupMappingController();
			ArrayList<CourseSemester> courseSemesters=new ArrayList<>();
			String groupName=request.getParameter("editgroup-name");
			String courseSemesterId[]=request.getParameterValues("courseSemList");
			
			
			for(String courseSemId:courseSemesterId){
				CourseSemester courseSemester=new CourseSemester();
				courseSemester.setCourseSemesterId(Integer.parseInt(courseSemId));
			    courseSemesters.add(courseSemester);	
			}
			      group.setGroupName(groupName);
			      groupMappingController.addGroupMapping(groupController.addGroup(group), courseSemesters);
			      groupController.updateGroup(group);
		}
		
		}

	  
	   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//doPost(request, response);
		   
		   if(request.getParameter("action").equals("delete")){
			   int groupId=Integer.parseInt(request.getParameter("groupid"));
			   Group group=new Group();
				GroupController groupController=new GroupController();
				group.setGroupId(groupId);
			    groupController.deleteGroup(group);
				response.sendRedirect("groups.jsp");
			}
			else if(request.getParameter("action").equals("reterive")){
				int groupId=Integer.parseInt(request.getParameter("groupid"));
				GroupController groupController=new GroupController();
				Map<String,Object> groupDetails= groupController.groupDetailsFromId(groupId);
				String json = null;
	            json = new Gson().toJson(groupDetails);
	            
	            response.setContentType("application/json");
	            response.getWriter().write(json);
				
			}
		
		
	   }
}
