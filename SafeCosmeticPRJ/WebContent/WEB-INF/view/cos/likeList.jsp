<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.health.util.CmmUtil" %>
<%@ page import="com.health.DTO.likeDTO" %>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
	<%
	List<likeDTO> lList = (List<likeDTO>)request.getAttribute("lList");
	if(lList == null){
		lList = new ArrayList();
	}
	
	%>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" name="viewport" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />  
    <style>
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
	border:solid #ecebeb 1px
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
#inline {
	display: inline-block;
	position: absolute;
	top:60px;
	left: 140px;
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
    $(function(){
    	var id = document.getElementById("user_id");
    	id.focus();
    	
        //var a[] = [a,b,x,b];
       	//var aa = a[].join(",");
       	
       	$("#a").text("dfdfdf");
    });
    
	//상세이동
    function doDetail(n){
        var cos_no = n;
        location.href="/cosDetail.do?cos_no=" + cos_no;
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
                           <div>
							<img src="./image/NoPic.png" alt="Rounded Image" class="rounded img-fluid" id="w" id="inline" style="cursor:pointer">
							<div id="inline">
								<p id="brand"><%=lDTO.getBrand() %></p>
								<p id="cos_name" onclick="javascript:doDetail('<%=lDTO.getCos_no()%>');" style="cursor:pointer"><%=lDTO.getCos_name() %></p>
								<p id="price"><%=lDTO.getPrice() %></p>
								<p id="a"></p>
							</div>
							</div>
                           <hr>
                          <%} %>
                	</div>
            	</div>
           </div>
    </div>
	</div>
</body>
<jsp:include page="/WEB-INF/view/footer.jsp" flush="false"></jsp:include>
</html>