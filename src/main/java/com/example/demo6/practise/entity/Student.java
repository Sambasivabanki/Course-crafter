package com.example.demo6.practise.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;

@Entity
public class Student 
{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	private String studentName;
	private String email;
	private String phone;
	@ManyToOne
    @JoinColumn(name = "course_id")
	private Courses courses;
	private boolean feepaid=false;
	public Student() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Student(Long id, String studentName, String email, String phone, Courses courses, boolean feepaid) {
		super();
		this.id = id;
		this.studentName = studentName;
		this.email = email;
		this.phone = phone;
		this.courses = courses;
		this.feepaid = feepaid;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getStudentName() {
		return studentName;
	}
	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public Courses getCourses() {
		return courses;
	}
	public void setCourses(Courses courses) {
		this.courses = courses;
	}
	public boolean getFeepaid() {
		return feepaid;
	}
	public void setFeepaid(boolean feepaid) {
		this.feepaid = feepaid;
	}
	@Override
	public String toString() {
		return "Student [id=" + id + ", studentName=" + studentName + ", email=" + email + ", phone=" + phone
				+ ", courses=" + courses + ", feepaid=" + feepaid + "]";
	}
	
	
}
