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
	
	.invalid{
	background-image:
	linear-gradient(to top, #f44336 2px, rgba(244, 67, 54, 0) 2px), 
	linear-gradient(to top, #d2d2d2 1px, rgba(210, 210, 210, 0) 1px);
	}
    </style>
    <script src="./bootstrap/js/jquery-3.3.1.min.js"></script>
    <script>
    $(function(){
    	var id = document.getElementById("user_id");
    	id.focus();
    	var checkAjaxSetTimeout;
    	$("#user_id").keyup(function(){
    		//clearTimeout(checkAjaxSetTimeout);
    	    //checkAjaxSetTimeout = setTimeout(function(){
    	    var id = $("#user_id").val();
        	//if(id.length > 4){
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
        				}else if(data == -1){
        					$("#ui").html("This ID can be used.");
        				}
        			}
        		});
        		
        		//}
    	       // },1000);
    	});
    	var checkAjaxSetTimeout;
    	$("#email").keyup(function(){
    		//clearTimeout(checkAjaxSetTimeout);
    	    //checkAjaxSetTimeout = setTimeout(function(){
    	    var email = $("#email").val();
        	//if(email.length > 5){
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
        		
        		//}
    	        //},1000);
    	});

    	 $("#password_check").keyup(function(){
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
    	    });
    });
   
 function doSubmit(form) { //전송시 유효성 체크
        
        if (form.user_id.value == "") {
           alert("아이디를 입력해주세요.");
           form.user_id.focus();
           return false;
        }
 		if (form.email.value == "") {
            alert("이메일을 입력해주세요.");
            form.email.focus();
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
                    <div class="col-md-11 ml-auto mr-auto">
                        <div class="card card-signup">
                            <form class="form" method="post" action="/join_proc.do" onsubmit="return doSubmit(this);" >
                                <div class="card-header card-header-primary text-center">
                                    <h3>회원가입</h3>
                                    
                                </div>
                                <p class="text-divider"></p>
                                <div class="card-body">
  									<div class="form-group">
		                                 <label for="exampleInput1" class="bmd-label-floating">아이디</label>
		                                <input type="text" class="form-control" id="user_id" name="user_id">
		                                <span class="bmd-help" id="ui"></span>
                            		</div>
                                    <div class="form-group">
		                                 <label for="exampleInput1" class="bmd-label-floating">Email</label>
		                                <input type="email" class="form-control" id="email" name="email">
		                                <span class="bmd-help" id="ec"></span>
                            		</div>
                            		<div class="form-group">
		                                 <label for="exampleInput1" class="bmd-label-floating">비밀번호</label>
		                                <input type="password" class="form-control" id="password" name="password">
		                                <span class="bmd-help"></span>
                            		</div>
                            		<div class="form-group">
		                                 <label for="exampleInput1" class="bmd-label-floating">비밀번호 확인</label>
		                                <input type="password" class="form-control" id="password_check">
		                                <span class="bmd-help" id="pw"></span>
                            		</div>
                            		<br>
										<label for="exampleInput1" class="bmd-label-floating">나이</label><br/>
	                            		<select name="age" id="selectbox" >
	                            		<option value="">&ensp;생년월일</option>
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