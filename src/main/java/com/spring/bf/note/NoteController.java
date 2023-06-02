package com.spring.bf.note;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class NoteController {
	@Autowired
	NoteDAO dao;

	@RequestMapping("note/insert")
	public String insert(NoteVO bag, HttpSession session) {
		System.out.println(bag);
		dao.insert(bag);
		
		String receiver = (String) session.getAttribute("id");
	    return "redirect:receive_notelist?receiver=" + receiver;
	}

	@RequestMapping("note/delete")
	public void delete(int no) {
		System.out.println(no);
		dao.delete(no);
	}
	
	@RequestMapping("note/send_note")
	public void one(int no, Model model) {
		//NO?? ==> 하나만 조회! 
		//
		System.out.println(no);
		NoteVO vo = dao.one(no);
		System.out.println(vo);
		model.addAttribute("bag", vo);
	}
	@RequestMapping("note/receive_note")
	public void one2(int no, Model model) {
		System.out.println(no);
		NoteVO vo = dao.one(no);
		System.out.println(vo);
		model.addAttribute("bag", vo);
	}
	@RequestMapping("note/send_notelist")
	public void send(NoteVO vo, Model model) {
		List<NoteVO> list = dao.send(vo);
		model.addAttribute("list", list);
	}
	
	@RequestMapping("note/receive_notelist")
	public void receive(NoteVO vo, Model model) {
		List<NoteVO> list = dao.receive(vo); 
		//{bag1, bag2}
		//bag의 LIST
		//1, apple, banana, hi ==> vo(bag1)
		//쪽지하나당 하나의 가방이 필요하다(배열)
		//2, apple, melon, hello ==> vo(bag2)
		model.addAttribute("list", list);
		//"list" 부분은 ArrayList 선언 역할
	}
	
	
}
