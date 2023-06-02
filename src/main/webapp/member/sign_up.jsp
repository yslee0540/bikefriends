<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="../resources/css/bbsstyle.css">
<title>회원가입</title>
<style>
	table{
		text-align: center;
	}
</style>
<script type="text/javascript" src="../resources/js/jquery-3.6.4.js"></script>
<script type="text/javascript">
function isCheck() {
	  var password = document.getElementById("pw").value;
	  var confirmPassword = document.getElementById("pwCheck").value;
	
	  console.log(password);
	  console.log(confirmPassword);
	  if(password.length < 6){
	  	if (password != confirmPassword) {
	    	alert("패스워드가 일치하지 않습니다.");
	    	return false;
	  	}
	  	alert("비밀번호는 6자리 이상여야 합니다.");
    	return false;
	  }
	  alert("정상적으로 회원가입 처리 되었습니다.");
	  return true;
	}
function isSame() {
    var password = document.getElementById('pw').value;
    var confirmPassword = document.getElementById('pwCheck').value;

    if(password != '' && password.length >= 6) {
        if(password == confirmPassword) {
            document.getElementById('same').innerHTML='비밀번호가 일치합니다.';
            document.getElementById('same').style.color='blue';
        }
        
        else {
            document.getElementById('same').innerHTML='비밀번호가 일치하지 않습니다.';
            document.getElementById('same').style.color='red';
        }
    } else{
    	document.getElementById('same').innerHTML='비밀번호는 6자리 이상이야 합니다.';
        document.getElementById('same').style.color='red';
    }
}
$(function() {
	$('#b1').click(function() {
		$.ajax({
			url : "idChk",
			type : "POST",
			dataType : "text",
			data : {"Sign_id" : $("#Sign_id").val()},
			success : function(x) {
				if(x == 1){
					alert("중복된 아이디입니다.");
				} else{
					$("#submit").removeAttr("disabled");
					alert("사용가능한 아이디입니다.");
				}
			}, error:function(e) {
			　　　　alert("error: " + e);
			}
		}) //ajax
	})//b1
})//$

</script>
</head>
<body>	
<jsp:include page="../nav.jsp"></jsp:include>
<center>
	<form action="sign_up" onsubmit="return isCheck()" method="get">
	<table style="vertical-align: middle; text-align: center;" class="table">
		<tr><td colspan="2"><h2>회원가입</h2></td></tr>
		<tr><td>아이디</td><td><input name="Sign_id" id="Sign_id" value="" class="form-control"></td></tr>
		<tr><td>비밀번호</td><td><input name="Sign_pw" value="" id="pw" type="password" class="form-control"></td></tr>  
		<tr><td>비밀번호 확인</td><td><input value="" id="pwCheck" onchange="isSame()" type="password" class="form-control"></td></tr>
		<tr><td>이름</td><td><input name="Sign_name" value="" class="form-control"></td></tr>  	
		<tr><td>성별</td><td><input name="Sign_gender" value="" class="form-control"></td></tr>
		<tr><td>생일</td><td><input name="Sign_birthday" type="date" value="" min="1900-00-00" class="form-control"></td></tr>
		<tr><td>주소</td><td><input name="Sign_address" value="" class="form-control"></td></tr>
		<tr><td>이메일</td><td><input name="Sign_email" value="" class="form-control"></td></tr>
		<tr><td>전화번호</td><td><input name="Sign_phone" value="" class="form-control"></td></tr>
		<tr><td colspan="2"><span id="same"></span></td></tr>
		<tr><td colspan="2"><input type="submit" id="submit" disabled="disabled" value="회원가입" class="btn btn-primary"></td></tr>
	</table>
	</form></center>
	<center><button id="b1" class="btn btn-primary">아이디 체크</button></center>
</body>
</html>