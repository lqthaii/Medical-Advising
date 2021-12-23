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
<%@ page import="model.Order" %>
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
    <link rel="stylesheet" href="/assets/font/fontawesome/css/all.css">
    <link rel="stylesheet" href="/assets/css/base.css">
    <link rel="stylesheet" href="/assets/css/main.css">
    <link rel="stylesheet" href="/assets/css/order.css">
    <link rel="icon" href="/assets/image/881599_medical_512x512.png" type="image/x-icon">
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
        .close, .closeDelivery {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }

        .close:hover,.closeDelivery:hover,
        .close:focus, .closeDelivery:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }
        .status__container {
            padding: 0 20px;
        }
        form {
            position: relative;
            height: 387px;
        }
        .product-in-cart-list {
            margin: 10px 0;
            overflow: scroll;
            max-height: 156px;
        }
        .product-in-cart-item {
            padding: 0 20px;
            display: flex;
        }
        .btn__status__container {
            display: flex;
            justify-content: center;
        }
        .btn__status {
            position: absolute;
            bottom: 0;
            align-items: center;
            padding: 8px 80px;
            background-color: var(--main-color);
            border: none;
        }
        .product-total{
            padding-left: 20px;
            color: tomato;
            font-size: 13pt;
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
                    if (session.getAttribute("account") != null && session.getAttribute("doctor") != null) {
                        if (((Account) request.getSession().getAttribute("account")).getTypeAccount().getId() == 2) {
                %>
                <li class="navbar__menu__item"><a href="/medical?actionUser=reply"><i class="fas fa-capsules"></i>Trả
                    lời câu hỏi</a></li>
                <%
                        }
                    }
                %>


                <%
                    if (session.getAttribute("account") != null && session.getAttribute("customer") != null) {
                        if (((Account) request.getSession().getAttribute("account")).getTypeAccount().getId() == 1) {
                %>
                <li class="navbar__menu__item"><a href="/medical?actionUser=question"><i
                        class="fas fa-question-circle"></i>
                    Hỏi Đáp</a>
                </li>
                <%
                        }
                    }
                %>
                <%
                    if (session.getAttribute("doctor") == null) {
                %>
                <li class="navbar__menu__item"><a href="https://mizuha2020.github.io/pharmacy_map/" target="_blank"><i class="fas fa-cannabis"></i> Nhà
                    thuốc gần tôi</a></li>
                <li class="navbar__menu__item navbar__menu__item--coop">
                    <a href="/user-coop.jsp"><i class="fas fa-handshake"></i> Đối tác</a>
                </li>
                <%
                    }
                %>
                <%
                    if (session.getAttribute("account") != null && session.getAttribute("customer") != null) {
                        if (((Account) request.getSession().getAttribute("account")).getTypeAccount().getId() == 4) {
                %>
                <li class="navbar__menu__item"><a href="/medical?actionUser=pharma"><i class="fas fa-capsules"></i> Quản
                    Lý</a></li>
                <%
                        }
                    }
                %>
            </ul>
            <!-- menu-user -->
            <ul class="navbar__menu menu-user">
                <%
                    if (session.getAttribute("account") != null && session.getAttribute("customer") != null) {
                %>
               <%-- <li class="navbar__menu__item navbar__menu__item--notify">
                    <a href="#"> <i class="fas fa-shopping-cart"></i> Giỏ hàng</a>
                    <span class="notify-number">${orderNum}</span>
                    <div class="notify">
                        <header class="notify__header">
                            <h3>Sản phẩm đã thêm</h3>
                        </header>
                        <c:forEach var="item" items="${order.getItemList()}">
                        <ul class="cart__list__container">
                            <li class="cart__list__item">
                                <img src="../assets/image/image01.jpg" alt="sản phẩm đã thêm" class="item__img">
                                <div class="item__info">
                                    <div class="item__header">
                                        <h5 class="item__name">tên</h5>
                                        <span class="item__price">giá: 3000đ</span>
                                        <span class="item__qnt">x3</span>
                                        <span class="item__update"></span>
                                    </div>
                                    <div class="item__body">
                                        <span class="items__price__total">Tổng: 9000đ</span>
                                        <span class="icon__update">
                    <span class="item__cart__edit"><i class="fas fa-pencil-alt edit__cart"></i></span>
                                            <!-- <span class="item__cart__edit"><i class="far fa-trash-alt"></i></span> -->
                <span class="item__cart__edit"><i class="fas fa-trash-alt remove__cart"></i></span>
              </span>
                                    </div>
                                </div>
                            </li>
                            </c:forEach>
                    </div>
                </li>--%>
                <%
                    }
                %>
                <%--                Xử lý login cho bác sĩ--%>
                <%
                    if (session.getAttribute("account") != null && session.getAttribute("doctor") != null) {
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
                <%
                    if (session.getAttribute("account") != null && session.getAttribute("customer") != null) {
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
                <%
                    if (session.getAttribute("account") == null && session.getAttribute("customer") == null) {
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
            <a href="/medical" class="logo-link">
                <img src="../assets/image/logo_transparent.png" alt="" class="header-middle__logo">
            </a>
            <div class="header-middle-search">
                <input type="text" class="header-middle-search__input" placeholder="Nhập tìm kiếm..." name="search">
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
            <a href="/medical?actionUser=search" class="search-icon-link">
                <div class="search-icon">
                    <i class="fas fa-search"></i>
                </div>
            </a>
            <a <%--href="/medical"--%> class="logo-link" onclick="window.open('https://medical-advice.netlify.app/', '_blank', 'location=yes,height=570,width=1000,scrollbars=yes,status=yes')">
                <img src="../assets/image/logo2_transparent.png" alt="" class="header-middle__logo" >
            </a>
        </div>
    </div>
</div>
<c:if test="${order!=null}">
    <div class="shopping__cart" id="btnModal" onclick="openModal()">
        <i class="fas fa-cart-plus"></i>
        <span class="shopping__cart__number display--none">0</span>
    </div>
</c:if>

<%--<c:if test="${order!=null}">--%>
    <div class="shopping__cart__list" style="display:none;" id="modal">
        <h4 class="shopping__cart__header">Sản phẩm đã thêm<span class="close">&times;</span></h4>

        <ul class="cart__list__container">
            <c:forEach items="${order.getItemList()}" var="item">
                <li class="cart__list__item">
                    <img src="data:image/jpg;base64,${item.getDrug().getImage()}" alt="sản phẩm đã thêm" class="item__img" style="object-fit: cover">
                    <div class="item__info">
                        <div class="item__header">
                            <h5 class="item__name">${item.getDrug().getName()}</h5>
                            <span class="item__price">${item.getPrice()}đ</span>
                            <span class="item__qnt">x${item.getQuantity()}</span>
                            <span class="item__update"></span>
                        </div>
                        <div class="item__body">
                            <span class="items__price__total">${item.getPrice()*item.getQuantity()}</span>
                            <span class="icon__update">
                <span class="item__cart__edit"><i class="fas fa-pencil-alt edit__cart"></i></span>
                                <!-- <span class="item__cart__edit"><i class="far fa-trash-alt"></i></span> -->
                <span class="item__cart__edit"><i class="fas fa-trash-alt remove__cart"></i></span>
              </span>
                        </div>
                    </div>
                </li>
            </c:forEach>
        </ul>
        <c:if test="${totalPrice!=null}"><h4 style="margin: 5px 20px; color: tomato">Tổng: ${totalPrice}  </h4></c:if>
        <div class="btn__buy__cart">
            <button class="buy__confirm" id="buy" onclick="openDelivery()">Mua</button>
        </div>
    </div>
<div class="modal" style="display: none;" id="modalDelivery">
    <div class="modal__overlay"></div>
    <div class="modal__body" style="height: 490px">
        <form action="/payment" method="post">
            <h2 style="padding: 0 20px;">Nhập thông tin giao hàng <span class="closeDelivery">&times;</span></h2>
            <div class="info__container">
                <div class="name__container info__content">
                    <span>Họ tên</span>
                    <input type="text" required placeholder="vui lòng nhập tên của bạn" class="name__value" name="nameDelivery">
                </div>
                <div class="tel__container info__content">
                    <span>Số điện thoại</span>
                    <input type="text" required placeholder="Vui lòng nhập số điện thoại" class="tel__value" name="numberPhoneDelivery">
                </div>
                <div class="address__container info__content">
                    <span>Địa chỉ</span>
                    <input type="text" required placeholder="Vui lòng nhập địa chỉ" class="address__value" name="andressDelivery">
            </div>
            <div class="product-in-cart">
                <h2 style="padding: 0 20px; margin: 0">Danh sách sản phẩm đã thêm</h2>
                <ul class="cart__list__container product-in-cart-list">
                    <c:forEach items="${order.getItemList()}" var="item">
                    <li class="product-in-cart-item">
                        <img src="data:image/jpg;base64,${item.getDrug().getImage()}" alt="sản phẩm đã thêm" class="item__img">
                        <div class="item__info">
                            <div class="item__header">
                                <h5 class="item__name">${item.getDrug().getName()}</h5>
                                <span class="item__price">${item.getPrice()}đ</span>
                                <span class="item__qnt">x${item.getQuantity()}</span>
                            </div>
                            <div class="item__body">
                                <span class="items__price__total">Tổng: ${item.getPrice()*item.getQuantity()}</span>
                            </div>
                        </div>
                    </li>
                    </c:forEach>
                </ul>
                <div class="product-total">
                    <span>Tổng tiền: ${totalPrice}</span>
                </div>
                <div class="btn__status__container" style="height: 85px">
                    <button class="btn__status btn__seeking" type="submit" style="border-radius: 10px">Gửi thông tin</button>
                </div>
            </div>
        </form>
        </div>
    </div>
</div>
<%--</c:if>--%>
<!-- Header End -->
<%--<script src="/js/main.js"></script>--%>
<script>
    var modal = document.getElementById("modal");
    var btn = document.getElementById("btnModal");
    var span = document.getElementsByClassName("close")[0];
    var buy = document.getElementById("buy");
    var modalDelivery = document.getElementById("modalDelivery");
    var close = document.getElementsByClassName("closeDelivery")[0];
    span.onclick = function() {
        modalDelivery.style.display = "none";
        modal.style.display = "none";
        btn.style.display = "block";
    }
    close.onclick = function() {
        modalDelivery.style.display = "none";
        btn.style.display = "block";
    }
    window.onclick = function(event) {
        if (event.target == modal) {
            modal.style.display = "none";
            btn.style.display = "block";
        }
    }
    function openModal(){
        btn.style.display = "none";
        modal.style.display = "block";
    }
    function  openDelivery(){
        modalDelivery.style.display = "flex";
        modal.style.display = "none";
        btn.style.display = "block";
    }
</script>
</body>
</html>
