package com.spring.bf.group;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class GroupController {
	@Autowired
	GroupDAO dao;

	@RequestMapping("bbs/grouplist")
	public void list(Model model) {
		List<GroupVO> list = dao.list();
		model.addAttribute("list", list);
	}

	// 내 지역 게시판
	@RequestMapping("bbs/book")
	public void book(String id, Model model) {
		//회원정보에서 주소 가져오기
		String name = dao.book(id);
		// 그룹 정보 가져오기
		GroupVO vo = dao.one(name);
		model.addAttribute("vo", vo);
	}
	
	@RequestMapping(value = "bbs/autocomplete")
	@ResponseBody
	public Map<String, Object> auto(@RequestParam Map<String, Object> paramMap) throws Exception{
		List<Map<String, Object>> resultList = dao.auto(paramMap);
		paramMap.put("resultList", resultList);

		return paramMap;
	}

}
