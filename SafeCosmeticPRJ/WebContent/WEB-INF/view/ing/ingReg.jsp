<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.health.util.CmmUtil" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" name="viewport" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />  
  <!-- Bootstrap core CSS-->
  <link href="./bootstrap/common/vendor/bootstrap/css/bootstrap.css" rel="stylesheet">
  <!-- Custom fonts for this template-->
  <link href="./bootstrap/common/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
  <!-- Custom styles for this template-->
    <style>
    #exampleInputEmail1 {
	display: inline;
	border: solid 0.1px #d2d2d2;
	background-image:none;
}
#exampleInputEmail1:focus {
	border-color:#7b9e03;
	box-shadow:0 0 0 0.2rem #7b9e0359;
}
    #button {
	background-color:rgb(197, 224, 180);
	color:white;
	border-style:none;
	border-radius: 10px;
	width:300px;
	height:50px;
	font-size:20px;
	font-weight: bold;
	}
#selectbox1{
	
	width:50%;
	height:40px;
	color:gray;
	border-radius: 7px;
	border-color: #d2d2d2;
}
#selectbox2{
	
	width:50%;
	height:40px;
	color:gray;
	border-radius: 7px;
	border-color: #d2d2d2;
}
.card-header card-header-primary text-center {
	border-bottom: 0;
}
	
    </style>
    <script>
    window.onload = function(){
    	var id = document.getElementById("user_id");
    	id.focus();
    };
    
    function doSubmit(form) { //전송시 유효성 체크
           
           if (form.ing_name.value == "") {
              alert("성분명을 입력해주세요.");
              form.ing_name.focus();
              return false;
           }
           if (form.ing_eng.value == "") {
               alert("성분의 영문명을 입력해주세요.");
               form.ing_eng.focus();
               return false;
            }
           if (form.mix.value == "") {
               alert("배합목적을 입력해주세요.");
               form.mix.focus();
               return false;
            }
           if (form.ewg_level.value == "") {
               alert("EWG등급을 입력해주세요.");
               form.ewg_level.focus();
               return false;
            }
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
                            <h3>성분등록</h3><hr>
                            <form class="form" method="post" action="/ingReg_proc.do" onsubmit="return doSubmit(this);" >
                           <div class="form-group">
				           <label for="exampleInputEmail1">성분명</label>
				           <input class="form-control" id="exampleInputEmail1" maxlength="100"
				           name="ing_name" type="text" aria-describedby="#">
				           </div>
				            <div class="form-group">
				           <label for="exampleInputEmail1">영문명</label>
				           <input class="form-control" id="exampleInputEmail1" maxlength="200"
				           name="ing_eng" type="text" aria-describedby="#">
				           </div>
                          <div class="form-group">
				           <label for="exampleInputEmail1">배합목적</label>
				           <input class="form-control" id="exampleInputEmail1"maxlength="150"
				           name="mix" type="text" aria-describedby="#">
				           </div>
				           <div class="form-group">
				           <label for="exampleInputEmail1">EWG등급</label>
				           <input class="form-control" id="exampleInputEmail1" maxlength="5"
				           name="ewg_level" type="text" aria-describedby="#">
				           </div>
				           <div class="form-group">
								<label for="exampleInputEmail1">피부타입별</label><br/>
								<select
									name="ing_type" id="selectbox1">
									<option value="1">해당없음</option>
									<option value="2">건성</option>
									<option value="3">중성</option>
									<option value="4">지성</option>
									<option value="5">복합성</option>
								</select>
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">주의성분</label><br/>
								<select
									name="danger_check" id="selectbox2">
									<option value="a">해당없음</option>
									<option value="b">임산부</option>
									<option value="c">영유아용</option>
									<option value="d">알레르기성피부</option>
								</select>
							</div>

				           
				           <div class="card-header card-header-primary text-center">
				           <input type="submit" value="등록" class="btn" style="width:150px" id="button">
				           <input type="button" value="취소" class="btn" style="width:150px" id="button" onclick="location.href='/ingList.do'">
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