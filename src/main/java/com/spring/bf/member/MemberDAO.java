package com.spring.bf.member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import java.util.Locale;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.spring.bf.bbs.BbsVO;

@Component
public class MemberDAO { // CRUD

	@Autowired
	SqlSessionTemplate my;

	public void insert(MemberVO bag) {
		System.out.println("회원가입 DAO 시도" + bag);
		my.insert("member.create", bag);
	}

	public int login(MemberVO bag) {
		int result = 0;
		MemberVO bag2 = my.selectOne("member.one", bag);
		System.out.println(bag2);
		if (bag2 != null) {
			if (bag.getSign_id().equals(bag2.getSign_id())) {
				if (bag.getSign_pw().equals(bag2.getSign_pw())) {
					result = 1;
				}
			}
		}
		System.out.println("result : " + result);
		return result;

	}
	
	public int login2(MemberVO bag) { //네이버 로그인은 비밀번호가 필요없음
		System.out.println("네이버 로그인 요청");
		int result = 0;
		MemberVO bag2 = my.selectOne("member.one", bag);
		System.out.println(bag2);
		if (bag2 != null) {
			if (bag.getSign_id().equals(bag2.getSign_id())) {
				result = 1;
			}
		}
		System.out.println("result" + result);
		return result;

	}
	
	public int idChk(MemberVO bag) {
		int result = my.selectOne("member.idChk", bag);
		System.out.println("dao : " + result);
		return result;
	}
	
	public void update(MemberVO bag) {
		my.selectOne("member.up", bag);
		System.out.println(bag);
	}
	
	public void password(MemberVO bag) {
		my.selectOne("member.password", bag);
		System.out.println(bag);
	}
	
	
	public void updateIMG(MemberVO bag) {
		my.selectOne("member.upimg", bag);
		System.out.println(bag);
	}
	
	public MemberVO one(String id) {
		MemberVO bag = my.selectOne("member.one", id);
		return bag;
	}
	
	//지정된 writer만 가져옴
	public List<BbsVO> list(BbsVO vo) {
		List<BbsVO> list = my.selectList("member.list", vo);
		return list;
	}
	
	public int count(String id) {
		return my.selectOne("member.count", id);
	}
	
	public MemberVO select(String id) {
		ResultSet rs = null; // 항목명 + 결과 데이터를 담고 있는 테이블
		// 기본형 정수/실수/문자/논리만 값으로 초기화
		// 나머지 데이터형(참조형) 주소가! 들어가 있음.
		// 참조형 변수를 초기화할 때는 null(주소가 없다라는 의미)
		MemberVO bag = null;
		try {
			// 1.오라클 11g와 연결한 부품 설정
			Class.forName("com.mysql.cj.jdbc.Driver");
			System.out.println("1.mySQL과 자바 연결할 부품 설정 성공.");
			Locale.setDefault(Locale.US); // 맥 locale에러나신 분들만!!!

			// 2.오라클 11g에 연결해보자.(java --- oracle)
			// String url = "jdbc:mysql://localhost:3306/multi";
			String url = "jdbc:mysql://localhost:3306/bikefriends?serverTimezone=UTC";
			String user = "root";
			String password = "1234";
			Connection con = DriverManager.getConnection(url, user, password); // Connection
			// String data = JOptionPane.showInputDialog("이름입력"); //String, 임아무개
			System.out.println("2. mySQL 연결 성공.");

			// ipaddress ==> InetAddress
			// String url = "http://wwww.naver.com";
			// URL u = new URL(url);
			// 자바는 부품조립식이여서,String에 넣은 문자열을 특정한 부품으로 인식하지 못함.
			// 특정한 부품으로 인식하려면 그 부품으로 만들어주어야 한다.
			// SQL부품으로 만들어주어야 함.
			// PreparedStatement가 SQL부품!!

			String sql = "select * from member where Sign_id = ? ";
			PreparedStatement ps = con.prepareStatement(sql); // PreparedStatement
			ps.setString(1, id);
			System.out.println("3. SQL문 부품(객체)으로 만들어주기 성공.");

			rs = ps.executeQuery(); // select문 전송시
			System.out.println("4. SQL문 오라클로 보내기 성공.");
			if (rs.next()) { // 검색결과가 있는지 여부는 rs.next()
				// true이면 있다라는 의미, false이면 없다라는 의미
				System.out.println("검색결과 있음. 성공.");
				String sign_name = rs.getString("Sign_name");  
				String sign_gender = rs.getString("Sign_gender");  
				String sign_birthday = rs.getString("Sign_birthday");
				String sign_email = rs.getString("Sign_email");
				int sign_age = rs.getInt("Sign_age");
				String sign_img = rs.getString("Sign_img");
				String sign_bio = rs.getString("Sign_bio");
				String sign_address = rs.getString("Sign_address");
				String sign_phone = rs.getString("Sign_phone");
				
				// 검색결과를 검색화면 UI부분을 주어야 함.
				bag = new MemberVO();
				bag.setSign_name(sign_name);
				bag.setSign_gender(sign_gender);
				bag.setSign_birthday(sign_birthday);
				bag.setSign_email(sign_email);
				bag.setSign_age(sign_age);
				bag.setSign_img(sign_img);
				bag.setSign_bio(sign_bio);
				bag.setSign_address(sign_address);
				bag.setSign_phone(sign_phone);
				
			} else {
				System.out.println("검색결과 없음. 성공.");
			}
			// System.out.println(result);
		} catch (Exception e) {
			e.printStackTrace();
		}
		// 검색결과가 없을 때는 bag에 무엇이 들어있나? null
		return bag;
	}
}
