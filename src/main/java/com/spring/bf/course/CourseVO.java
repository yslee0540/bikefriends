package com.spring.bf.course;

import java.sql.Timestamp;

import org.springframework.format.annotation.DateTimeFormat;

public class CourseVO {

	private int course_no;
	private int rate;
	private String content;
	private String title;
	private String writer;
	private String line_lat;
	private String line_lng;
	private String Sign_name;
	private int start;
	private int end;
	private int page;

	// 검색
	private String type;
	private String keyword;

	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Timestamp date;

	public void setStartEnd(int page) {
		start = 1 + (page - 1) * 20;
		end = page * 20;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getSign_name() {
		return Sign_name;
	}

	public void setSign_name(String sign_name) {
		Sign_name = sign_name;
	}

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
		return "CourseVO [course_no=" + course_no + ", rate=" + rate + ", content=" + content + ", title=" + title
				+ ", writer=" + writer + ", line_lat=" + line_lat + ", line_lng=" + line_lng + ", Sign_name="
				+ Sign_name + ", start=" + start + ", end=" + end + ", page=" + page + ", type=" + type + ", keyword="
				+ keyword + ", date=" + date + "]";
	}

}
