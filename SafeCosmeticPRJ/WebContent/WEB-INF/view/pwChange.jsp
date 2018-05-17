<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.health.util.CmmUtil" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" name="viewport" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <!-- Favicons -->
    <link rel="apple-touch-icon" href="./bootstrap/mainassets/img/kit/free/apple-icon.png">
    <link rel="icon" href="./image/pact.png">
    <title>
        Safe Cosmetic
    </title>
    <!--     Fonts and icons     -->
    <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" />
    <link rel="stylesheet" href="./bootstrap/main/assets/css/material-kit.css">
    <!-- Documentation extras -->
    <!-- CSS Just for demo purpose, don't include it in your project -->
    <link href="./bootstrap/main/assets/assets-for-demo/demo.css" rel="stylesheet" />
    <!-- iframe removal -->
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
	
	label{
	color:black;
	font-size:4px;
	
	}
    </style>

</head>
<body class="index-page ">
    <div class="main main-raised">
        <div class="section section-basic">
             <div class="container">
                <div class="row">
                    <div class="col-md-6 ml-auto mr-auto">
                        <div class="card card-signup">
                                <div class="card-header card-header-primary text-center">
                                    <h3>비밀번호 변경</h3>
                                    
                                </div>
                                <p class="text-divider"></p>
                                <div class="card-body">
                                <form class="form" method="post" action="/pwEmailConfirm.do">
                                    <div class="input-group">
                                        <input type="password" class="form-control" placeholder="Password" name="password">
                                    </div>
                                    <div class="input-group">
                                        <input type="password" class="form-control" placeholder="Password">
                                    </div>
                                    
                                    <div class="card-footer justify-content-center">
                                    	<input type="submit" value="비밀번호 변경" id="button">
                                    </div>
                                    </form>
                                   </div>
                        </div>
                    </div>
                </div>
            </div>
    </div>
	</div>
    <!--   Core JS Files   -->
    <script src="./bootstrap/main/assets/js/core/jquery.min.js"></script>
    <script src="./bootstrap/main/assets/js/core/popper.min.js"></script>
    <script src="./bootstrap/main/assets/js/bootstrap-material-design.js"></script>
    <!--  Plugin for Date Time Picker and Full Calendar Plugin  -->
    <script src="/bootstrap/main/assets/js/plugins/moment.min.js"></script>
    <!--	Plugin for the Datepicker, full documentation here: https://github.com/Eonasdan/bootstrap-datetimepicker -->
    <script src="./bootstrap/main/assets/js/plugins/bootstrap-datetimepicker.min.js"></script>
    <!--	Plugin for the Sliders, full documentation here: http://refreshless.com/nouislider/ -->
    <script src="./bootstrap/main/assets/js/plugins/nouislider.min.js"></script>
    <!-- Material Kit Core initialisations of plugins and Bootstrap Material Design Library -->
    <script src="./bootstrap/main/assets/js/material-kit.js?v=2.0.2"></script>
    <!-- Fixed Sidebar Nav - js With initialisations For Demo Purpose, Don't Include it in your project -->
    <script src="./bootstrap/main/assets/assets-for-demo/js/material-kit-demo.js"></script>
    <script>
        $(document).ready(function() {

            //init DateTimePickers
            materialKit.initFormExtendedDatetimepickers();

            // Sliders Init
            materialKit.initSliders();
        });
    </script>
</body>

</html>