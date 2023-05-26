package com.spring.bf.bbsReply;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BbsReplyController {
	@Autowired
	BbsReplyDAO dao;
	
	@RequestMapping("bbs/replyinsert")
	public void insert(BbsReplyVO vo) {
		dao.insert(vo);
	}
	
	@RequestMapping("bbs/replydelete")
	public void delete(int reply_no) {
		System.out.println(reply_no);
		dao.delete(reply_no);
	}
	
	@RequestMapping("bbs/replyupdate")
	public void updateView(int reply_no, Model model) {
		BbsReplyVO vo = dao.one(reply_no);
		model.addAttribute("vo", vo);
	}
	
	@RequestMapping("bbs/replyupdate2")
	public String update(BbsReplyVO vo) {
		dao.update(vo);
		return "redirect:one?bbs_no=" + vo.getBbs_no();
	}
	
	@RequestMapping("bbs/replylist")
	public void list(int bbs_no, Model model) {
		List<BbsReplyVO> list = dao.list(bbs_no);
		model.addAttribute("list", list);
	}
	
}
