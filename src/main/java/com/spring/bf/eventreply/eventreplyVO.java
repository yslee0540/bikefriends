package com.spring.bf.eventreply;

import java.sql.Timestamp;

import org.springframework.format.annotation.DateTimeFormat;

public class eventreplyVO {
	private int reply_no;
	private int bbs_no;
	private String writer;
	private String content;
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Timestamp date;
	public int getReply_no() {
		return reply_no;
	}
	public void setReply_no(int reply_no) {
		this.reply_no = reply_no;
	}
	public int getBbs_no() {
		return bbs_no;
	}
	public void setBbs_no(int bbs_no) {
		this.bbs_no = bbs_no;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Timestamp getDate() {
		return date;
	}
	public void setDate(Timestamp date) {
		this.date = date;
	}
	@Override
	public String toString() {
		return "eventreplyVO [reply_no=" + reply_no + ", bbs_no=" + bbs_no + ", writer=" + writer + ", content="
				+ content + ", date=" + date + "]";
	}
	
}
