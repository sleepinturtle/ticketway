<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		<meta charset="UTF-8">
		<title> 글 수정하기 </title>
		<%@ include file="/WEB-INF/views/header.jsp" %>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/yth.css" type="text/css">	</head>
	<body>
	
		<div class="container">
		<table class="table table-hover">
			<tbody>
				<tr>
					<th> 제목 </th>
					<td>
						<input type="text" id="title" name="title" maxlength="20"
								class="form-control" value="${detail_dto.title}">
						<label for="title" id="title_label" class="write_label"></label>
					</td>
				</tr>
				<tr>
					<th> 작 성 자 </th>
					<td>
						${login_info.mid}
					</td>
				</tr>
				<tr>
					<th> 내 용 </th>
					<td>
						<textarea class="form-contol" id="cnts" name="cnts">${detail_dto.qna_cnts}</textarea>
						<script type="text/javascript">
						CKEDITOR.replace("cnts",{filebrowserUploadUrl:'${pageContext.request.contextPath}/ckfileup?pkgnm=board'});
						</script>
						<label for="cnts" id="contents_label" class="write_label"></label>
					</td>
				</tr>
			</tbody>
		</table>
		
		<button id="write_btn" class="btn btn-primary float-right"> 글 수정 완료 </button>
		<a href="${pageContext.request.contextPath}/notice/qnadetail?qna_no=${detail_dto.qna_no}">
			<button class="btn btn-warning"> 글 수정 취소 </button>
		</a>
		<hr>
		</div>
	<script type="text/javascript">
	$(document).ready(function() {
		$("#write_btn").click(function() {

			if( $.trim( $("#title").val() ) == "" ){
				$("#title_label").text("제목을 입력 하세요.");
				return;
			}

			if( CKEDITOR.instances["cnts"].getData() == "" ){
				$("#contents_label").text("내용을 입력 하세요.");
				return;
			}

			$.post(
					"${pageContext.request.contextPath}/notice/qnaupdate"
					, {
						qna_no : ${detail_dto.qna_no}
						, title : $("#title").val()
						, qna_cnts : CKEDITOR.instances.cnts.getData()
					}
					, function(data, status) {
						if(data >= 1){
							alert("게시글을 수정 하였습니다.");
							location.href="${pageContext.request.contextPath}/notice/qnadetail?qna_no=${detail_dto.qna_no}";
						} else if(data <= 0){
							alert("게시글 수정을 실패 하였습니다.");
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
