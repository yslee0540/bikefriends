package com.spring.bf.member;

public class MemberVO {
	String Sign_id;
	String Sign_pw;
	String Sign_name;
	String Sign_gender;
	String Sign_birthday;
	String Sign_email;
	int Sign_age;
	String Sign_img;
	String Sign_bio;
	String Sign_address;
	String Sign_phone;
	public String getSign_id() {
		return Sign_id;
	}
	public void setSign_id(String sign_id) {
		Sign_id = sign_id;
	}
	public String getSign_pw() {
		return Sign_pw;
	}
	public void setSign_pw(String sign_pw) {
		Sign_pw = sign_pw;
	}
	public String getSign_name() {
		return Sign_name;
	}
	public void setSign_name(String sign_name) {
		Sign_name = sign_name;
	}
	public String getSign_gender() {
		return Sign_gender;
	}
	public void setSign_gender(String sign_gender) {
		Sign_gender = sign_gender;
	}
	public String getSign_birthday() {
		return Sign_birthday;
	}
	public void setSign_birthday(String sign_birthday) {
		Sign_birthday = sign_birthday;
	}
	public String getSign_email() {
		return Sign_email;
	}
	public void setSign_email(String sign_email) {
		Sign_email = sign_email;
	}
	public int getSign_age() {
		return Sign_age;
	}
	public void setSign_age(int age) {
		Sign_age = age;
	}
	public String getSign_img() {
		return Sign_img;
	}
	public void setSign_img(String sign_img) {
		Sign_img = sign_img;
	}
	public String getSign_bio() {
		return Sign_bio;
	}
	public void setSign_bio(String sign_bio) {
		Sign_bio = sign_bio;
	}
	public String getSign_address() {
		return Sign_address;
	}
	public void setSign_address(String sign_address) {
		Sign_address = sign_address;
	}
	public String getSign_phone() {
		return Sign_phone;
	}
	public void setSign_phone(String sign_phone) {
		Sign_phone = sign_phone;
	}
	@Override
	public String toString() {
		return "memberVO [Sign_id=" + Sign_id + ", Sign_pw=" + Sign_pw + ", Sign_name=" + Sign_name + ", Sign_gender="
				+ Sign_gender + ", Sign_birthday=" + Sign_birthday + ", Sign_email=" + Sign_email + ", Sign_age="
				+ Sign_age + ", Sign_img=" + Sign_img + ", Sign_bio=" + Sign_bio + ", Sign_address=" + Sign_address
				+ ", Sign_phone=" + Sign_phone + "]";
	}

	
	
}
