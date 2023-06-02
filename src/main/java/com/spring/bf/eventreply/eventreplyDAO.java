package com.spring.bf.eventreply;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;


@Component
public class eventreplyDAO { 
	
	@Autowired
	SqlSessionTemplate my;
	
	public void insert(eventreplyVO bag) {
		my.insert("eventreply.create", bag);
	}
	
	public void delete (String id) {
		my.delete("eventreply.del", id);
	}
	
	public void update (eventreplyVO bag) {
		my.update("eventreply.up", bag);
	}
	
	public eventreplyVO one (String id) {
		eventreplyVO vo=my.selectOne("eventreply.one", id);
		return vo;
	}
	
	public List <eventreplyVO> list(){
		List<eventreplyVO> list=my.selectList("eventreply.all");
		return list;
	}
}