package com.spring.bf.event;


import java.sql.Date;

import org.springframework.format.annotation.DateTimeFormat;

import javafx.util.converter.DateStringConverter;

public class eventVO {
		private int no;
		private String event_id;
		private String event_location;
		
		private Date event_date;
		private String event_img;
		private int event_size;
		
	
		public String getEvent_id() {
			return event_id;
		}
		public void setEvent_id(String event_id) {
			this.event_id = event_id;
		}
		public String getEvent_location() {
			return event_location;
		}
		public void setEvent_location(String event_location) {
			this.event_location = event_location;
		}
		public Date getEvent_date() {
			return event_date;
		}
		public void setEvent_date(Date event_date) {
			this.event_date = event_date;
		}
		public String getEvent_img() {
			return event_img;
		}
		public void setEvent_img(String event_img) {
			this.event_img = event_img;
		}
		public int getEvent_size() {
			return event_size;
		}
		public void setEvent_size(int event_size) {
			this.event_size = event_size;
		}
		
		public int getNo() {
			return no;
		}
		public void setNo(int no) {
			this.no = no;
		}
		@Override
		public String toString() {
			return "eventVO [no=" + no + ", event_id=" + event_id + ", event_location=" + event_location
					+ ", event_date=" + event_date + ", event_img=" + event_img + ", event_size=" + event_size + "]";
		}
		
		
		
}
