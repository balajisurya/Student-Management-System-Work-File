package in.jdsoft.studentmanagement.controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.ServletContext;

import in.jdsoft.studentmanagement.database.DBConnection;
import in.jdsoft.studentmanagement.model.CourseSemester;
import in.jdsoft.studentmanagement.model.Group;

public class GroupMappingController {
static ServletContext sc;
	
	Connection groupMappingConn=null;
    PreparedStatement groupMappingStmt=null;
    ResultSet groupMappingRs=null;
    ArrayList<Group> viewMappingGroups=new ArrayList<>();
  
    CourseSemesterController courseSemesterController=new CourseSemesterController();
	  public void getDbAccess(ServletContext sc){
			GroupMappingController.sc=sc;
	  }

	  public void addGroupMapping(int groupId,ArrayList<CourseSemester> courseSemesters){
		  try{
			  	DBConnection groupMappingSc=(DBConnection) sc.getAttribute("dbConn");
			  	groupMappingConn=groupMappingSc.getDBConnection();
			  	
			  	for(CourseSemester courseSemester:courseSemesters){
			  		groupMappingStmt=groupMappingConn.prepareStatement("INSERT INTO tbl_group_mapping(group_id,course_sem_id) values(?,?)");
			  		groupMappingStmt.setInt(1,groupId);
			  		groupMappingStmt.setInt(2,courseSemester.getCourseSemesterId());
			  		groupMappingStmt.execute();
			  		courseSemesterController.lockStatus(courseSemester.getCourseSemesterId(),1);
			    }
			  	
	    	}catch(Exception e){ 
	    		System.out.println("Exception in Add group mapping "+e);
	     }
	    finally{
	    		close();
	    	}
		  
	  }
	
	  
	 
	  
	  public void close(){
	    	try{
				
				if(groupMappingConn!=null){
					groupMappingConn.close();
				}
				if(groupMappingStmt!=null){
					groupMappingStmt.close();	
				}
				if(groupMappingRs!=null){
					groupMappingRs.close();
			   }
			}catch(Exception e){
				System.out.println("Exception in connection closing group mapping"+e);
			}
	    }
	
}
