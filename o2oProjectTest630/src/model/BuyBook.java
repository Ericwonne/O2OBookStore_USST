package model;

import java.io.Serializable;

public class BuyBook implements Serializable {
	private int id;
	private String isbn;
	private String name;
	private int version;
	private String publish;	
	private String author;
	private float expect_age;
	private String course_name;
	private String grade;
	private String school;
	private String major;
	private float expect_discount;
	private String tag;
	private String release_time;
	private int glances;
	private String describe;
	private String userName;
	private String st_num;
	private int userId;
	private int user_id;
	private String if_course;
	private int status;
	private String type;
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getIsbn() {
		return isbn;
	}
	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getVersion() {
		return version;
	}
	public void setVersion(int version) {
		this.version = version;
	}
	public String getPublish() {
		return publish;
	}
	public void setPublish(String publish) {
		this.publish = publish;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public float getExpect_age() {
		return expect_age;
	}
	public void setExpect_age(float expect_age) {
		this.expect_age = expect_age;
	}
	public String getIf_course() {
		return if_course;
	}
	public void setIf_course(String if_course) {
		this.if_course = if_course;
	}
	public String getCourse_name() {
		return course_name;
	}
	public void setCourse_name(String course_name) {
		this.course_name = course_name;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public String getSchool() {
		return school;
	}
	public void setSchool(String school) {
		this.school = school;
	}
	public String getMajor() {
		return major;
	}
	public void setMajor(String major) {
		this.major = major;
	}
	public float getExpect_discount() {
		return expect_discount;
	}
	public void setExpect_discount(float expect_discount) {
		this.expect_discount = expect_discount;
	}
	public String getTag() {
		return tag;
	}
	public void setTag(String tag) {
		this.tag = tag;
	}
	public String getRelease_time() {
		return release_time;
	}
	public void setRelease_time(String release_time) {
		this.release_time = release_time;
	}
	public int getGlances() {
		return glances;
	}
	public void setGlances(int glances) {
		this.glances = glances;
	}
	public String getDescribe() {
		return describe;
	}
	public void setDescribe(String describe) {
		this.describe = describe;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getSt_num() {
		return st_num;
	}
	public void setSt_num(String st_num) {
		this.st_num = st_num;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	
	
}
