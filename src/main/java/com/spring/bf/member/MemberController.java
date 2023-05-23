package com.spring.bf.member;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URL;
import java.util.Calendar;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.ResourceUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
		int currentYear  = current.get(Calendar.YEAR);
		int currentMonth = current.get(Calendar.MONTH);
		int currentDay   = current.get(Calendar.DAY_OF_MONTH);
		int age = 0;
		
		try {
			System.out.println(currentYear + "." + currentMonth + "." + currentDay);
			String[] s = bag.getSign_birthday().split("-");
			
			if(currentMonth <= Integer.parseInt(s[1])){
				if(currentDay < Integer.parseInt(s[2])) {
					age = currentYear - Integer.parseInt(s[0]) - 1;
				}else {
					age = currentYear - Integer.parseInt(s[0]);
				}
			} else {
				age = currentYear - Integer.parseInt(s[0]);
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		bag.setSign_age(age);
		System.out.println(bag);
		System.out.println(dao);
		dao.insert(bag);
		return "redirect:main.jsp";
	}

	@RequestMapping("member/sign_in")
	public String login(MemberVO bag, HttpSession session, HttpServletResponse response) {
		System.out.println("로그인 요청");
		//views아래 login.jsp를 호출하게 됨.
		int result = dao.login(bag);//1, 0
		if(result == 1) {
			//로그인이 성공하면, 세션을 잡아두자.!!!
			System.out.println("로그인 성공");
			session.setAttribute("id", bag.getSign_id());
			return "redirect:main.jsp"; //views아래 파일이름.jsp
		}else {
			//views아래가 아니고, webapp아래
			//member.jsp로 가고 싶은 경우!
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
		String result = "0"; //중복시 1
		System.out.println(bag);
		try {
			int count = dao.idChk(bag); //0이 되야함
			result = String.valueOf(count);
		} catch (Exception e) {
			System.out.println(e);
		}
		
		System.out.println(result);
		return result;
	}
	
	@RequestMapping("member/sign_update")
	public String sign_update(MemberVO bag, HttpServletRequest request) {
		String id = (String)request.getSession().getAttribute("id");
		System.out.println("세션 id : " + id);
		
		bag.setSign_id(id);
		dao.update(bag);
		return "redirect:myInfo.jsp";
	}
	
	@RequestMapping("member/upload_ok")
	public String upload(@RequestParam("file") MultipartFile file,  MultipartHttpServletRequest request)throws Exception {
		String fileRealName = file.getOriginalFilename(); //파일명을 얻어낼 수 있는 메서드!
		long size = file.getSize(); //파일 사이즈
		
		System.out.println("파일명 : "  + fileRealName);
		System.out.println("용량크기(byte) : " + size);
		//서버에 저장할 파일이름 fileextension으로 .jsp이런식의  확장자 명을 구함
		String fileExtension = fileRealName.substring(fileRealName.lastIndexOf("."),fileRealName.length());
		String uploadFolder = "C:\\spring\\finalbike\\src\\main\\webapp\\resources\\img";
//		String uploadFolder = "\\resources\\img";
		
		String uploadPath = request.getSession().getServletContext().getRealPath("resources/img");
		
		String savedName = file.getOriginalFilename();
		
		File target = new File(uploadPath + "/" + savedName);
		file.transferTo(target);
		
		UUID uuid = UUID.randomUUID();
		System.out.println(uuid.toString());
		String[] uuids = uuid.toString().split("-");
		
		String uniqueName = uuids[0];
		System.out.println("생성된 고유문자열" + uniqueName + " | 확장자명" + fileExtension);
		
		// File saveFile = new File(uploadFolder+"\\"+fileRealName); uuid 적용 전
		File saveFile = new File(uploadFolder + "\\" + uniqueName + fileExtension);  // 적용 후
		
		System.out.println(saveFile);
		try {
			file.transferTo(saveFile); // 실제 파일 저장메서드(filewriter 작업을 손쉽게 한방에 처리해준다.)
		} catch (Exception e) {
			System.out.println(e);
		}
		
		String id = (String)request.getSession().getAttribute("id");
		MemberVO bag = new MemberVO();
		bag.setSign_id(id);
		bag.setSign_img(uniqueName + fileExtension);
		dao.updateIMG(bag);
		
		return "redirect:myInfo.jsp";
	}
	
	@RequestMapping("member/naverLogin")
	public String home(naverVO vo, Model model, HttpSession session, HttpServletResponse response) {
		System.out.println("네이버 로그인 요청");
		System.out.println(vo);
		MemberVO bag = new MemberVO();
		bag.setSign_id(vo.getId()); //아이디 먼저 입력
		int count = dao.idChk(bag); //0 기록없음 1 아이디존재
		System.out.println("count: " + count);
		
		if(count == 0) {
			System.out.println("계정없음. 네이버 로그인 회원가입 시도");
			bag.setSign_gender(vo.getGender());
			bag.setSign_img(vo.getProfile_image());
			bag.setSign_email(vo.getEmail());
			bag.setSign_phone(vo.getMobile());
			bag.setSign_birthday("00-00-00");
			bag.setSign_pw("0");
			bag.setSign_name(vo.getNickname());
			System.out.println(bag);
			dao.insert(bag); //회원가입
		}//if
		
		int result = dao.login2(bag);//1 성공, 0 실패
		if(result == 1) { //로그인 세션 시도
			System.out.println("로그인 성공");
			session.setAttribute("id", bag.getSign_id());
			//model.addAttribute("vo", vo);
			 //views아래 파일이름.jsp
		}else {
			//views아래가 아니고, webapp아래
			//member.jsp로 가고 싶은 경우!
			System.out.println("로그인 실패");
			try {
				response.setCharacterEncoding("UTF-8");
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>alert('알 수 없는 이유로 로그인에 실패하였습니다.'); history.go(-1);</script>");
				out.flush();
			} catch (IOException e) {
				e.printStackTrace();
			} //catch
		} //else 로그인 시도
		
		return "redirect:main.jsp";
		
	}
	

    /* 메인페이지 로그아웃 */
    @RequestMapping("member/logout")
    public String logoutMainGET(HttpServletRequest request) throws Exception{
    	 HttpSession session = request.getSession();
    	 
    	 session.invalidate();
    	 System.out.println("로그아웃 실행");
    	 return "redirect:main.jsp";
    }
}
