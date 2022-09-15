<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		<meta charset="UTF-8">
		<title> 멤버 게시판 글 쓰기 </title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
	
		<style type="text/css">
   		
   		* {
			margin: 0 auto;
			padding: 0;
		}
	
		
		h1 { 
		text-align : center; 
		
		}
		
		h3 { 
		text-align : center; 
		
		}
		
		h5 { 
		text-align : center; 
		
		}
		
		h6 { 
		text-align : center; 
		
		}
		
		#bar_search {
		width:700px;
		height:70px;
		font-size:15px;
		
		}
		
		#btn_search {
		width:110px;
		height:38px;
		}
		
		th { 
		text-align : center; 
		
		}
		
		td { 
		text-align : center; 
		width:3%;
		
		}
		
	</style>
		
	</head>
	
	<body>
	<%@ include file="/WEB-INF/views/header.jsp" %>
		<br><br><br><br><br><br><br>
		
		                        <h1 style="font-family:Georgia;">  message room </h1>
								<h5 style="font-family:Georgia;">  your nick : ${dto_from_list.send_mid}  </h5>
								<h6 style="font-family:Georgia;">  Opponent nick : ${dto_from_list.recv_mid}  </h6>
								<input type="hidden" id="room" name="room" value="${dto_from_list.room}">
								<input type="hidden" id="send_mno" name="send_mno" value="${dto_from_list.send_mno}">
								<input type="hidden" id="recv_mno" name="recv_mno" value="${dto_from_list.recv_mno}">
								<input type="hidden" id="send_mid" name="send_mid" value="${dto_from_list.send_mid}">
								<input type="hidden" id="recv_mid" name="recv_mid" value="${dto_from_list.recv_mid}">
								
		<br><br><br><br>
		<p align="middle">
				<iframe src="${pageContext.request.contextPath}/message/chat_list?room=${dto_from_list.room}&memo=${dto_from_list.memo}&send_mno=${dto_from_list.send_mno}&recv_mno=${dto_from_list.recv_mno}&send_mid=${dto_from_list.send_mid}&recv_mid=${dto_from_list.recv_mid}" title="test"
				width="80%" height="500" frameborder=0 framespacing=0 marginheight=0 marginwidth=0 vspace=0></iframe>

			
		</p>
		<div>
				<table class="table table-hover">
					<tbody>
						<col class="w-10">
						<tr>
							<td colspan="5" class="text-center">
								<input type="text" class="form-control-sm" id="content" name="content" maxlength="20">
							   	<label for="content" id="content_label" class="write_label"></label>
								<button id="write_btn" type="button" class="btn btn-dark btn-lg"> 보내기 </button>
							</td>
						</tr>
					</tbody>
				</table>
		</div>
		
	
		
	
	<%@ include file="/WEB-INF/views/footer.jsp" %>
	<script type="text/javascript">
	$(document).ready(function() {
		$("#write_btn").click(function() {
			if( $.trim( $("#content").val() ) == "" ){
				return;
			} else { $("#content_label").text(""); }

			$.post(
					"${pageContext.request.contextPath}/message/chat"
					, {
						  room : $("#room").val()
							, send_mno : $("#send_mno").val()
							, recv_mno: $("#recv_mno").val()
							, send_mid : $("#send_mid").val()
							, recv_mid: $("#recv_mid").val()
					        , content : $("#content").val()
						
					}
					, function(data, status) {
						if(data >= 1){
							alert("쪽지를 등록 하였습니다.");
							//location.href="${pageContext.request.contextPath}/message/write_form"
							window.location.reload();
						} else if(data <= 0){
							alert("주소 등록을 실패 하였습니다.");
						} else {
							alert("잠시 후 다시 시도해 주세요.");
						}
					}//call back function
			);//post

		});//click
	});//ready
	</script>
	
	
	
	</body>
</html>