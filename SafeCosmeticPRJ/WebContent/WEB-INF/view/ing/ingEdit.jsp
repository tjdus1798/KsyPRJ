<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.health.DTO.ingDTO"%>
<%@ page import="com.health.util.CmmUtil"%>

<!DOCTYPE html>
<html>
<head>
<%
	ingDTO iDTO = (ingDTO) request.getAttribute("iDTO");
	if (iDTO == null)
		iDTO = new ingDTO();
%>
<meta charset="UTF-8">
<meta
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0"
	name="viewport" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<!-- Bootstrap core CSS-->
<link href="./bootstrap/common/vendor/bootstrap/css/bootstrap.css"
	rel="stylesheet">
<!-- Custom fonts for this template-->
<link
	href="./bootstrap/common/vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<!-- Custom styles for this template-->
<script src="./bootstrap/js/jquery-3.3.1.min.js"></script>
<style>
#button {
	background-color: rgb(197, 224, 180);
	color: white;
	border-style: none;
	border-radius: 10px;
	width: 300px;
	height: 50px;
	font-size: 20px;
}
#selectbox1{
	
	width:35%;
	height:30px;
	color:gray;
	border-radius: 7px;
	border-color: #d2d2d2;
}
#selectbox2{
	
	width:35%;
	height:30px;
	color:gray;
	border-radius: 7px;
	border-color: #d2d2d2;
}
.card-header card-header-primary text-center {
	border-bottom: 0;
}
</style>
<script>


	$(function(){
		
	});

    	
	
</script>
<jsp:include page="/WEB-INF/view/top.jsp" flush="false"></jsp:include>
</head>
<body class="index-page ">
	<div class="main main-raised">
		<div class="section section-basic">
			<div class="container">
				<div class="row">
					<div class="col-md-12 ml-auto mr-auto">
						<h3>성분등록</h3>
						<hr>
						<form class="form" method="post" action="/ingReg_proc.do">
							<div class="form-group">
								<label for="exampleInputEmail1">성분명</label> <input
									class="form-control" id="exampleInputEmail1" name="ing_name"
									type="text" aria-describedby="#"
									value="<%=CmmUtil.nvl(iDTO.getIng_name())%>">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">영문명</label> <input
									class="form-control" id="exampleInputEmail1" name="ing_eng"
									type="text" aria-describedby="#"
									value="<%=CmmUtil.nvl(iDTO.getIng_eng())%>">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">배합목적</label> <input
									class="form-control" id="exampleInputEmail1" name="mix"
									type="text" aria-describedby="#"
									value="<%=CmmUtil.nvl(iDTO.getMix())%>">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">EWG등급</label> <input
									class="form-control" id="exampleInputEmail1" name="ewg_level"
									type="text" aria-describedby="#"
									value="<%=CmmUtil.nvl(iDTO.getEwg_level())%>">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">피부타입별</label><br/>
								<select
									name="ing_type" id="selectbox1">
									<option value="1" <% if(CmmUtil.nvl(iDTO.getIng_type()).equals("1")) { out.println("SELECTED"); } %>>건성</option>
									<option value="2" <% if(CmmUtil.nvl(iDTO.getIng_type()).equals("2")) { out.println("SELECTED"); } %>>중성</option>
									<option value="3" <% if(CmmUtil.nvl(iDTO.getIng_type()).equals("3")) { out.println("SELECTED"); } %>>지성</option>
									<option value="4" <% if(CmmUtil.nvl(iDTO.getIng_type()).equals("4")) { out.println("SELECTED"); } %>>복합성</option>
								</select>
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">주의성분</label><br/>
								<select
									name="danger_check" id="selectbox2">
									<option value="a" <% if(CmmUtil.nvl(iDTO.getDanger_check()).equals("a")) { out.println("SELECTED"); } %>>해당없음</option>
									<option value="b" <% if(CmmUtil.nvl(iDTO.getDanger_check()).equals("b")) { out.println("SELECTED"); } %>>임산부</option>
									<option value="c" <% if(CmmUtil.nvl(iDTO.getDanger_check()).equals("c")) { out.println("SELECTED"); } %>>영유아용</option>
									<option value="d" <% if(CmmUtil.nvl(iDTO.getDanger_check()).equals("d")) { out.println("SELECTED"); } %>>알레르기성피부</option>
								</select>
							</div>
							<div class="card-header card-header-primary text-center"
								style="border-bottom: 0;">
								<input type="submit" value="수정" class="btn" style="width: 150px"
									id="button"> <input type="button" value="취소"
									class="btn" style="width: 150px" id="button">
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