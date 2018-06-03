<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.health.DTO.ingDTO"%>
<%@ page import="com.health.util.CmmUtil"%>
<%

	ingDTO iDTO = (ingDTO)request.getAttribute("iDTO");
	if(iDTO==null) iDTO = new ingDTO();
	String ing_no = CmmUtil.nvl(iDTO.getIng_no());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0"
	name="viewport" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<jsp:include page="/WEB-INF/view/top.jsp" flush="false"></jsp:include>
<style>
a{
align-items: right;
}
	
h3 {
	display: inline;
}

#eng {
	color: gray;
	font-size: 13px;
}

div.listTable {
	font-family: sans-serif;
	border: 1px solid #E3DEDE;
	background-color: #FFFFFF;
	width: 80%;
	text-align: center;
	border-collapse: collapse;
}

.divTable.listTable .divTableCell, .divTable.listTable .divTableHead {
	border: 1px solid #e8e5e5;
	padding: 10px 10px;
}

.divTable.listTable .divTableBody .divTableCell {
	font-size: 18px;
	color: #3c4858;
	font-weight: bold;
}

.divTable.listTable .divTableHeading {
	background: #FFFFFF;
	background: -moz-linear-gradient(top, #ffffff 0%, #ffffff 66%, #FFFFFF 100%);
	background: -webkit-linear-gradient(top, #ffffff 0%, #ffffff 66%, #FFFFFF 100%);
	background: linear-gradient(to bottom, #ffffff 0%, #ffffff 66%, #FFFFFF 100%);
	border-bottom: 0px solid #545454;
}

.divTable.listTable .divTableHeading .divTableHead {
	font-size: 14px;
	font-weight: bold;
	color: #000000;
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

#g {
	color: #afa8a8;
}
.badge{
	border : solid 1px #7b9e03;
	color : #7b9e03;
	font-size : 15px;
	background-color: white;
	border-radius : 5px;
}
</style>
<script>
//수정하기
function doEdit(i){
    var ing_no = i;
    location.href="/ingEdit.do?ing_no="+ ing_no;
 }

function delete_check(i) {
	var ing_no = i;
    if(confirm("삭제하시겠습니까?")){
       location.href="/ingDelete.do?ing_no="+ ing_no;
       return true;
    }else{
       return false;
    }
  }
 
</script>
</head>
<body class="index-page ">
	<div class="main main-raised">
		<div class="section section-basic">
			<div class="container">
				<div class="row">
					<div class="col-md-12 ml-auto mr-auto">
						<h3><%= CmmUtil.nvl(iDTO.getIng_name()) %></h3>
						&ensp; <label id="eng"><%= CmmUtil.nvl(iDTO.getIng_eng()) %></label>&ensp;
						 <span class="badge" onclick="doEdit(<%=iDTO.getIng_no()%>);">수정</span>
						 <span class="badge" onclick="delete_check(<%=iDTO.getIng_no()%>);">삭제</span>
						<hr>
						 <input type="hidden" id="ing_no" name="ing_no" value="<%=CmmUtil.nvl(iDTO.getIng_no()) %>">
						<div class="divTable listTable">
							<div class="divTableBody">
								<div class="divTableRow">
									<div class="divTableCell" id="g">성분명</div>
									<div class="divTableCell"><%= CmmUtil.nvl(iDTO.getIng_name()) %></div>
								</div>
								<div class="divTableRow">
									<div class="divTableCell" id="g">영문명</div>
									<div class="divTableCell">
										<%= CmmUtil.nvl(iDTO.getIng_eng()) %>
									</div>
								</div>
								<div class="divTableRow">
									<div class="divTableCell" id="g">배합목적</div>
									<div class="divTableCell"><%= CmmUtil.nvl(iDTO.getMix()) %></div>
								</div>
								<div class="divTableRow">
									<div class="divTableCell" id="g">EWG등급</div>
									<div class="divTableCell">
									<% if( CmmUtil.nvl(iDTO.getEwg_level()).equals("1")){%>
										<img style="width: 30px; height: 30px" src="../image/1.png">
									<%}else if(CmmUtil.nvl(iDTO.getEwg_level()).equals("1-2")){ %>
										<img style="width: 30px; height: 30px" src="../image/1-2.png"> 
									<%}else if(CmmUtil.nvl(iDTO.getEwg_level()).equals("1-3")){ %>
										<img style="width: 30px; height: 30px" src="../image/1-3.png"> 
									<%}else if(CmmUtil.nvl(iDTO.getEwg_level()).equals("2")){ %> 
										<img style="width: 30px; height: 30px" src="../image/2.png">
									<%}else if(CmmUtil.nvl(iDTO.getEwg_level()).equals("3")){ %>
										<img style="width: 30px; height: 30px" src="../image/3.png"> 
									<%}else if(CmmUtil.nvl(iDTO.getEwg_level()).equals("4")){ %>
										<img style="width: 30px; height: 30px" src="../image/4.png"> 
									<%}else if(CmmUtil.nvl(iDTO.getEwg_level()).equals("5")){ %>
										<img style="width: 30px; height: 30px" src="../image/5.png"> 
									<%}else if(CmmUtil.nvl(iDTO.getEwg_level()).equals("6")){ %>
										<img style="width: 30px; height: 30px" src="../image/6.png"> 
									<%}else if(CmmUtil.nvl(iDTO.getEwg_level()).equals("7")){ %>
										<img style="width: 30px; height: 30px" src="../image/7.png"> 
									<%}else if(CmmUtil.nvl(iDTO.getEwg_level()).equals("8")){ %>
										<img style="width: 30px; height: 30px" src="../image/8.png"> 
									<%}else if(CmmUtil.nvl(iDTO.getEwg_level()).equals("9")){ %>
										<img style="width: 30px; height: 30px" src="../image/9.png"> 
									<%}else if(CmmUtil.nvl(iDTO.getEwg_level()).equals("10")){ %>
										<img style="width: 30px; height: 30px" src="../image/10.png"> 
									<%}else if(CmmUtil.nvl(iDTO.getEwg_level()).equals("-")){ %>
										<img style="width: 30px; height: 30px" src="../image/-.png"> 
									<%} %>
									</div>
								</div>
								<div class="divTableRow">
									<div class="divTableCell" id="g">피부타입별</div>
									<div class="divTableCell">
									<%if( CmmUtil.nvl(iDTO.getIng_type()).equals("1")){%>
									해당없음
									<%}else if(CmmUtil.nvl(iDTO.getIng_type()).equals("2")){ %>
									건성
									<%}else if(CmmUtil.nvl(iDTO.getIng_type()).equals("3")){ %>
									중성
									<%}else if(CmmUtil.nvl(iDTO.getIng_type()).equals("4")){ %>
									지성
									<%}else if(CmmUtil.nvl(iDTO.getIng_type()).equals("5")){ %>
									복합성
									<%} %>
									</div>
								</div>
								<div class="divTableRow">
									<div class="divTableCell" id="g">주의성분</div>
									<div class="divTableCell">
									<%if( CmmUtil.nvl(iDTO.getDanger_check()).equals("a")){%>
									해당없음
									<%}else if( CmmUtil.nvl(iDTO.getDanger_check()).equals("b")){%>
									임산부
									<%}else if( CmmUtil.nvl(iDTO.getDanger_check()).equals("c")){%>
									영유아용
									<%}else if( CmmUtil.nvl(iDTO.getDanger_check()).equals("d")){%>
									알레르기성 피부
									<%} %>
									</div>
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