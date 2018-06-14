<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
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
	font-weight:bold;
	}
	
	label{
	color:black;
	font-size:4px;
	
	}
    </style>
    
	<script>
    window.onload = function(){
    	var pw = document.getElementById("password");
    	pw.focus();
    };
    function doSubmit(form) { //전송시 유효성 체크
        if (form.password.value == "") {
            alert("비밀번호를 입력해주세요.");
            form.password.focus();
            return false;
         }
        if (form.password_check.value == "") {
    		alert("비밀번호 확인을 입력하시기 바랍니다.");
    		form.password_check.focus();
    		return false;
    	}
    	if (form.password.value != form.password_check.value) {
			alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
			form.password.focus();
    		return false;
    	}
    }
   

	//비밀번호 체크

	function pwdCheck() {
		var pwd = document.getElementById('password');
		var blank = /[\s]/gi;
		if (blank.test(pwd.value) == true) {
			alert('공백은 사용할 수 없습니다');
			pwd.value = "";
			return false;
		}

		var special = /[.`~!@\#$%<>^&*\()\-=+_\’:;]/gi;
		if (special.test(pwd.value) == true) {
			alert('특수문자는 사용이 불가능합니다');
			pwd.value = "";
			return false;
		}
		var hangle = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힝]/gi;
		if (hangle.test(pwd.value) == true) {
			alert('한글은 사용이 불가능합니다');
			pwd.value = "";
			return false;
		}
	}
	//비밀번호 확인 체크
		function pwdChkCheck() {
		var pwdChk = document.getElementById('password_check');
		var blank = /[\s]/gi;
		if (blank.test(pwdChk.value) == true) {
			alert('공백은 사용할 수 없습니다');
			pwdChk.value = "";
			return false;
		}
		var special = /[.`~!@\#$%<>^&*\()\-=+_\’:;]/gi;
		if (special.test(pwdChk.value) == true) {
			alert('특수문자는 사용이 불가능합니다');
			pwdChk.value = "";
			return false;
		}
		var hangle = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힝]/gi;
		if (hangle.test(pwdChk.value) == true) {
			alert('한글은 사용이 불가능합니다');
			pwdChk.value = "";
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
                                    <h3>비밀번호 변경</h3>
                                    
                                </div>
                                <p class="text-divider"></p>
                                <div class="card-body">
                                <form class="form" method="post" action="/userPwChange_proc.do"  onsubmit="return doSubmit(this);">
                                    <div class="input-group">
                                        <input type="password" class="form-control" placeholder="Password" name="password" id="password" maxlength="20" onkeydown="pwdCheck()">
                                    </div>
                                    <div class="input-group">
                                        <input type="password" class="form-control" placeholder="Password Check" id="password_check" name="password_check" maxlength="20" onkeydown="pwdChkCheck()">
                                    </div>
                                    
                                    <div class="card-footer justify-content-center">
                                    	<input type="submit" value="비밀번호 변경" id="button">
                                    </div>
                                    </form>
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