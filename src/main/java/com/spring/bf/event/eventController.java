package com.spring.bf.event;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

@Controller // 스프링에서 제어하는 역할로 등록!
public class eventController {

	@Autowired
	eventDAO dao; // 전역변수(글로벌 변수)
	// 컨트롤 하는 기능(CRUD)
	// 회원가입, 수정, 탈퇴, 정보검색

//	@RequestMapping("login")
//	public String login(eventVO bag) {
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
	@RequestMapping("event/insert")
	public void insert(eventVO eventVO, HttpServletRequest request, MultipartFile file, Model model) throws Exception {
		String savedName = file.getOriginalFilename();
		String uploadPath = request.getSession().getServletContext().getRealPath("resources/upload");
		File target = new File(uploadPath + "/" + savedName);
		System.out.println(target);
		
		file.transferTo(target);

		model.addAttribute("savedName", savedName);
		System.out.println("img넣기 전>> " + eventVO);
		eventVO.setEvent_img(savedName);
		System.out.println("img넣은 후>> " + eventVO);

		// 선언해두면, 컨트롤러내의 메서드내에서는
		// 1)bag을 만들어서
		// 2)클라이언트로 부터 전달된 데이터도 받아줌.
		// 3)bag에 데이터 다 넣어줌.
		System.out.println("insert요청됨.");
		System.out.println(eventVO);
		System.out.println(dao);
		// eventDAO dao = new eventDAO();
		// dao에게 insert요청!!
		dao.insert(eventVO);
	}

	
	@RequestMapping("event/update")
	public void update(eventVO bag) {
		System.out.println("update요청됨.");
		System.out.println(bag);
		dao.update(bag);
	}
	
	@RequestMapping("event/delete")
	public void delete(String event_id) {
		System.out.println("delete요청됨.");
		System.out.println(event_id);
		dao.delete(event_id);
	}

//	@RequestMapping("one")
//	public void one(String id, Model model) {
//		System.out.println("one요청됨.");
//		System.out.println(id);
////		eventVO bag = dao.one(id);
//		//bag에 검색결과 다 들어있음.
//		//views아래 one.jsp로 쓸 수 있도록 설정해주어야 함.
//		model.addAttribute("bag", bag);
//		//views까지 전달할 속성으로 추가해주세요. 
//	}
//	

	@RequestMapping("event/list")
	public void list(Model model) {
		List<eventVO> list = dao.list();
		model.addAttribute("list", list);
	}

	@RequestMapping("event/one")
	public void one(String event_id, Model model) {
		System.out.println("id="+event_id);
		eventVO vo = dao.one(event_id);
		model.addAttribute("vo", vo);
	}
	
	@RequestMapping("event/eventmain")
	public void eventmain(Model model) {
		List<eventVO> list = dao.list();
		model.addAttribute("list", list);
	}

	// https://search.naver.com/search.naver?where=nexearch&sm=top_hty&fbm=1&ie=utf8&query=%EC%9E%90%EB%8F%99%EC%B0%A8

}