package com.spring.bf.pay;

public class PayVO {
	private int pay_no;
	private String id;
	private String money;
	private String name;
	private String tel;
	private String email;
	
	public int getPay_no() {
		return pay_no;
	}
	public void setPay_no(int pay_no) {
		this.pay_no = pay_no;
	}
	public String getId() {
		return id;
	}
	
	public void setId(String id) {
		this.id = id;
	}
	public String getMoney() {
		return money;
	}
	public void setMoney(String money) {
		this.money = money;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	
	@Override
	public String toString() {
		return "PayVO [pay_no=" + pay_no + ", id=" + id + ", money=" + money + ", name=" + name + ", tel=" + tel
				+ ", email=" + email + "]";
	}
	
}
