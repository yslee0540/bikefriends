<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구매하기</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
	<script type="text/javascript" src="resources/js/jquery-3.6.4.js"></script>
	<link rel="stylesheet" href="resources/css/bbsstyle.css">
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	text-align: center;
}

#container {
	width: 600px;
	margin: 20px auto;
	text-align: center;
}

#header {
	line-height: 120px;
	width: 100%;
	height: 120px;
	text-align: center;
	background-color: #acacac;
}

#left-sidebar {
	width: 250px;
	height: 600px;
	background-color: #e9e9e9;
	float: left;
}

#contents {
	width: 600px;
	height: 500px;
	background-color: #f7f7f7;
	float: left;
}

#footer {
	width: 100%;
	height: 120px;
	background-color: #888888;
	text-align: center;
	clear: left;
}

.btnArea {
	width: 100%;
	margin-top: 20px;
}

.btnArea button {
	width: 100px;
	height: 30px;
	display: inline-block;
	background-color: #cbcbcb;
	border: none;
	outline: none;
	color: #303033;
	border-radius: 8px;
	cursor: auto;
}

.btnArea button+button {
	margin-left: 20px;
}

.checkT {
	width: 2%;
}

.checkT p {

	width: 15px;
	margin: 12.5px auto;
	height: 15px;
	white-space: nowrap;
}

.checkT p input {

	display: block;
	width: 100%;
	height: 100%;
	border: 1px solid #cbcbcb;
	background-color: #fff;
	white-space: nowrap;
}

.disabled {
	opacity: 0.6;
	cursor: not-allowed;
}
</style>

<!-- <script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	 -->

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>

<!-- iamport.payment.js -->
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>



<script type="text/javascript">
	$(function() {

		$("#order2_chk").click(function() {
			var order2Chk = $("#order2_chk").prop("checked");
			// prop 를 사용하여 checkbox의 속성에 접근

			if (order2Chk) {
				$(".order2_chks").prop("checked", true);
			} else {
				$(".order2_chks").prop("checked", false);
			}

		});

		// 체크박스가 체크되면 버튼 활성화 되게 만들기

		$('.checkT input[type="checkbox"]').click(function() {
			var tmpp = $(this).prop('checked');
			// this를 사용하여 클릭한 checkbox 가 체크되도록 설정
			if (tmpp) {
				$(".btnArea button").css({
					"backgroundColor" : "#d2201d",
					"cursor" : "pointer",
					"color" : "#fff"
				}).prop("disabled", false);
			} else {
				$(".btnArea button").css({
					"backgroundColor" : "#cbcbcb",
					"cursor" : "auto",
					"color" : "#303033"
				}).prop("disabled", true);
			}
		});
	});
</script>
<script type="text/javascript">


	function route_payment_result() {
		// 대충 저기 구매내역 페이지로 이동하는 코드.
		// 필요하다면 데이터도 같이 실어서 보낼것.
	}


	function request_payment() {
		if(confirm("정말 결제 하시겠습니까?")) {
		
		var IMP = window.IMP; // 생략가능
		
	
		const name = $('#user').val();
		const email = $('#email').val();
		const tel = $('#tel').val();
		const id = $('#id').val();
		
		const money = ${param.money};
		
		
		alert(email);
		IMP.init('iamport'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
		IMP.request_pay({
			pg : 'inicis', // version 1.1.0부터 지원.
			pay_method : 'card',
			merchant_uid : 'merchant_' + new Date().getTime(),
			name : '주문명:자전거 이용권',
			amount : money,
			// amount : $('#money').val(),
			buyer_email : email,
			buyer_name : name,
			buyer_tel : tel,
			buyer_addr : '서울특별시 강남구 삼성동',
			buyer_postcode : '123-456',
			m_redirect_url : 'www.yourdomain.com/payments/complete'
		}, function(rsp) {
			
			if (rsp.success) {
				//여기서부터 뱉어주는 정보
				var msg = '결제가 완료되었습니다.';
				
				console.log('rsp : ',rsp);
				
				msg += '고유ID : ' + rsp.imp_uid;
				msg += '상점 거래ID : ' + rsp.merchant_uid;
				msg += '결제 금액 : ' + rsp.paid_amount;
				msg += '카드 승인번호 : ' + rsp.apply_num;
				
				console.log(msg);
				location.href="insertpay?email=" + email + "&id=" + id +"&tel=" + tel + "&money=" + money + "&name=" + name

				
			} else {
				var msg = '결제에 실패하였습니다.';
				msg += '에러내용 : ' + rsp.error_msg;
				alert(msg)
				
				console.log('rsp : '+rsp);
			}
			// alert(‎msg);
		});
		
		
		}}
		
	

</script>

</head>

<body>
 <jsp:include page="/nav.jsp"></jsp:include>
	<div id="container">
		<header id="header">
			<h1>구매하기</h1>
			
		</header>
		<main id="contents">
		결제수단<br> <img src="../resources/image/kakao.png"><br>
		<hr color="lime">
		<h1>구매자 정보</h1>
		아이디: <input id="id" value="본인 아이디"><br>
		이메일: <input id="email" value="본인 이메일"><br>
		구매자이름: <input id="user" value="이름"><br> 구매자 전화번호: <input
			id="tel" value="전화번호"><br>
		<hr color="lime">
		<input type="text" value="이용약관"> <br> (필수) 개인의 사생활 어쩌구저쩌구
		네 그렇습니다.<br> (필수) 법적 책임의 어쩌구 저쩌구<br> <input type="checkbox">
		<br>
		<hr color="lime">

		<!-- 
 onclick="order2_chk(); or2_activ();" -->

		<div class="checkT">
			<p>
				<input type="checkbox" id="order2_chk" name="order2_chki"
					class="order2_chks">전체동의
			</p>

		</div>
		<br>

</main>



		<footer id="footer">
			<h2>구매금액</h2>
			<div class="btnArea">
				<button class="btn" disabled="disabled" onclick="request_payment()">
					결제하기</button>
			</div>
		</footer>
	</div>

</body>
</html>