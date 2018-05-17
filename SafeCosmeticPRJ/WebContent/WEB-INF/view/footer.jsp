<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">

</head>
<body>
<!--  End Modal -->
    <footer class="footer ">
        <div class="container">
            <nav class="pull-left">
                <ul>
                    <li>
                        <a href="https://www.kcia.or.kr/cid/">
                            화장품성분사전
                        </a>
                    </li>
                    |
                    <li>     
                         <a href="http://www.mfds.go.kr/index.do" >
                        	 식약청 
                         </a>
                    </li>
                </ul>
            </nav>
            <div class="copyright pull-right">
                &copy;
                <script>
                    document.write(new Date().getFullYear())
                </script>, made with <i class="material-icons">favorite</i> by
                <a href="" target="_blank" style="color:#7b9e03">safe cosmetic</a> for a better your skin.
            </div>
        </div>
    </footer>
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