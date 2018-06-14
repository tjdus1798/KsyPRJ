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
	    width: 20%;
    height: 45px;
    font-size: 20px;
    font-weight: bold;
    margin-left: 52%;
    margin-top: -160px;
}
 .btn {
	background-color: rgb(197, 224, 180);
	color: white;
	border-style: none;
	width: 200px;
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
			<form class="form" action="ingredient_search.do"  onsubmit="return doSubmit(this);">
				<div class="row">
				
					<div class="col-md-12 ml-auto mr-auto">
						<h3>성분별 검색</h3>
						<hr>
								<select name="cos_type" id="selectbox">
								<option style="background: #cdd0c3;" value="choice">카테고리</option>
								<option style="background: #cdd0c3;" value="choice">기초화장품</option>
								<option value="skin">스킨토너</option>
								<option value="lotion">로션/에멀젼/에센스</option>
								<option value="cream">크림/오일</option>
								<option value="mask">팩, 마스크</option>
								<option value="sunblock">자외선차단제</option>
								<option style="background: #cdd0c3;" value="choice">메이크업</option>
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
								<option style="background: #cdd0c3;" value="choice">클렌징</option>
								<option value="remover">립&아이리무버</option>
								<option value="Cleansing_foam">클렌징폼</option>
								<option value="cleansing_cream">클렌징크림</option>
								<option value="cleansing_oil">클렌징오일/워터</option>
								<option style="background: #cdd0c3;" value="choice">바디제품</option>
								<option value="body_lotion">바디로션</option>
								<option value="body_oil">바디오일</option>
								<option value="body_wash">바디워시</option>
							</select>
							<br/><br/>
								<input class="form-control" id="exampleInputEmail1" type="text"
									name="good" aria-describedby="emailHelp" id="good"
									placeholder="&ensp;포함할 성분 검색">

							<input type="submit" value="SEARCH" class="btn"
								id="button">
								
						<div id="search"></div>
					</div>
					
				</div>
				</form>
			</div>
		</div>
	</div>
</body>
<jsp:include page="/WEB-INF/view/footer.jsp" flush="false"></jsp:include>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
function doSubmit(form) { //전송시 유효성 체크
	
	if (form.cos_type.value == "choice") {
        alert("분류를 선택해주세요.");
        form.cos_type.focus();
        return false;
     }
	if (form.good.value == "") {
        alert("성분명을 입력해주세요.");
        form.good.focus();
        return false;
     }
}
$(function(){
	$( "#exampleInputEmail1").autocomplete({
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
            url: "ingredient_auto.do",
            method : "post",
            data: {
           	 "good" : search 
           },
            dataType: "json",
            success: function( data ) {
           	 response($.map(data, function (item) {  
                    return {  
                        value: item.ing_name  
                    }  
                    console.log(data);
                }))  
                return false;
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


</script>
</html>