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
    </style>
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
						para.textContent = '[File name : ' + curFiles[i].name
								+ ', file size : '
								+ returnFileSize(curFiles[i].size) + '.]';
						var image = document.createElement('img');
						image.src = window.URL.createObjectURL(curFiles[i]);
						fn.value = curFiles[i].name
						list.appendChild(image);
						list.appendChild(para);
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
    
    </script>
</head>
<body class="index-page ">
<div class="main main-raised">
        <div class="section section-basic">
             <div class="container">

                <div class="row">
                    <div class="col-md-12 ml-auto mr-auto" style="margin:0 auto">
                    <form class="form" method="post" action="/boardReg_proc.do" enctype="multipart/form-data">
                    
				    	<div class="form-group" style="left: 10%;">
				    	
			            	<input class="form-control" id="exampleInputEmail1" name="titles" type="text" aria-describedby="emailHelp" placeholder="&nbsp;Enter a title" style="text-decoration:none;border: solid 0.1px #d2d2d2;width:50%">
			          		<br/><div class="preview" ></div>
			          	<div class="fileBox">
								<input type="text" class="fileName" readonly="readonly">
								<label for="image_uploads" class="btn_file">파일찾기</label> 
								<input type="file" id="image_uploads" name="imgFile" accept=".jpg, .jpeg, .png" style="display:none">
						</div>
			          	 <br>
						<textarea name="contents" cols="100%" rows="10" style="resize:none;border-color:#ced4da"></textarea>
						</div>
							
							<div class="card-header card-header-primary text-center" style="border-bottom:0px">
				           <input type="reset" value="다시 작성" class="btn" style="width:150px" id="button">
				           <input type="submit" value="등록" class="btn" style="width:150px" id="button">
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