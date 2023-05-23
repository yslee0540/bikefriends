package com.spring.bf.bbs;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class BbsDAO {
	
	@Autowired
	SqlSessionTemplate my;
	
	public int insert(BbsVO bag) {
		int result = my.insert("bbs.create", bag);
		return result;
	}
	
	public int delete(int bbs_no) {
		int result = my.delete("bbs.delete", bbs_no);
		return result;
	}
	
	public int update(BbsVO vo) {
		int result = my.update("bbs.update", vo);
		return result;
	}
	
	public BbsVO one(int no) {
		BbsVO vo = my.selectOne("bbs.one", no);
		return vo;
	}
	
	public List<BbsVO> list(BbsVO vo) {
		List<BbsVO> list = my.selectList("bbs.list", vo);
		return list;
	}
	
	public List<BbsVO> search(BbsVO vo) {
		List<BbsVO> list = my.selectList("bbs.search", vo);
		return list;
	}
	
	//조회수
	public int update(int bbs_no) {
		int result = my.update("bbs.hit", bbs_no);
		return result;
	}
	
	public List<BbsVO> best(BbsVO vo) {
		List<BbsVO> list = my.selectList("bbs.best2", vo);
		return list;
	}
	
	public List<BbsVO> best() {
		List<BbsVO> list = my.selectList("bbs.best");
		return list;
	}
	
	//게시판 페이징
	public int count(int group_no) {
		return my.selectOne("bbs.count", group_no);
	}
	
	//검색 페이징
	public int count(BbsVO vo) {
		return my.selectOne("bbs.count2", vo);
	}
	
	//인기게시판 페이징
	public int count2(int group_no) {
		return my.selectOne("bbs.count3", group_no);
	}

}
