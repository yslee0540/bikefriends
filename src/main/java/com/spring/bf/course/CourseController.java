package com.spring.bf.course;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CourseController {
	@Autowired
	CourseDAO dao;
	
	@RequestMapping("course/list")
	public void list(CourseVO vo, Model model) {
		List<CourseVO> list = dao.list(vo);
		model.addAttribute("list", list);
	}
	
	@RequestMapping("course/one")
	public void one(int course_no, Model model) {
		CourseVO vo = dao.one(course_no);
		model.addAttribute("vo", vo);
		model.addAttribute("rate", vo.getRate());
	}
	
	//update 페이지에 현재 정보 보여주기
	@RequestMapping("course/update")
	public void update(int course_no, Model model) {
		CourseVO vo = dao.one(course_no);
		model.addAttribute("vo", vo);
		model.addAttribute("rate", vo.getRate());
	}
	
	@RequestMapping("course/update2")
	public void update2(CourseVO vo) {
		dao.update(vo);
	}
	
	@RequestMapping("course/insert")
	public void insert(CourseVO vo) {
		dao.insert(vo);
	}
	
	@RequestMapping("course/delete")
	public void delete(int course_no) {
		System.out.println(course_no);
		dao.delete(course_no);
	}
	
	@RequestMapping("course/search")
	public void search(String title, Model model) {
//		vo.setStartEnd(vo.getPage());
		List<CourseVO> list = dao.search(title);
//		int count = dao.count(vo);
//		int pages = 0;
//		if (count % 20 == 0) {
//			pages = count / 20;
//		} else {
//			pages = count / 20 + 1;
//		}
		
		model.addAttribute("list", list);
//		model.addAttribute("pages", pages);
	}
	
}
