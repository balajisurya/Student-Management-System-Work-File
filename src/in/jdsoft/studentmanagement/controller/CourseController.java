package in.jdsoft.studentmanagement.controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;

import in.jdsoft.studentmanagement.database.DBConnection;
import in.jdsoft.studentmanagement.model.Courses;


/**
* CourseController is a class used to perform the various Operation on Course like Adding the new course using addCourse() method.  
* 
*
* @author  Jd Soft
* @version 1.0
* @since   2015-12-09 
*/
public class CourseController {
	
	static ServletContext sc;
	
	Connection courseConn=null;
    PreparedStatement courseStmt=null;
    ResultSet courseRs=null;
    ArrayList<Courses> viewCourse=new ArrayList<>();

    
	public void getDbAccess(ServletContext sc){
		 CourseController.sc=sc;
	 }
	
	/**
     * addCourse() method is used to add the new course, it accepts the Course object as its parameter.
     * @throws Exception with message "Exception in Add Course of course controller" if there is any exception.
     */
	 
    public void addCourse(Courses c){
    	try{
    	DBConnection courseSc=(DBConnection) sc.getAttribute("dbConn");
    	courseConn=courseSc.getDBConnection();
    	courseStmt=courseConn.prepareStatement("INSERT INTO tbl_courses(course_name, duration_in_years,duration_in_semesters,course_description,image) values(?,?,?,?,?)");
    	courseStmt.setString(1,c.getCourseName());
    	courseStmt.setInt(2, c.getDurationInYears());
    	courseStmt.setInt(3,c.getDurationInSemester());
    	courseStmt.setString(4,c.getCourseDescription());
    	courseStmt.setString(5,c.getCourseImage());
    	courseStmt.execute();
    	new CourseSemesterController().addCourseSemesters(0);
    	}
    	catch(Exception e){ 
    		System.out.println("Exception in Add Course of course controller "+e);
    	}
    	finally{
    		close();
    	}
    }
    
    public ArrayList<Courses> viewCourse(){
    	try{
    		DBConnection courseSc=(DBConnection) sc.getAttribute("dbConn");
        	courseConn=courseSc.getDBConnection();
        	courseStmt=courseConn.prepareStatement("SELECT * FROM tbl_courses ORDER BY course_id DESC");
        	courseRs=courseStmt.executeQuery();
        	while(courseRs.next()){
        		Courses course=new Courses();
        		course.setCourseId(courseRs.getInt("course_id"));
        		course.setCourseName(courseRs.getString("course_name"));
        		course.setDurationInYears(courseRs.getInt("duration_in_years"));
        		course.setDurationInSemester(courseRs.getInt("duration_in_semesters"));
        		course.setCourseDescription(courseRs.getString("course_description"));
        		course.setCourseImage(courseRs.getString("image"));
        		viewCourse.add(course);
        	}
    	}catch(Exception e){
    		System.out.println("Exception in view courses of course controller "+e);
    	}finally{
    		close();
    	}
    	
    	return viewCourse;
    }
    

    public void deleteCourse(Courses c){
    	try{
    		DBConnection courseSc=(DBConnection) sc.getAttribute("dbConn");
        	courseConn=courseSc.getDBConnection();
        	courseStmt=courseConn.prepareStatement("DELETE  FROM tbl_courses where course_id=?");
        	courseStmt.setInt(1, c.getCourseId());
        	courseStmt.executeUpdate();
    	}catch(Exception e){
    		System.out.println("Exception in delete Course of course controller "+e);
    	}finally{
    		close();
    	}
    }
    
    
    public void updateCourse(Courses c){
    	  try{
    		  DBConnection courseSc=(DBConnection) sc.getAttribute("dbConn");
          	  courseConn=courseSc.getDBConnection();
          	  courseStmt=courseConn.prepareStatement("UPDATE tbl_courses SET course_name=?,duration_in_years=?,duration_in_semesters=? where course_id=?");
          	  courseStmt.setString(1,c.getCourseName());
          	  courseStmt.setInt(2, c.getDurationInYears());
          	  courseStmt.setInt(3,c.getDurationInSemester());
          	  courseStmt.setInt(4,c.getCourseId());
          	  courseStmt.executeUpdate();
    	  }catch(Exception e){
    		  System.out.println("Exception in update Course of course controller "+e);
    	  }finally{
    		  close();
    	  }
    }
    
    public String courseNameFromId(int courseId){
 	   String course_name=null;
       try{
     	  DBConnection courseSc=(DBConnection) sc.getAttribute("dbConn");
       	  courseConn=courseSc.getDBConnection();
       	  courseStmt=courseConn.prepareStatement("SELECT course_name FROM tbl_courses where course_id=?");
       	  courseStmt.setInt(1,courseId);
       	  courseRs=courseStmt.executeQuery();
       	  courseRs.next();
       	  course_name=courseRs.getString("course_name");
       }catch(Exception e){
     	  System.out.println("Exception in course Name from course Id of course controller "+e);
       }finally{
     	  close();
       }
       return course_name;
 }
    
    public Map<String,Object> courseDetailsFromId(int courseId){
    	HashMap<String, Object> courseDetails=new HashMap<>();
       try{
     	  DBConnection courseSc=(DBConnection) sc.getAttribute("dbConn");
       	  courseConn=courseSc.getDBConnection();
       	  courseStmt=courseConn.prepareStatement("SELECT * FROM tbl_courses where course_id=?");
       	  courseStmt.setInt(1,courseId);
       	  courseRs=courseStmt.executeQuery();
       	  courseRs.next();
       	  courseDetails.put("course_name", courseRs.getString("course_name"));
       	  courseDetails.put("duration_in_years", courseRs.getInt("duration_in_years"));
       	  courseDetails.put("duration_in_semesters", courseRs.getInt("duration_in_semesters"));
       	  courseDetails.put("course_descrption",courseRs.getString("course_description"));
       	  courseDetails.put("course_image",courseRs.getString("image"));
       	  
       }catch(Exception e){
     	  System.out.println("Exception in course details of course controller"+e);
       }finally{
     	  close();
       }
       return courseDetails;
 }
    
    public void close(){
    	try{
    		if(courseConn!=null){
				courseConn.close();
			}
			if(courseStmt!=null){
			  courseStmt.close();	
			}
			if(courseRs!=null){
				courseRs.close();
		   }
		}catch(Exception e){
			System.out.println("Exception in closing courses connection of course controller"+e);
		}
    }
}
