<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ page import="com.health.util.CmmUtil" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" name="viewport" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
      <!-- Bootstrap core CSS-->
  <link href="./bootstrap/common/vendor/bootstrap/css/bootstrap.css" rel="stylesheet">
  <!-- Custom fonts for this template-->
  <link href="./bootstrap/common/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
  <!-- Custom styles for this template-->
    <jsp:include page="/WEB-INF/view/top.jsp" flush="false"></jsp:include>
    <style>
    #button {
	background-color:rgb(197, 224, 180);
	color:white;
	border-style:none;
	border-radius: 10px;
	width:300px;
	height:50px;
	font-size:20px;
	font-weight:bold;
	}
	div#image{
	display:inline;
	}
	
	label#inline{
	display:inline;
	}
    </style>
     <script type="text/javascript" src="http://code.jquery.com/jquery-2.1.0.min.js"></script>
    <script>
 

    </script>
    <style>
    #inline {
	display: inline-block;
	position: absolute;
	top: 120px;
	left: 450px;
}
#w {
	height:300px;
	width: 400px;
	display: inline-block;
	border:solid #ecebeb 1px
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
	vertical-align: middle;
	position: relative;
    top: 5px;
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
#focus:focus{
	border-color:#7b9e03;
	box-shadow:0 0 0 0.2rem #7b9e0359;
}
#focus::placeholder{
	color:#aeafb1;
}
    </style>
    <script src="./bootstrap/js/jquery-3.3.1.min.js"></script>
    <script>
    window.onload = function() {
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
						para.textContent = '<미리보기> : File name - ' + curFiles[i].name
								+ ', file size - '
								+ returnFileSize(curFiles[i].size) + '.';
						var image = document.createElement('img');
						image.src = window.URL.createObjectURL(curFiles[i]);
						image.setAttribute('width', '100px');
						image.setAttribute('height', '100px');
						fn.value = curFiles[i].name
						//list.appendChild(para);
						list.appendChild(image);
						$("#show_me").show();
					} else {
						para.textContent = 'File name '
								+ curFiles[i].name
								+ ': Not a valid file type. Update your selection.';
						listItem.appendChild(para);
					}
					//list.appendChild(listItem);
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
    };
  //현재 이미지 삭제
    function drop(){
    	var fn = document.querySelector('.fileName');
    	fn.value = "";
    	//var input = document.querySelector('#image_uploads');
    	//input.clear();
    	$("#image_uploads").val("");
    	//$('.preview').removeChild();
    	//document.getElementById("image_uploads").value = "";
    	//document.getElementById("fileName").value = "";
    	var pr = document.querySelector(".preview");
    	while ( pr.hasChildNodes() ) {
    		pr.removeChild( pr.firstChild ); 
    		} 
    	$("#show_me").hide();
  		}
    </script>
    <script>
    function doSubmit(form) { //전송시 유효성 체크
	    if (form.titles.value == "") {
	        alert("제목을 입력해주세요.");
	        form.titles.focus();
	        return false;
	     }
	    if (calBytes(form.titles.value) > 100) {
			alert("제목은 최대 100Bytes까지만 입력 가능합니다.");
			form.titles.focus();
			return false;
		}
	    if (form.contents.value == "") {
	        alert("내용을 입력해주세요.");
	        form.contents.focus();
	        return false;
	     }
	    if (calBytes(form.contents.value) > 4000) {
			alert("내용은 최대 4000Bytes까지만 입력 가능합니다.");
			form.contents.focus();
			return false;
		}
    }
    function calBytes(str) {
		var tcount = 0;
		var tmpStr = new String(str);
		var strCnt = tmpStr.length;
		var onechar;
		for (i=0;i<strCnt;i++) {
			onechar = tmpStr.charAt(i);
			if (escape(onechar).length > 4) {
				tcount += 2;
			} else {
				tcount += 1;
			}
		}
		return tcount;
	}	
    </script>
</head>
<body class="index-page ">
<div class="main main-raised">
        <div class="section section-basic">
             <div class="container">
                <div class="row">
                    <div class="col-md-12 ml-auto mr-auto" style="margin:0 auto">
                    <form class="form" method="post" action="/boardReg_proc.do" enctype="multipart/form-data" onsubmit="return doSubmit(this);">
                    
				    	<div class="form-group" style="left: 10%;">
				    	
			            	<input class="form-control" id="exampleInputEmail1" name="titles" id="titles" type="text" maxlength="50" aria-describedby="emailHelp" placeholder="&nbsp;Enter a title" style="text-decoration:none;border: solid 0.1px #d2d2d2;width:50%;background-image:none">
			          		<br/><div class="preview" ></div>
			          	<div class="fileBox">
								<input type="text" class="fileName" readonly="readonly">
								<a onclick='drop();' style="display:none" id="show_me"><i class='material-icons' style='position:relative;top:2px;left:-2px;cursor:pointer'>clear</i></a>
								<label for="image_uploads" class="btn_file">파일찾기</label> 
								<input type="file" id="image_uploads" name="upfile" accept=".jpg, .jpeg, .png" style="display:none">
						</div>
			          	 <br>
						<textarea name="contents" cols="100%" rows="20" maxlength="2000" style="resize:none;border-color:#ced4da" id="focus"placeholder="&nbsp;Enter a contents"></textarea>
						</div>
							<div class="card-header card-header-primary text-center" style="border-bottom:0px">
				           <input type="button" value="목록으로" class="btn" style="width:150px" id="button" onclick="location.href='/boardList.do'">
				           <input type="submit" value="등록하기" class="btn" style="width:150px" id="button">
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