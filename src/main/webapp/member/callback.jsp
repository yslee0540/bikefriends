<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.parser.JSONParser"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.net.URL"%>
<%@ page import="java.net.HttpURLConnection"%>
<%@ page import="java.io.BufferedReader"%>
<%@ page import="java.io.InputStreamReader"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!doctype html>
<html lang="ko">
<head>
<script type="text/javascript"
	src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"
	charset="utf-8"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
</head>
<body>
	<script type="text/javascript">
		var naver_id_login = new naver_id_login("Faa9w2Y7kH0XycxYku9B",
				"http://localhost:8898/bf/member/allback.jsp");
		//alert(naver_id_login.oauthParams.access_token);
		//naver_id_login.setPopup();
		naver_id_login.get_naver_userprofile("naverSignInCallback()");
		// 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
		function naverSignInCallback() {
			id = naver_id_login.getProfileData('id') //고유 식별번호
			nickname = naver_id_login.getProfileData('nickname') //별명
			name = naver_id_login.getProfileData('name') //이름
			email = naver_id_login.getProfileData('email') // 메일 주소
			gender = naver_id_login.getProfileData('gender') //성별 F여성 M남성 U확인불가
			age = naver_id_login.getProfileData('age') // 연령대
			birthday = naver_id_login.getProfileData('birthday') //생일 MM-DD
			birthyear = naver_id_login.getProfileData('birthyear') //출생연도
			profile_image = naver_id_login.getProfileData('profile_image') //프로필 사실 URL
			mobile = naver_id_login.getProfileData('mobile') //휴대전화번호

			//alert("naverLogin?nickname=" + nickname
			//		+ "&name=" + name + "&email=" + email + "&gender=" + gender
			//		+ "&age=" + age + "&birthday=" + birthday
			//		+ "&profile_image=" + profile_image)
			location.href ="naverLogin?nickname=" + nickname
					+ "&name=" + name + "&email=" + email + "&gender=" + gender
					+ "&age=" + age + "&birthday=" + birthday
					+ "&profile_image=" + profile_image
					+ "&id=" + id
					+ "&birthyear=" + birthyear
					+ "&mobile=" + mobile

		}
	</script>
</body>
</html>