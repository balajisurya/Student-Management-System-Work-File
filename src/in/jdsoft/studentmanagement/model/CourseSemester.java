package in.jdsoft.studentmanagement.model;

public class CourseSemester {

	public int courseSemesterId;
	public int courseId;
	public int courseSemester;
	public int lockStatus;
	
	
	public void setCourseId(int courseId) {
		this.courseId = courseId;
	}
	
	public int getCourseId() {
		return courseId;
	}
	
	public void setCourseSemester(int courseSemester) {
		this.courseSemester = courseSemester;
	}
	
	public int getCourseSemester() {
		return courseSemester;
	}
	
	public void setCourseSemesterId(int courseSemesterId) {
		this.courseSemesterId = courseSemesterId;
	}
	
	public int getCourseSemesterId() {
		return courseSemesterId;
	}

	public int getLockStatus() {
		return lockStatus;
	}

	public void setLockStatus(int lockStatus) {
		this.lockStatus = lockStatus;
	}

	
}
