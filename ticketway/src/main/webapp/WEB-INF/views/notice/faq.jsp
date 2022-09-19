<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>FAQ</title>
		<%@ include file="/WEB-INF/views/header.jsp" %>
		
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/yth.css" type="text/css">
	</head>
	<body>
		
		<div class="row" style="justify-content : center;">
			<a class="btn btn-light btn-lg class_btn" href="${pageContext.request.contextPath}/notice/notice_main" id="all">전체</a>
			<a class="btn btn-light btn-lg class_btn" id="notice_list" href="${pageContext.request.contextPath}/notice/notice_list">공지사항</a>
			<a class="btn btn-light btn-lg class_btn" id="event_list" href="${pageContext.request.contextPath}/notice/event_list">이벤트</a>
			<a class="btn btn-light btn-lg class_btn" href="${pageContext.request.contextPath}/notice/qna_main">Q&A</a>
			<a class="btn btn-light btn-lg class_btn" href="${pageContext.request.contextPath}/notice/faq">FAQ</a>
		</div>
		
		<button class="accordion">Q. 예매 취소 및 환불 규정은 어떻게 되나요?</button>
		<div class="panel">
		  <p>01. 예매취소
			<br>
			1) 현장 취소를 하는 경우
			상영시간 이전까지만 가능하며, 상영시간 이후 취소나 환불은 되지 않습니다.
			<br>
			2) 홈페이지에서 예매 취소할 경우
			부분 취소는 불가합니다. (ex. 4장을 홈페이지로 예매한 경우 4장 모두 취소만 가능)                
			<br>
			3) 모바일 앱/웹(m.ticketway.co.kr)에서 예매 취소할 경우
			부분 취소는 불가합니다.(ex. 4장을 모바일앱/웹으로 예매한 경우 4장 모두 취소만 가능)           
			모바일앱/웹 예매 취소는 연극/뮤지컬 공연 시작 시간 15분전까지 가능합니다.
			<br>
			※ 단, 일부 행사의 경우 행사 당일 취소, 변경 불가 합니다.
			※ 단, 온라인 예매도 현장에서 티켓을 출력한 경우에는 상영시간 전까지 현장 방문을 통해서만 취소가 가능합니다.
			<br>
			4) 미성년자 권리보호 안내
			미성년자인 고객께서 계약을 체결하시는 경우 법정대리인이 그 계약에 동의하지 아니하면 미성년자 본인 또는 법정대리인이 그 계약을 취소할 수 있습니다
			<br>
			02. 환불규정
			<br>
			1) 신용카드
			결제 후 3일 이내 취소 시 승인 취소되며, 3일 이후 매입 취소시 영업일 기준 3~5일 소요됩니다.<br>
			2) 체크카드
			결제 후 3일 이내 취소 시 당일 카드사에서 환불처리되며, 3일 이후 매입 취소 시 카드사에 따라 3~10일 소요됩니다.
			<br>
			3) 휴대폰 결제
			결제 일자 기준 당월(1일~말일)취소만 가능하며, 익월 취소 관련 문의는 CGV고객센터(1544-1122)를 통해 확인 후   3~10일 이내 환불됩니다.
			※ 당일 취소가 원칙이나 현장(매표소)에서 취소할 경우 익일 환불처리 될 수 있습니다.
			<br>
			4) 카카오페이
			카카오페이머니를 사용하신 경우 각각의 잔액으로 원복되며, 카드 결제를 하신 경우는 카드사 정책에 따라 승인취소가 진행되며 3일 이후 매입 취소시 영업일 기준 3~10일 소요됩니다.
			<br>
			5) PAYCO
			PAYCO 쿠폰/포인트를 사용하신 경우 각각의 쿠폰/포인트로 원복되며 쿠폰의 경우 조건에 따라 재사용이 불가 할 수 있습니다. 카드 결제금액은 카드사 정책에 따라 승인취소가 진행되며 3일 이후 매입 취소시 영업일 기준 3~10일 소요됩니다.
			<br>
			6) 계좌이체
			결제일 기준 결제 당일~7일 이내 예매 취소 시 은행 별 기준은 아래와 같습니다.
			①  예매 취소 후 즉시 환급되는 은행
			  : 신한, 우체국, 전북, 경남, 광주, 대구, 새마을, 제주
			② 예매 취소 후 3~5일 이내 환급되는 은행
			  : 농협, 부산, SC제일은행, 우리은행, 그 外 기타 은행 (KEB하나은행/KB국민은행/씨티은행 등)
			③ 결제일 기준 7일 이후 예매 취소 시
			  :  계좌이체로 결제하신 경우 예매 취소일로부터 7일~10일 이내에 환급
			  ※ 환불에 대한 문의는 은행사에서 확인 가능
			<br>
			03. 분쟁해결
			<br>
			1) 회사는 이용자가 제기하는 정당한 의견이나 불만을 반영하고 그 피해의 보상 등에 관한 처리를 위하여 CGV고객센터(1544-1122)를 설치·운영하고 있습니다.
			2) 회사는 고객센터를 통하여 이용자로부터 제출되는 불만사항 및 의견을 처리합니다.  다만, 신속한 처리가 곤란한 경우에는 이용자에게 그 사유와 처리일정을 즉시 통보합니다.
			3) 전자상거래 분쟁(청약철회등)과 관련한 이용자의 피해구제는 이용약관 및 전자상거래법 등 관련 법령에 따릅니다.</p>
		</div>
		
		<button class="accordion">Q. 티켓을 분실했어요.</button>
		<div class="panel">
		  <p>현장 매표소에서  
			온라인에서 예매한 티켓은 예매번호, 
			현장에서 구매한 티켓은 결제수단(일반적으로 카드) 제시하여 
			본인이 예매하였음을 확인 후, 재발권 가능합니다.
			<br>
			(CJONE 멤버십 적립이 된 상태라면 멤버십정도를 통해서도 예매 경로에 상관없이 확인 가능)
			<br>
			단, 현금 결제의 경우 CJONE 멤버십 적립을 하지 않았다면, 
			본인의 예매 내역인지를 확인할 수 없기에 재발권이 불가하오니, 이용에 불편없으시길 바랍니다.</p>
		</div>
		
		<button class="accordion">Q. 개인정보 이용내역에 대한 안내를 받았어요.</button>
		<div class="panel">
		  <p>개인정보보호법 제39조 8(개인정보 이용내역의 통지) 법률에 따라 년 1회 개인정보 이용내역을 안내해 드리고 있습니다.
			<br>
 

			서비스 이용 여부 및 수신동의 여부와  관계없이 서비스 가입 시 등록한 이메일 주소를 기준으로 발송되는 안내 메일입니다.
			
			자세한 내용은 개인정보 처리방침을 확인해 주시기 바랍니다.​ </p>
		</div>
		<button class="accordion">Q. 관람 등급에 대해서 알고 싶습니다.</button>
		<div class="panel">
		  <p>티켓웨이는 관람등급을 철저히 준수하고 있습니다.<br>

			■ 등급 기준
			  - 전체 관람가 : 모든 연령의 관람객이 관람 할 수 있는 연극/뮤지컬<br>
			  - 12세 관람가 : 만 12세 미만의 관람객은 관람 할 수 없는 연극/뮤지컬 (보호자 동반 시 12세 미만 관람 가능)<br>
			  - 15세 관람가 : 만 15세 미만의 관람객은 관람 할 수 없는 연극/뮤지컬(보호자 동반 시 15세 미만 관람 가능)<br>
			  - 청소년 관람불가 : 만 18세 미만의 관람객은 관람 할 수 없는 연극/뮤지컬
			<br>
			※ 온라인 예매 시 로그인한 예매자의 나이가 연극/뮤지컬 등급에 해당 되지 않을 시 예매/결제 진행 불가
			<br>
			※ 12세/15세 관람가 영화의 경우 입장시 본인 확인이 필요한 관계로 실물 신분증명서(학생증/여권 등) 지참 必
			※ 청소년 관람불가의 경우 입장 시 본인 확인이 필요한 관계로 실물 신분증명서(주민등록증/운전면허증/여권) 지참 必
			   (신분증 사진, PASS 모바일 인증 불가)</p>
		</div>
		<button class="accordion">Q. 연극/뮤지컬 관람도중 개인 물품을 분실했어요.어디가서 찾아야 하나요?</button>
		<div class="panel">
		  <p>분실물의 경우 발견 즉시 현장에서 보관을 진행하고 있으며,
			확인 요청시 본인 확인 후 물품 확인을 도와드리고 있습니다.
			<br>
			영화관 내에서 분실 여부를 확인하신 경우<br>
			즉시 현장 매표소로 방문하시어 문의주시면 습득 여부 확인 및 접수가 가능하며,
			확인 후 안내드리고 있사오니 이 점 참고 부탁드립니다.</p>
		</div>
		<button class="accordion">Q. 개인정보 이용내역에 대한 안내를 받았어요.</button>
		<div class="panel">
		  <p>개인정보보호법 제39조 8(개인정보 이용내역의 통지) 법률에 따라 년 1회 개인정보 이용내역을 안내해 드리고 있습니다.
			<br>
 

			서비스 이용 여부 및 수신동의 여부와  관계없이 서비스 가입 시 등록한 이메일 주소를 기준으로 발송되는 안내 메일입니다.
			
			자세한 내용은 개인정보 처리방침을 확인해 주시기 바랍니다.​ </p>
		</div>
		<div class="row" style="background: linear-gradient(120deg, #dda4cd, #afc3f5); justify-content: center;">
				<a class="btn btn-success btn-lg footer_btn col-6" href="${pageContext.request.contextPath}/notice/qna_main">Q&A</a>
				<a href="${pageContext.request.contextPath}/message/list" class="btn btn-success btn-lg col-6 footer_btn float-right">1대1 문의하기</a>
		</div>
		<script type="text/javascript">
			var acc = document.getElementsByClassName("accordion");
			var i;
	
			for (i = 0; i < acc.length; i++) {
			  acc[i].addEventListener("click", function() {
			    this.classList.toggle("active");
			    var panel = this.nextElementSibling;
			    if (panel.style.maxHeight) {
			      panel.style.maxHeight = null;
			    } else {
			      panel.style.maxHeight = panel.scrollHeight + "px";
			    } 
			  });
			}
		</script>
	</body>
		
</html>