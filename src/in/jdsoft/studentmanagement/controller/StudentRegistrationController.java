package in.jdsoft.studentmanagement.controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.ServletContext;

import com.mysql.jdbc.Statement;

import in.jdsoft.studentmanagement.database.DBConnection;
import in.jdsoft.studentmanagement.model.CourseSemester;
import in.jdsoft.studentmanagement.model.StudentAcademic;
import in.jdsoft.studentmanagement.model.StudentRegistration;
import in.jdsoft.studentmanagement.model.UserManagement;

public class StudentRegistrationController {
static ServletContext sc;
	
	Connection registrationConn=null;
    PreparedStatement registrationStmt=null;
    ResultSet registrationRs=null;
    ArrayList<StudentRegistration> viewStudents=new ArrayList<>();
    ArrayList<StudentRegistration> returnStudentList=new ArrayList<>();
    StudentAcademicController academicController=new StudentAcademicController();
    CourseSemesterController courseSemester=new CourseSemesterController();

    
	public void getDbAccess(ServletContext sc){
		StudentRegistrationController.sc=sc;
	 }
	
	
	 
    public int addStudent(StudentRegistration student){
    	int newStudentId=0;
    	try{
    	DBConnection studentSc=(DBConnection) sc.getAttribute("dbConn");
    	registrationConn=studentSc.getDBConnection();
    	registrationStmt=registrationConn.prepareStatement("INSERT INTO tbl_student(course_id, category_id," +
    			"semester,current_semester,first_name,last_name,parent_guardian_first_name," +
    			"parent_guardian_last_name,sex,birth_date,address_line_1,address_line_2,country_id" +
    			"" +
    			",city_id,postcode,email,contact,passport_number,photo_path,joined_date,student_status_id,results_lock,created_date) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)",Statement.RETURN_GENERATED_KEYS);
    	registrationStmt.setInt(1,student.getCourseId());
    	registrationStmt.setInt(2,student.getCategoryId());
    	registrationStmt.setInt(3,student.getSemester());
    	registrationStmt.setInt(4,student.getCurrentSemester());
    	registrationStmt.setString(5,student.getFirstname());
    	registrationStmt.setString(6,student.getLastname());
    	registrationStmt.setString(7,student.getParentOrGuardianFirstName());
    	registrationStmt.setString(8,student.getParentOrGuardianLastName());
    	registrationStmt.setString(9,student.getSex());
    	
    	registrationStmt.setDate(10,student.getDateOfBirth());
    	registrationStmt.setString(11,student.getAddressLineOne());
    	registrationStmt.setString(12,student.getAddressLineTwo());
    	registrationStmt.setInt(13,student.getCountryId());
    	registrationStmt.setInt(14,student.getCityId());	
    	registrationStmt.setString(15,student.getPostcode());
    	registrationStmt.setString(16,student.getEmail());
    	registrationStmt.setString(17,student.getContact());
    	registrationStmt.setString(18,student.getPassportNo());
    	registrationStmt.setString(19,student.getImagePath());
    	registrationStmt.setDate(20,student.getJoinedDate());
    	registrationStmt.setInt(21,1);
    	registrationStmt.setInt(22,1);
    	registrationStmt.setTimestamp(23,student.getCreatedDate());
    	registrationStmt.execute();
    	registrationRs=registrationStmt.getGeneratedKeys();
    	
    	if(registrationRs.next()){
			newStudentId=registrationRs.getInt(1);
		}
    	//creating academic
   	
    	int totalSem=0;
    	int courseId=0;
    	int joinedSem=0;
    	ArrayList<StudentRegistration> detailsOfStudent= getStudentDetails(newStudentId);
    	
    	for (StudentRegistration registeredStudent: detailsOfStudent) {
			 courseId=registeredStudent.getCourseId();
			 joinedSem=registeredStudent.getSemester();
			 totalSem=(Integer) new CourseController().courseDetailsFromId(courseId).get("duration_in_semesters");
		}
	
    		if(joinedSem<=totalSem){
    			StudentAcademic academic=new StudentAcademic();
    			academic.setStudentId(newStudentId);
    			academic.setSemester(joinedSem);
    			academic.setCourseId(courseId);
    			academic.setInvoiceStatus(0);
            	academicController.addAcademics(academic);
    		}	
    		
    		//creating logincredential
    		UserManagement studentUser=new UserManagement();
    		UserManagementController adduserController=new UserManagementController();
    		studentUser.setUsername(student.getFirstname().concat(" "+student.getLastname()));
    		studentUser.setUserEmail(student.getEmail());
    		studentUser.setPassword(student.getDateOfBirth().toString());
    		studentUser.setUserType("student");
    		studentUser.setUserStatusId(1);
    		studentUser.setCreatedBy(student.getCreatedBy());
    		studentUser.setCreatedDate(student.getCreatedDate());
    		adduserController.addUser(studentUser);
    	}catch(Exception e){ 
    		System.out.println("Exception in Adding student of studentRegistration controller "+e);
    	}
    	finally{
    		close();
    	}
    	return newStudentId;
    }
    
    public ArrayList<StudentRegistration> getStudentList(){
    	try{
    		DBConnection studentSc=(DBConnection) sc.getAttribute("dbConn");
        	registrationConn=studentSc.getDBConnection();
        	registrationStmt=registrationConn.prepareStatement("SELECT * FROM tbl_student ORDER BY student_id DESC");
        	registrationRs=registrationStmt.executeQuery();
        	while(registrationRs.next()){
        		StudentRegistration student=new StudentRegistration();
        		
        		student.setStudentId(registrationRs.getInt("student_id"));
        		student.setCourseId(registrationRs.getInt("course_id"));
        		student.setCategoryId(registrationRs.getInt("category_id"));
        		student.setSemester(registrationRs.getInt("semester"));
        		student.setCurrentSemester(registrationRs.getInt("current_semester"));
        		student.setFirstname(registrationRs.getString("first_name"));
        		student.setLastname(registrationRs.getString("last_name"));
        		student.setParentOrGuardianFirstName(registrationRs.getString("parent_guardian_first_name"));
        		student.setParentOrGuardianFirstName(registrationRs.getString("parent_guardian_last_name"));
        		student.setSex(registrationRs.getString("sex"));
        		student.setDateOfBirth(registrationRs.getDate("birth_date"));
        		student.setAddressLineOne(registrationRs.getString("address_line_1"));
        		student.setAddressLineTwo(registrationRs.getString("address_line_2"));
        		student.setCountryId(registrationRs.getInt("country_id"));
        		student.setCityId(registrationRs.getInt("city_id"));
        		student.setPostcode(registrationRs.getString("postcode"));
        		student.setEmail(registrationRs.getString("email"));
        		student.setContact(registrationRs.getString("contact"));
        		student.setPassportNo(registrationRs.getString("passport_number"));
        		student.setImagePath(registrationRs.getString("photo_path"));
        		student.setJoinedDate(registrationRs.getDate("joined_date"));
        		student.setStudentStatusId(registrationRs.getInt("student_status_id"));
        		student.setResultsLock(registrationRs.getInt("results_lock"));
        		viewStudents.add(student);
        		
        	}
    	}catch(Exception e){
    		System.out.println("Exception in getting student list of student registration controller "+e);
    	}finally{
    		close();
    	}
    	return viewStudents;
    }
    

    public void deleteStudent(StudentRegistration student){
    	try{
    		DBConnection studentSc=(DBConnection) sc.getAttribute("dbConn");
        	registrationConn=studentSc.getDBConnection();
        	registrationStmt=registrationConn.prepareStatement("DELETE  FROM tbl_student where student_id=?");
        	registrationStmt.setInt(1,student.getStudentId());
        	registrationStmt.executeUpdate();
    	}catch(Exception e){
    		System.out.println("Exception in delete student of studentRegistartion controller "+e);
    	}finally{
    		close();
    	}
    }
    
    
    public void updateStudentProfile(StudentRegistration student){
    	  try{
    		  DBConnection studentSc=(DBConnection) sc.getAttribute("dbConn");
          	  registrationConn=studentSc.getDBConnection();
          	  registrationStmt=registrationConn.prepareStatement("UPDATE tbl_student SET category_id=?,semester=?,first_name=?,"
          	  		+ "last_name=?,parent_guardian_first_name=?,parent_guardian_last_name=?,sex=?,age=?,birth_date=?,address_line_1=?,postcode=?,email=?,contact=?,passport_number=?,photo_path=?,joined_date=?where student_id=?");

        	registrationStmt.setInt(1,student.getCategoryId());
        	registrationStmt.setInt(2,student.getSemester());
        	registrationStmt.setString(3,student.getFirstname());
        	registrationStmt.setString(4,student.getLastname());
        	registrationStmt.setString(5,student.getParentOrGuardianFirstName());
        	registrationStmt.setString(6,student.getParentOrGuardianLastName());
        	registrationStmt.setString(7,student.getSex());
        	
        	registrationStmt.setDate(8,student.getDateOfBirth());
        	registrationStmt.setString(9,student.getAddressLineOne());
        	registrationStmt.setString(10,student.getAddressLineTwo());
        	registrationStmt.setInt(11,student.getCountryId());
        	registrationStmt.setInt(12,student.getCityId());
        	registrationStmt.setString(13,student.getPostcode());
        	registrationStmt.setString(14,student.getEmail());
        	registrationStmt.setString(15,student.getContact());
        	registrationStmt.setString(16,student.getPassportNo());
        	registrationStmt.setString(17,student.getImagePath());
        	registrationStmt.setDate(18,student.getJoinedDate());
        	registrationStmt.setInt(19,student.getStudentId());
          	registrationStmt.executeUpdate();
    	  }catch(Exception e){
    		  System.out.println("Exception in update student of studentRegistration controller "+e);
    	  }finally{
    		  close();
    	  }
    }
    
    public ArrayList<StudentRegistration> getStudentDetails(int studentId){
    	
    	StudentRegistration studentDetails=new StudentRegistration();
    	ArrayList<StudentRegistration> details=new ArrayList<>();
    	//HashMap<String, Object> studentDetails=new HashMap<>();
       try{
     	  DBConnection studentSc=(DBConnection) sc.getAttribute("dbConn");
       	  registrationConn=studentSc.getDBConnection();
       	  registrationStmt=registrationConn.prepareStatement("SELECT * FROM tbl_student where student_id=?");
       	  registrationStmt.setInt(1,studentId);
       	  registrationRs=registrationStmt.executeQuery();
       	  registrationRs.next();
       	  
       	studentDetails.setStudentId(registrationRs.getInt("student_id"));
		studentDetails.setCourseId(registrationRs.getInt("course_id"));
		studentDetails.setCategoryId(registrationRs.getInt("category_id"));
		studentDetails.setSemester(registrationRs.getInt("semester"));
		studentDetails.setCurrentSemester(registrationRs.getInt("current_semester"));
		studentDetails.setFirstname(registrationRs.getString("first_name"));
		studentDetails.setLastname(registrationRs.getString("last_name"));
		studentDetails.setParentOrGuardianFirstName(registrationRs.getString("parent_guardian_first_name"));
		studentDetails.setParentOrGuardianFirstName(registrationRs.getString("parent_guardian_last_name"));
		studentDetails.setSex(registrationRs.getString("sex"));
		studentDetails.setDateOfBirth(registrationRs.getDate("birth_date"));
		studentDetails.setAddressLineOne(registrationRs.getString("address_line_1"));
		studentDetails.setAddressLineTwo(registrationRs.getString("address_line_2"));
		studentDetails.setCountryId(registrationRs.getInt("country_id"));
		studentDetails.setCityId(registrationRs.getInt("city_id"));
		studentDetails.setPostcode(registrationRs.getString("postcode"));
		studentDetails.setEmail(registrationRs.getString("email"));
		studentDetails.setContact(registrationRs.getString("contact"));
		studentDetails.setPassportNo(registrationRs.getString("passport_number"));
		studentDetails.setImagePath(registrationRs.getString("photo_path"));
		studentDetails.setJoinedDate(registrationRs.getDate("joined_date"));
		studentDetails.setStudentStatusId(registrationRs.getInt("student_status_id"));
		studentDetails.setResultsLock(registrationRs.getInt("results_lock"));
		details.add(studentDetails);
       }catch(Exception e){
     	  System.out.println("Exception in student details of student Registration controller"+e);
       }finally{
     	  close();
       }
       return details;
 }
    
    public ArrayList<StudentRegistration> getStudentListOfGroup(int groupId,int categoryId){
		  try{
			    ArrayList<CourseSemester> courseSemestersInGroup=courseSemester.getCourseSemestersInGroup(groupId);
			    
			    for(CourseSemester courseSemster:courseSemestersInGroup){
			    	DBConnection studentSc2=(DBConnection) sc.getAttribute("dbConn");
		    	    registrationConn=studentSc2.getDBConnection();
		    		registrationStmt=registrationConn.prepareStatement("SELECT * FROM tbl_student WHERE course_id=? AND current_semester=? AND category_id=?");
		    		registrationStmt.setInt(1, courseSemster.getCourseId());
		    		registrationStmt.setInt(2, courseSemster.getCourseSemester());
		    		registrationStmt.setInt(3, categoryId);
		    		registrationRs=registrationStmt.executeQuery();
		    		
		        	while(registrationRs.next()){
		        		StudentRegistration student=new StudentRegistration();
		        		student.setStudentId(registrationRs.getInt("student_id"));
		        		student.setCourseId(registrationRs.getInt("course_id"));
		        		student.setCategoryId(registrationRs.getInt("category_id"));
		        		student.setSemester(registrationRs.getInt("semester"));
		        		student.setCurrentSemester(registrationRs.getInt("current_semester"));
		        		student.setFirstname(registrationRs.getString("first_name"));
		        		student.setLastname(registrationRs.getString("last_name"));
		        		student.setParentOrGuardianFirstName(registrationRs.getString("parent_guardian_first_name"));
		        		student.setParentOrGuardianLastName(registrationRs.getString("parent_guardian_last_name"));
		        		student.setSex(registrationRs.getString("sex"));
		        		student.setDateOfBirth(registrationRs.getDate("birth_date"));
		        		student.setAddressLineOne(registrationRs.getString("address_line_1"));
		        		student.setAddressLineTwo(registrationRs.getString("address_line_2"));
		        		student.setCountryId(registrationRs.getInt("country_id"));
		        		student.setCityId(registrationRs.getInt("city_id"));
		        		student.setPostcode(registrationRs.getString("postcode"));
		        		student.setEmail(registrationRs.getString("email"));
		        		student.setContact(registrationRs.getString("contact"));
		        		student.setPassportNo(registrationRs.getString("passport_number"));
		        		student.setImagePath(registrationRs.getString("photo_path"));
		        		student.setJoinedDate(registrationRs.getDate("joined_date"));
		        		returnStudentList.add(student);
		        	}
			   }
	    		
	    	}catch(Exception e){
	    		System.out.println("Exception in get Student List Of Group "+e);
	    	}finally{
	    		close();
	    	}
	  
	     return returnStudentList;
	  }
    
    public ArrayList<StudentRegistration> getStudentListFromCourseSemesterAndCategory(int courseSemesterId,int categoryId){
    	ArrayList<StudentRegistration> returnStudentListFromCourseSemesterAndCategory=new ArrayList<>();
		  try{
			        CourseSemester courseSemesters=courseSemester.getCourseSemesters(courseSemesterId);
			        DBConnection studentSc2=(DBConnection) sc.getAttribute("dbConn");
		    	    registrationConn=studentSc2.getDBConnection();
		    		registrationStmt=registrationConn.prepareStatement("SELECT * FROM tbl_student WHERE course_id=? AND current_semester=? AND category_id=?");
		    		registrationStmt.setInt(1, courseSemesters.getCourseId());
		    		registrationStmt.setInt(2, courseSemesters.getCourseSemester());
		    		registrationStmt.setInt(3, categoryId);
		    		registrationRs=registrationStmt.executeQuery();
		    		
		        	while(registrationRs.next()){
		        		StudentRegistration student=new StudentRegistration();
		        		student.setStudentId(registrationRs.getInt("student_id"));
		        		student.setCourseId(registrationRs.getInt("course_id"));
		        		student.setCategoryId(registrationRs.getInt("category_id"));
		        		student.setSemester(registrationRs.getInt("semester"));
		        		student.setCurrentSemester(registrationRs.getInt("current_semester"));
		        		student.setFirstname(registrationRs.getString("first_name"));
		        		student.setLastname(registrationRs.getString("last_name"));
		        		student.setParentOrGuardianFirstName(registrationRs.getString("parent_guardian_first_name"));
		        		student.setParentOrGuardianLastName(registrationRs.getString("parent_guardian_last_name"));
		        		student.setSex(registrationRs.getString("sex"));
		        		student.setDateOfBirth(registrationRs.getDate("birth_date"));
		        		student.setAddressLineOne(registrationRs.getString("address_line_1"));
		        		student.setAddressLineTwo(registrationRs.getString("address_line_2"));
		        		student.setCountryId(registrationRs.getInt("country_id"));
		        		student.setCityId(registrationRs.getInt("city_id"));
		        		student.setPostcode(registrationRs.getString("postcode"));
		        		student.setEmail(registrationRs.getString("email"));
		        		student.setContact(registrationRs.getString("contact"));
		        		student.setPassportNo(registrationRs.getString("passport_number"));
		        		student.setImagePath(registrationRs.getString("photo_path"));
		        		student.setJoinedDate(registrationRs.getDate("joined_date"));
		        		student.setStudentStatusId(registrationRs.getInt("student_status_id"));
		        		student.setResultsLock(registrationRs.getInt("results_lock"));
		        		returnStudentListFromCourseSemesterAndCategory.add(student);
		        	}
		
	    	}catch(Exception e){
	    		System.out.println("Exception in get Student List Of Course Semester and Category"+e);
	    	}finally{
	    		close();
	    	}
	  
	     return returnStudentListFromCourseSemesterAndCategory;
	  }
    
    
    public void updateStudentStatus(int statusId,int studentId){
    	  try{
    		  DBConnection studentSc=(DBConnection) sc.getAttribute("dbConn");
          	  registrationConn=studentSc.getDBConnection();
          	  registrationStmt=registrationConn.prepareStatement("UPDATE tbl_student SET student_status_id=? WHERE student_id=?");
          	  registrationStmt.setInt(1,statusId);
          	  registrationStmt.setInt(2,studentId);
          	  registrationStmt.executeUpdate();
    	  }catch(Exception e){
    		  System.out.println("Exception in updating student status "+e);
    	  }finally{
    		  close();
    	  }
    }
    
    public void releaseLock(){
  	  try{
  		  DBConnection studentSc=(DBConnection) sc.getAttribute("dbConn");
        	  registrationConn=studentSc.getDBConnection();
        	  registrationStmt=registrationConn.prepareStatement("UPDATE tbl_student SET results_lock=? WHERE student_status_id=?");
        	  registrationStmt.setInt(1,0);
        	  registrationStmt.setInt(2,1);
        	  registrationStmt.executeUpdate();
  	  }catch(Exception e){
  		  System.out.println("Exception in releasing Lock "+e);
  	  }finally{
  		  close();
  	  }
  }
    
    public void updateCurrentSemester(int currentSemester,int studentId){
  	  try{
  		  DBConnection studentSc=(DBConnection) sc.getAttribute("dbConn");
        	  registrationConn=studentSc.getDBConnection();
        	  registrationStmt=registrationConn.prepareStatement("UPDATE tbl_student SET current_semester=? WHERE student_id=?");
        	  registrationStmt.setInt(1,currentSemester);
        	  registrationStmt.setInt(2,studentId);
        	  registrationStmt.executeUpdate();
  	  }catch(Exception e){
  		  System.out.println("Exception in updating students current semester "+e);
  	  }finally{
  		  close();
  	  }
  }
    
    public void updateStudentLock(int lockStatus,int studentId){
  	  try{
  		  DBConnection studentSc=(DBConnection) sc.getAttribute("dbConn");
        	  registrationConn=studentSc.getDBConnection();
        	  registrationStmt=registrationConn.prepareStatement("UPDATE tbl_student SET results_lock=? WHERE student_id=?");
        	  registrationStmt.setInt(1,lockStatus);
        	  registrationStmt.setInt(2,studentId);
        	  registrationStmt.executeUpdate();
  	  }catch(Exception e){
  		  System.out.println("Exception in updating student Lock status "+e);
  	  }finally{
  		  close();
  	  }
  }
    
 
    public void close(){
    	try{
    		if(registrationConn!=null){
				registrationConn.close();
			}
			if(registrationStmt!=null){
			  registrationStmt.close();	
			}
			if(registrationRs!=null){
				registrationRs.close();
		   }
		}catch(Exception e){
			System.out.println("Exception in closing student Registration connection of student registration controller"+e);
		}
    }

}
