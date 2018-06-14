<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.health.util.CmmUtil"%>
<%@ page import="com.health.DTO.mainDTO"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

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
#pn{
   	border: solid 1px;
    padding: 5px;
    border-radius: 5px;
     }
    .marg-top{
	margin-top:30px;
	}
	.pagination>.active>a, .pagination>.active>a:focus, .pagination>.active>a:hover, .pagination>.active>span, .pagination>.active>span:focus, .pagination>.active>span:hover{
	border: solid 1px;
    background-color: #c5e0b4;
    color: white;
    padding-left: 5px;
    padding-right: 5px;
    padding-top: 1px;
    padding-bottom: 1px;
	}
	a{
    color: #999999;
    }
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
        var user_no = n;
        location.href="/userDetail.do?user_no=" + user_no;
     }
    function goPage(pages, lines) {
        location.href = '?' + "pages=" + pages;
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
				           			<!-- 페이징  -->
		<c:choose>
		<c:when test="${paging.numberOfRecords ne NULL and paging.numberOfRecords ne '' and paging.numberOfRecords ne 0}">
		<div class="text-center marg-top">
			<ul class="pagination" style="display:inline-flex;">
				<c:if test="${paging.currentPageNo gt 5}">  											  <!-- 현재 페이지가 5보다 크다면(즉, 6페이지 이상이라면) -->
					<li><a href="javascript:goPage(${paging.prevPageNo}, ${paging.maxPost})" id="pn">이전</a>&ensp;</li> <!-- 이전페이지 표시 -->
				</c:if>
				<!-- 다른 페이지를 클릭하였을 시, 그 페이지의 내용 및 하단의 페이징 버튼을 생성하는 조건문-->
					<c:forEach var="i" begin="${paging.startPageNo}" end="${paging.endPageNo}" step="1"> <!-- 변수선언 (var="i"), 조건식, 증감식 -->
		            <c:choose>
		                <c:when test="${i eq paging.currentPageNo}"> 
		                      <li class="active"><a href="javascript:goPage(${i}, ${paging.maxPost})">${i}</a></li> <!-- 1페이지부터 10개씩 뽑아내고, 1,2,3페이지순으로 나타내라-->
		                </c:when>
		                	<c:otherwise>
		                    <li>&ensp;<a href="javascript:goPage(${i}, ${paging.maxPost})">${i}</a>&ensp;</li> 
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<!-- begin에 의해서 변수 i는 1이기 때문에, 처음에는 c:when이 수행된다. 그 후 페이징의 숫자 2를 클릭하면 ${i}는 2로변하고, 현재는 ${i}는 1이므로 otherwise를 수행한다
					         그래서 otherwise에 있는 함수를 수행하여 2페이지의 게시물이 나타나고, 반복문 실행으로 다시 forEach를 수행한다. 이제는 i도 2이고, currentPageNo도 2이기 때문에
					     active에 의해서 페이징부분의 2에 대해서만 파란색으로 나타난다. 그리고 나머지 1,3,4,5,이전,다음을 표시하기위해 다시 c:otherwise를 수행하여 페이징도 나타나게한다.-->
				<!-- // 다른 페이지를 클릭하였을 시, 그 페이지의 내용 및 하단의 페이징 버튼을 생성하는 조건문-->
				<!-- 소수점 제거 =>-->
				<fmt:parseNumber var="currentPage" integerOnly="true" value="${(paging.currentPageNo-1)/5}"/>
				<fmt:parseNumber var="finalPage" integerOnly="true" value="${(paging.finalPageNo-1)/5}"/>
				<c:if test="${currentPage < finalPage}"> <!-- 현재 페이지가 마지막 페이지보다 작으면 '다음'을 표시한다. -->
					<li>&ensp;<a href="javascript:goPage(${paging.nextPageNo}, ${paging.maxPost})" id="pn">다음</a>&ensp;</li>
				</c:if> 
			</ul>
			</div>
		</c:when>
		</c:choose>

					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<jsp:include page="/WEB-INF/view/footer.jsp" flush="false"></jsp:include>
</html>