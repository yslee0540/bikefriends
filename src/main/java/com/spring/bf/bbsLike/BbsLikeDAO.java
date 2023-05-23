package com.spring.bf.bbsLike;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class BbsLikeDAO {
	
	@Autowired
	SqlSessionTemplate my;
	
	public int insert(BbsLikeVO vo) {
		int result = my.insert("bbslike.likeUp", vo);
		return result;
	}
	
	public int delete(BbsLikeVO vo) {
		int result = my.delete("bbslike.likeDown", vo);
		return result;
	}
	
	public int one(BbsLikeVO vo) {
		int count = my.selectOne("bbslike.findLike", vo);
		return count;
	}

}
