<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.health.util.CmmUtil" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" name="viewport" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
      <%
    request.setCharacterEncoding("euc-kr");

    String SESSION_USER_ID = CmmUtil.nvl((String)session.getAttribute("session_user_id"));
    String SESSION_USER_NO = CmmUtil.nvl((String)session.getAttribute("session_user_no"));
    String SESSION_AUTH = CmmUtil.nvl((String)session.getAttribute("session_auth"));
    %>
    <!-- Favicons -->
    <link rel="apple-touch-icon" href="./bootstrap/mainassets/img/kit/free/apple-icon.png">
    <link rel="icon" href="./image/pact.png">
    <title>
        Safe Cosmetic
    </title>
    <!--     Fonts and icons     -->
    <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" />
    <link rel="stylesheet" href="./bootstrap/main/assets/css/material-kit.css">
    <!-- Documentation extras -->
    <!-- CSS Just for demo purpose, don't include it in your project -->
    <link href="./bootstrap/main/assets/assets-for-demo/demo.css" rel="stylesheet" />
    <!-- iframe removal -->
    <style>
    #button {
	background-color:rgb(197, 224, 180);
	color:white;
	border-style:none;
	border-radius: 10px;
	width:300px;
	height:50px;
	font-size:20px;
	}
	
	label{
	color:black;
	font-size:4px;
	
	}
    </style>
        <script>
    window.onload = function(){
    	var email = document.getElementById("email");
    	email.focus();
    };
    
	function doSubmit(f1) {
		if (f1.email.value == "") {
			alert("이메일을 입력하시기 바랍니다.");
			f1.email.focus();
			return false;
		}
	}
	function doSubmit(f2) {
		if (f2.email.value == "") {
			alert("이메일을 입력하시기 바랍니다.");
			f2.email.focus();
			return false;
		}
		if (f2.user_id.value == "") {
			alert("아이디를 입력하시기 바랍니다.");
			f2.user_id.focus();
			return false;
		}
	}
	
	//Id 이메일 체크
	function emailCheck() {
		var email = document.getElementById('email');
		var blank = /[\s]/gi;
		if (blank.test(email.value) == true) {
			alert('공백은 사용할 수 없습니다');
			email.value = "";
			return false;
		}
		var special = /[`~!\#$%<>^&*\()\-=+_\’:;]/gi;
		if (special.test(email.value) == true) {
			alert('특수문자는 사용이 불가능합니다');
			email.value = "";
			return false;
		}
		var hangle = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힝]/gi;
		if (hangle.test(email.value) == true) {
			alert('한글은 사용이 불가능합니다');
			email.value = "";
			return false;
		}
	}
	//PW 이메일 체크
	function pw_emailCheck() {
		var email = document.getElementById('pw_email');
		var blank = /[\s]/gi;
		if (blank.test(email.value) == true) {
			alert('공백은 사용할 수 없습니다');
			email.value = "";
			return false;
		}
		var special = /[`~!\#$%<>^&*\()\-=+_\’:;]/gi;
		if (special.test(email.value) == true) {
			alert('특수문자는 사용이 불가능합니다');
			email.value = "";
			return false;
		}
		var hangle = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힝]/gi;
		if (hangle.test(email.value) == true) {
			alert('한글은 사용이 불가능합니다');
			email.value = "";
			return false;
		}
	}
	//아이디 체크
	function Id() {
		var id = document.getElementById('user_id');
		var blank = /[\s]/gi;
		if (blank.test(id.value) == true) {
			alert('공백은 사용할 수 없습니다');
			id.value = "";
			return false;
		}
		var special = /[`~!\#$%<>^&*\()\-=+_\’:;]/gi;
		if (special.test(id.value) == true) {
			alert('특수문자는 사용이 불가능합니다');
			id.value = "";
			return false;
		}
		var hangle = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힝]/gi;
		if (hangle.test(id.value) == true) {
			alert('한글은 사용이 불가능합니다');
			id.value = "";
			return false;
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
                    <div class="col-md-6 ml-auto mr-auto">
                        <div class="card card-signup">
                                <div class="card-header card-header-primary text-center">
                                    <h3>아이디/비밀번호 찾기</h3>
                                    
                                </div>
                                <p class="text-divider"></p>
                                <div class="card-body">
                                <form class="form" name="f1" id="f1" method="post" action="/idSearch_proc.do" onsubmit="return doSubmit(this);">
                                    <div class="input-group">
                                        <input type="email" class="form-control" placeholder="Email" id="email" name="email" maxlength="50" onkeydown="emailCheck()">
                                    </div>
                                    <div class="card-footer justify-content-center">
                                    	<input type="submit" value="ID SEARCH" id="button" >
                                    </div>
                                    </form>
                                    <form class="form" name="f2" id="f2" method="post" action="/pwSearch.do" onsubmit="return doSubmit(this);">
                                    <div class="input-group">
                                        <input type="text" class="form-control" placeholder="ID" name="user_id" id="user_id" onkeydown="Id()" maxlength="20">
                                    </div>
                                    <div class="input-group">
                                         <input type="email" class="form-control" placeholder="Email" name="email" id="pw_email" maxlength="50" onkeydown="pw_emailCheck()">
                                    </div>
                                    <div class="card-footer justify-content-center">
                                     <input type="submit" value="PASSWORD SEARCH" id="button">
                                     </div>
                                     </form>
                                     <div class="card-footer justify-content-center">
                                     <label>* 회원가입 시 등록한 E-mail 정보를 입력하여 ID와 비밀번호를 메일로 받으실 수 있습니다.
                                     </label>
                                     </div>
                                   </div>

                        </div>
                    </div>
                </div>
            </div>
    </div>
	</div>
</body>
<jsp:include page="/WEB-INF/view/footer.jsp" flush="false"></jsp:include>
</html>