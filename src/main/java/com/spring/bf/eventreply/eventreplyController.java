package com.spring.bf.eventreply;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.spring.bf.bbsReply.BbsReplyVO;
import com.spring.bf.eventreply.eventreplyVO;

@Controller // 스프링에서 제어하는 역할로 등록!
public class eventreplyController {

	@Autowired
	eventreplyDAO dao; // 전역변수(글로벌 변수)
	// 컨트롤 하는 기능(CRUD)
	// 회원가입, 수정, 탈퇴, 정보검색

//	@RequestMapping("login")
//	public String login(eventreplyVO bag) {
//		System.out.println(bag);
//		//dao를 이용해서 db처리할 예정.
//		//views아래로 넘어가게 되어있음.
//		//views아래 login.jsp를 호출하게 됨.
//		int result = dao.login(bag);//1, 0
//		if(result == 1) {
//			return "ok"; //views아래 파일이름.jsp
//		}else {
//			//views아래가 아니고, webapp아래
//			//member.jsp로 가고 싶은 경우!
//			return "redirect:member.jsp";
//		}
//	}

	// 클래스 내에서 기능처리 담당
	// 멤버변수 + 멤버메서드(기능처리 담당)
	// 하나의 요청당 하나의 메서드
	// 하나의 버튼호출당 하나의 함수 연결!
	// 요청된 주소가 어떻게 될 때
	// 바로 아래에 있는 메서드가 호출이 될지를
	// 써주어야 한다.
	@RequestMapping("eventreply/replyinsert")
	public void insert(eventreplyVO vo) {
		dao.insert(vo);
	}

	
	@RequestMapping("eventreply/replyupdate")
	public void update(eventreplyVO bag) {
		System.out.println("update요청됨.");
		System.out.println(bag);
		dao.update(bag);
	}
	
	@RequestMapping("eventreply/replydelete")
	public void delete(String event_id) {
		System.out.println("delete요청됨.");
		System.out.println(event_id);
		dao.delete(event_id);
	}

//	@RequestMapping("one")
//	public void one(String id, Model model) {
//		System.out.println("one요청됨.");
//		System.out.println(id);
////		eventreplyVO bag = dao.one(id);
//		//bag에 검색결과 다 들어있음.
//		//views아래 one.jsp로 쓸 수 있도록 설정해주어야 함.
//		model.addAttribute("bag", bag);
//		//views까지 전달할 속성으로 추가해주세요. 
//	}
//	

	@RequestMapping("eventreply/replylist")
	public void list(Model model) {
		List<eventreplyVO> list = dao.list();
		model.addAttribute("list", list);
	}
	


	@RequestMapping("eventreply/replyone")
	public void one(String event_id, Model model) {
		System.out.println("id="+event_id);
		eventreplyVO vo = dao.one(event_id);
		model.addAttribute("vo", vo);
	}

	// https://search.naver.com/search.naver?where=nexearch&sm=top_hty&fbm=1&ie=utf8&query=%EC%9E%90%EB%8F%99%EC%B0%A8

}