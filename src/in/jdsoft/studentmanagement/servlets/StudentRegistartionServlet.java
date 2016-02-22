package in.jdsoft.studentmanagement.servlets;

import java.io.IOException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import in.jdsoft.studentmanagement.controller.CourseController;
import in.jdsoft.studentmanagement.controller.ReceiptController;
import in.jdsoft.studentmanagement.controller.StudentRegistrationController;
import in.jdsoft.studentmanagement.model.StudentRegistration;


@WebServlet("/StudentRegistartionServlet")
public class StudentRegistartionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		
		 System.out.println("working");
		 SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy");
		 String studentFirstName=request.getParameter("first-name");
		 String studentLastName=request.getParameter("last-name");
		 String parentOrGuardianFirstName=request.getParameter("guardianfirst-name");
		 String parentOrGuardianLastName=request.getParameter("guardianlast-name");
		 String studentGender=request.getParameter("sex");
		 int 	studentCourseId=Integer.parseInt(request.getParameter("courses-list"));
		 int 	studentSemester=Integer.parseInt(request.getParameter("semester-joined"));
		 int 	studentCategoryId=Integer.parseInt(request.getParameter("category"));
		 String studentImagePath="images/image.png";
		 String date=request.getParameter("date_of_joining");
		 java.sql.Date dateOfJoining=null;
		try {
			dateOfJoining = new java.sql.Date(format.parse(date).getTime());
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 String studentEmail=request.getParameter("student_email");
		 String studentContact=request.getParameter("contact_number");
		 String dateOfBirth=request.getParameter("student_dob");
		 java.sql.Date studentDateOfBirth=null;
		try {
			studentDateOfBirth = new java.sql.Date(format.parse(dateOfBirth).getTime());
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 String studentAddressLine1=request.getParameter("address_line_1");
		 String studentAddressLine2=request.getParameter("address_line_2");
		 int studentCounryId=Integer.parseInt(request.getParameter("country"));
		 int studentCityId=Integer.parseInt(request.getParameter("city"));
		 String studentPostcode=request.getParameter("post_code");
		 String studentPassportNo=request.getParameter("passport-number");
		 int fesStructureId=Integer.parseInt(request.getParameter("feesTemplateId"));
		 
		 
		//Double templateItemPrice=Double.parseDouble(request.getParameter("item-price"));
		//int currencyId=Integer.parseInt(request.getParameter("template-currency"));
		
		StudentRegistration registerStudent=new StudentRegistration();
		StudentRegistrationController studentRegistrationController=new StudentRegistrationController();
		
		registerStudent.setCourseId(studentCourseId);
		registerStudent.setCategoryId(studentCategoryId);
		registerStudent.setSemester(studentSemester);
		registerStudent.setCurrentSemester(studentSemester);
		registerStudent.setFirstname(studentFirstName);
		registerStudent.setLastname(studentLastName);
		registerStudent.setParentOrGuardianFirstName(parentOrGuardianFirstName);
		registerStudent.setParentOrGuardianLastName(parentOrGuardianLastName);
		registerStudent.setSex(studentGender);
		registerStudent.setDateOfBirth(studentDateOfBirth);
		registerStudent.setAddressLineOne(studentAddressLine1);
		registerStudent.setAddressLineTwo(studentAddressLine2);
		registerStudent.setCountryId(studentCounryId);
		registerStudent.setCityId(studentCityId);
		registerStudent.setPostcode(studentPostcode);
		registerStudent.setEmail(studentEmail);
		registerStudent.setContact(studentContact);
		registerStudent.setPassportNo(studentPassportNo);
		registerStudent.setImagePath(studentImagePath);
		registerStudent.setJoinedDate(dateOfJoining);
		registerStudent.setCreatedBy(request.getSession().getAttribute("username").toString());
		
		Calendar calendar = Calendar.getInstance();
		java.util.Date createdDate = calendar.getTime();
		Timestamp createdDateTime = new Timestamp(createdDate.getTime());
		
		registerStudent.setCreatedDate(createdDateTime);
		int newstudentId=studentRegistrationController.addStudent(registerStudent);
		
		String studentId[]={Integer.toString(newstudentId)};
		new ReceiptController().addReceipt(studentId, fesStructureId);
		response.sendRedirect("dashboard.jsp");
	}

   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
		int courseId =Integer.parseInt(request.getParameter("courseId"));
    	 java.util.List<Integer> list = new ArrayList<Integer>();
    	 String json = null;
    	 int semcount=0;
        if(courseId!=0){
        	semcount=(Integer)new CourseController().courseDetailsFromId(courseId).get("duration_in_semesters");
           for(int i=1;i<=semcount;i++){
        		list.add(i);
            }
        	json = new Gson().toJson(list);
        	
        }
        response.setContentType("application/json");
        response.getWriter().write(json);
    }
}
