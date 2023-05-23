package com.spring.bf.member;

public class naverVO {
	String id;
	String nickname;
	String name;
	String email;
	String gender;
	String age;
	String birthday;
	String birthyear;
	String profile_image;
	String mobile;
	

	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public String getProfile_image() {
		return profile_image;
	}
	public void setProfile_image(String profile_image) {
		this.profile_image = profile_image;
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getBirthyear() {
		return birthyear;
	}
	public void setBirthyear(String birthyear) {
		this.birthyear = birthyear;
	}
	@Override
	public String toString() {
		return "naverVO [id=" + id + ", nickname=" + nickname + ", name=" + name + ", email=" + email + ", gender="
				+ gender + ", age=" + age + ", birthday=" + birthday + ", birthyear=" + birthyear + ", profile_image="
				+ profile_image + ", mobile=" + mobile + "]";
	}
	
}
