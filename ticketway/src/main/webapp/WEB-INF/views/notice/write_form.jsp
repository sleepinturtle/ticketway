<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>새 소식 등록</title>
		<%@ include file="/WEB-INF/views/header.jsp" %>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/yth.css" type="text/css">
	</head>
	<body>
		<div class="container">
			<div class="mt-4">
				<input id="title" type="text" placeholder="제목을 입력하세요." class="form-control">
				<label for="title" id="title_label" class="write_label"></label>
			</div>
			<hr>
			<div>작 성 자</div>
			<input id="writer" type="text" value="${login_info.mid}" disabled="disabled" class="form-control">
			<hr>
			<div>
				<select id="class_no" name="class_no" class="form-control">
					<option value="공지사항">공지 사항</option>
					<option value="이벤트">이벤트</option>
					<option value="Q&A">Q&A</option>
				</select>
			</div>
			<hr>
			<div>
				<textarea id="cnts" name="cnts" rows="20" class="form-control" placeholder="내용을 입력하세요."></textarea>
				<label for="cnts" id="contents_label" class="write_label"></label>
				<script type="text/javascript">
				CKEDITOR.replace("cnts",{filebrowserUploadUrl:'${pageContext.request.contextPath}/ckfileup?pkgnm=board'});
				</script>
			</div>
			<hr>
			<button id="write_btn" class="btn btn-primary float-right"> 글 작성 완료 </button>
			<a href="${pageContext.request.contextPath}/notice/notice_main">
				<button class="btn btn-warning"> 글 작성 취소 </button>
			</a>
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
						"${pageContext.request.contextPath}/notice/write"
						, {
							title : $("#title").val()
							, mid : $("#writer").val()
							, class_no : $("#class_no").val()
							, cnts : CKEDITOR.instances["cnts"].getData()
						}
						, function(data, status) {
							if(data >= 1){
								alert("게시글이 성공적으로 업로드 되었습니다.");
								location.href="${pageContext.request.contextPath}/notice/notice_main";
							} else if(data <= 0){
								alert("게시글 작성을 실패 하였습니다.");
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