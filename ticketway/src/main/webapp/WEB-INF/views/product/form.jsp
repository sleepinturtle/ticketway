<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		<meta charset="UTF-8">
		<title> 판매자 상품 등록 </title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
		<script src="//cdn.ckeditor.com/4.19.0/full/ckeditor.js"></script>
		<style type="text/css">
		.write_label {
			font-size : 0.7em;
			color : red;
		}
		</style>
	</head>
	<body>
	<%@ include file="/WEB-INF/views/header.jsp" %>
		<hr>
		<h3> 연극 등록 </h3>
		<hr>
		<form id="write_form">
			<table class="table table-hover">
				<tbody>
					<tr>
						<th> 연 극 명  </th>
						<td colspan="3">
							<input type="text" id="prdt_name" name="prdt_name" maxlength="20"
									class="form-control">
							<label for="prdt_name" id="prdt_name_label" class="write_label"></label>
						</td>
					</tr>
					
					
					<tr>
						<th> 감 독 이 름 </th>
						<td>
							${login_info.mid}
						</td>
						<th> 날 짜  등 록</th>
						<td>
							<input type="text" id="qty" name="qty" class="form-control">
							<label for="qty" id="qty_label" class="write_label"></label>
						</td>
					</tr>
					<tr>
						<th> 좌 석 수</th>
						<td>
							<input type="text" id="price" name="price" class="form-control">
							<label for="price" id="price_label" class="write_label"></label>
						</td>
						<th> 극 장 명 </th>
						<td>
							<input type="text" id="discount" name="discount" class="form-control">
							<label for="discount" id="discount_label" class="write_label"></label>
						</td>
					</tr>
					<tr>
						<th> 연 극 이 미 지 (*) </th>
						<td>
							<input type="file" id="thumbnail" name="thumbnail" class="form-control">
							<label for="thumbnail" id="thumbnail_label" class="write_label"></label>
						</td>
						<th> 연 극 상 세 이 미 지 </th>
						<td>
							<input type="file" id="prdt_img" name="prdt_img" class="form-control">
							<label for="prdt_img" id="prdt_img_label" class="write_label"></label>
						</td>
					</tr>
					<tr>
						<th> 연 극 설 명 이 미 지 </th>
						<td>
							<input type="file" id="desc_img" name="desc_img" class="form-control">
							<label for="desc_img" id="desc_img_label" class="write_label"></label>
						</td>
						<th> 연 극 문 서 </th>
						<td>
							<input type="file" id="add_file" name="add_file" class="form-control">
						</td>
					</tr>
					<tr>
						<th> 연 극 내 용  </th>
						<td colspan="3">
							<textarea class="form-contol" id="desc_txt" name="desc_txt"></textarea>
							<script type="text/javascript">
							CKEDITOR.replace("desc_txt");
							</script>
						</td>
					</tr>
				</tbody>
			</table>
		</form>
		<button id="write_btn" class="btn btn-primary float-right"> 연극 등록 완료 </button>
		<a href="${pageContext.request.contextPath}/product/list">
			<button class="btn btn-warning"> 연극 등록 취소 </button>
		</a>
		<hr>
	<%@ include file="/WEB-INF/views/footer.jsp" %>

	<script type="text/javascript">
	let onlyNum = /^[0-9]+$/;

	$(document).ready(function() {
		$("#write_btn").click(function() {

			if( $.trim( $("#prdt_name").val() ) == "" ){
				$("#prdt_name_label").text("상품명을 입력 하세요.");
				return;
			} else { $("#prdt_name_label").text(""); }

			if( $("#qty").val().val() ) == "" ){//허용되지 않은 글자는 null.
				$("#qty_label").text("필수 입력 사항이며, 숫자만 허용 됩니다.");
				return;
			} else { $("#qty_label").text(""); }

			if( $("#price").val().match(onlyNum) == null ){//허용되지 않은 글자는 null.
				$("#price_label").text("필수 입력 사항이며, 숫자만 허용 됩니다.");
				return;
			} else { $("#price_label").text(""); }

			if( $("#discount").val().val() ) == "" ){//허용되지 않은 글자는 null.
				$("#discount_label").text("필수 입력 사항이며, 숫자만 허용 됩니다.");
				return;
			} else { $("#discount_label").text(""); }

			let tmp1 = $("#thumbnail").val().substring($("#thumbnail").val().length-3);
			let tmp1_boolean = (tmp1 == "jpg" || tmp1 == "jpeg" || tmp1 == "gif" || tmp1 == "png"
								|| tmp1 == "JPG" || tmp1 == "JPEG" || tmp1 == "GIF" || tmp1 == "PNG");
			if( $.trim( $("#thumbnail").val() ) == "" || tmp1_boolean == false ){
				$("#thumbnail_label").text("필수 입력 사항이며, jpg/jpeg/gif/png 파일만 허용 됩니다.");
				return;
			} else { $("#thumbnail_label").text(""); }

			let tmp2 = $("#prdt_img").val().substring($("#prdt_img").val().length-3);
			let tmp2_boolean = (tmp2 == "jpg" || tmp2 == "jpeg" || tmp2 == "gif" || tmp2 == "png"
				|| tmp2 == "JPG" || tmp2 == "JPEG" || tmp2 == "GIF" || tmp2 == "PNG");
			if( $.trim( $("#prdt_img").val() ) != "" && tmp2_boolean == false ){
				$("#prdt_img_label").text("상품이미지는 jpg/jpeg/gif/png 파일만 허용 됩니다.");
				return;
			} else { $("#prdt_img_label").text(""); }

			let tmp3 = $("#desc_img").val().substring($("#desc_img").val().length-3);
			let tmp3_boolean = (tmp3 == "jpg" || tmp3 == "jpeg" || tmp3 == "gif" || tmp3 == "png"
				|| tmp3 == "JPG" || tmp3 == "JPEG" || tmp3 == "GIF" || tmp3 == "PNG");
			if( $.trim( $("#desc_img").val() ) != "" && tmp3_boolean == false ){
				$("#desc_img_label").text("상품이미지는 jpg/jpeg/gif/png 파일만 허용 됩니다.");
				return;
			} else { $("#desc_img_label").text(""); }

			let form = new FormData( document.getElementById( "write_form" ) );
			form.append( "description", CKEDITOR.instances.desc_txt.getData() );

			let keys = form.keys();
			for(key of keys) console.log(key);

			let values = form.values();
			for(value of values) console.log(value);

			$.ajax({
					type : "POST"
					, encType : "multipart/form-data"
					, url : "${pageContext.request.contextPath}/product/insert"
					, data : form
					, processData : false
					, contentType : false
					, cache : false
					, success : function(result) {
						alert("상품이 등록 되었습니다.");
						location.href = "${pageContext.request.contextPath}/product/list";
					}//call back function
					, error : function(xhr) {
						alert("잠시 후 다시 시도해 주세요.");
					}//call back function//xhr : xml http request/response
			});//ajax

		});//click
	});//ready
	</script>
 

	</body>
</html>
