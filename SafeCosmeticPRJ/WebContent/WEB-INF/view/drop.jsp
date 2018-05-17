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
<%
	request.setCharacterEncoding("euc-kr");

	String SESSION_USER_ID = CmmUtil.nvl((String) session.getAttribute("session_user_id"));
	String SESSION_USER_NO = CmmUtil.nvl((String) session.getAttribute("session_user_no"));
%>
<!-- Favicons -->
<link rel="apple-touch-icon"
	href="./bootstrap/mainassets/img/kit/free/apple-icon.png">
<link rel="icon" href="./image/pact.png">
<title>Safe Cosmetic</title>
<!--     Fonts and icons     -->
<link rel="stylesheet" type="text/css"
	href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" />
<link rel="stylesheet"
	href="./bootstrap/main/assets/css/material-kit.css">
<!-- Documentation extras -->
<!-- CSS Just for demo purpose, don't include it in your project -->
<link href="./bootstrap/main/assets/assets-for-demo/demo.css"
	rel="stylesheet" />
<!-- iframe removal -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script id="template" type="text/x-handlebars-template">
	<li>
		<span class="mailbox-attachment-icon has-img"><img src="{{imgsrc}}" alt="Attachment"></span>
		<div class="mailbox-attachment-info>
		<a href="{{getLink}}" class="mailbox-attachment-name">{{fileName}}</a>
		<a href="{{fullName}}"
			class="btn btn-default btn-xs pull-right delbtn"><i class="fa fa-fw fa-remove"></i>
		</a>
		</div>
		</i>
</script>
<script>
	window.onload = function() {
	

		var input = document.querySelector('#image_uploads'); //input type="file"
		var preview = document.querySelector('.preview'); //<p>
		var fn = document.querySelector('.fileName'); //input type="text"

		input.style.opacity = 0;

		input.addEventListener('change', updateImageDisplay);

		function updateImageDisplay() {
			while (preview.firstChild) {
				preview.removeChild(preview.firstChild);
			}

			var curFiles = input.files;
			if (curFiles.length === 0) {
				var para = document.createElement('p');
				para.textContent = '선택한 파일이 존재하지 않습니다.';
				preview.appendChild(para);
			} else {
				var list = document.createElement('ol');
				preview.appendChild(list);
				for (var i = 0; i < curFiles.length; i++) {
					var listItem = document.createElement('li');
					var para = document.createElement('p');
					if (validFileType(curFiles[i])) {
						para.textContent = 'File name :' + curFiles[i].name
								+ ', file size :'
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
	width: 500px;
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
	width: 30%;
	height: 30px;
	border-radius: 7px;
	border-color: #e4e2e2;
}
.material-icons{
	position: relative;
	top: 7px;

}
</style>
</head>
<body class="index-page ">
	<div class="main main-raised">
		<div class="section section-basic">
			<div class="container">

				<div class="row">
					<div class="col-md-12 ml-auto mr-auto">
						<form class="form" method="post" action="/drop_proc.do">
						
						<div class="fileBox">
								<input type="text" class="fileName" readonly="readonly">
								<label for="image_uploads" class="btn_file">파일찾기</label> <input
									type="file" id="image_uploads" name="image_uploads"
									accept=".jpg, .jpeg, .png">
							</div>
							<div class="preview">
								<p>선택한 파일이 존재하지 않습니다.</p>
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