<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ page import="com.health.util.CmmUtil" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" name="viewport" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <jsp:include page="/WEB-INF/view/top.jsp" flush="false"></jsp:include>
    <style>
    .fileDrop{
    width:88%;
    height:100px;
    border:1px dotted gray;
    background-color:	#F0F8FF;
    margin:auto;
    }
    </style>
    <script src = "http://cdnjs.cloudflare.com/ajax/libs/handlers.js/3.0.1/handlebars.js"></script>
</head>
<body class="index-page ">
 <div class="main main-raised">
  <div class="form-group">
 	 <label for="exampleInputEmail1">File Drop Here</label>
  	<div class="fileDrop"></div>
  </div>
  
  <div class="box-footer">
  	<div>
  		<hr>
  	</div>
  
 
 <ul class="mailbox-attachments clearfix uploadedList">
 </ul>
 <button type="submit" >submit</button>
 
   <script id="template" type="text/x-handlebars-template">
	<li>
		<span class="mailbox-attachment-icon has-img"><img src="{{imgsrc}}" alt="Attachment"></span>

	</script>

</div>
</div>
</body>
<jsp:include page="/WEB-INF/view/footer.jsp" flush="false"></jsp:include>
</html>