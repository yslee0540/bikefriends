package com.spring.bf.group;

public class GroupVO {

	private int group_no;
	private String group_name;
	private String group_img;

	public int getGroup_no() {
		return group_no;
	}

	public void setGroup_no(int group_no) {
		this.group_no = group_no;
	}

	public String getGroup_name() {
		return group_name;
	}

	public void setGroup_name(String group_name) {
		this.group_name = group_name;
	}

	public String getGroup_img() {
		return group_img;
	}

	public void setGroup_img(String group_img) {
		this.group_img = group_img;
	}

	@Override
	public String toString() {
		return "GroupVO [group_no=" + group_no + ", group_name=" + group_name + ", group_img=" + group_img + "]";
	}

}
