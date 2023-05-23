package com.spring.bf.bike;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;


@Component
public class BikeReplyDAO {

	@Autowired
	SqlSessionTemplate my;

	public int insert(BikeReplyVO bag) {
		int result=my.insert("bikereply.insert",bag);
		return result;
		
	}
	
	public List<BikeReplyVO> list(int bike_no) {
		List<BikeReplyVO> list= my.selectList("bikereply.all",bike_no);
		System.out.println(list.size());
		return list;
	}
	
	public int delete(int bikereply_no) {
		int result = my.delete("bikereply.delete", bikereply_no);
		return result;
	}
	
	public int update(BikeReplyVO vo) {
		int result = my.update("bikereply.update" , vo);
		return result;
	}
	
	public BikeReplyVO one(int bikereply_no) {
		BikeReplyVO	vo = my.selectOne("bikereply.one", bikereply_no);
		return vo;
	}
	
}
