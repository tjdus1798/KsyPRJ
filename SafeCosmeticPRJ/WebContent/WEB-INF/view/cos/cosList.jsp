<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ page import="com.health.util.CmmUtil" %>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.health.DTO.cosmeticDTO"%>
<!DOCTYPE html>
<html>
<head>
<%
	List<cosmeticDTO> cList = (List<cosmeticDTO>)request.getAttribute("cList");
	if(cList == null){
	   cList = new ArrayList();
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
	font-size:25px;
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
	  overflow: hidden; 
  	  text-overflow: ellipsis;
  	  white-space: nowrap; 
	}
	.divTable.listTable .divTableCell, .divTable.listTable .divTableHead {
	  border: 1px solid #C4C4C4;
	  padding: 7px 7px;
	}
	.divTable.listTable .divTableBody .divTableCell {
	  font-size: 15px;
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
	  font-size: 17px;
	  font-weight: bold;
	  color: #696969;
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
    </style>
    <jsp:include page="/WEB-INF/view/top.jsp" flush="false"></jsp:include>
	<script>
	//상세이동
    function doDetail(n){
        var cos_no = n;
        location.href="/cosDetail.do?cos_no=" + cos_no;
     }
	</script>
</head>
<body class="index-page ">
<div class="main main-raised">
        <div class="section section-basic">
             <div class="container">

                <div class="row">
                    <div class="col-md-12 ml-auto mr-auto" >
                            <h3>화장품 목록</h3>
                            <hr> 
                            <form class="form" method="post" action="#">
                           <div class="form-group">
				            <div class="divTable listTable">
										<div class="divTableHeading">
										<div class="divTableRow">
										<div class="divTableHead" style="width:7%">번호</div>
										<div class="divTableHead" style="width:13%">분류</div>
										<div class="divTableHead" style="width:35%">품명</div>
										<div class="divTableHead" style="width:20%">브랜드</div>
										<div class="divTableHead" style="width:15%">가격</div>
										</div>
										</div>
										<div class="divTableBody" >
										<%for (cosmeticDTO cDTO : cList) { %>
										<div class="divTableRow">
										<div class="divTableCell"><%= cDTO.getCos_no() %></div>
										<div class="divTableCell"><%= cDTO.getCos_type() %></div>
										<div class="divTableCell"  onclick="doDetail(<%=cDTO.getCos_no()%>);" style="cursor:pointer"><%= cDTO.getCos_name() %></div>
										<div class="divTableCell"><%= cDTO.getBrand() %></div>
										<div class="divTableCell"><%= cDTO.getPrice() %>원</div>
										</div>
										<%} %>
										</div>
										
										
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