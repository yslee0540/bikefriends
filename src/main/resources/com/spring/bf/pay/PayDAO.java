package com.spring.bf.pay;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.spring.bf.pay.PayVO;
import com.spring.bf.pay.PageVO;
import com.spring.bf.pay.PayVO;





@Component
public class PayDAO { // CRUD
	@Autowired
	SqlSessionTemplate my;
	
	public int insert(PayVO bag) {
		System.out.println("------" + my);
		int result = my.insert("pay.create", bag);
		return result;
	}
	
	public List<PayVO> list() {
		List<PayVO> list = my.selectList("pay.all");
		return list;
}
	public void delete(PayVO bag) {
		int result = my.delete("pay.delete");
	}
	
	
	public PayVO createdId() {
		return my.selectOne("pay.createdId");
	}
	

	public List<PayVO> all(PageVO vo) {
		return my.selectList("pay.all", vo);
	}
	
	public List<PayVO> list2(PageVO vo) {
		return my.selectList("pay.list2", vo);
	}
	public int count() {
		return my.selectOne("pay.count");
	}                                                               
	public PayVO one(PayVO vo) {
		return my.selectOne("pay.one", vo);
	}                                                               

	public int up(PayVO vo) {
		return my.update("pay.up", vo);
	}
	public int del(PayVO vo) {
		return my.delete("pay.del", vo);
	}
	
	
	
	
	
}