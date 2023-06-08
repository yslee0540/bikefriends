package com.spring.bf.member;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Controller
public class MemberController {

	@Autowired
	MemberDAO dao;
	
	@RequestMapping("member/sign_up")
	public String insert(MemberVO bag) {
		System.out.println("insert요청됨.");
		Calendar current = Calendar.getInstance();
		int currentYear = current.get(Calendar.YEAR);
		int currentMonth = current.get(Calendar.MONTH);
		int currentDay = current.get(Calendar.DAY_OF_MONTH);
		int age = 0;

		try {
			System.out.println(currentYear + "." + currentMonth + "." + currentDay);
			String[] s = bag.getSign_birthday().split("-");

			if (currentMonth <= Integer.parseInt(s[1])) {
				if (currentDay < Integer.parseInt(s[2])) {
					age = currentYear - Integer.parseInt(s[0]) - 1;
				} else {
					age = currentYear - Integer.parseInt(s[0]);
				}
			} else {
				age = currentYear - Integer.parseInt(s[0]);
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		bag.setSign_age(age);
		bag.setSign_img("/bf/resources/img/profile.jpg");
		System.out.println(bag);
		System.out.println(dao);
		dao.insert(bag);
		return "redirect:/index.jsp";
	}

	@RequestMapping("member/sign_in")
	public String login(MemberVO bag, HttpSession session, HttpServletResponse response) {
		System.out.println("로그인 요청");
		// views아래 login.jsp를 호출하게 됨.
		int result = dao.login(bag);// 1, 0
		if (result == 1) {
			// 로그인이 성공하면, 세션을 잡아두자.!!!
			System.out.println("로그인 성공");
			session.setAttribute("id", bag.getSign_id());
			bag = dao.one(bag.getSign_id());
			session.setAttribute("name", bag.getSign_name());
			session.setAttribute("email", bag.getSign_email());
			session.setAttribute("phone", bag.getSign_phone());
			System.out.println("name : " + bag.getSign_name());
			return "redirect:/index.jsp"; // views아래 파일이름.jsp
		} else {
			// views아래가 아니고, webapp아래
			// member.jsp로 가고 싶은 경우!
			System.out.println("로그인 실패");
			try {
				response.setCharacterEncoding("UTF-8");
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>alert('아이디또는 패스워드를 잘못 입력하셨습니다.'); history.go(-1);</script>");
				out.flush();
			} catch (IOException e) {
				e.printStackTrace();
			}
			return "redirect:member/login.jsp";
		}
	}

	@RequestMapping("member/idChk")
	@ResponseBody
	public String idChk(MemberVO bag) {
		String result = "0"; // 중복시 1
		System.out.println(bag);
		try {
			int count = dao.idChk(bag); // 0이 되야함
			result = String.valueOf(count);
		} catch (Exception e) {
			System.out.println(e);
		}

		System.out.println(result);
		return result;
	}

	@RequestMapping("member/sign_update")
	public String sign_update(MemberVO bag, HttpServletRequest request) {
		String id = (String) request.getSession().getAttribute("id");
		System.out.println("세션 id : " + id);
		bag.setSign_id(id);
		dao.update(bag);
		
		HttpSession session = request.getSession();
		session.setAttribute("id", bag.getSign_id());
		session.setAttribute("name", bag.getSign_name());
		session.setAttribute("email", bag.getSign_email());
		session.setAttribute("phone", bag.getSign_phone());

		return "redirect:one?id=" + id;
	}
	
	@RequestMapping("member/sign_password")
	public String sign_password(MemberVO bag, HttpServletRequest request) {
		String id = (String) request.getSession().getAttribute("id");
		System.out.println("세션 id : " + id);
		bag.setSign_id(id);
		dao.password(bag);

		return "redirect:one?id=" + id;
	}
	
	@RequestMapping("member/one")
	public void one(String id, Model model) {
		MemberVO bag = dao.one(id);
		model.addAttribute("bag", bag);
		System.out.println(bag);
	}

	@RequestMapping("member/update")
	public void update(String id, Model model) {
		MemberVO bag = dao.one(id);
		model.addAttribute("vo", bag);
		System.out.println(bag);
	}

	@RequestMapping("member/upload_ok")
	public String upload(String fileUrl, MultipartFile file, MultipartHttpServletRequest request) throws Exception {
		MemberVO bag = new MemberVO();

		if (!file.isEmpty()) {
			String savedName = file.getOriginalFilename();
			String uploadPath = request.getSession().getServletContext().getRealPath("resources/upload");
			System.out.println(uploadPath);
			File target = new File(uploadPath + "/" + savedName);
			file.transferTo(target);

			bag.setSign_img("/bf/resources/upload/" + savedName);
		} else {
			bag.setSign_img(fileUrl);
		}

//		UUID uuid = UUID.randomUUID();
//		System.out.println(uuid.toString());
//		String[] uuids = uuid.toString().split("-");
//		String uniqueName = uuids[0];
//		
		String id = (String) request.getSession().getAttribute("id");
		bag.setSign_id(id);

		dao.updateIMG(bag);

		return "redirect:one?id=" + id;
	}

	@RequestMapping("member/naverLogin")
	public String home(naverVO vo, Model model, HttpSession session, HttpServletResponse response) {
		System.out.println("네이버 로그인 요청");
		System.out.println(vo);
		MemberVO bag = new MemberVO();
		bag.setSign_id(vo.getId()); // 아이디 먼저 입력
		int count = dao.idChk(bag); // 0 기록없음 1 아이디존재
		System.out.println("count: " + count);

		if (count == 0) {
			System.out.println("계정없음. 네이버 로그인 회원가입 시도");
			bag.setSign_gender(vo.getGender());
			bag.setSign_img(vo.getProfile_image());
			bag.setSign_email(vo.getEmail());
			bag.setSign_phone(vo.getMobile());
//			bag.setSign_birthday("00-00-00");
			bag.setSign_pw("0");
			bag.setSign_name(vo.getNickname());
			System.out.println(bag);
			dao.insert(bag); // 회원가입
		} // if

		int result = dao.login2(bag);// 1 성공, 0 실패
		if (result == 1) { // 로그인 세션 시도
			System.out.println("로그인 성공");
			session.setAttribute("id", bag.getSign_id());
			bag = dao.one(bag.getSign_id());
			session.setAttribute("name", bag.getSign_name());
			session.setAttribute("email", bag.getSign_email());
			session.setAttribute("phone", bag.getSign_phone());
			System.out.println("name : " + bag.getSign_name());
			// model.addAttribute("vo", vo);
			// views아래 파일이름.jsp
		} else {
			// views아래가 아니고, webapp아래
			// member.jsp로 가고 싶은 경우!
			System.out.println("로그인 실패");
			try {
				response.setCharacterEncoding("UTF-8");
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>alert('알 수 없는 이유로 로그인에 실패하였습니다.'); history.go(-1);</script>");
				out.flush();
			} catch (IOException e) {
				e.printStackTrace();
			} // catch
		} // else 로그인 시도

		return "redirect:/index.jsp";

	}

	/* 메인페이지 로그아웃 */
	@RequestMapping("member/logout")
	public String logoutMainGET(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		session.invalidate();
		System.out.println("로그아웃 실행");
				
		return "redirect:/index.jsp";
	}
	
	
	
}
