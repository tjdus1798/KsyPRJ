<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.health.DTO.ingDTO"%>
<%@ page import="com.health.util.CmmUtil"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0"
	name="viewport" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<%
    request.setCharacterEncoding("euc-kr");

    String SESSION_USER_ID = CmmUtil.nvl((String)session.getAttribute("session_user_id"));
    String SESSION_USER_NO = CmmUtil.nvl((String)session.getAttribute("session_user_no"));
    

    List<ingDTO> iList = (List<ingDTO>)request.getAttribute("iList");
    if(iList == null){
       iList = new ArrayList();
    }
    %>
<style>
#button {
	background-color: rgb(197, 224, 180);
	color: white;
	border-style: none;
	border-radius: 10px;
	width: 300px;
	height: 50px;
	font-size: 20px;
	font-weight: bold;
}

#left {
	float: right;
	background-color: rgb(197, 224, 180);
	color: white;
	border-style: none;
	border-radius: 5px;
	width: 70px;
	height: 30px;
	font-weight: bold;
}

h3 {
	font-weight: lighter;
	display: inline;
}

div.listTable {
	font-family: sans-serif;
	border: 1px solid #E3DEDE;
	background-color: #FFFFFF;
	width: 100%;
	text-align: center;
	border-collapse: collapse;
	display: block; 
	table-layout:fixed;
}

.divTable.listTable .divTableCell, .divTable.listTable .divTableHead {
	border: 1px solid #C4C4C4;
	padding: 7px 7px;
}

.divTable.listTable .divTableBody .divTableCell {
	font-size: 15px;
	color: #545454;
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
	  color: #696969;
	  text-align: center;
	  border-left: 0px solid #545454;
	}

.divTable.listTable .divTableHeading .divTableHead:first-child {
	border-left: none;
}
/* DivTable.com */
.divTable {
	display: table;
}

.divTableRow {
	display: table-row;
}

.divTableHeading {
	display: table-header-group;
}

.divTableCell, .divTableHead {
	display: table-cell;
}

.divTableHeading {
	display: table-header-group;
}

.divTableBody {
	display: table-row-group;
}
</style>
<script>
  	//상세이동
    function doDetail(n){
        var ing_no = n;
        location.href="/ingDetail.do?ing_no=" + ing_no;
     }
     
</script>
<jsp:include page="/WEB-INF/view/top.jsp" flush="false"></jsp:include>
</head>
<body class="index-page ">
	<div class="main main-raised">
		<div class="section section-basic">
			<div class="container">

				<div class="row">
					<div class="col-md-12 ml-auto mr-auto">
						<h3>성분정보</h3>
						<%if(SESSION_USER_ID.equals("admin")){ %>
						<a href="/ingReg.do"><input type="button" value="등록" id="left"></a>
						<%} %>
						<hr>
						<form class="form" method="post" action="#">
							<div class="form-group">
								<div class="divTable listTable">
									<div class="divTableHeading">
										<div class="divTableRow">
											<div class="divTableHead" style="width: 10%;">번호</div>
											<div class="divTableHead">성분명</div>
											<div class="divTableHead">영문명</div>
											<div class="divTableHead" style="width: 10%;font-size:15px">EWG등급</div>
										</div>
									</div>
									<div class="divTableBody">
										<%for (ingDTO iDTO : iList) { %>
										<div class="divTableRow" >
											<div class="divTableCell" ><%=iDTO.getIng_no() %></div>
											<div class="divTableCell" onclick="doDetail(<%=iDTO.getIng_no()%>);" style="cursor:pointer;"><p style="white-space:nowrap;width:450px;overflow:hidden;text-overflow:ellipsis;"><%=iDTO.getIng_name() %></p></div>
											<div class="divTableCell" ><p style="white-space:nowrap;width:450px;overflow:hidden;text-overflow:ellipsis;"><%=iDTO.getIng_eng() %></p></div>
											<div class="divTableCell">
												<% if( CmmUtil.nvl(iDTO.getEwg_level()).equals("1")){%>
													<img style="width: 25px; height: 25px" src="../image/1.png">
												<%}else if(CmmUtil.nvl(iDTO.getEwg_level()).equals("1-2")){ %>
													<img style="width: 25px; height: 25px" src="../image/1-2.png"> 
												<%}else if(CmmUtil.nvl(iDTO.getEwg_level()).equals("1-3")){ %>
													<img style="width: 25px; height: 25px" src="../image/1-3.png"> 
												<%}else if(CmmUtil.nvl(iDTO.getEwg_level()).equals("2")){ %> 
													<img style="width: 25px; height: 25px" src="../image/2.png">
												<%}else if(CmmUtil.nvl(iDTO.getEwg_level()).equals("3")){ %>
													<img style="width: 25px; height: 25px" src="../image/3.png"> 
												<%}else if(CmmUtil.nvl(iDTO.getEwg_level()).equals("4")){ %>
													<img style="width: 25px; height: 25px" src="../image/4.png"> 
												<%}else if(CmmUtil.nvl(iDTO.getEwg_level()).equals("5")){ %>
													<img style="width: 25px; height: 25px" src="../image/5.png"> 
												<%}else if(CmmUtil.nvl(iDTO.getEwg_level()).equals("6")){ %>
													<img style="width: 25px; height: 25px" src="../image/6.png"> 
												<%}else if(CmmUtil.nvl(iDTO.getEwg_level()).equals("7")){ %>
													<img style="width: 25px; height: 25px" src="../image/7.png"> 
												<%}else if(CmmUtil.nvl(iDTO.getEwg_level()).equals("8")){ %>
													<img style="width: 25px; height: 25px" src="../image/8.png"> 
												<%}else if(CmmUtil.nvl(iDTO.getEwg_level()).equals("9")){ %>
													<img style="width: 25px; height: 25px" src="../image/9.png"> 
												<%}else if(CmmUtil.nvl(iDTO.getEwg_level()).equals("10")){ %>
													<img style="width: 25px; height: 25px" src="../image/10.png"> 
												<%}else if(CmmUtil.nvl(iDTO.getEwg_level()).equals("-")){ %>
													<img style="width: 25px; height: 25px" src="../image/-.png"> 
												<%} %>
											</div>
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