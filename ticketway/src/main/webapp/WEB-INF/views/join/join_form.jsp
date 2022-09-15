<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title> 회원 가입 </title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
		<style type="text/css">
		#service_agree_label, #info_agree_label, #mpwd_label, #rempwd_label, #tel1_label, #email1_label {
			color : red;
		}
		</style>
		<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<script type="text/javascript">
		$(document).ready(function() {
			$("#addr_btn").click(function() {

			    new daum.Postcode({
			        oncomplete: function(data) {//data : 다음에서 주는 결과 값.
			        	$("#mpost").val(data.zonecode);
			        	$("#maddr").val(data.address);
			        }//call back function
			    }).open();

			});//click
		});//ready
		</script>
	</head>
	<body>
	<%@ include file="/WEB-INF/views/header.jsp" %>
		<hr>
		<h3> 회원 가입 </h3>
		<hr>
		<table class="table table-hover">
			<tbody>
			
				<tr>
					<th> 아 이 디 </th>
					<td>
						<div class="input-group">
							<input type="text" id="mid" name="mid" maxlength="20" class="form-control">
							<div class="input-group-append">
								<button id="id_btn" class="btn btn-primary"> 아 이 디 중 복 체 크 </button>
							</div>
						</div>
						<label for="mid" id="mid_label"></label>
					</td>
				</tr>
				<tr>
					<th> 이 름  </th>
					<td>
						<div class="input-group">
							<input type="text" id="mname" name="mname" maxlength="20" class="form-control">
						</div>
						<label for="mname" id="mname_label"></label>
					</td>
				</tr>
				<tr>
					<th> 비 밀 번 호 </th>
					<td>
						<input type="password" id="mpwd" name="mpwd" maxlength="20" class="form-control">
						<label for="mpwd" id="mpwd_label"></label>
					</td>
				</tr>
				<tr>
					<th> 비 밀 번 호 확 인 </th>
					<td>
						<input type="password" id="rempwd" name="rempwd" maxlength="20" class="form-control">
						<label for="rempwd" id="rempwd_label"></label>
					</td>
				</tr>
				<tr>
					<th> 전 화 번 호 </th>
					<td>
						<div class="input-group">
								<input type="text" id="tel1" name="tel1" maxlength="3" class="form-control"
									placeholder="010">
							<input type="text" id="tel2" name="tel2" maxlength="4" class="form-control"
									placeholder="1234">
							<input type="text" id="tel3" name="tel3" maxlength="4" class="form-control"
									placeholder="5678">
						</div>
						<label for="tel1" id="tel1_label"></label>
					</td>
				</tr>
				<tr>
					<th> 이 메 일 </th>
					<td>
						<div class="input-group">
							<input type="text" id="email1" name="email1" maxlength="25" class="form-control">
							<span class="input-group-text">@</span>
							<input type="text" id="email2" name="email2" maxlength="25" class="form-control"
									placeholder="naver.com">
						</div>
						<label for="email1" id="email1_label"></label>
					</td>
				</tr>
				<tr>
					<th> 주 소 </th>
					<td>
						<div class="input-group">
							<span class="input-group-text"> 우 편 번 호 </span>
							<input type="text" id="mpost" name="mpost" readonly="readonly"
									class="form-control">
							<button id="addr_btn" class="btn btn-primary"> 주 소 검 색 </button>
						</div>
						<div class="input-group">
							<span class="input-group-text"> 주 소 </span>
							<input type="text" id="maddr" name="maddr" readonly="readonly"
									class="form-control">
						</div>
						<div class="input-group">
							<span class="input-group-text"> 상 세 주 소 </span>
							<input type="text" id="maddr1" name="maddr1" class="form-control">
						</div>
					</td>
				</tr>
				<tr>
			
			</tbody>
		</table>
		<div class="clearfix">
			<button id="join_btn" class="btn btn-primary float-right"> 회 원 가 입 </button>
		</div>
		<hr>
	<%@ include file="/WEB-INF/views/footer.jsp" %>
	<script type="text/javascript">
	let checkedID = "";
	let onlyNum = /^[0-9]+$/;
	let engLowerAndNum = /^[a-z0-9]+$/;
	let onlyPwd = /^[a-z0-9~!@#$%^&*().]+$/;
	let onlyEmail = /^[a-zA-Z0-9.@]+$/;

	$(document).ready(function() {
		$("#join_btn").click(function() {
	
			if( checkedID == "" || checkedID != $("#mid").val() ){
				$("#mid_label").text("아이디 중복 체크를 해 주세요.");
				$("#mid_label").css("color", "red");
				return;
			} else { $("#mid_label").text(""); }

			if( $("#mname").val() == null ){//허용되지 않은 글자는 null.
				$("#mname_label").text("영문 소문자, 숫자, 특수 문자만 허용 됩니다.");
				return;
			} else { $("#mname_label").text(""); }

			if( $("#mpwd").val().match(onlyPwd) == null ){//허용되지 않은 글자는 null.
				$("#mpwd_label").text("영문 소문자, 숫자, 특수 문자만 허용 됩니다.");
				return;
			} else { $("#mpwd_label").text(""); }

			if( $("#mpwd").val() != $("#rempwd").val() ){
				$("#rempwd_label").text("비밀번호와 비밀번호 확인이 서로 다릅니다.");
				return;
			} else { $("#rempwd_label").text(""); }

			let tmpTel1 = $.trim( $("#tel1").val() );
			let tmpTel2 = $.trim( $("#tel2").val() );
			let tmpTel3 = $.trim( $("#tel3").val() );

			if( ( tmpTel1 != "" && tmpTel1.match(onlyNum) == null )
				|| ( tmpTel2 != "" && tmpTel2.match(onlyNum) == null )
				|| ( tmpTel3 != "" && tmpTel3.match(onlyNum) == null ) ){
				$("#tel1_label").text("숫자만 허용 됩니다.");
				return;
			} else { $("#tel1_label").text(""); }

			let tmpEmail1 = $.trim( $("#email1").val() );
			let tmpEmail2 = $.trim( $("#email2").val() );

			if( ( tmpEmail1 != "" && tmpEmail1.match(onlyEmail) == null )
				|| ( tmpEmail2 != "" && tmpEmail2.match(onlyEmail) == null ) ){
				$("#email1_label").text("영문 대소문자와 숫자 . @만 허용 됩니다.");
				return;
			} else { $("#email1_label").text(""); }

			$.post(
					"${pageContext.request.contextPath}/join/"
					, {
						
						 mid : $("#mid").val()
						, mname : $("#mname").val()
						, mpwd : $("#mpwd").val()
						, tel1 : $("#tel1").val()
						, tel2 : $("#tel2").val()
						, tel3 : $("#tel3").val()
						, email1 : $("#email1").val()
						, email2 : $("#email2").val()
						, mpost : $("#mpost").val()
						, maddr : $("#maddr").val()
						, maddr1 : $("#maddr1").val()
						
					}
					, function(data, status) {
						if(data == 1){
							alert("회원 가입에 성공 하셨습니다. 로그인 해주세요.");
							location.href="${pageContext.request.contextPath}/login_form";
						} else {
							alert("잠시 후 다시 시도해 주세요.");
						}
					}//call back function
			);//post

		});//click
	});//ready

	$(document).ready(function() {
		$("#id_btn").click(function() {

			if( $.trim( $("#mid").val() ) == "" ){
				return;
			}
			if( $("#mid").val().match(engLowerAndNum) == null ){//허용되지 않은 글자는 null.
				$("#mid_label").text("영문 소문자와 숫자만 허용 됩니다.");
				return;
			} else { $("#mid_label").text(""); }

			$.get(
					"${pageContext.request.contextPath}/join/id_chk"
					, { mid : $("#mid").val() }
					, function(data, status) {
						if(data == 0){
							$("#mid_label").text("사용 가능한 아이디 입니다.");
							$("#mid_label").css("color", "blue");
							checkedID = $("#mid").val();
						} else if(data >= 1){
							$("#mid_label").text("이미 사용 중인 아이디 입니다.");
							$("#mid_label").css("color", "red");
						} else {
							alert("잠시 후 다시 시도해 주세요.");
						}
					}//call back function
			);//get

		});//click
	});//ready
	</script>
	</body>
</html>













