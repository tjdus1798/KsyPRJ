<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.health.util.CmmUtil" %>
<%@ page import="com.health.DTO.mainDTO" %>
<%
mainDTO mDTO = (mainDTO)request.getAttribute("mDTO");
if(mDTO == null) mDTO = new mainDTO();
String gender = CmmUtil.nvl(mDTO.getGender());
String skin_type = CmmUtil.nvl(mDTO.getSkin_type());
String something = CmmUtil.nvl(mDTO.getSomething());
String age = CmmUtil.nvl(mDTO.getAge());
%>
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
    <script src="./bootstrap/js/jquery-3.3.1.min.js"></script>
    <style>
    
    #selectbox{
	
	width:150px;
	height:30px;
	color:gray;
	border-radius: 7x;
	border-coloe: gray;
	}

	#b {
	background-color:rgb(197, 224, 180);
	color:white;
	border-style:none;
	border-radius: 8px;
	width:150px;
	height:42px;
	font-size:20px;
	font-weight:bold;
	}
    
    </style>
    <script>
    $(Document).ready(function(){
    	var id = document.getElementById("user_id");
    	id.focus();
    	var age= <%=CmmUtil.nvl(mDTO.getAge())%>
    	$("#selectbox").val(age).attr("selected", "selected");

    });
    
    function update_check() {
        if(confirm("수정하시겠습니까?")){
           return true;
        }else{
           return false;
        }
      }
      
      function delete_check() {
        if(confirm("탈퇴하시겠습니까?")){
           location.href="/userDelete.do?user_no=<%=mDTO.getUser_no()%>";
           return true;
        }else{
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
                            <form class="form" method="post" action="/userUpdate.do">
                                <div class="card-header card-header-primary text-center">
                                    <h3>개인정보수정</h3>
                                      <input type="hidden" id="user_no" name="user_no" value="<%=CmmUtil.nvl(mDTO.getUser_no()) %>">
                                    
                                </div>
                                <p class="text-divider"></p>
                                <div class="card-body">
  									<div class="form-group">
		                                 <label for="exampleInput1" class="bmd-label-floating">아이디</label>
		                                <input type="text" class="form-control" id="user_id" name="user_id" value="<%=CmmUtil.nvl(mDTO.getUser_id())%>" readonly>
		                                <span class="bmd-help"><a style="color:#c51919">cannot change the User Id.</a></span>
                            		</div>
                                    <div class="form-group">
		                                 <label for="exampleInput1" class="bmd-label-floating">Email</label>
		                                <input type="email" class="form-control" id="email" name="email" value="<%=CmmUtil.nvl(mDTO.getEmail())%>" readonly>
		                                <span class="bmd-help"><a style="color:#c51919">cannot change the Email Address.</a></span>
                            		</div>
                            		<div class="form-group">
		                                 <label for="exampleInput1" class="bmd-label-floating">비밀번호</label>
		                                <input type="password" class="form-control" id="password" name="password" readonly value="********">
		                                <span class="bmd-help"><a style="color:#c51919">cannot change the  Password</a></span>
                            		</div>
                            		<div class="form-group">
		                                 <label for="exampleInput1" class="bmd-label-floating">비밀번호 확인</label>
		                                <input type="password" class="form-control" id="password_check" readonly value="********">
		                                <span class="bmd-help"><a style="color:#c51919">cannot change the  Password</a></span>
                            		</div>
                            		<br>
										<label for="exampleInput1" class="bmd-label-floating">나이</label><br/>
	                            		<select name="age" id="selectbox" >
	                            		<option value="">&ensp;생년월일</option>
	                            		<% 
	                            		String toDate = new java.text.SimpleDateFormat("yyyy").format(new java.util.Date());
											for (int i=1960 ; i<=Integer.parseInt(toDate) ; i++) { %>
										<option value="<%= i %>"> 
										 <%= i %>년</option>
										<% } %>
	                      				</select><br><br>
		                            <label for="exampleInput1" class="bmd-label-floating">성별</label>
		                              <div class="form-check">
		                              <label class="form-check-label">
		                                    <input class="form-check-input" type="radio" name="gender" id="w" value="w" 
		                                    <% if("w".equals(gender)){%>checked<%}%>
													> 여자
		                                    <span class="circle">
		                                    <span class="check"></span>
		                                    </span>
		                                </label>
		                            </div>
										<div class="form-check">
		                                <label class="form-check-label">
		                                    <input class="form-check-input" type="radio" name="gender" id="m" value="m"
		                                    <% if("m".equals(gender)){%>checked<%}%>> 남자
		                                    <span class="circle">
		                                        <span class="check"></span>
		                                    </span>
		                                </label>
		                            </div><br>



							<label for="exampleInput1" class="bmd-label-floating">피부타입</label>
							<div class="form-check">
		                                <label class="form-check-label">
		                                    <input class="form-check-input" type="radio" name="skin_type" id="1" value="1"
		                                    <% if("1".equals(skin_type)){%>checked<%}%>> 건성
		                                    <span class="circle">
		                                        <span class="check"></span>
		                                    </span>
		                                </label>
		                            </div>
		                            <div class="form-check">
		                                <label class="form-check-label">
		                                    <input class="form-check-input" type="radio" name="skin_type" id="2" value="2"
		                                    <% if("2".equals(skin_type)){%>checked<%}%>> 중성
		                                    <span class="circle">
		                                        <span class="check"></span>
		                                    </span>
		                                </label>
		                            </div>
		                            <div class="form-check">
		                                <label class="form-check-label">
		                                    <input class="form-check-input" type="radio" name="skin_type" id="3" value="3"
		                                    <% if("3".equals(skin_type)){%>checked<%}%>> 지성
		                                    <span class="circle">
		                                        <span class="check"></span>
		                                    </span>
		                                </label>
		                            </div>
		                            <div class="form-check">
		                                <label class="form-check-label">
		                                    <input class="form-check-input" type="radio" name="skin_type" id="4" value="4"
		                                    <% if("4".equals(skin_type)){%>checked<%}%>> 복합성
		                                    <span class="circle">
		                                        <span class="check"></span>
		                                    </span>
		                                </label>
		                            </div><br>
                            
                        
                        <label for="exampleInput1" class="bmd-label-floating">특이사항</label>
						<div class="form-check">
                                <label class="form-check-label">
                                    <input class="form-check-input" type="radio" name="something" value="a"
                                    <% if("a".equals(something)){%>checked<%}%>> 해당없음
                                     <span class="circle">
		                                        <span class="check"></span>
		                                    </span>
                                </label>
                            </div>
                            <div class="form-check">
                                <label class="form-check-label">
                                    <input class="form-check-input" type="radio" name="something" value="b"
                                    <% if("b".equals(something)){%>checked<%}%>> 임산부
                                     <span class="circle">
		                                        <span class="check"></span>
		                                    </span>
                                </label>
                            </div>
                            <div class="form-check">
                                <label class="form-check-label">
                                    <input class="form-check-input" type="radio" name="something" value="c"
                                    <% if("c".equals(something)){%>checked<%}%>> 영유아용
                                    <span class="circle">
		                                        <span class="check"></span>
		                                    </span>
                                </label>
                            </div>
                            <div class="form-check">
                                <label class="form-check-label">
                                    <input class="form-check-input" type="radio" name="something" value="d" 
                                    <% if("d".equals(something)){%>checked<%}%>> 알레르기성 피부
                                    <span class="circle">
		                                        <span class="check"></span>
		                                    </span>
                                </label>
                            </div>
                        </div>
                           
                                  <div class="card-footer justify-content-center">
                                 	<input type="submit" value="수정" id="b" onClick="update_check()">&ensp;<input type="button" value="탈퇴" id="b" onClick="delete_check()">
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