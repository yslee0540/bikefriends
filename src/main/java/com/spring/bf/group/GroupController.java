package com.spring.bf.group;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class GroupController {
	@Autowired
	GroupDAO dao;
	
	@RequestMapping("bbs/grouplist")
	public void list(Model model) {
		List<GroupVO> list = dao.list();
		model.addAttribute("list", list);
	}

	//각 게시판 즐겨찾기
	@RequestMapping("bbs/book")
	public void book(String id, Model model) {
		String name = dao.book(id);
		name = name.substring(name.length()-3, name.length());
		GroupVO vo = dao.one(name);
		model.addAttribute("group", vo);
	}
	
}
