<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ page import="com.health.util.CmmUtil" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" name="viewport" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <%
    request.setCharacterEncoding("euc-kr");

    String SESSION_USER_ID = CmmUtil.nvl((String)session.getAttribute("session_user_id"));
    String SESSION_USER_NO = CmmUtil.nvl((String)session.getAttribute("session_user_no"));
    %>
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
</head>
<body class="index-page ">
    <nav class="navbar navbar-color-on-scroll navbar-transparent    fixed-top  navbar-expand-lg " color-on-scroll="100" id="sectionsNav">
        <div class="container">
            <div class="navbar-translate">
                <a class="navbar-brand" href="main.do">Safe Cosmetic </a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                    <span class="navbar-toggler-icon"></span>
                    <span class="navbar-toggler-icon"></span>
                </button>
            </div>
            <div class="collapse navbar-collapse">
                <ul class="navbar-nav ml-auto">
                <% if (SESSION_USER_ID.equals(" ")||SESSION_USER_ID.equals("")) {%>
               <li class="nav-item">
                        <a class="nav-link" href="/login.do" onclick="scrollToDownload()">
                            로그인
                        </a>
                    </li>
                   <% }else{ %>
                     <%if (SESSION_USER_ID.equals("admin")){ %>
                      <li class="dropdown nav-item">
                        <a href="#" class="dropdown-toggle nav-link" data-toggle="dropdown">
                            <%=SESSION_USER_ID%>님!
                        </a>
                        <div class="dropdown-menu dropdown-with-icons">
                            <a href="/userList.do" class="dropdown-item">
                                <i class="material-icons">people_outline</i>회원관리
                            </a>
                            <a href="/logOut.do" class="dropdown-item">
                                <i class="material-icons">directions_run</i>로그아웃
                            </a>
                        </div>
                   </li>
                   
                    <li class="dropdown nav-item">
                        <a href="#" class="dropdown-toggle nav-link" data-toggle="dropdown">
                            화장품
                        </a>
                        <div class="dropdown-menu dropdown-with-icons">
                            <a href="/cosReg.do" class="dropdown-item">
                                <i class="material-icons">note_add</i>화장품 등록
                            </a>
                            <a href="/cosList.do" class="dropdown-item">
                                <i class="material-icons">description</i>화장품 리스트
                            </a>
                        </div>
                    </li>
                   
                    <%}else{%>
                    <li class="dropdown nav-item">
                        <a href="#" class="dropdown-toggle nav-link" data-toggle="dropdown">
                             <%=SESSION_USER_ID%>님!
                        </a>
                        <div class="dropdown-menu dropdown-with-icons">
                            <a href="/likeList.do" class="dropdown-item">
                                <i class="material-icons">mood</i>좋아요
                            </a>
                            <a href="/userDetail.do?user_no=<%=SESSION_USER_NO%>" class="dropdown-item">
                                <i class="material-icons">account_circle</i>개인정보수정
                            </a>
                            <a href="/userCheck.do" class="dropdown-item">
                                <i class="material-icons">lock_outline</i>비밀번호변경
                            </a>
                            <a href="/logOut.do" class="dropdown-item">
                                <i class="material-icons">directions_run</i>로그아웃
                            </a>
                        </div>
                    </li>
                   
                    <%}}%>
                     <li class="nav-item">
                        <a class="nav-link" href="/ingList.do" onclick="scrollToDownload()">
                              성분정보
                        </a>
                    </li>
                    <li class="dropdown nav-item">
                        <a href="#" class="dropdown-toggle nav-link" data-toggle="dropdown">
                            검색
                        </a>
                        <div class="dropdown-menu dropdown-with-icons">
                            <a href="/ingredientList.do" class="dropdown-item">
                                <i class="material-icons">search</i>성분별
                            </a>
                            <a href="/brandList.do" class="dropdown-item">
                                <i class="material-icons">search</i>브랜드별
                            </a>
                        </div>
                    </li>
                    <li class="dropdown nav-item">
                        <a href="#" class="dropdown-toggle nav-link" data-toggle="dropdown">
                            추천화장품
                        </a>
                        <div class="dropdown-menu dropdown-with-icons">
                            <a href="/pregnantList.do" class="dropdown-item">
                                <i class="material-icons">pregnant_woman</i>임산부
                            </a>
                            <a href="/babyList.do" class="dropdown-item">
                                <i class="material-icons">child_care</i>영유아
                            </a>
                            <a href="/allergyList.do" class="dropdown-item">
                                <i class="material-icons">local_pharmacy</i>알레르기성 피부
                            </a>
                        </div>
                    </li>
                     <li class="nav-item">
                        <a class="nav-link" href="/boardList.do" onclick="scrollToDownload()">
                              게시판
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <div class="page-header header-filter clear-filter purple-filter" data-parallax="true" style="background-image: url('./image/cos1.jpg');background-color:rgb(185, 224, 185),rgb(255, 235, 0);">
        <div class="container">
            <div class="row">
                <div class="col-md-8 ml-auto mr-auto">
                    <div class="brand">
                         <h1>I Love Safe Cosmetic</h1>
                    </div>
                </div>
            </div>
        </div>
    </div>