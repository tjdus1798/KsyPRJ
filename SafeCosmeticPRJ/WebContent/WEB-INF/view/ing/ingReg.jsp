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
    #button {
	background-color:rgb(197, 224, 180);
	color:white;
	border-style:none;
	border-radius: 10px;
	width:300px;
	height:50px;
	font-size:20px;
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
                            <form class="form" method="post" action="/ingReg_proc.do">
                           <div class="form-group">
				           <label for="exampleInputEmail1">성분명</label>
				           <input class="form-control" id="exampleInputEmail1" 
				           name="ing_name" type="text" aria-describedby="#">
				           </div>
				            <div class="form-group">
				           <label for="exampleInputEmail1">영문명</label>
				           <input class="form-control" id="exampleInputEmail1" 
				           name="ing_eng" type="text" aria-describedby="#">
				           </div>
                          <div class="form-group">
				           <label for="exampleInputEmail1">배합목적</label>
				           <input class="form-control" id="exampleInputEmail1"
				           name="mix" type="text" aria-describedby="#">
				           </div>
				           <div class="form-group">
				           <label for="exampleInputEmail1">EWG등급</label>
				           <input class="form-control" id="exampleInputEmail1"
				           name="ewg_level" type="text" aria-describedby="#">
				           </div>
				           <div class="form-group">
				           <label for="exampleInputEmail1">피부타입별</label>
				           <input class="form-control" id="exampleInputEmail1"
				           name="ing_type" type="text" aria-describedby="#">
				           </div>
				           <div class="form-group">
				           <label for="exampleInputEmail1">주의성분</label>
				           <input class="form-control" id="exampleInputEmail1"
				           name="danger_check" type="text" aria-describedby="#">
				           
				           <div class="card-header card-header-primary text-center">
				           <input type="submit" value="등록" class="btn" style="width:150px" id="button">
				           <input type="button" value="취소" class="btn" style="width:150px" id="button">
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