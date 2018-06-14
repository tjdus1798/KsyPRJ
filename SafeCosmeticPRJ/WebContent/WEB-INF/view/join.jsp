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
    #selectbox{
	width:150px;
	height:30px;
	color:gray;
	border-radius: 10x;
	border-coloe: gray;
	}

	#submit {
	background-color:rgb(197, 224, 180);
	color:white;
	border-style:none;
	border-radius: 10px;
	width:300px;
	height:50px;
	font-size:20px;
	}
	#btn {
	background-color:rgb(197, 224, 180);
	color:white;
	border-style:none;
	}
	.invalid{
	background-image:
	linear-gradient(to top, #f44336 2px, rgba(244, 67, 54, 0) 2px), 
	linear-gradient(to top, #d2d2d2 1px, rgba(210, 210, 210, 0) 1px);
	}
    </style>
    <script src="./bootstrap/js/jquery-3.3.1.min.js"></script>
    <script>
    var idExists = "1";//ID 중복체크 실행여부(1: 중복체크 실행안함 / 2: 아이디 중복 / 3: 통과)
    var emailExists = "1";
    function doIdCheck() {
    	var id = $("#user_id").val();
    		var id = $("#user_id").val();
    		$.ajax({
    			url : '/idCheck.do',
    			method : "POST",
    			data : {
    				user_id: id
    			},
    			dataType:"text",
    			success : function(data) {
    				if(data == 1){
    					alert("이미 존재하는 아이디입니다.");
    					idExists = 2;
    				}else if(data == -1){
    					alert("사용가능한 아이디입니다.");
    					id.readOnly = true;
    					idExists = 3;
    				}
    			}
    		});
    }
    function doEmailCheck() {
    	var email = $("#email").val();
    		var email = $("#email").val();
    		$.ajax({
    			url : '/emailCheck.do',
    			method : "POST",
    			data : {
    				email: email
    			},
    			dataType:"text",
    			success : function(data) {
    				if(data == 1){
    					alert("이미 존재하는 이메일입니다.");
    					emailExists = 2;
    				}else if(data == -1){
    					alert("사용가능한 이메일입니다.");
    					emailExists = 3;
    				}
    			}
    		});
    }
    $(function(){
    	var id = document.getElementById("user_id");
    	id.focus();
    	/* var checkAjaxSetTimeout;
    	$("#user_id").keyup(function(){
    		//clearTimeout(checkAjaxSetTimeout);
    	    //checkAjaxSetTimeout = setTimeout(function(){
    	    var id = $("#user_id").val();
        	if(id.length > 3){
        		var id = $("#user_id").val();
        		$.ajax({
        			url : '/idCheck.do',
        			method : "POST",
        			data : {
        				user_id: id
        			},
        			dataType:"text",
        			success : function(data) {
        				if(data == 1){
        					$("#ui").html("This ID already exists.");
        					idExists =2;
        				}else if(data == -1){
        					$("#ui").html("This ID can be used.");
        					idExists = 1;
        				}
        			}
        		});
        		
        		}
    	       // },1000);
    	}); */
/*     	var checkAjaxSetTimeout;
    	$("#email").keyup(function(){
    		//clearTimeout(checkAjaxSetTimeout);
    	    //checkAjaxSetTimeout = setTimeout(function(){
    	    var email = $("#email").val();
        	if(email.length > 5){
        		var email = $("#email").val();
        		$.ajax({
        			url : '/emailCheck.do',
        			method : "POST",
        			data : {
        				email: email
        			},
        			dataType:"text",
        			success : function(data) {
        				if(data == 1){
        					$("#ec").html("This Email already exists.");
        				}else if(data == -1){
        					$("#ec").html("This Email can be used.");
        				}
        			}
        		});
        		
        		}
    	        //},1000);
    	}); */

    	/*  $("#password_check").keyup(function(){
    		 clearTimeout(checkAjaxSetTimeout);
 		    checkAjaxSetTimeout = setTimeout(function(){
    		    	 var pw_check = $("#password_check").val();
    		    	 if(pw_check.length > 4){
    		    		 console.log(pw_check);
    		    		 if($("#password").val()==pw_check){

    		    		 }else{
      		    			$("#pw").html("Password Doesn’t Match.");
      		    			$("#pw").css('color','red');
    		    		 }
    		    	 }
    		    });
    	    }); */
    });
   
 function doSubmit(form) { //전송시 유효성 체크
        
        if (form.user_id.value == "") {
           alert("아이디를 입력해주세요.");
           form.user_id.focus();
           return false;
        }
        if (idExists == "1") {
            alert("아이디 중복확인을 해주세요.");
            form.user_id.focus();
            return false;
         }
        if (idExists == "2") {
            alert("중복되는 아이디입니다.");
            form.user_id.focus();
            return false;
         }
 		if (form.email.value == "") {
            alert("이메일을 입력해주세요.");
            form.email.focus();
            return false;
         }
 		if (emailExists == "1") {
            alert("이메일 중복확인을 해주세요.");
            form.email.focus();
            return false;
         }
 		if (emailExists == "2") {
            alert("중복되는 이메일입니다.");
            form.email.focus();
            return false;
         }
        if (form.password.value == "") {
            alert("비밀번호를 입력해주세요.");
            form.password.focus();
            return false;
         }
        if (form.password_check.value == "") {
            alert("비밀번호를 입력해주세요.");
            form.password_check.focus();
            return false;
         }
        if (form.password.value != form.password_check.value) {
			alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
			form.password.focus();
    		return false;
    	}
        if (form.age.value == "age_option") {
            alert("생년월일을 선택해주세요.");
            form.age.focus();
            return false;
         }
        if (form.skin_type.value == "") {
            alert("피부타입을 선택해주세요.");
            form.skin_type.focus();
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
	//이메일 체크
	function emailCheck() {
		var email = document.getElementById('email');
		var blank = /[\s]/gi;
		if (blank.test(email.value) == true) {
			alert('공백은 사용할 수 없습니다');
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
                    <div class="col-md-11 ml-auto mr-auto">
                        <div class="card card-signup">
                            <form class="form" method="post" action="/join_proc.do" onsubmit="return doSubmit(this);" >
                                <div class="card-header card-header-primary text-center">
                                    <h3>회원가입</h3>
                                    
                                </div>
                                <p class="text-divider"></p>
                                <div class="card-body">
  									<div class="form-group" >
		                                 <label for="exampleInput1" class="bmd-label-floating">아이디</label>
		                                <input type="text" class="form-control" id="user_id" name="user_id" autocomplete="off" maxlength="20" onkeydown="idCheck()" style="display: inline;">
		                                <span class="bmd-help" id="ui"></span><input type="button" value="중복확인" id="btn" onclick="doIdCheck()">
                            		</div>
                                    <div class="form-group">
		                                 <label for="exampleInput1" class="bmd-label-floating">Email</label>
		                                <input type="email" class="form-control" id="email" name="email" autocomplete="off" onkeydown="emailCheck()" maxlength="50"  style="display: inline;">
		                                <span class="bmd-help" id="ec"></span><input type="button" value="중복확인" id="btn" onclick="doEmailCheck()">
                            		</div>
                            		<div class="form-group">
		                                 <label for="exampleInput1" class="bmd-label-floating">비밀번호</label>
		                                <input type="password" class="form-control" id="password" name="password" onkeydown="pwdCheck()" maxlength="20">
		                                <span class="bmd-help"></span>
                            		</div>
                            		<div class="form-group">
		                                 <label for="exampleInput1" class="bmd-label-floating">비밀번호 확인</label>
		                                <input type="password" class="form-control" id="password_check" name="password_check" onkeydown="pwdChkCheck()" maxlength="20">
		                                <span class="bmd-help" id="pw"></span>
                            		</div>
                            		<br>
										<label for="exampleInput1" class="bmd-label-floating">나이</label><br/>
	                            		<select name="age" id="selectbox" >
	                            		<option value="age_option">&ensp;생년월일</option>
	                            		<% 
	                            		String toDate = new java.text.SimpleDateFormat("yyyy").format(new java.util.Date());
											for (int i=1960 ; i<=Integer.parseInt(toDate) ; i++) { %>
										<option value="<%= i %>"><%= i %>년</option>
										<% } %>
	
	                      				</select><br><br>
		                            <label for="exampleInput1" class="bmd-label-floating">성별</label>
		                              <div class="form-check">
		                              <label class="form-check-label">
		                                    <input class="form-check-input" type="radio" name="gender" id="w" value="w" checked> 여자
		                                    <span class="circle">
		                                    <span class="check"></span>
		                                    </span>
		                                </label>
		                            </div>
										<div class="form-check">
		                                <label class="form-check-label">
		                                    <input class="form-check-input" type="radio" name="gender" id="m" value="m"> 남자
		                                    <span class="circle">
		                                        <span class="check"></span>
		                                    </span>
		                                </label>
		                            </div><br>



							<label for="exampleInput1" class="bmd-label-floating">피부타입</label>
							<div class="form-check">
		                                <label class="form-check-label">
		                                    <input class="form-check-input" type="radio" name="skin_type" id="1" value="1"> 건성
		                                    <span class="circle">
		                                        <span class="check"></span>
		                                    </span>
		                                </label>
		                            </div>
		                            <div class="form-check">
		                                <label class="form-check-label">
		                                    <input class="form-check-input" type="radio" name="skin_type" id="2" value="2"> 중성
		                                    <span class="circle">
		                                        <span class="check"></span>
		                                    </span>
		                                </label>
		                            </div>
		                            <div class="form-check">
		                                <label class="form-check-label">
		                                    <input class="form-check-input" type="radio" name="skin_type" id="3" value="3"> 지성
		                                    <span class="circle">
		                                        <span class="check"></span>
		                                    </span>
		                                </label>
		                            </div>
		                            <div class="form-check">
		                                <label class="form-check-label">
		                                    <input class="form-check-input" type="radio" name="skin_type" id="4" value="4"> 복합성
		                                    <span class="circle">
		                                        <span class="check"></span>
		                                    </span>
		                                </label>
		                            </div><br>
                            
                        
                        <label for="exampleInput1" class="bmd-label-floating">특이사항</label>
						<div class="form-check">
                                <label class="form-check-label">
                                    <input class="form-check-input" type="radio" name="something" value="a" checked> 해당없음
                                     <span class="circle">
		                                        <span class="check"></span>
		                                    </span>
                                </label>
                            </div>
                            <div class="form-check">
                                <label class="form-check-label">
                                    <input class="form-check-input" type="radio" name="something" value="b"> 임산부
                                     <span class="circle">
		                                        <span class="check"></span>
		                                    </span>
                                </label>
                            </div>
                            <div class="form-check">
                                <label class="form-check-label">
                                    <input class="form-check-input" type="radio" name="something" value="c"> 영유아용
                                    <span class="circle">
		                                        <span class="check"></span>
		                                    </span>
                                </label>
                            </div>
                            <div class="form-check">
                                <label class="form-check-label">
                                    <input class="form-check-input" type="radio" name="something" value="d" > 알레르기성 피부
                                    <span class="circle">
		                                        <span class="check"></span>
		                                    </span>
                                </label>
                            </div>
                        </div>
                           
                                  <div class="card-footer justify-content-center">
                                 	<input type="submit" value="SIGN IN" id="submit">
                                  </div>
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