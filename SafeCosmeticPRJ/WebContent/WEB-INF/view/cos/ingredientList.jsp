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
	font-size: 18px
}

.form-control, .is-focused .form-control {
	background-image: linear-gradient(to top, #efeeee 2px, rgba(156, 39, 176, 0)
		2px), linear-gradient(to top, #d2d2d2 1px, rgba(210, 210, 210, 0) 1px)
}

#selectbox {
	width: 50%;
	height: 35px;
	border-radius: 7px;
	border-color: #e4e2e2;
}

#button {
	background-color: rgb(197, 224, 180);
	color: white;
	border-style: none;
	width: 50%;
	height: 50px;
	font-size: 20px;
	font-weight: bold;
}
</style>
</head>
<body class="index-page ">
	<div class="main main-raised">
		<div class="section section-basic">
			<div class="container">

				<div class="row">
					<div class="col-md-12 ml-auto mr-auto">
						<h3>성분별 검색</h3>
						<hr>
						<form class="form" method="post" action="#">
							<div class="form-group">
								<input class="form-control" id="exampleInputEmail1" type="text"
									name="#" aria-describedby="emailHelp"
									placeholder="&ensp;포함할 성분 검색"><br /> <input
									class="form-control" id="exampleInputEmail1" type="text"
									name="#" aria-describedby="emailHelp"
									placeholder="&ensp;제외할 성분 검색">
							</div>
							<hr>

							<select name="cos_type" id="selectbox">
								<option style="background: #cdd0c3;">카테고리</option>
								<option style="background: #cdd0c3;">기초화장품</option>
								<option value="skin">스킨토너</option>
								<option value="lotion">로션/에멀젼/에센스</option>
								<option value="cream">크림/오일</option>
								<option value="mask">팩, 마스크</option>
								<option value="sunblock">자외선차단제</option>
								<option style="background: #cdd0c3;" value="0">메이크업</option>
								<option value="makeup_base">메이크업 베이스</option>
								<option value="powder">파우더</option>
								<option value="foundation">파운데이션</option>
								<option value="blusher">블러셔</option>
								<option value="eyeliner">아이라이너</option>
								<option value="eyeshadow">아이셰도우</option>
								<option value="eyebrow">아이브로우</option>
								<option value="mascara">마스카라</option>
								<option value="lipstick">립스틱</option>
								<option value="lip_gloss">립글로즈, 립밤</option>
								<option style="background: #cdd0c3;" value="0">클렌징</option>
								<option value="remover">립&아이리무버</option>
								<option value="Cleansing_foam">클렌징폼</option>
								<option value="cleansing_cream">클렌징크림</option>
								<option value="cleansing_oil">클렌징오일/워터</option>
								<option style="background: #cdd0c3;" value="0">바디제품</option>
								<option value="body_lotion">바디로션</option>
								<option value="body_oil">바디오일</option>
								<option value="body_wash">바디워시</option>
							</select> <br/> <br/> <br/> <br/>
							<input type="button" value="SEARCH" class="btn"
								id="button">
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<jsp:include page="/WEB-INF/view/footer.jsp" flush="false"></jsp:include>
</html>