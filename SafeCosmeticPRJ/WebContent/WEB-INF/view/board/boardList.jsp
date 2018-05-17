<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ page import="com.health.util.CmmUtil" %>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.health.DTO.boardDTO"%>
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
    
    List<boardDTO> bList = (List<boardDTO>)request.getAttribute("bList");
    if(bList == null){
       bList = new ArrayList();
    }
    %>
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
	#left {
	float:right;
	background-color:rgb(197, 224, 180);
	color:white;
	border-style:none;
	border-radius: 5px;
	width:70px;
	height:30px;
	font-weight:bold;
    }
    h3
    {
	  font-weight:lighter;
	  display:inline;
	  
    }
	    div.listTable {
	  font-family: sans-serif;
	  border: 1px solid #E3DEDE;
	  background-color: #FFFFFF;
	  width: 100%;
	  text-align: center;
	  border-collapse: collapse;
	}
	.divTable.listTable .divTableCell, .divTable.listTable .divTableHead {
	  border: 1px solid #C4C4C4;
	  padding: 7px 7px;
	}
	.divTable.listTable .divTableBody .divTableCell {
	  font-size: 15px;
	  color: #545454;
	  border-color:#c5e0b4;
	}
	.divTable.listTable .divTableHeading {
	  background: #FFFFFF;
	  background: -moz-linear-gradient(top, #ffffff 0%, #ffffff 66%, #FFFFFF 100%);
	  background: -webkit-linear-gradient(top, #ffffff 0%, #ffffff 66%, #FFFFFF 100%);
	  background: linear-gradient(to bottom, #ffffff 0%, #ffffff 66%, #FFFFFF 100%);
	  border-bottom: 0px solid #545454;
	}
	.divTable.listTable .divTableHeading .divTableHead {
	  font-size: 17px;
	  font-weight: bold;
	  color: white;
	  text-align: center;
	  border-left: 0px solid #545454;
	  background-color:#c5e0b4;
	  border-color:#c5e0b4;
	}
	.divTable.listTable .divTableHeading .divTableHead:first-child {
	  border-left: none;
	}
	/* DivTable.com */
	.divTable{ display: table; }
	.divTableRow { display: table-row; }
	.divTableHeading { display: table-header-group;}
	.divTableCell, .divTableHead { display: table-cell;}
	.divTableHeading { display: table-header-group;}
	.divTableBody { display: table-row-group;}
    </style>
   	<script>

  	//상세이동
    function doDetail(n){
        var bo_no = n;
        location.href="/boardDetail.do?bo_no=" + bo_no;
  		}
	
     
	</script>
    <jsp:include page="/WEB-INF/view/top.jsp" flush="false"></jsp:include>
</head>
<body class="index-page ">
<div class="main main-raised">
        <div class="section section-basic">
             <div class="container">

                <div class="row">
                    <div class="col-md-12 ml-auto mr-auto" >
                            <h3>게시판</h3>
                            <%if(SESSION_USER_ID.equals("admin")){ %>
                            <a href="/boardReg.do"><input type="button" value="등록" id="left" ></a>
                            <%} %>
                            <hr> 
                            <form class="form" method="post" action="#">
                           <div class="form-group">
				            <div class="divTable listTable">
										<div class="divTableHeading">
										<div class="divTableRow">
										<div class="divTableHead">번호</div>
										<div class="divTableHead">제목</div>
										<div class="divTableHead">등록일</div>
										<div class="divTableHead">조회수</div>
										</div>
										</div>
										<div class="divTableBody" >
										<%for (boardDTO bDTO : bList) { %>
										<div class="divTableRow">
										<div class="divTableCell"><%= bDTO.getBo_no() %></div>
										<div class="divTableCell"  onclick="doDetail(<%=bDTO.getBo_no()%>);"><%= bDTO.getTitle() %></div>
										<div class="divTableCell"><%= bDTO.getReg_dt() %></div>
										<div class="divTableCell"><%= bDTO.getCnt() %></div>
										</div>
										<% } %>
										</div>
										
										
				           </div>
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