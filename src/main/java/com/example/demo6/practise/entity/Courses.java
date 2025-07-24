package com.example.demo6.practise.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class Courses 
{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long courseId;
	private String courseName;
	private double price;
	private String startDate;
	private String description;
	@Column(name = "image_name")
	private String imageName;
	public Courses() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Courses(Long courseId, String courseName, String description, String startDate, double price, String imageName) {
	    this.courseId = courseId;
	    this.courseName = courseName;
	    this.description = description;
	    this.startDate = startDate;
	    this.price = price;
	    this.imageName = imageName;
	}

	public Long getCourseId() {
		return courseId;
	}
	public void setCourseId(Long courseId) {
		this.courseId = courseId;
	}
	public String getCourseName() {
		return courseName;
	}
	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getImageName() {
		return imageName;
	}
	public void setImageName(String imageName) {
		this.imageName = imageName;
	}
	@Override
	public String toString() {
		return "Courses [courseId=" + courseId + ", courseName=" + courseName + ", price=" + price + ", startDate="
				+ startDate + ", description=" + description + ", imageName=" + imageName + "]";
	}
	
}
