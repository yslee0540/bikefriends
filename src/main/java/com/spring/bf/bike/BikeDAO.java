package com.spring.bf.bike;

import java.util.List;

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
	
}
