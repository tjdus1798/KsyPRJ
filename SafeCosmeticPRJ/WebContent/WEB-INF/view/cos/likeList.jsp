<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.health.util.CmmUtil" %>
<%@ page import="com.health.DTO.likeDTO" %>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
	<%
	List<likeDTO> lList = (List<likeDTO>)request.getAttribute("page");
	if(lList == null){
		lList = new ArrayList();
	}
	
	%>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" name="viewport" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />  
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
	.pagination {
	    display: inline-flex;
	    padding-left: 0;
	    list-style: none;
	    border-radius: 0.25rem;
	}
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
	  font-size: 12px;
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
	.divTable{ display: table; }
	.divTableRow { display: table-row; }
	.divTableHeading { display: table-header-group;}
	.divTableCell, .divTableHead { display: table-cell;}
	.divTableHeading { display: table-header-group;}
	.divTableBody { display: table-row-group;}
#w {
	height:100px;
	width: 100px;
	display: inline-block;
	border:solid #ecebeb 1px;
	position: relative;
    top: -30px;
}
#inline {
	display: inline-block;
	position: relative;
	left: 40px;
}
#inline-block {
	display: inline-block;
}
p {
	color: gray;
	font-weight: lighter;
}

#db {
	color: black;
}
#brand {
	font-size: 14px;
}
#cos_name {
	font-size: 18px;
	font-weight: bold;
	color:black;
}

    </style>
    <script src="./bootstrap/js/jquery-3.3.1.min.js"></script>
    <script>
	//상세이동
    function doDetail(n){
        var cos_no = n;
        location.href="/cosDetail.do?cos_no=" + cos_no;
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
                    <div class="col-md-12 ml-auto mr-auto" >
                            <h3>좋아요</h3>
                            <hr> 
                            <%for (likeDTO lDTO : lList) { %>
                           <div style="height:100px">
							<%if(lDTO.getImg_name()==null){ %>
								<img src="./image/NoPic.png" alt="Rounded Image" class="rounded img-fluid" id="w" id="inline">
							<%}else{ %>
								<img src="./cosmetic/<%= lDTO.getImg_name() %>" alt="Rounded Image" class="rounded img-fluid" id="w" id="inline">
							<%} %>	
							<div id="inline">
								<p id="brand"><%=lDTO.getBrand() %></p>
								<p id="cos_name" onclick="javascript:doDetail('<%=lDTO.getCos_no()%>');" style="cursor:pointer"><%=lDTO.getCos_name() %></p>
								<p id="price"><%=lDTO.getPrice() %>원</p>
								<p id="a"></p>
							</div>
							</div>
                           <hr>
                          <%} %>
                          
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