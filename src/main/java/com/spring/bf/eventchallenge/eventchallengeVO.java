package com.spring.bf.eventchallenge;

import java.sql.Timestamp;

import org.springframework.format.annotation.DateTimeFormat;

public class eventchallengeVO {
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Timestamp date;
	private int no;
	private String content;
	private String writer;
	private String img;
	private int hit;
	public Timestamp getDate() {
		return date;
	}
	public void setDate(Timestamp date) {
		this.date = date;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	@Override
	public String toString() {
		return "eventchallengeVO [date=" + date + ", no=" + no + ", content=" + content + ", writer=" + writer
				+ ", img=" + img + ", hit=" + hit + "]";
	}
	
}
