package com.spring.bf.course;

import java.sql.Timestamp;

import org.springframework.format.annotation.DateTimeFormat;

public class CourseVO {

	private int course_no;
	private String start_location;
	private double start_lat;
	private double start_lng;
	private String end_location;
	private double end_lat;
	private double end_lng;
	private int rate;
	private String content;
	private String title;
	private String writer;
	private String line_lat;
	private String line_lng;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Timestamp date;

	public String getLine_lat() {
		return line_lat;
	}

	public void setLine_lat(String line_lat) {
		this.line_lat = line_lat;
	}

	public String getLine_lng() {
		return line_lng;
	}

	public void setLine_lng(String line_lng) {
		this.line_lng = line_lng;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public Timestamp getDate() {
		return date;
	}

	public void setDate(Timestamp date) {
		this.date = date;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getCourse_no() {
		return course_no;
	}

	public void setCourse_no(int course_no) {
		this.course_no = course_no;
	}

	public String getStart_location() {
		return start_location;
	}

	public void setStart_location(String start_location) {
		this.start_location = start_location;
	}

	public double getStart_lat() {
		return start_lat;
	}

	public void setStart_lat(double start_lat) {
		this.start_lat = start_lat;
	}

	public double getStart_lng() {
		return start_lng;
	}

	public void setStart_lng(double start_lng) {
		this.start_lng = start_lng;
	}

	public String getEnd_location() {
		return end_location;
	}

	public void setEnd_location(String end_location) {
		this.end_location = end_location;
	}

	public double getEnd_lat() {
		return end_lat;
	}

	public void setEnd_lat(double end_lat) {
		this.end_lat = end_lat;
	}

	public double getEnd_lng() {
		return end_lng;
	}

	public void setEnd_lng(double end_lng) {
		this.end_lng = end_lng;
	}

	public int getRate() {
		return rate;
	}

	public void setRate(int rate) {
		this.rate = rate;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Override
	public String toString() {
		return "BbsVO [course_no=" + course_no + ", start_location=" + start_location + ", start_lat=" + start_lat
				+ ", start_lng=" + start_lng + ", end_location=" + end_location + ", end_lat=" + end_lat + ", end_lng="
				+ end_lng + ", rate=" + rate + ", content=" + content + "]";
	}

}
