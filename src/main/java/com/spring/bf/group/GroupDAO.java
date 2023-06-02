package com.spring.bf.group;

import java.util.List;
import java.util.Map;

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
	
	public String book(String id) {
		String address = my.selectOne("group.book", id);
		return address;
	}
	
	//그룹이름, 주소 비교
	public GroupVO one(String name) {
		GroupVO vo = my.selectOne("group.one", name);
		return vo;
	}

	public List<Map<String, Object>> auto(Map<String, Object> paramMap) {
		List<Map<String, Object>> list = my.selectList("group.auto", paramMap);
		return list;
	}
	
}
