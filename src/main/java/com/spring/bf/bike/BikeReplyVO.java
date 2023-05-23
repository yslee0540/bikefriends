package com.spring.bf.bike;

import java.sql.Timestamp;
import org.springframework.format.annotation.DateTimeFormat;

public class BikeReplyVO {
	
	private int bikereply_no;
	private int bike_no;
	private String bikereply_writer;
	private String bikereply_content;
	private String bikereply_rating;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Timestamp date;

	public int getBikereply_no() {
		return bikereply_no;
	}

	public void setBikereply_no(int bikereply_no) {
		this.bikereply_no = bikereply_no;
	}

	public int getBike_no() {
		return bike_no;
	}

	public void setBike_no(int bike_no) {
		this.bike_no = bike_no;
	}

	

	public String getBikereply_writer() {
		return bikereply_writer;
	}

	public void setBikereply_writer(String bikereply_writer) {
		this.bikereply_writer = bikereply_writer;
	}

	public String getBikereply_content() {
		return bikereply_content;
	}

	public void setBikereply_content(String bikereply_content) {
		this.bikereply_content = bikereply_content;
	}

	public String getBikereply_rating() {
		return bikereply_rating;
	}

	public void setBikereply_rating(String bikereply_rating) {
		this.bikereply_rating = bikereply_rating;
	}

	public Timestamp getDate() {
		return date;
	}

	public void setDate(Timestamp date) {
		this.date = date;
	}

	@Override
	public String toString() {
		return "BikeReplyVO [bikereply_no=" + bikereply_no + ", bike_no=" + bike_no + ", bikereply_writer="
				+ bikereply_writer + ", bikereply_content=" + bikereply_content + ", bikereply_rating="
				+ bikereply_rating + ", date=" + date + "]";
	}



	
	
	
	
	
}
