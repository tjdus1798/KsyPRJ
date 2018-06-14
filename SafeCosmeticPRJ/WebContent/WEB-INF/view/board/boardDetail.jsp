<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ page import="com.health.util.CmmUtil" %>
<%@ page import="com.health.DTO.boardDTO" %>
<%
	boardDTO bDTO = (boardDTO)request.getAttribute("bDTO");
	if(bDTO==null) bDTO = new boardDTO();
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
    <style>
    h6{
    color:gray;
    }
    #h{
    display:inline;
    }
    #right {
    float:right;
    background-color: #ffffff;
    color: #7b9e03;
    border: solid #7b9e03 1px;
	border-radius: 5px;
	width:70px;
	height:30px;
	font-weight:bold;
	margin-left: 5px;
    }
     #button {
	background-color:rgb(197, 224, 180);
	color:white;
	border-style:none;
	border-radius: 5px;
	width:300px;
	height:50px;
	font-size:20px;
	font-weight:bold;
	}
	#center{
	display: block;
    margin-left: auto;
    margin-right: auto;
	}
    </style>
    
    <jsp:include page="/WEB-INF/view/top.jsp" flush="false"></jsp:include>
    <script>
  //삭제하기
    function doDelete(n, m){
        var bo_no = n;
        var img_name=m;
        location.href="/boardDelete.do?bo_no=" + bo_no +"&img_name="+ img_name;
  		}
    //수정하기
    function doEdit(n){
        var bo_no = n;
        location.href="/boardEdit.do?bo_no=" + bo_no;
  		}
    </script>
</head>
<body class="index-page ">
<div class="main main-raised">
        <div class="section section-basic">
             <div class="container">
                <div class="row">
                    <div class="col-md-12 ml-auto mr-auto" >
                            <h3 id="h"><%= CmmUtil.nvl(bDTO.getTitle()) %></h3>
                            <input type="hidden" id="img_name" name="img_name" value="<%=CmmUtil.nvl(bDTO.getImg_name()) %>">
                            <%if(SESSION_USER_ID.equals("admin")){ %>
                            <a>&ensp;<input type="button" value="삭제" id="right" onclick="doDelete('<%=bDTO.getBo_no()%>','<%=bDTO.getImg_name()%>');"></a>
                            <input type="button" value="수정" id="right"  onclick="doEdit(<%=bDTO.getBo_no()%>);">&ensp;</a>
                            <%} %><br>
                            <h6><%= CmmUtil.nvl(bDTO.getReg_dt()) %></h6>
                            <hr> 
                            <%if(CmmUtil.nvl(bDTO.getImg_name()).length() > 1){ %>
                           		 <img src="./upload/<%= CmmUtil.nvl(bDTO.getImg_name()) %>" id="center"><br><br>
                            <%}%>
                            <%= CmmUtil.nvl(bDTO.getContent()) %>
                	</div>
            	</div>
           </div>
    </div>
	</div>
</body>
<jsp:include page="/WEB-INF/view/footer.jsp" flush="false"></jsp:include>
</html>