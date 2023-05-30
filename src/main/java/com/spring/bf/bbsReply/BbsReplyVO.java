package com.spring.bf.bbsReply;

import java.sql.Timestamp;

import org.springframework.format.annotation.DateTimeFormat;

public class BbsReplyVO {

	private int reply_no;
	private int bbs_no;
	private String writer;
	private String Sign_name;
	private String content;

	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Timestamp date;

	public String getSign_name() {
		return Sign_name;
	}

	public void setSign_name(String sign_name) {
		Sign_name = sign_name;
	}

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

	public Timestamp getDate() {
		return date;
	}

	public void setDate(Timestamp date) {
		this.date = date;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Override
	public String toString() {
		return "BbsReplyVO [reply_no=" + reply_no + ", bbs_no=" + bbs_no + ", writer=" + writer + ", date=" + date
				+ ", content=" + content + "]";
	}

}
