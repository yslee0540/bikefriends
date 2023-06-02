package com.spring.bf.bike;

import java.util.List;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;


@Component
public class BikeDAO {

	@Autowired
	SqlSessionTemplate my;

	public List<BikeVO> list() {
		List<BikeVO> list = my.selectList("bike.all2");
		return list;
	}

	public List<BikeVO> all(PageVO vo) {
		return my.selectList("bike.all2", vo);

	}

	public int count() {
		return my.selectOne("bike.count");
	}
	
	public BikeVO one(int bike_no) {
		BikeVO bag = my.selectOne("bike.one",bike_no);
		return bag;
	}
	
	public List<BikeVO> searchbrand(SearchVO vo) {
		return my.selectList("bike.searchbrand" ,vo);
	}
	public List<BikeVO> searchcaegory(SearchVO vo) {
		return my.selectList("bike.searchcaegory" ,vo);
	}
	
	public int countbrand(String keyword) {
		return my.selectOne("bike.countbrand",keyword);
	}
	public int countcategory(String keyword) {
		return my.selectOne("bike.countcategory",keyword);
	}
	
}
