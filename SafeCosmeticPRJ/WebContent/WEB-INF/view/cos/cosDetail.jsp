<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.health.util.CmmUtil"%>
<%@ page import="com.health.DTO.likeDTO" %>
<%@ page import="com.health.DTO.cosmeticDTO" %>
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
    %>
<meta charset="UTF-8">
<meta
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0"
	name="viewport" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<jsp:include page="/WEB-INF/view/top.jsp" flush="false"></jsp:include>
<style>
#w {
	height:300px;
	width: 400px;
	display: inline-block;
	border:solid #ecebeb 1px
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
	width: 800px;
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
	select();
});

//좋아요검색
function select() {
	
	$.ajax({
		type: 'post',
		url : '/like_select.do',
		data : {
	             'user_no' : '${sessionScope.SESSION_USER_NO}',
	             'cos_no' : '<%=cDTO.getCos_no() %>',
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
	            'brand' : '<%=cDTO.getBrand() %>'
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
</script>
</head>
<body class="index-page ">
	<div class="main main-raised">
		<div class="section section-basic">
			<div class="container">
				<div class="row">
					<div class="col-md-12 ml-auto mr-auto">
						<h3>화장품</h3>
						<hr>
						<div>
							<img src="./image/NoPic.png" alt="Rounded Image" class="rounded img-fluid" id="w" id="inline">
							<div id="inline">
								<p id="brand"><%=cDTO.getBrand()%></p>
								<h4><%=cDTO.getCos_name()%></h4>

								<label>분류 :</label>&ensp;<label id="db"><%=cDTO.getCos_type()%></label><br /> <label>정가
									:</label>&ensp;<label id="db"><%=cDTO.getPrice()%></label> <br /> <br /> <br /> <br />
								<input type="button" value="쇼핑하기" class="btn"
									style="width: 130px;" id="button">&ensp;
								<%if (SESSION_USER_ID.equals("admin")) {%>
									<input type="button" value="제품분석" class="btn" style="width: 130px" id="button">
									<% }else{%>
										<%if(lDTO.getLike_no()==null) {%>
											<img src="./image/like.png" id="like" name="like" style="display:none"  onclick="javascript:LikeDelete('<%=CmmUtil.nvl(cDTO.getCos_no()) %>');return false;">
											<img src="./image/like_border.png" id="dislike"  name="dislike" onclick="javascript:insert();return false;"  >
										<%}else{%>
											<img src="./image/like.png" id="like" name="like" onclick="javascript:LikeDelete('<%=CmmUtil.nvl(cDTO.getCos_no()) %>');return false;">
											<img src="./image/like_border.png" id="dislike" name="dislike" style="display:none"  onclick="javascript:insert();return false;" >
									<% }} %>

							</div>
						</div>

						<hr>
						<h3>성분정보</h3>
						<div>
							<i class="material-icons" id="inline-block">content_paste</i> <label
								id="inline-block-label" style="left: 45px;">성분구성</label>
						</div>

						<div class="divTable listTable"
							style="position: relative; left: 150px;">
							<div class="divTableBody">
								<div class="divTableRow">
									<div class="divTableCell"><img src="./image/1.png"  style="width:30px;height:30px"></div>
									<div class="divTableCell">스쿠알란&ensp;<label id="eng">Squalane</label></div>
								</div>
							</div>
						</div>
						<br/>
						<div>
							<i class="material-icons" id="inline-block">thumb_up</i> <label
								id="inline-block-label" style="left: 45px;">지성 관련 성분</label>
						</div>
						<div class="divTable listTable" style="position: relative; left: 150px;">
							<div class="divTableBody">
								<div class="divTableRow">
									<div class="divTableCell">캐모마일오일&ensp;<label id="eng">Ormenis Multicaulis Oil</label></div>
								</div>
							</div>
						</div>
						<br/>
						<div>
							<i class="material-icons" id="inline-block">thumb_up</i> <label
								id="inline-block-label" style="left: 45px;">중건성 관련 성분</label>
						</div>
						<div class="divTable listTable" style="position: relative; left: 150px;">
							<div class="divTableBody">
								<div class="divTableRow">
									<div class="divTableCell">캐모마일오일&ensp;<label id="eng">Ormenis Multicaulis Oil</label></div>
								</div>
							</div>
						</div>
						<br/>
						<div>
							<i class="material-icons" id="inline-block">thumb_up</i> <label
								id="inline-block-label" style="left: 45px;">지성 관련 성분</label>
						</div>
						<div class="divTable listTable" style="position: relative; left: 150px;"s>
							<div class="divTableBody">
								<div class="divTableRow">
									<div class="divTableCell">캐모마일오일&ensp;<label id="eng">Ormenis Multicaulis Oil</label></div>
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