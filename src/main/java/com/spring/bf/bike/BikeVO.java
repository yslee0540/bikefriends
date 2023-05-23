package com.spring.bf.bike;

public class BikeVO {
	private int bike_no;
	private String bike_brand;
	private String bike_name;
	private String bike_category;
	private String bike_img;
	private String bike_detail;
	public int getBike_no() {
		return bike_no;
	}
	public void setBike_no(int bike_no) {
		this.bike_no = bike_no;
	}
	public String getBike_brand() {
		return bike_brand;
	}
	public void setBike_brand(String bike_brand) {
		this.bike_brand = bike_brand;
	}
	public String getBike_name() {
		return bike_name;
	}
	public void setBike_name(String bike_name) {
		this.bike_name = bike_name;
	}
	public String getBike_category() {
		return bike_category;
	}
	public void setBike_category(String bike_category) {
		this.bike_category = bike_category;
	}
	public String getBike_img() {
		return bike_img;
	}
	public void setBike_img(String bike_img) {
		this.bike_img = bike_img;
	}
	public String getBike_detail() {
		return bike_detail;
	}
	public void setBike_detail(String bike_detail) {
		this.bike_detail = bike_detail;
	}
	@Override
	public String toString() {
		return "BikeVO [bike_no=" + bike_no + ", bike_brand=" + bike_brand + ", bike_name=" + bike_name
				+ ", bike_category=" + bike_category + ", bike_img=" + bike_img + ", bike_detail=" + bike_detail + "]";
	}
	
	
	
	
	
	
	
	
	
	
}
