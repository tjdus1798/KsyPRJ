<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.health.util.CmmUtil"%>
<%@ page import="com.health.DTO.likeDTO" %>
<%@ page import="com.health.DTO.cosmeticDTO" %>
<%@ page import="com.health.DTO.ingDTO" %>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<%
    request.setCharacterEncoding("euc-kr");

    String SESSION_USER_ID = CmmUtil.nvl((String)session.getAttribute("session_user_id"));
    String SESSION_USER_NO = CmmUtil.nvl((String)session.getAttribute("session_user_no"));
    
    cosmeticDTO cDTO = (cosmeticDTO)request.getAttribute("cDTO");
	if(cDTO==null) cDTO = new cosmeticDTO();
	likeDTO lDTO = (likeDTO)request.getAttribute("lDTO");
	if(lDTO==null) lDTO = new likeDTO();
	List<ingDTO> iList = (List<ingDTO>)request.getAttribute("iList");
	if(iList == null){
		iList = new ArrayList();
}
    %>
<meta charset="UTF-8">
<meta
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0"
	name="viewport" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<jsp:include page="/WEB-INF/view/top.jsp" flush="false"></jsp:include>
<style>
.badge{
	border : solid 1px #7b9e03;
	color : #7b9e03;
	font-size : 15px;
	background-color: white;
	border-radius : 5px;
	float: right;
	margin-right: 5px;
}
h3 {
	display: inline;
}

#eng {
	color: gray;
	font-size: 13px;
}
#inline-block {
	display: inline-block;
}

#inline-block-label {
	display: inline-block;
	position: absolute;
	font-weight: bold;
	font-size: 19px;
}

#inline {
	display: inline-block;
	position: absolute;
	top: 120px;
	left: 450px;
}
#w {
	height:300px;
	width: 400px;
	display: inline-block;
	border:solid #ecebeb 1px
}
p {
	color: gray;
	font-weight: lighter;
}

#db {
	color: black;
}

#button {
	background-color: rgb(197, 224, 180);
	color: white;
	border-style: none;
	border-radius: 10px;
	height: 45px;
	font-weight: bold;
	font-size: 18px;
}

#brand {
	font-size: 17px;
}

h4 {
	font-weight: bold;
	font-size: 20px;
}

div.listTable {
	font-family: sans-serif;
	border: 1px solid #E3DEDE;
	background-color: #FFFFFF;
	width: 85%;
	text-align: center;
	border-collapse: collapse;
}

.divTable.listTable .divTableCell, .divTable.listTable .divTableHead {
	border: 1px solid #e8e5e5;
	padding: 7px 7px;
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
#eng{
	color:gray;
	font-size: 13px;
}
</style>
<script src="./bootstrap/js/jquery-3.3.1.min.js"></script>
<script>

$(function(){
	var ing =  $("#ing_name").val();
	select();
	shop();
}); 
//쇼핑하기API
function shop(){
	var content = "";
	 $.ajax({
	         type : 'post',
	         url : '/shopping_proc.do',
	         data : {
	            'keyword' : '<%=cDTO.getCos_name() %>'
	         },
	         success : function(data) {
	        	 $.each(data, function (key, value) {
	        		//console.log(value.link);
	        		console.log(value.link);
	        		content += "<a href="+ value.link +" target='_blank'><img src='./image/shopping.png' id='button'></a>";
	        	 });
	        	 $('#test').append(content);
	         }
	   });
}
//좋아요검색
function select() {
	
	$.ajax({
		type: 'post',
		url : '/like_select.do',
		data : {
	             'user_no' : '${sessionScope.SESSION_USER_NO}',
	             'cos_no' : '<%=cDTO.getCos_no() %>'
	    },
	    success : function(data) {
	    	console.log(data);
	    }, 
		error : function(data) {
           console.log("검색 실패");
	    }
	});
	
}
//좋아요추가
function insert(){
	 $.ajax({
	         type : 'post',
	         url : '/like_insert.do',
	         data : {
	            'user_no' : '${sessionScope.SESSION_USER_NO}',
	            'cos_no' : '<%=cDTO.getCos_no() %>',
	            'reg_no' : '${sessionScope.SESSION_USER_NO}',
	            'cos_name' : '<%=cDTO.getCos_name() %>',
	            'price' : '<%=cDTO.getPrice() %>',
	            'brand' : '<%=cDTO.getBrand() %>',
	            'img_name' : '<%=cDTO.getImg_name() %>'
	         },
	         success : function(data) {
	            alert("좋아요 추가되었습니다.");
	            console.log("좋아요 추가");
	            console.log(data);
	       		$('#dislike').hide();
	            $('#like').show();
				},
	         error : function(data) {
	            alert("다시 시도해주세요.");
	         }
	   });

};

//좋아요취소
function LikeDelete(){
       $.ajax({
          type : 'post',
          url : '/like_delete.do',
          data : {
        	  'cos_no' : '<%=cDTO.getCos_no() %>'
          },
          success : function(data) {
                alert("좋아요 취소되었습니다.");
                console.log("좋아요 취소");
                
               $('#like').hide();
                $('#dislike').show();
          },
          error : function(data) {
             alert("다시 시도해주시기 바랍니다.");
          }
    });
}
//차트 이동
function goAnalysis(n){
    var cos_no = n;
    location.href="/analysis.do?cos_no="+ cos_no;
 }
//수정하기
function doEdit(i){
    var cos_no = i;
    location.href="/cosEdit.do?cos_no="+ cos_no;
 }
//삭제하기
function delete_check(n, m) {
	var cos_no = n;
	var img_name = m;
    if(confirm("삭제하시겠습니까?")){
       location.href="/cosDelete.do?cos_no="+ cos_no +"&img_name="+ img_name;
       return true;
    }else{
       return false;
    }
  }
//좋아요 로그인 체크
function login_check(i) {
	var id=i;
    if(id == ""){
    	alert("로그인이 필요한 서비스입니다.");
    	location.href="/login.do";
       	return true;
    }else{
    	insert();
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
						<h3>화장품</h3>
						<%if(SESSION_USER_ID.equals("admin")) {%>
						<span class="badge" style="cursor:pointer;" onclick="delete_check('<%=cDTO.getCos_no()%>','<%=cDTO.getImg_name()%>');">삭제</span>
							&ensp;<span class="badge" onclick="doEdit('<%=CmmUtil.nvl(cDTO.getCos_no()) %>');" style="cursor:pointer;">수정</span>
						 <%} %>
						<hr>
						<div>
						<%if(cDTO.getImg_name() == null || cDTO.getImg_name().equals("")){ %>
							<img src="./image/NoPic.png" alt="Rounded Image" class="rounded img-fluid" id="w" id="inline">
						<%}else{ %>
						<img src="./cosmetic/<%= cDTO.getImg_name() %>" alt="Rounded Image" class="rounded img-fluid" id="w" id="inline">
						<%} %>	
							<div id="inline">
								<p id="brand"><%=cDTO.getBrand()%></p>
								<h4><%=cDTO.getCos_name()%></h4>
								<label>분류 :</label>&ensp;<label id="db"><%=cDTO.getCos_type()%></label><br /> <label>정가
									:</label>&ensp;<label id="db"><%=cDTO.getPrice()%>원</label> <br /> <br /> <br /> <br />
								<a id="test"></a>&ensp;
								<%if (SESSION_USER_ID.equals("admin")) {%>
									<img src="./image/analysis.png" id="button" style="cursor:pointer;" onclick="javascript:goAnalysis('<%=CmmUtil.nvl(cDTO.getCos_no()) %>')">
									<% }else{%>
										<%if(lDTO.getLike_no()==null) {%>
											<img src="./image/like.png" id="like" name="like" style="display:none"  onclick="javascript:LikeDelete('<%=CmmUtil.nvl(cDTO.getCos_no()) %>');return false;">
											<img src="./image/like_border.png" id="dislike"  name="dislike" onclick="login_check('<%=SESSION_USER_ID %>');"  >
										<%}else{%>
											<img src="./image/like.png" id="like" name="like" onclick="javascript:LikeDelete('<%=CmmUtil.nvl(cDTO.getCos_no()) %>');return false;">
											<img src="./image/like_border.png" id="dislike" name="dislike" style="display:none"  onclick="login_check('<%=SESSION_USER_ID %>');" >
									<% }} %>

							</div>
						</div>
						<hr>
						<h3>성분정보</h3>
						<br><br>
						<div>
							<i class="material-icons" id="inline-block">content_paste</i> <label
								id="inline-block-label" style="left: 45px;">성분구성</label>
						</div>

						<div class="divTable listTable">
							<div class="divTableBody">
								<c:if test="${not empty iList}">
								<c:forEach items="${iList}" var="list">
								<div class="divTableRow">
									<div class="divTableCell">
									<c:choose>
											<c:when test="${list.ewg_level eq '1'}">
													<img style="width: 25px; height: 25px" src="../image/1.png">
											</c:when>
											<c:when test="${list.ewg_level eq '1-2'}">
													<img style="width: 25px; height: 25px" src="../image/1-2.png"> 
											</c:when>
											<c:when test="${list.ewg_level eq '1-3'}">
													<img style="width: 25px; height: 25px" src="../image/1-3.png"> 
											</c:when>
											<c:when test="${list.ewg_level eq '2'}">
													<img style="width: 25px; height: 25px" src="../image/2.png">
													</c:when>
											<c:when test="${list.ewg_level eq '3'}">
													<img style="width: 25px; height: 25px" src="../image/3.png"> 
												</c:when>
												<c:when test="${list.ewg_level eq '4'}">
													<img style="width: 25px; height: 25px" src="../image/4.png"> 
												</c:when>
												<c:when test="${list.ewg_level eq '5'}">
													<img style="width: 25px; height: 25px" src="../image/5.png"> 
												</c:when>
												<c:when test="${list.ewg_level eq '6'}">
													<img style="width: 25px; height: 25px" src="../image/6.png"> 
												</c:when>
												<c:when test="${list.ewg_level eq '7'}">
													<img style="width: 25px; height: 25px" src="../image/7.png"> 
												</c:when>
												<c:when test="${list.ewg_level eq '8'}">
													<img style="width: 25px; height: 25px" src="../image/8.png"> 
												</c:when>
												<c:when test="${list.ewg_level eq '9'}">
													<img style="width: 25px; height: 25px" src="../image/9.png"> 
												</c:when>
												<c:when test="${list.ewg_level eq '10'}">
													<img style="width: 25px; height: 25px" src="../image/10.png"> 
												</c:when>
												<c:when test="${list.ewg_level eq '-'}">
													<img style="width: 25px; height: 25px" src="../image/-.png"> 
												</c:when>
												</c:choose>
									</div>
									<div class="divTableCell" >${list.ing_name} &ensp;<label id="eng">${list.ing_eng}</label></div>
								</div>
								</c:forEach>
								</c:if>
								<c:if test="${empty iList}">
										<div class="divTableCell">등록된 성분정보가 없습니다.</div>
								</c:if>
							</div>
						</div>
						<br/>
						
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<jsp:include page="/WEB-INF/view/footer.jsp" flush="false"></jsp:include>
