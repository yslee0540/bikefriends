package com.spring.bf.group;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class GroupDAO {
	
	@Autowired
	SqlSessionTemplate my;
	
	public List<GroupVO> list() {
		List<GroupVO> list = my.selectList("group.all");
		return list;
	}
	
	public GroupVO one(int no) {
		GroupVO vo = my.selectOne("group.one", no);
		return vo;
	}
	
	public String book(String id) {
		String address = my.selectOne("group.book", id);
		return address;
	}
	
	//그룹이름, 주소 비교
	public GroupVO one(String name) {
		GroupVO vo = my.selectOne("group.one2", name);
		return vo;
	}

}
