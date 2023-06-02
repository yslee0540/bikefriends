package com.spring.bf.member;

import javax.mail.internet.MimeMessage;
import javax.mail.internet.InternetAddress;

import java.util.Random;

import javax.mail.Message;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class EmailController {
    char[] charSet = new char[] {
            'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'};
    
	@Autowired
	private JavaMailSender mailSender;
	
	@Autowired
	MemberDAO dao;
	
	//아이디와 이메일이 같으면 특정한 메일이 가게..
	@RequestMapping("member/mail")
	public void sendEmail(String id) throws Exception {
			MimeMessage message = mailSender.createMimeMessage();
			System.out.println("id : " + id);
			MemberVO bag = null;
			
			try {
			bag = dao.one(id);
			}catch (Exception e) {
				System.out.println("id 없음");
			}
			
			try {
			Random random = new Random();
			
			String pass = String.valueOf(charSet[random.nextInt(charSet.length)]);
			
			for (int i=0; i<6; i++) { 
				pass += String.valueOf(random.nextInt(9));		
			}	
			
			message.setFrom("bikefriends2023@gmail.com");
			message.setRecipient(Message.RecipientType.TO, new InternetAddress(bag.getSign_email()));
			message.setSubject("Bike Friends 비밀번호 변경 메일 입니다.");
			message.setText("비밀번호가 [ " + pass + " ]로 변경되었습니다. 회원 정보에서 비밀번호를 반드시 수정해주세요.");
			
			bag.setSign_pw(pass);
			dao.password(bag);
			
			mailSender.send(message);
			System.out.println("메일 전송 완료");
			}catch (Exception e) {
				System.out.println("메일 전송 실패");
			}
			
			
	}
}