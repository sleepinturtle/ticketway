<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>QnA 상세정보</title>
		<%@ include file="/WEB-INF/views/header.jsp" %>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/yth.css" type="text/css">
	<body>
		
		<div class="container" style="position: relative;">
		<a id="up_btn" href="${pageContext.request.contextPath}/notice/qnaupdate_form?qna_no=${detail_dto.qna_no}"><button id="u-btn" class="btn btn-info float-right">수정하기</button></a>
			   <table class="table table-hover">
			   		<tbody>
			   			<tr>
			   				<th>작성자</th>
			   				<td>
			   					<div>
			   						${detail_dto.mid}
			   					</div>
			   				</td>
			   					
			   			</tr>
			   			<tr>
			   				<th>질문 번호</th>
			   				<td>
			   					<div>
			   						${detail_dto.qna_no}
			   					</div>
			   				</td>
			   					
			   			</tr>
			   			<tr>
			   				<th>질문 일자</th>
			   				<td>
				   				<div>
				   					${detail_dto.qna_date}
			   					</div>
			   				</td>
			   			</tr>
			   			
			   			<tr>
				   			<th>제목</th>
				   			<td>${detail_dto.title}</td>
			   			</tr>
			   			
			   			<tr>
			   				<th>내용</th>
			   				<td>${detail_dto.qna_cnts}</td>
			   			</tr>
			   		</tbody>
			   </table>
			   <table id="cmt_table" class="table table-hover">
			   		<thead>
			   			<tr>
			   				<th>
			   					답변
			   				</th>
			   			</tr>
			   		</thead>
			   		<tbody>
			   			<tr>
				   			<td>
					   			<textarea id="cnts" class="form-control"></textarea>
					   			<script type="text/javascript">
									CKEDITOR.replace('cnts');
								</script>
				   			</td>
				   			<td><button class="btn btn-primary float-right" id="reply_btn">답변하기</button></td>
			   			</tr>
			   		</tbody>
			   </table>
			   <hr>
			   
			   
			   <a href="${pageContext.request.contextPath}/notice/qna_main"><button class="btn btn-warning">목록으로 가기</button></a>
			  <button id="d_btn" class="btn btn-danger float-right">삭제하기</button>
			   <hr>	
			   <table id="replylist" class="table table-hover">
					<thead>
						
						<tr>
							<th> 글번호 </th> <th>작성자</th> 	<th> 내용 </th>	<th> 작성일자 </th>
							<td><a id="gochat" href="${pageContext.request.contextPath}/message/list" class="btn btn-info">1 대 1 문의하러 가기</a></td>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="dto" items="${replylist}">
							<tr>
								<td>${dto.cmt_no}</td>
								<td>${dto.mid}</td>
								<td>${dto.rply_cnts}</td>
								<td>${dto.rply_date}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				
		</div>
	</body>
	<script type="text/javascript">
	$(document).ready(function() {
		$("#d_btn").hide();
		$("#up_btn").hide();
		$("#cmt_table").show();
		
		if(${login_info.mgr_yn == 1}){
			$("#d_btn").show();
			$("#up_btn").show();
			$("#cmt_table").show();
			$("#gochat").hide();
		}
		if(${login_info.mgr_yn == 0}){
			
			$("#cmt_table").hide();
		}
		if(${login_info == null}){
			$("#up_btn").hide();
			$("#d_btn").hide();
		}
		if(${login_info.mno == detail_dto.mno}){
			$("#up_btn").show();
			$("#d_btn").show();
		}
		if(${login_info.mno != detail_dto.mno}){
			$("#up_btn").hide();
			$("#d_btn").hide();
		}
		
		
		
		$("#d_btn").click(function() {
			
			$.get(
					"${pageContext.request.contextPath}/notice/qnadelete"
					, {
						qna_no : ${detail_dto.qna_no}
					}
					, function(data, status) {
						if( data >= 1 ){
							alert("게시글이 삭제 되었습니다.");
							location.href="${pageContext.request.contextPath}/notice/qna_main";
						} else if( data <= 0 ) {
							alert("게시글 삭제를 실패 하였습니다.");
						} else {
							alert("잠시 후 다시 시도해 주세요.");
						}
					}//call back function
			);//get
		});//click
		
		$("#reply_btn").click(function() {
					
					$.get(
							"${pageContext.request.contextPath}/notice/reply_insert"
							, {
								qna_no : ${detail_dto.qna_no}
								, rply_cnts : CKEDITOR.instances["cnts"].getData()
							}
							, function(data, status) {
								if( data >= 1 ){
									alert("댓글이 등록 되었습니다.");
									location.href="${pageContext.request.contextPath}/notice/qna_main";
								} else if( data <= 0 ) {
									alert("댓글 등록 실패하였습니다.");
								} else {
									alert("잠시 후 다시 시도해 주세요.");
								}
							}//call back function
					);//get
				});//click
		
		
	});
	
	</script>
</html>