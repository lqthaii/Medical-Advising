<%@ page import="model.Customer" %><%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 23/11/2021
  Time: 9:42 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.io.*,java.util.*" %>
<%@ page import="model.Account" %>
<%@ page import="model.Doctor" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@100;200;300;400;500;600&display=swap"
          rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css"
          integrity="sha512-NhSC1YmyruXifcj/KFRWoC561YpHpc5Jtzgvbuzx5VozKpWvQ+4nXhPdFgmx8xqexRcpAglTj9sIBWINXa8x5w=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <link rel="stylesheet" href="assets/font/fontawesome/css/all.css">
    <link rel="stylesheet" href="assets/css/base.css">
    <link rel="stylesheet" href="assets/css/main.css">
    <link rel="icon" href="assets/image/881599_medical_512x512.png" type="image/x-icon">
    <title>Medical Advice</title>
    <script type="text/javascript">
        var Tawk_API = Tawk_API || {}, Tawk_LoadStart = new Date();
        (function () {
            var s1 = document.createElement("script"), s0 = document.getElementsByTagName("script")[0];
            s1.async = true;
            s1.src = 'https://embed.tawk.to/612f4f1bd6e7610a49b31057/1fegcq1ck';
            s1.charset = 'UTF-8';
            s1.setAttribute('crossorigin', '*');
            s0.parentNode.insertBefore(s1, s0);
        })();
    </script>
    <style>
        .header-middle__logo {
            height: 100px;
            object-fit: cover;
        }
    </style>

</head>
<body>
<!-- Header Begin -->
<div class="header">
    <div class="grid row">
        <nav class="navbar">
            <ul class="navbar__menu">
                <li class="navbar__menu__item"><a href="/medical"><i class="fas fa-home"></i>
                    Trang Chủ</a></li>
                <li class="navbar__menu__item"><a href="/medical?actionUser=pharma"><i class="fas fa-capsules"></i> Nhà
                    Thuốc</a></li>


                <%
                    if (session.getAttribute("account") != null && session.getAttribute("doctor") != null)
                    {
                        if (((Account)request.getSession().getAttribute("account")).getTypeAccount().getId()==2) {
                %>
                <li class="navbar__menu__item"><a href="/medical?actionUser=reply"><i class="fas fa-capsules"></i>Trả lời câu hỏi</a></li>
                <%
                        }}
                %>


                <%if (session.getAttribute("account") != null && session.getAttribute("customer") != null)
                {
                    if (((Account)request.getSession().getAttribute("account")).getTypeAccount().getId()==1) {
                %>
                <li class="navbar__menu__item"><a href="/medical?actionUser=question"><i
                        class="fas fa-question-circle"></i>
                    Hỏi Đáp</a>
                </li>
                <%
                    }}
                %>
                <%
                    if (session.getAttribute("doctor") == null) {
                %>
                <li class="navbar__menu__item navbar__menu__item--coop">
                    <a href="#"><i class="fas fa-handshake"></i> Trở thành đối tác của chúng tôi</a>
                    <div class="navbar__menu__item-coop">
                        <ul class="coop-list">
                            <li class="coop-list-item"><a href="#">Bác Sĩ</a></li>
                            <li class="coop-list-item"><a href="#">Nhà Thuốc</a></li>
                            <li class="coop-list-item"><a href="#">Shipper</a></li>
                        </ul>
                    </div>
                </li>
                <%
                    }
                %>
                <%
                if (session.getAttribute("account") != null && session.getAttribute("customer") != null)
                {
                    if (((Account)request.getSession().getAttribute("account")).getTypeAccount().getId()==4) {
                %>
                <li class="navbar__menu__item"><a href="/medical?actionUser=pharma"><i class="fas fa-capsules"></i> Quản Lý</a></li>
                <%
                    }}
                %>
            </ul>
            <!-- menu-user -->
            <ul class="navbar__menu menu-user">
                <%if (session.getAttribute("account") != null && session.getAttribute("customer") != null)
                {
                %>
                <li class="navbar__menu__item navbar__menu__item--notify">
                    <a href="#"> <i class="fas fa-bell"></i> Thông báo</a>
                    <span class="notify-number">5</span>
                    <div class="notify">
                        <header class="notify__header">
                            <h3>Thông báo của bạn</h3>
                        </header>
                        <ul class="notify__list">
                            <li class="notify__list__item">
                                <a href="#" class="notify__list__item-link">
                                    <div class="notify-info notify-info-new">
                                                <span class="notify-name">
                                                    Bác sĩ Nguyễn Anh Quốc đã trả lời câu hỏi của bạn
                                                </span>
                                    </div>
                                </a>
                            </li>
                        </ul>
                    </div>
                </li>
                <%
                    }
                %>
<%--                Xử lý login cho bác sĩ--%>
                <%if (session.getAttribute("account") != null && session.getAttribute("doctor") != null)
                {
                %>
                <li class="navbar__menu__item navbar__menu__user">
                    <a href="#">
                            <span class="user-name">
                                <%=((Doctor) request.getSession().getAttribute("doctor")).getFullName()%>
                            </span>
                        <img src="../assets/image/maxresdefault.jpg" alt="avatar"
                             class="navbar__menu__user__avt">
                    </a>
                    <div class="user-setting">
                        <ul class="user-setting__list">
                            <li class="user-setting__item"><a href="/medical?actionUser=profile">Thông tin</a></li>
                            <li class="user-setting__item"><a href="/medical?actionUser=reply">Trả lời câu hỏi</a></li>
                            <li class="user-setting__item"><a href="/account?actionUser=logout">Đăng
                                xuất</a></li>
                        </ul>
                    </div>
                </li>
                <%
                    }
                %>
<%--                Xử lý login cho người dùng--%>
                <%if (session.getAttribute("account") != null && session.getAttribute("customer") != null)
                    {
                %>
                <li class="navbar__menu__item navbar__menu__user">
                    <a href="#">
                            <span class="user-name">
                                <%=((Customer) request.getSession().getAttribute("customer")).getFullName()%>
                            </span>
                        <img src="../assets/image/maxresdefault.jpg" alt="avatar"
                             class="navbar__menu__user__avt">
                    </a>
                    <div class="user-setting">
                        <ul class="user-setting__list">
                            <li class="user-setting__item"><a href="/medical?actionUser=profile">Thông tin</a></li>
                            <li class="user-setting__item"><a href="#">Hồ sơ bệnh án</a></li>
                            <li class="user-setting__item"><a href="#">Lịch sử đơn hàng</a></li>
                            <li class="user-setting__item"><a href="/account?actionUser=logout">Đăng
                                xuất</a></li>
                        </ul>
                    </div>
                </li>
                <%
                    }
                %>
<%--                Xử lý khi chưa login --%>
                <%if (session.getAttribute("account") == null && session.getAttribute("customer") == null)
                    {
                %>
                <li class="navbar__menu__item" id="user-info"><a href="/medical?actionUser=login">Đăng Nhập</a>
                </li>
                <li class="navbar__menu__item"><a href="/medical?actionUser=signup">Đăng Kí</a></li>
                <%
                    }
                %>
            </ul>
        </nav>

    </div>
    <!-- Top header end-->

    <div class="header-middle row">
        <div class="header-middle-content">
            <a href="index.html" class="logo-link">
                <img src="../assets/image/logo_transparent.png" alt="" class="header-middle__logo">
            </a>

            <div class="header-middle-search">
                <input type="text" class="header-middle-search__input" placeholder="Nhập tìm kiếm...">
                <div class="search-example">
                    <div class="search-example-content">
                        <div class="search-example-content__title">
                            Tìm kiếm phổ biến
                        </div>
                        <a href="#">
                            <div class="search-example-content__item">Thuốc trị cảm cúm</div>
                        </a>
                        <a href="#">
                            <div class="search-example-content__item">Thuốc ho</div>
                        </a>
                        <a href="#">
                            <div class="search-example-content__item">Đau bụng</div>
                        </a>
                        <a href="#">
                            <div class="search-example-content__item">Khó thở</div>
                        </a>
                        <a href="#">
                            <div class="search-example-content__item">Thuốc kháng sinh</div>
                        </a>


                    </div>
                </div>
            </div>
            <a href="#" class="search-icon-link">
                <div class="search-icon">
                    <i class="fas fa-search"></i>
                </div>
            </a>
            <a href="/medical" class="logo-link">
                <img src="../assets/image/logo2_transparent.png" alt="" class="header-middle__logo">
            </a>

        </div>

    </div>
</div>
<!-- Header End -->
<%--<script src="/js/main.js"></script>--%>
</body>
</html>
