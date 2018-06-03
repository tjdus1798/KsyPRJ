<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.health.util.CmmUtil"%>
<!DOCTYPE html>
<html>
<head>
    <%
    request.setCharacterEncoding("euc-kr");

    String SESSION_USER_ID = CmmUtil.nvl((String)session.getAttribute("session_user_id"));
    String SESSION_USER_NO = CmmUtil.nvl((String)session.getAttribute("session_user_no"));
    %>
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
 .btn {
	background-color: rgb(197, 224, 180);
	color: white;
	border-style: none;
	width: 30%;
	height: 50px;
	font-size: 20px;
	font-weight: bold;
	display:inline;
	position: relative;
    top: -2px;
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


</head>
<body class="index-page ">

	<div class="main main-raised">
		<div class="section section-basic">
			<div class="container">
				<div class="row">
					<div class="col-md-12 ml-auto mr-auto">
						<h3>브랜드별 검색</h3>
						<hr>
							<div class="form-group">
								<input class="form-control" class="searchbox" id="exampleInputEmail1" type="text"
									name="searchbox" aria-describedby="emailHelp"
									placeholder="&ensp;브랜드명 검색"> 
								
									 <input type="button" value="SEARCH" class="btn" style="background-color: rgb(197, 224, 180)">
							</div>
							
							<div id="search">
							
							<!-- <hr> 
                           <div>
							<img src="./image/NoPic.png" alt="Rounded Image" class="rounded img-fluid" id="w" id="inline" style="cursor:pointer">
							<div id="inline">
								<p id="brand">에뛰드하우스</p>
								<p id="cos_name" onclick="javascript:doDetail();" style="cursor:pointer">반짝반짝 립스틱</p>
								<p id="price">9800원</p>
								<p id="a"></p>
							</div>
							</div> -->
							</div>
							  
        		 		<!-- <div align="center"><input type="button" class="btn" id="addview" value="더보기" style="background-color: rgb(197, 224, 180)"> -->
 					</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<jsp:include page="/WEB-INF/view/footer.jsp" flush="false"></jsp:include>


<!-- <script src="./bootstrap/js/jquery-3.3.1.min.js"></script> -->
<!-- <script src="https://code.jquery.com/jquery-1.12.4.js"></script> -->
 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> 
<script>
var cos_no = "";
$(function(){
	//검색
	$("#exampleInputEmail1").change(function() {
		var search = $('#exampleInputEmail1').val();
		var contents = "";
		var count = "";
		var content = "";
	   if (search == "") {
	      location.href="/cos/brandList.do";
	   } else {
	      $.ajax({
	         url : "brand_search.do",
	         method : "post",
	         data : {'search' : search},
	         datatype : "json", 
	         success : function(data) {
          	 	contents += "제품&ensp;<font style='color:#7b9e03'><b>" + count + "</b></font>&ensp;개";
             	content += "<hr>";
	            $.each(data, function (key, value) {
	            		count =  value.like_count;
	           			cos_no = value.cos_no;
	            	  console.log("key : "+key);
	            	  console.log("value : "+value);
	            	  console.log("cos_no : "+ value.cos_no);
	                  content += "<div style='height:100px'>";
	                  content += "<img src='./cosmetic/"+ value.img_name +"' alt='Rounded Image' class='rounded img-fluid' id='w' id='inline' style='cursor:pointer' onclick='doDetail(" + cos_no + ");'>";
	                  content += "<div id='inline'>";
	                  content += "<p id='brand'>"+value.brand+"</p>";
	                  content += "<p id='cos_name' onclick='javascript:doDetail();' style='cursor:pointer' onclick='doDetail(" + cos_no + ");'>"+ value.cos_name +"</p>";
	                  content += "<p id='price'>" + value.price + "원</p></div></div><hr/>";
	            });
	            
	            if(content == ""){
	         	   content += '<b>"'+search+'" 에 해당하는 검색결과가 없습니다.</font><b><br><br></div>';
			 			$('#search').append(contents+content);
	            }else{
	            $('#search').html('');
	            $('#search').append(contents+content);
	            }
	               $('#addview').remove();
	         	}
	         
	      });
	   }
	});
/*  	 var tag=[];
	//자동완성
	$("#exampleInputEmail1").keyup(function() {
	   var search = $('#exampleInputEmail1').val();
	      $.ajax({
	         url : "brand_auto.do",
	         method : "post",
	         data : {'search' : search},
	         datatype : "json", 
	         success : function(data) {
	            $.each(data, function (key, value) {
	            	  tag.push(value.brand);
	            });
	            	console.log(tag);
	         }
	      });
	});
	  $( "#exampleInputEmail1").autocomplete({
  		source: tag
  	});  */ 
	
     $( "#exampleInputEmail1" ).autocomplete({
    	 width: 300,
         max: 10,
         delay: 100,
         minLength: 1,
         autoFocus: true,
         cacheLength: 1,
         scroll: true,
         highlight: false,
         source: function( request, response ) {
        	 var search = $('#exampleInputEmail1').val();
           $.ajax({
             url: "brand_auto.do",
             method : "post",
             data: {
            	 "search" : search 
            },
             dataType: "json",
             success: function( data ) {
            	 response($.map(data, function (item) {  
                     return {  
                         value: item.brand  
                     }  
                     console.log(data);
                 }))  
	               
             } ,
             open: function() {
                 $( this ).removeClass( "ui-corner-all" ).addClass( "ui-corner-top" );
             },
             close: function() {
               $( this ).removeClass( "ui-corner-top" ).addClass( "ui-corner-all" );
             }
           });
         }
     });  
      
});

//상세이동
function doDetail(n){
    var cos_no = n;
    location.href="/cosDetail.do?cos_no=" + cos_no;
 }
</script>

</html>