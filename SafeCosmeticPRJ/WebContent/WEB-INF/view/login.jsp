<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.health.util.CmmUtil" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
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
    </style>
    <script>
    window.onload = function(){
    	var id = document.getElementById("user_id");
    	id.focus();
    	
    };
    function doSubmit(form) { //전송시 유효성 체크
        
        if (form.user_id.value == "") {
           alert("아이디를 입력해주세요.");
           form.user_id.focus();
           return false;
        }
        if (form.password.value == "") {
            alert("비밀번호를 입력해주세요.");
            form.password.focus();
            return false;
         }
    }
  //아이디 체크

	function idCheck() {
		var id = document.getElementById('user_id');
		var blank = /[\s]/gi;
		if (blank.test(id.value) == true) {
			alert('공백은 사용할 수 없습니다');
			id.value = "";
			return false;
		}
		var special = /[.`~!@\#$%<>^&*\()\-=+_\’:;]/gi;
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
                            <form class="form" method="post" action="/login_proc.do" onsubmit="return doSubmit(this);">
                                <div class="card-header card-header-primary text-center">
                                    <h3>로그인</h3>
                                    
                                </div>
                                <p class="text-divider"></p>
                                <div class="card-body">
                                    <div class="input-group">
                                        <input type="text" class="form-control" placeholder="ID" name="user_id" id="user_id" onkeydown="idCheck()" maxlength="20">
                                    </div>
                                    <div class="input-group">
                                        <input type="password" class="form-control" placeholder="Password" name="password" onkeydown="pwdCheck()" maxlength="20">
                                    </div>
                                     <h6 class="right">Forgot <a href="/idSearch.do">Id</a> / <a href="/idSearch.do">Password</a>?</h6>
                                </div>
                                <div class="card-footer justify-content-center">
                                    <input type="submit" value="SIGN IN" id="button" >
                                </div>
                                 <h6 class="center">Don’t have an account?<br/>
                                 <a href="/join.do"><b>Sign up now</b></a></h6>
                                 <br/>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
    </div>
	</div>
</body>
<jsp:include page="/WEB-INF/view/footer.jsp" flush="false"></jsp:include>
</html>