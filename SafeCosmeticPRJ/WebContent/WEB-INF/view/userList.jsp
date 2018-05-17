<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.health.util.CmmUtil"%>
<%@ page import="com.health.DTO.mainDTO"%>
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

	String SESSION_USER_ID = CmmUtil.nvl((String) session.getAttribute("session_user_id"));
	String SESSION_USER_NO = CmmUtil.nvl((String) session.getAttribute("session_user_no"));

	List<mainDTO> mList = (List<mainDTO>) request.getAttribute("mList");
	if (mList == null) {
		mList = new ArrayList();
	}
%>

<!-- Favicons -->
<link rel="apple-touch-icon"
	href="./bootstrap/mainassets/img/kit/free/apple-icon.png">
<link rel="icon" href="./image/pact.png">
<title>Safe Cosmetic</title>
<!--     Fonts and icons     -->
<link rel="stylesheet" type="text/css"
	href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" />
<link rel="stylesheet"
	href="./bootstrap/main/assets/css/material-kit.css">
<!-- Documentation extras -->
<!-- CSS Just for demo purpose, don't include it in your project -->
<link href="./bootstrap/main/assets/assets-for-demo/demo.css"
	rel="stylesheet" />
<!-- iframe removal -->
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

h3 {
	font-weight: lighter;
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
</style>
<script>
    
  	//상세이동
    function doDetail(n){
        var user_no = n;
        location.href="/userDetail.do?user_no=" + user_no;
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
						<h3>회원관리</h3>
						<hr>
						<form class="form" method="post" action="#">

							<div class="divTable listTable">
								<div class="divTableHeading">
									<div class="divTableRow">
										<div class="divTableHead">번호</div>
										<div class="divTableHead">아이디</div>
										<div class="divTableHead">이메일</div>
										<div class="divTableHead">성별</div>
										<div class="divTableHead">생년월일</div>
										<div class="divTableHead">피부타입</div>
										<div class="divTableHead">특이사항</div>
										<div class="divTableHead">가입일</div>
									</div>
								</div>
								<div class="divTableBody">
									<%
										for (mainDTO mDTO : mList) {
									%>
									<div class="divTableRow">
										<div class="divTableCell"><%=mDTO.getUser_no()%></div>
										<div class="divTableCell"
											onclick="doDetail(<%=mDTO.getUser_no()%>);" style="cursor:pointer"><%=mDTO.getUser_id()%></div>
										<div class="divTableCell"><%=mDTO.getEmail()%></div>
										<div class="divTableCell">
											<%
												if (CmmUtil.nvl(mDTO.getGender()).equals("w")) {
														out.print("여");
													} else {
														out.print("남");
													}
											%>
										</div>
										<div class="divTableCell"><%=mDTO.getAge()%>년
										</div>
										<div class="divTableCell">
											<%
												if (CmmUtil.nvl(mDTO.getSkin_type()).equals("1")) {
														out.print("건성");
													} else if (CmmUtil.nvl(mDTO.getSkin_type()).equals("2")) {
														out.print("중성");
													} else if (CmmUtil.nvl(mDTO.getSkin_type()).equals("3")) {
														out.print("지성");
													} else {
														out.print("복합성");
													}
											%>

										</div>
										<div class="divTableCell">
											<%
												if (CmmUtil.nvl(mDTO.getSomething()).equals("a")) {
														out.print("해당없음");
													} else if (CmmUtil.nvl(mDTO.getSomething()).equals("b")) {
														out.print("임산부");
													} else if (CmmUtil.nvl(mDTO.getSomething()).equals("c")) {
														out.print("영유아용");
													} else {
														out.print("알레르기성피부");
													}
											%>
										</div>
										<div class="divTableCell"><%=mDTO.getReg_dt()%></div>
									</div>
									<%
										}
									%>
								</div>

							</div>
							<div class="card-footer justify-content-center">
								<input type="button" value="더보기  ▼" id="button">
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