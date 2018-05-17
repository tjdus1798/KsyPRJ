<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<!-- Carousel Card -->
							<div class="card card-raised card-carousel" id="w" id="inline">
								<div id="carouselExampleIndicators" class="carousel slide"
									data-ride="carousel">
									<ol class="carousel-indicators">
										<li data-target="#carouselExampleIndicators" data-slide-to="0"
											class="active"></li>
										<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
										<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
									</ol>
									<div class="carousel-inner">
										<div class="carousel-item active">
											<img class="d-block w-100" src="../image/test2.PNG"
												alt="First slide">
											<div class="carousel-caption d-none d-md-block"></div>
										</div>
										<div class="carousel-item">
											<img class="d-block w-100" src="../image/test1.PNG"
												alt="Second slide">
											<div class="carousel-caption d-none d-md-block"></div>
										</div>
										<div class="carousel-item">
											<img class="d-block w-100" src="../image/test3.PNG"
												alt="Third slide">
											<div class="carousel-caption d-none d-md-block"></div>
										</div>
									</div>
									<a class="carousel-control-prev"
										href="#carouselExampleIndicators" role="button"
										data-slide="prev"> <i class="material-icons">keyboard_arrow_left</i>
										<span class="sr-only">Previous</span>
									</a> <a class="carousel-control-next"
										href="#carouselExampleIndicators" role="button"
										data-slide="next"> <i class="material-icons">keyboard_arrow_right</i>
										<span class="sr-only">Next</span>
									</a>
								</div>
							</div>
							<!-- End Carousel Card -->
</body>
</html>