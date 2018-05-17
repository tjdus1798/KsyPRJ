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
                                        <input type="text" class="form-control" placeholder="ID" name="user_id" id="user_id">
                                    </div>
                                    <div class="input-group">
                                        <input type="password" class="form-control" placeholder="Password" name="password">
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