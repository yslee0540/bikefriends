package com.spring.bf.location;

public class locationVO {
	private String location_id;
	private String location_district;
	private String location_addr;
	private String location_name;
	public String getLocation_id() {
		return location_id;
	}
	public void setLocation_id(String location_id) {
		this.location_id = location_id;
	}
	public String getLocation_district() {
		return location_district;
	}
	public void setLocation_district(String location_district) {
		this.location_district = location_district;
	}
	public String getLocation_addr() {
		return location_addr;
	}
	public void setLocation_addr(String location_addr) {
		this.location_addr = location_addr;
	}
	public String getLocation_name() {
		return location_name;
	}
	public void setLocation_name(String location_name) {
		this.location_name = location_name;
	}
	@Override
	public String toString() {
		return "locationVO [location_id=" + location_id + ", location_district=" + location_district
				+ ", location_addr=" + location_addr + ", location_name=" + location_name + "]";
	}
	
		
}
