package com.spring.bf.event;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;


@Component
public class eventDAO { 
	
	@Autowired
	SqlSessionTemplate my;
	
	public void insert(eventVO bag) {
		my.insert("event.create", bag);
	}
	
	public void delete (String id) {
		my.delete("event.del", id);
	}
	
	public void update (eventVO bag) {
		my.update("event.up", bag);
	}
	
	public eventVO one (String id) {
		eventVO vo=my.selectOne("event.one", id);
		return vo;
	}
	
	public List <eventVO> list(){
		List<eventVO> list=my.selectList("event.all");
		return list;
	}
}