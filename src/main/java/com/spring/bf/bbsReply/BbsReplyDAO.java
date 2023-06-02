package com.spring.bf.bbsReply;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class BbsReplyDAO {
	
	@Autowired
	SqlSessionTemplate my;
	
	public int insert(BbsReplyVO vo) {
		int result = my.insert("bbsreply.create", vo);
		return result;
	}
	
	public int delete(int reply_no) {
		int result = my.delete("bbsreply.delete", reply_no);
		return result;
	}
	
	public int update(BbsReplyVO vo) {
		int result = my.update("bbsreply.update", vo);
		return result;
	}
	
	public List<BbsReplyVO> list(int bbs_no) {
		List<BbsReplyVO> list = my.selectList("bbsreply.all", bbs_no);
		return list;
	}
	
	public BbsReplyVO one(int reply_no) {
		BbsReplyVO vo = my.selectOne("bbsreply.one", reply_no);
		return vo;
	}

}
