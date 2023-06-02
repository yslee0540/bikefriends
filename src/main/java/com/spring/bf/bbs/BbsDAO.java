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
	
	public String groupone(int no) {
		BbsVO vo = my.selectOne("bbs.groupone", no);
		return vo.getGroup_name();
	}
	
	public List<BbsVO> search(BbsVO vo) {
		List<BbsVO> list = my.selectList("bbs.search", vo);
		return list;
	}
	
	//조회수
	public int hit(int bbs_no) {
		int result = my.update("bbs.hit", bbs_no);
		return result;
	}
	
	public List<BbsVO> bestList(BbsVO vo) {
		List<BbsVO> list = my.selectList("bbs.bestList", vo);
		return list;
	}
	
	public List<BbsVO> best() {
		List<BbsVO> list = my.selectList("bbs.best");
		return list;
	}
	
	public List<BbsVO> recent() {
		List<BbsVO> list = my.selectList("bbs.recent");
		return list;
	}
	
	//게시판 페이징
	public int count(int group_no) {
		return my.selectOne("bbs.count", group_no);
	}
	
	//검색 페이징
	public int searchCount(BbsVO vo) {
		return my.selectOne("bbs.searchCount", vo);
	}
	
	//인기게시판 페이징
	public int bestCount(int group_no) {
		return my.selectOne("bbs.bestCount", group_no);
	}

}
