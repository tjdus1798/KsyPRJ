<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.health.util.CmmUtil"%>
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
.form-control {
	border: solid 1px #e6e5e5;
	background: 0;
	background-color: #efeeee;
	border-radius: 7px;
	font-size: 18px;
	display:inline;
	height:50px;
}

.form-control, .is-focused .form-control {
	background-image: linear-gradient(to top, #efeeee 2px, rgba(156, 39, 176, 0)
		2px), linear-gradient(to top, #d2d2d2 1px, rgba(210, 210, 210, 0) 1px)
}
#button {
	background-color: rgb(197, 224, 180);
	color: white;
	border-style: none;
	width: 20%;
	height: 50px;
	font-size: 20px;
	font-weight: bold;
	display:inline;
}
</style>
</head>
<body class="index-page ">

	<div class="main main-raised">
		<div class="section section-basic">
			<div class="container">
				<div class="row">
					<div class="col-md-12 ml-auto mr-auto">
						<h3>브랜드별 검색</h3>
						<hr>
						<form class="form" method="post" action="#">
							<div class="form-group">
								<input class="form-control" id="exampleInputEmail1" type="text"
									name="#" aria-describedby="emailHelp"
									placeholder="&ensp;브랜드명 검색"> 
									 <input type="button" value="SEARCH" class="btn" id="button">
							</div>
							<hr/>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<jsp:include page="/WEB-INF/view/footer.jsp" flush="false"></jsp:include>
</html>