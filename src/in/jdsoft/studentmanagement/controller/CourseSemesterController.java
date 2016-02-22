package in.jdsoft.studentmanagement.controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.ServletContext;

import in.jdsoft.studentmanagement.database.DBConnection;
import in.jdsoft.studentmanagement.model.CourseSemester;

public class CourseSemesterController {

static ServletContext sc;
	
	Connection courseSemConn=null,courseSemConn1=null,courseSemConn2=null;
    PreparedStatement courseSemStmt=null,courseSemStmt1=null,courseSemStmt2=null;
    ResultSet courseSemRs=null,courseSemRs1=null,courseSemRs2=null;
    CourseController courseController=new CourseController();
    ArrayList<CourseSemester> returnAllCourseSemester=new ArrayList<>();
    ArrayList<CourseSemester> returnCourseSemesters=new ArrayList<>();
    ArrayList<CourseSemester> returnCourseSemestersInGroup=new ArrayList<>();
 
	public void getDbAccess(ServletContext sc){
		 CourseSemesterController.sc=sc;
	 }

	  public void addCourseSemesters(int courseId){
		  try{
			  	DBConnection courseSemSc=(DBConnection) sc.getAttribute("dbConn");
			  	courseSemConn=courseSemSc.getDBConnection();
			  	int totalSemester=(Integer)courseController.courseDetailsFromId(courseId).get("duration_in_semesters");
	    	
	    		for(int semester=1;semester<=totalSemester;semester++){
	    			courseSemStmt=courseSemConn.prepareStatement("INSERT INTO tbl_course_semesters(course_id,semester,lock_status) values(?,?,?)");
	    			courseSemStmt.setInt(1,courseId);
	    			courseSemStmt.setInt(2,semester);
	    			courseSemStmt.setInt(3, 0);
	    			courseSemStmt.execute();
	    		}
	    	
	    	}catch(Exception e){ 
	    		System.out.println("Exception in Add course semester  "+e);
	    	}
	    	finally{
	    		close();
	    	}
	  }
	  
	  public void lockStatus(int courseSemesterId,int lockStatus){
	  	  try{
	  		  DBConnection courseSemSc=(DBConnection) sc.getAttribute("dbConn");
	  		  courseSemConn=courseSemSc.getDBConnection();
	  		  courseSemStmt=courseSemConn.prepareStatement("UPDATE tbl_course_semesters SET lock_status=? WHERE course_sem_id=?");
	  		  courseSemStmt.setInt(1,lockStatus);
	  		  courseSemStmt.setInt(2,courseSemesterId);
	  		  courseSemStmt.executeUpdate();
	  	  }catch(Exception e){
	  		  System.out.println("Exception in lockingStatus of courseSemester "+e);
	  	  }finally{
	  		  close();
	  	  }
	  }
	
	  
	  public ArrayList<CourseSemester> getAllCourseSemesters(){
	    	try{
	    		DBConnection courseSemSc=(DBConnection) sc.getAttribute("dbConn");
	    		courseSemConn=courseSemSc.getDBConnection();
	    		courseSemStmt=courseSemConn.prepareStatement("SELECT * FROM tbl_course_semesters");
	    		courseSemRs=courseSemStmt.executeQuery();
	        	while(courseSemRs.next()){
	        		CourseSemester courseSemeter=new CourseSemester();
	        		
	        		courseSemeter.setCourseSemesterId(courseSemRs.getInt("course_sem_id"));
	        		courseSemeter.setCourseId(courseSemRs.getInt("course_id"));
	        		courseSemeter.setCourseSemester(courseSemRs.getInt("semester"));
	        		courseSemeter.setLockStatus(courseSemRs.getInt("lock_status"));
	        		returnAllCourseSemester.add(courseSemeter);
	        		
	        	}
	    	}catch(Exception e){
	    		System.out.println("Exception in get all course semester "+e);
	    	}finally{
	    		close();
	    	}
	    	
	    	return returnAllCourseSemester;
	    }
	  
	  
	  public ArrayList<CourseSemester> getCourseSemestersInGroup(int groupId){
		  
	    	try{
	    		DBConnection courseSemSc=(DBConnection) sc.getAttribute("dbConn");
	    		courseSemConn=courseSemSc.getDBConnection();
	    		courseSemStmt=courseSemConn.prepareStatement("SELECT course_sem_id FROM tbl_group_mapping WHERE group_id=?");
	    		courseSemStmt.setInt(1, groupId);
	    		courseSemRs=courseSemStmt.executeQuery();
	    		while(courseSemRs.next()){
	        		returnCourseSemestersInGroup.add(getCourseSemesters(courseSemRs.getInt("course_sem_id")));
	        	}
	    	}catch(Exception e){
	    		System.out.println("Exception in get course semester in group "+e);
	    	}finally{
	    		close();
	    	}
	    	
	    	return returnCourseSemestersInGroup;
	    }
  
	  public CourseSemester getCourseSemesters(int courseSemID){
		  CourseSemester courseSemeter=new CourseSemester();
	    	try{
	    		DBConnection courseSemSc1=(DBConnection) sc.getAttribute("dbConn");
	    		courseSemConn1=courseSemSc1.getDBConnection();
	    		courseSemStmt1=courseSemConn1.prepareStatement("SELECT * FROM tbl_course_semesters where course_sem_id=?");
	    		courseSemStmt1.setInt(1,courseSemID);
	    		courseSemRs1=courseSemStmt1.executeQuery();
	           if(courseSemRs1.next()){
	        	    courseSemeter.setCourseId(courseSemRs1.getInt("course_id"));
	        		courseSemeter.setCourseSemester(courseSemRs1.getInt("semester"));
	        			
	        	}
	    	}catch(Exception e){
	    		System.out.println("Exception in get Course Semester "+e);
	    	}
	    	return courseSemeter;
	    }
	  
 
	  public void close(){
	    	try{
	    		if(courseSemConn!=null){
	    			courseSemConn.close();
				}
				if(courseSemStmt!=null){
					courseSemStmt.close();	
				}
				if(courseSemRs!=null){
					courseSemRs.close();
			   }
				
				if(courseSemConn1!=null){
	    			courseSemConn1.close();
				}
				if(courseSemStmt1!=null){
					courseSemStmt1.close();	
				}
				if(courseSemRs1!=null){
					courseSemRs1.close();
			   }	
				
				if(courseSemConn2!=null){
	    			courseSemConn2.close();
				}
				if(courseSemStmt2!=null){
					courseSemStmt2.close();	
				}
				if(courseSemRs2!=null){
					courseSemRs2.close();
			   }
			}catch(Exception e){
				System.out.println("Exception in closing CourseSemester  connection "+e);
			}
	    }
}
