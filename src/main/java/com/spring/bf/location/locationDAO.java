package com.spring.bf.location;

import org.mybatis.spring.SqlSessionTemplate;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;


@Component
public class locationDAO { 
	
	@Autowired
	SqlSessionTemplate my;
	
	public void insert(locationVO bag) {
		my.insert("location.create", bag);
	}
	
	public void delete (String id) {
		my.delete("location.del", id);
	}
	
	public void update (locationVO bag) {
		my.update("location.up", bag);
	}
	
	public locationVO one (String id) {
		locationVO vo=my.selectOne("location.one", id);
		return vo;
	}
	
	public List <locationVO> list(){
		List<locationVO> list=my.selectList("location.all");
		return list;
	}
}