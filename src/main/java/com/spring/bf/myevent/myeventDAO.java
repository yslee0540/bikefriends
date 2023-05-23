package com.spring.bf.myevent;

import org.mybatis.spring.SqlSessionTemplate;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;


@Component
public class myeventDAO { 
	
	@Autowired
	SqlSessionTemplate my;
	
	public void insert(myeventVO bag) {
		my.insert("myevent.create", bag);
	}
	
	public void delete (String id) {
		my.delete("myevent.del", id);
	}
	
	public void update (myeventVO bag) {
		my.update("myevent.up", bag);
	}
	
	public myeventVO one (String id) {
		myeventVO vo=my.selectOne("myevent.one", id);
		return vo;
	}
	
	public List <myeventVO> list(){
		List<myeventVO> list=my.selectList("myevent.all");
		return list;
	}

	
}