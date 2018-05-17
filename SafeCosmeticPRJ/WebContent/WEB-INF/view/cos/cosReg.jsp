<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.health.util.CmmUtil"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0"
	name="viewport" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<!-- Bootstrap core CSS-->
<link href="./bootstrap/common/vendor/bootstrap/css/bootstrap.css"
	rel="stylesheet">
<!-- Custom styles for this template-->
<link href="./bootstrap/common/css/sb-admin.css" rel="stylesheet">
<!-- Bootstrap core CSS-->
<link href="./bootstrap/common/vendor/bootstrap/css/bootstrap.css"
	rel="stylesheet">
<!-- Custom fonts for this template-->
<link
	href="./bootstrap/common/vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<!-- Custom styles for this template-->
<style>
#button {
	background-color: rgb(197, 224, 180);
	color: white;
	border-style: none;
	width: 300px;
	height: 50px;
	font-size: 20px;
	font-weight: bold;
}

#exampleInputEmail1 {
	display: inline;
}

.fileBox .fileName {
	display: inline-block;
	width: 50%;
	height: 30px;
	padding-left: 10px;
	margin-right: 5px;
	line-height: 30px;
	border: 1px solid #dee2e6;
	background-color: #fff;
	vertical-align: middle
}

.fileBox .btn_file {
	display: inline-block;
	border: 1px solid #dee2e6;
	width: 100px;
	height: 30px;
	font-size: 0.8em;
	line-height: 30px;
	text-align: center;
	vertical-align: middle
}

.fileBox input[type="file"] {
	position: absolute;
	width: 1px;
	height: 1px;
	padding: 0;
	margin: -1px;
	overflow: hidden;
	clip: rect(0, 0, 0, 0);
	border: 0
}
#btn, #del_btn{
    background-color: gainsboro;
}
#selectbox {
	width: 35%;
	height: 30px;
	border-radius: 7px;
	border-color: #e4e2e2;
}
.material-icons{
	position: relative;
	top: 7px;

}
.card-header card-header-p3.rimary text-center {
	border-bottom: 0;
}
</style>
<script>
	window.onload = function() {
		var btn = document.getElementById("btn");
		var add = document.getElementById("add");
		var del_btn = document.getElementById("del_btn");

		btn.onclick = function() {
			var newDIV = document.createElement("div");

			newDIV.innerHTML = "<input class='form-control' id='exampleInputEmail2' type='text' name='ing_name' aria-describedby='emailHelp'>";
			newDIV.setAttribute("class", "form-group");
			newDIV.setAttribute("id", "del");
			add.appendChild(newDIV);

		}
		del_btn.onclick = function() {
			var del = document.getElementById("del");
			var parent = del.parentElement;

			parent.removeChild(del);
		}
		var input = document.querySelector('#image_uploads');
		var preview = document.querySelector('.preview');
		var fn = document.querySelector('.fileName');

		input.style.opacity = 0;

		input.addEventListener('change', updateImageDisplay);

		function updateImageDisplay() {
			while (preview.firstChild) {
				preview.removeChild(preview.firstChild);
			}

			var curFiles = input.files;
			if (curFiles.length === 0) {
				var para = document.createElement('p');
				para.textContent = 'No files currently selected for upload';
				preview.appendChild(para);
			} else {
				var list = document.createElement('ol');
				preview.appendChild(list);
				for (var i = 0; i < curFiles.length; i++) {
					var listItem = document.createElement('li');
					var para = document.createElement('p');
					if (validFileType(curFiles[i])) {
						para.textContent = 'File name ' + curFiles[i].name
								+ ', file size '
								+ returnFileSize(curFiles[i].size) + '.';
						var image = document.createElement('img');
						image.src = window.URL.createObjectURL(curFiles[i]);
						fn.value = curFiles[i].name

						listItem.appendChild(image);
						listItem.appendChild(para);

					} else {
						para.textContent = 'File name '
								+ curFiles[i].name
								+ ': Not a valid file type. Update your selection.';
						listItem.appendChild(para);
					}

					list.appendChild(listItem);
				}
			}
		}

		var fileTypes = [ 'image/jpeg', 'image/pjpeg', 'image/png' ]

		function validFileType(file) {
			for (var i = 0; i < fileTypes.length; i++) {
				if (file.type === fileTypes[i]) {
					return true;
				}
			}

			return false;
		}

		function returnFileSize(number) {
			if (number < 1024) {
				return number + 'bytes';
			} else if (number > 1024 && number < 1048576) {
				return (number / 1024).toFixed(1) + 'KB';
			} else if (number > 1048576) {
				return (number / 1048576).toFixed(1) + 'MB';
			}
		}
	}
</script>
<jsp:include page="/WEB-INF/view/top.jsp" flush="false"></jsp:include>
</head>
<body class="index-page ">
	<div class="main main-raised">
		<div class="section section-basic">
			<div class="container">
				<div class="row">
					<div class="col-md-12 ml-auto mr-auto">
						<h3>화장품 등록</h3>
						<hr>
						<form class="form" method="post" action="/cosReg_proc.do">
							<div class="form-group" style="width: 50%">
								<label for="exampleInputEmail1">카테고리분류</label> &ensp; 
								<select name="cos_type" id="selectbox">
									<option style="background: #cdd0c3;">선택</option>
									<option style="background: #cdd0c3;">기초화장품</option>
									<option value="skin">스킨토너</option>
									<option value="lotion">로션/에멀젼/에센스</option>
									<option value="cream">크림/오일</option>
									<option value="mask">팩, 마스크</option>
									<option value="sunblock">자외선차단제</option>
									<option style="background: #cdd0c3;" value="0">메이크업</option>
									<option value="makeup_base">메이크업 베이스</option>
									<option value="powder">파우더</option>
									<option value="foundation">파운데이션</option>
									<option value="blusher">블러셔</option>
									<option value="eyeliner">아이라이너</option>
									<option value="eyeshadow">아이셰도우</option>
									<option value="eyebrow">아이브로우</option>
									<option value="mascara">마스카라</option>
									<option value="lipstick">립스틱</option>
									<option value="lip_gloss">립글로즈, 립밤</option>
									<option style="background: #cdd0c3;" value="0">클렌징</option>
									<option value="remover">립&아이리무버</option>
									<option value="Cleansing_foam">클렌징폼</option>
									<option value="cleansing_cream">클렌징크림</option>
									<option value="cleansing_oil">클렌징오일/워터</option>
									<option style="background: #cdd0c3;" value="0">바디제품</option>
									<option value="body_lotion">바디로션</option>
									<option value="body_oil">바디오일</option>
									<option value="body_wash">바디워시</option>
								</select>
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">브랜드명</label> <input
									class="form-control" id="exampleInputEmail1" type="text"
									name="brand" aria-describedby="emailHelp">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">품명</label> <input
									class="form-control" id="exampleInputEmail1" type="text"
									name="cos_name" aria-describedby="emailHelp">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">가격</label> <input
									class="form-control" id="exampleInputEmail1" type="text"
									name="price" aria-describedby="emailHelp">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">성분</label> <input
									class="form-control" id="exampleInputEmail1" type="text" name="ing_name"
									aria-describedby="emailHelp">&ensp; 
									<input type="button" value="추가하기" class="btn" id="btn" > 
									<input type="button" value="삭제하기" class="btn" id="del_btn">
							</div>
							<div id="add"></div>
							<label for="exampleInputEmail1">이미지추가</label>
							<div class="fileBox">
								<input type="text" class="fileName" readonly="readonly">
								<label for="image_uploads" class="btn_file">파일찾기</label> <input
									type="file" id="image_uploads" name="image_uploads"
									accept=".jpg, .jpeg, .png">
							</div>
							<div class="preview">
								<p><i class="material-icons">report_problem</i>선택한 파일이 존재하지 않습니다.</p>
							</div>
							<div class="card-header card-header-primary text-center">
								<input type="submit" value="등록" class="btn" style="width: 150px" id="button">
								<input type="button" value="취소" class="btn" style="width: 150px" id="button">
							</div>
							</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<jsp:include page="/WEB-INF/view/footer.jsp" flush="false"></jsp:include>
</html>