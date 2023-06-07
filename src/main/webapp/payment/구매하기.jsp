<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	overflow: auto;
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
#overflowTest {
  color: black;
  padding: 15px;
  width: 600;
  height: 100px;
  overflow: scroll;
  border: 1px solid #ccc;
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
		
	
		const name = $('#name').text(); //value값을 의미한다...!
		const email = $('#email').text();
		const tel = $('#tel').text();
		const id = $('#id').text();
		
		const money = ${param.money};
		
		
		//alert(email);
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
		결제수단<br> <img src="../resources/img/kakao.png"><br>
		<hr color="lime">

		<h3>구매자 정보</h3>
		
	 	<%-- 아이디:${id}<br>
		이메일:${email}<br>
		구매자이름:${name}<br>
		전화번호: ${phone}<br> --%>
		 
		 아이디: <span id="id">${id}</span><br>
		이메일: <span id="email">${email}</span><br>
		구매자이름: <span id="name">${name}</span><br> 
		구매자 전화번호: <span id="tel">${phone}</span><br>
	
		<hr color="lime">
		이용약관 <br><div id="overflowTest"> 제 1 장 총칙
제1조(목적)
이 약관은 회원의 권익보호 및 거래관계의 명확화를 위하여 신용카드사(이하 “카드사”라 함)와 신용카드(이하 “카드”라 함)를 이용하고자 하는 회원 간의 필요한 사항을 정함을 목적으로 합니다.

제2조(회원)
① 회원은 본인회원과 가족회원으로 구분합니다.
② 본인회원이란 이 약관을 승인하고 비씨카드㈜에 카드 발급을 신청하여 카드사로부터 카드를 발급받은 분을 말합니다.
③ 가족회원이란 본인회원이 지정하고 대금의 지급 및 기타 카드이용에 관한 책임을 본인회원이 부담할 것을 승낙한 분으로서, 이 약관을 승인하고 카드사로부터 카드를 발급받은 분을 말합니다.
제 2 장 카드의 발급 및 관리 등
제3조(카드의 발급)
① 카드를 발급받고자 하는 신청인이 카드사에 카드발급을 신청하면 카드사는 내부 기준에 따른 심사 및 발급관련 절차 등을 거쳐 발급합니다.
② 카드모집자가 카드회원을 모집할 때 자금의 융통을 권유하는 경우에는 대출금리, 연체료율 및 취급수수료 등의 거래조건을 감추거나 왜곡하지 아니하고, 이해할 수 있도록 설명합니다.
③ 카드사는 신용카드 이용계약을 체결할 경우 신청인에게 카드에 대한 약관과 연회비 등 카드의 거래조건 및 연회비 반환사유, 반환금액 산정방식, 반환금액의 반환기한 등을 알리고 이용계약에 따른 계약서류를 제공하여야 합니다.
제3조의2(가족카드 발급 등)
① 본인회원은 카드사에 가족카드 발급(갱신·대체발급을 포함한다. 이하 이 조에서 같다)을 신청할 수 있으며, 카드사는 관련 법규 등에 따라 본인회원의 신용상태, 가족관계, 가족의 동의 등을 확인하여 가족카드를 발급할 수 있습니다.
② 가족카드는 본인회원의 배우자, 직계존속·비속(배우자 포함), 형제자매 및 배우자의 직계존속·비속, 형제자매에게 발급됩니다.
③ 카드사는 가족카드 발급과 관련하여 다음 각호의 사항을 상품설명서에 명시하고 카드를 발급할 경우 본인회원과 가족회원에게 안내합니다.
1. 가족카드 연회비 및 가족카드 발급 가능매수
2. 가족카드 부가서비스 이용조건 및 제공 범위
3. 가족카드 연말정산 관련 사항
4. 휴대폰 메시지 및 카드대금 청구서 제공사실 및 방법
5. 가족카드 포인트 양도방법
6. 이혼, 사망, 파양 등 가족관계 변동시 본인회원 및 가족회원의 카드사 신고방법 및 처리절차
7. 제6호의 가족관계 변동이 되었음에도 가족카드를 정지시키지 않는 경우 의도하지 않는 카드사용 및 책임이 발생할 수 있다는 사실
8. 본인회원이 요청할 경우 가족회원의 동의없이 가족카드가 한도감액·정지·해지될 수 있다는 사실
9. 기타 가족카드 이용정지 및 해지 등에 관한 사항
④ 본인회원은 본인회원이 발급을 신청하지 않은 가족카드 사용금액에 대해서는 책임을 부담하지 않습니다. 본인회원이 발급을 신청했다는 사실에 대한 입증책임은 카드사가 집니다.
⑤ 본인회원은 가족회원의 동의 없이 가족카드의 한도감액·정지·해지를 카드사에 요청할 수 있으며 카드사는 본인회원의 요청에 따라 가족카드 한도감액·정지·해지 조치를 한 경우에는 즉시 그 사실을 본인회원과 가족회원에게 알립니다.
⑥ 카드사는 제30조에 따라 가족회원에게 본인회원의 미상환 채무를 추심할 수 없습니다.
⑦ 본인회원은 카드사가 정하여 카드사의 홈페이지 등에 게시하는 절차에 따라 가족회원 명의의 계좌를 가족카드 이용대금 자동이체결제계좌로 지정해 줄 것을 카드사에 요청할 수 있으며, 이 경우 카드사는 가족회원의 동의를 받아 처리합니다.
제4조(카드의 유효기한 및 재발급)
① 카드의 유효기한은 카드표면에 기재됩니다.
② 카드사는 회원이 카드의 분실 및 훼손 등의 사유로 재발급을 요청하는 경우 카드의 잔여 유효기한까지는 재발급하여 드립니다.
③ 카드사는 유효기한이 도래한 카드에 대해서는 회원에 대한 심사를 거쳐 갱신발급 요건을 충족하는 회원에 대해 카드를 갱신 발급하며, 요건을 충족하지 못한 회원에 대해서는 갱신이 거절될 수 있습니다.
④ 갱신 또는 대체발급, 거절예정일전 6개월 이내에 카드를 사용한 적이 있는 회원은 카드사가 갱신 또는 대체발급, 거절예정일부터 1개월 이전에 회원에게 서면, 전화, 전자우편(E-MAIL), 휴대폰 메시지(모바일 메시지 서비스의 경우 회원의 사전동의를 받아야 하며, 데이터 비용 발생사실 등을 안내하여야 합니다. 또한, 유효하게 전달되지 못한 경우 휴대폰 문자메시지(SMS 등)로 대체전송됩니다. 이하 같습니다.), 팩스(FAX), 이용대금명세서 중 2가지 이상의 방법으로 발급·거절예정사실과 20일 이내에 이의 제기를 할 수 있음을 알린 후 해당 기간 내에 그 회원으로부터 이의 제기가 없어 묵시적 동의를 받은 경우 새로운 유효기한이 기재된 카드를 갱신 또는 대체발급하거나, 갱신 또는 대체발급이 거절됩니다.
⑤ 갱신 또는 대체발급예정일전 6개월 이내에 카드를 사용하지 않은 회원의 경우에는 회원이 서면, 전자문서(「전자문서 및 전자거래기본법」제2조제1호에 따른 전자문서를 말한다) 또는 전화로 동의한 경우에만 갱신 또는 대체발급합니다. 회원은 동의없는 갱신 또는 대체발급된 카드의 사용으로 인한 책임을 부담하지 않습니다. 회원이 동의했다는 사실에 대한 입증책임은 카드사가 집니다.
⑥ 카드가 갱신된 경우에도 계속하여 이 약관이 적용됩니다.</div> <!-- <input type="checkbox"> -->
		<!-- 
 onclick="order2_chk(); or2_activ();" -->
		<div class="checkT">
			<p>
				<input type="checkbox" id="order2_chk" name="order2_chki"
					class="order2_chks">전체동의
			</p>
		</div>
</main>

		<footer id="footer">
			<h3>구매금액</h3>
			<div class="btnArea">
				<button class="btn" disabled="disabled" onclick="request_payment()">
					결제하기</button>
			</div>
		</footer>
	</div>

</body>
</html>