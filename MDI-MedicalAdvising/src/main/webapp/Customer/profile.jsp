<%@ page import="model.Customer" %>
<%@ page import="model.Account" %><%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 11/12/2021
  Time: 7:58 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.css" rel="stylesheet">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <%--<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>--%>
    <style>
        body {
            background: #F1F3FA;
            font-family: "Montserrat", sans-serif;
        }


        .profile {
            margin: 20px 0;
        }

        .profile-sidebar {
            padding: 20px 0 10px 0;
            background: #fff;
            height: fit-content;
        }


        .profile-userpic img {
            float: none;
            margin: 0 auto;
            width: 50%;
            height: 50%;
            -webkit-border-radius: 50% !important;
            -moz-border-radius: 50% !important;
            border-radius: 50% !important;
        }


        .profile-usertitle {
            text-align: center;
            margin-top: 20px;
        }


        .profile-usertitle-name {
            color: #5a7391;
            font-size: 16px;
            font-weight: 600;
            margin-bottom: 7px;
        }


        .profile-usertitle-job {
            text-transform: uppercase;
            color: #5b9bd1;
            font-size: 12px;
            font-weight: 600;
            margin-bottom: 15px;
        }


        .profile-userbuttons {
            text-align: center;
            margin-top: 10px;
        }


        .profile-userbuttons .btn {
            text-transform: uppercase;
            font-size: 11px;
            font-weight: 600;
            padding: 6px 15px;
            margin-right: 5px;
        }


        .profile-userbuttons .btn:last-child {
            margin-right: 0px;
        }

        .profile-usermenu {
            margin-top: 30px;
        }

        .profile-usermenu ul li {
            border-bottom: 1px solid #f0f4f7;
        }


        .profile-usermenu ul li:last-child {
            border-bottom: none;
        }

        .profile-usermenu ul li a {
            color: #93a3b5;
            font-size: 14px;
            font-weight: 400;
        }


        .profile-usermenu ul li a i {
            margin-right: 8px;
            font-size: 14px;
        }

        .profile-usermenu ul li a:hover {
            background-color: #fafcfd;
            color: #5b9bd1;
        }


        .profile-usermenu ul li.active {
            border-bottom: none;
        }


        .profile-usermenu ul li.active a {
            color: #5b9bd1;
            background-color: #f6f9fb;
            border-left: 2px solid #5b9bd1;
            margin-left: -2px;
        }


        .profile-content {
            padding: 20px;
            background: #fff;
            min-height: 460px;
        }

        .padding {
            padding: 3rem !important
        }

        .user-card-full {
            overflow: hidden
        }

        .card {
            border-radius: 5px;
            -webkit-box-shadow: 0 1px 20px 0 rgba(69, 90, 100, 0.08);
            box-shadow: 0 1px 20px 0 rgba(69, 90, 100, 0.08);
            border: none;
            margin-bottom: 30px
        }

        .m-r-0 {
            margin-right: 0px
        }

        .m-l-0 {
            margin-left: 0px
        }

        .user-card-full .user-profile {
            border-radius: 5px 0 0 5px
        }

        .bg-c-lite-green {
            background: -webkit-gradient(linear, left top, right top, from(#f29263), to(#ee5a6f));
            background: linear-gradient(to right, #ee5a6f, #f29263)
        }

        .user-profile {
            padding: 20px 0
        }

        .card-block {
            padding: 1.25rem
        }

        .m-b-25 {
            margin-bottom: 25px
        }

        .img-radius {
            border-radius: 5px
        }

        h6 {
            font-size: 14px
        }

        .card .card-block p {
            line-height: 25px
        }

        @media only screen and (min-width: 1400px) {
            p {
                font-size: 14px
            }
        }

        .card-block {
            padding: 1.25rem
        }

        .b-b-default {
            border-bottom: 1px solid #e0e0e0
        }

        .m-b-20 {
            margin-bottom: 20px
        }

        .p-b-5 {
            padding-bottom: 5px !important
        }

        .card .card-block p {
            line-height: 25px
        }

        .m-b-10 {
            margin-bottom: 10px
        }

        .text-muted {
            color: #919aa3 !important
        }

        .b-b-default {
            border-bottom: 1px solid #e0e0e0
        }

        .f-w-600 {
            font-weight: 600
        }

        .m-b-20 {
            margin-bottom: 20px
        }

        .m-t-40 {
            margin-top: 20px
        }

        .p-b-5 {
            padding-bottom: 5px !important
        }

        .m-b-10 {
            margin-bottom: 10px
        }

        .m-t-40 {
            margin-top: 20px
        }

        .user-card-full .social-link li {
            display: inline-block
        }

        .user-card-full .social-link li a {
            font-size: 20px;
            margin: 0 10px 0 0;
            -webkit-transition: all 0.3s ease-in-out;
            transition: all 0.3s ease-in-out
        }
    </style>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@100;200;300;400;500;600&display=swap"
          rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css"
          integrity="sha512-NhSC1YmyruXifcj/KFRWoC561YpHpc5Jtzgvbuzx5VozKpWvQ+4nXhPdFgmx8xqexRcpAglTj9sIBWINXa8x5w=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <link rel="stylesheet" href="/assets/font/fontawesome/css/all.css">
    <link rel="stylesheet" href="/assets/css/base.css">
    <link rel="stylesheet" href="/assets/css/main.css">
</head>
<body>
<jsp:include page="/header.jsp"/>
<div class="container" style="margin-top: 180px">
    <div class="row profile">
        <div class="col-md-3">
            <div class="profile-sidebar">
                <div class="profile-userpic"><img
                        src="https://hocwebgiare.com/thiet_ke_web_chuan_demo/bootstrap_user_profile/images/profile_user.jpg"
                        class="img-responsive" alt="Thông tin cá nhân" style="object-fit: cover">
                </div>
                <div class="profile-usertitle">
                    <div class="profile-usertitle-name"> <%=((Customer) request.getSession().getAttribute("customer")).getFullName()%></div>
                    <div class="profile-usertitle-job">  <%=((Account) request.getSession().getAttribute("account")).getTypeAccount().getTypeName()%></div>
                </div>
                <div class="profile-userbuttons">
                    <a href="/medical"><button type="button" class="btn btn-success btn-sm">Trang chủ</button></a>
                    <a href="/account?actionUser=logout"><button type="button" class="btn btn-danger btn-sm">Đăng xuất</button></a>
                </div>
                <div class="profile-usermenu">
                    <ul class="nav">
                        <%--<div class="logo_menuchinh"
                             style="float:left; padding-top:5px; padding-left:10px; color:#fff; margin-left:auto; margin-right:auto; text-align:center; line-height:40px; font-size:16px;font-weight:bold;font-family:Arial">
                            HOCWEBGIARE.COM
                        </div>--%>
                        <%--<hr>--%>
                            <div></div>
                        <li><a href=""> <i class="glyphicon glyphicon-info-sign"></i> Thông tin
                            cá nhân </a>
                        </li>
                        <li><a href="https://hocwebgiare.com/"> <i class="glyphicon glyphicon-heart"></i> Hồ sơ bệnh án </a>
                        </li>
                        <li><a href="" target="_blank"> <i
                                class="glyphicon glyphicon-shopping-cart"></i> Quản lý đơn hàng </a>
                        </li>
                        <li><a href=""> <i class="glyphicon glyphicon-envelope"></i> Tư vấn </a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="col-md-9">
            <div class="profile-content">
                <h6 class="m-b-20 p-b-5 b-b-default f-w-600">Thông tin cá nhân</h6>
                <div class="row">
                    <div class="col-sm-6">
                        <p class="m-b-10 f-w-600">ID</p>
                        <h6 class="text-muted f-w-400"><%=((Customer) request.getSession().getAttribute("customer")).getId()%></h6>
                    </div>
                    <div class="col-sm-6">
                        <p class="m-b-10 f-w-600">Họ tên</p>
                        <h6 class="text-muted f-w-400"><%=((Customer) request.getSession().getAttribute("customer")).getFullName()%></h6>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-6">
                        <p class="m-b-10 f-w-600">Tên người dùng</p>
                        <h6 class="text-muted f-w-400"><%=((Account) request.getSession().getAttribute("account")).getUserName()%></h6>
                    </div>
                    <div class="col-sm-6">
                        <p class="m-b-10 f-w-600">Ngày sinh</p>
                        <h6 class="text-muted f-w-400"><%=((Customer) request.getSession().getAttribute("customer")).getBirthday()%></h6>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-6">
                        <p class="m-b-10 f-w-600">Số điện thoại</p>
                        <h6 class="text-muted f-w-400"><%=((Customer) request.getSession().getAttribute("customer")).getNumberPhone()%></h6>
                    </div>
                    <div class="col-sm-6">
                        <p class="m-b-10 f-w-600">Email</p>
                        <h6 class="text-muted f-w-400"><%=((Account) request.getSession().getAttribute("account")).getEmail()%></h6>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="js/jquery-1.11.1.min.js"></script>
</body>
</html>
