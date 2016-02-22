package in.jdsoft.studentmanagement.model;

import java.sql.Date;
import java.sql.Timestamp;

public class StudentRegistration {

	public  int studentId;
	public  int courseId;
	public int categoryId;
	public int semester;
	public int currentSemester;
	public String firstname;
	public String lastname;
	public  String parentOrGuardianFirstName;
	public  String parentOrGuardianLastName;
	public String sex;
	public Date dateOfBirth,joinedDate;
	public String addressLineOne;
	public String addressLineTwo;
	public int countryId;
	public int cityId;
	public String postcode;
	public String email;
	public String contact;
	public String passportNo;
	public String imagePath;
	public int studentStatusId;
	public int resultsLock;
	public Timestamp createdDate;
	public String createdBy;
	
	
	public void setStudentId(int studentId) {
		this.studentId = studentId;
	}
	public int getStudentId() {
		return studentId;
	}
	public void setCourseId(int courseId) {
		this.courseId = courseId;
	}
	public int getCourseId() {
		return courseId;
	}
	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}
	public int getCategoryId() {
		return categoryId;
	}
	
	public void setSemester(int semester) {
		this.semester = semester;
	}
	public int getSemester() {
		return semester;
	}
	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}
	public String getFirstname() {
		return firstname;
	}
	public void setLastname(String lastname) {
		this.lastname = lastname;
	}
	public String getLastname() {
		return lastname;
	}
	public void setParentOrGuardianFirstName(String parentOrGuardianFirstName) {
		this.parentOrGuardianFirstName = parentOrGuardianFirstName;
	}
	public String getParentOrGuardianFirstName() {
		return parentOrGuardianFirstName;
	}
	public void setParentOrGuardianLastName(String parentOrGuardianLastName) {
		this.parentOrGuardianLastName = parentOrGuardianLastName;
	}
	public String getParentOrGuardianLastName() {
		return parentOrGuardianLastName;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getSex() {
		return sex;
	}
	
	public void setDateOfBirth(Date dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}
	
     public Date getDateOfBirth() {
		return dateOfBirth;
	}
	
	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}
	public String getPostcode() {
		return postcode;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getEmail() {
		return email;
	}
	public void setContact(String contact) {
		this.contact = contact;
	}
	public String getContact() {
		return contact;
	}
	public void setPassportNo(String passportNo) {
		this.passportNo = passportNo;
	}

    public String getPassportNo() {
		return passportNo;
	}
	
	public void setJoinedDate(Date joinedDate) {
		this.joinedDate = joinedDate;
	}
	
	public Date getJoinedDate() {
		return joinedDate;
	}
	
	public void setCreatedDate(Timestamp createdDate) {
		this.createdDate = createdDate;
	}
	
	public Timestamp getCreatedDate() {
		return createdDate;
	}
	public String getAddressLineOne() {
		return addressLineOne;
	}
	public void setAddressLineOne(String addressLineOne) {
		this.addressLineOne = addressLineOne;
	}
	public String getAddressLineTwo() {
		return addressLineTwo;
	}
	public void setAddressLineTwo(String addressLineTwo) {
		this.addressLineTwo = addressLineTwo;
	}
	public int getCountryId() {
		return countryId;
	}
	public void setCountryId(int countryId) {
		this.countryId = countryId;
	}
	public int getCityId() {
		return cityId;
	}
	public void setCityId(int cityId) {
		this.cityId = cityId;
	}
	public int getStudentStatusId() {
		return studentStatusId;
	}
	public void setStudentStatusId(int studentStatusId) {
		this.studentStatusId = studentStatusId;
	}
	public int getResultsLock() {
		return resultsLock;
	}
	public void setResultsLock(int resultsLock) {
		this.resultsLock = resultsLock;
	}
	public int getCurrentSemester() {
		return currentSemester;
	}
	public void setCurrentSemester(int currentSemester) {
		this.currentSemester = currentSemester;
	}
	public String getCreatedBy() {
		return createdBy;
	}
	public void setCreatedBy(String createdBy) {
		this.createdBy = createdBy;
	}
	public String getImagePath() {
		return imagePath;
	}
	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}
	
}
