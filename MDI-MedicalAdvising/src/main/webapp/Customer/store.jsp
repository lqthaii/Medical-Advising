<%@ page import="java.util.Locale" %>
<%@ page import="java.text.NumberFormat" %><%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 23/11/2021
  Time: 11:55 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
          crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="assets/font/fontawesome/css/all.css">
    <link rel="stylesheet" href="assets/css/base.css">
    <link rel="stylesheet" href="assets/css/main.css">
    <link rel="stylesheet" href="assets/css/order.css">
    <link rel="icon" href="assets/image/881599_medical_512x512.png" type="image/x-icon">
    <script type="text/javascript" src="js/map.js"></script>
    <script type="text/javascript" src="js/main.js"></script>
    <script type="text/javascript" src="js/order.js"></script>
    <title>Medical Advice</title>
    <style>
        .cart:hover{

        }
    </style>
</head>
<body>
<jsp:include page="header.jsp"/>
<div style="margin-top: 100px"></div>
<div class="container">
    <div class="grid">
        <div class="grid__row">
            <div class="grid__column-3">
                <nav class="category">
                    <h3 class="category__heading">
                        <i class="fas fa-list-ul"></i>
                        Danh mục
                    </h3>
                    <ul class="category-list">
                        <li class="category-item category-item--active">
                            <a href="/medical?actionUser=pharma" class="category-item__link category-item__link--selected">Tất cả</a>
                        </li>
                        <c:forEach items="#{typeDrugs}" var="typeDrug">
                        <li class="category-item">
                            <a href="/medical?actionUser=drugById&id=${typeDrug.getId()}" class="category-item__link">${typeDrug.getName()}</a>
                        </li>
                        </c:forEach>
                    </ul>
                </nav>
            </div>

            <div class="grid__column-9">
                <div class="product-container">
                    <div class="grid__row">
                        <c:forEach items="${drugs}" var="drug">
                        <div class="grid__column-3">
                            <div style="background-color: var(--white-color);">
                            <a href="#" class="product-link">
                                <div class="product__image__wrapper">
                                    <img
                                            src="data:image/jpg;base64,${drug.getImage()}"
                                            alt="Combo hỗ trợ điều trị covid-19" style="height: 150px; object-fit: cover">
                                </div>
                                <p class="product__name"><b>${drug.getName()}</b></p>
                                <div class="product__price" style="color: #ee4d2d">${drug.priceFormat()} ₫

                                    <i class="fas fa-cart-plus cart-icon"></i>
                                </div>
                            </a>
                            </div>
                        </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="shopping__cart">
        <i class="fas fa-cart-plus"></i>
        <span class="shopping__cart__number display--none">0</span>
    </div>
    <div class="shopping__cart__list">
        <h4 class="shopping__cart__header">Sản phẩm đã thêm</h4>
        <ul class="cart__list__container"></ul>
        <div class="btn__buy__cart">
            <button class="buy__confirm">Mua</button>
        </div>
    </div>
</div>
<!-- Container End -->
<jsp:include page="footer.jsp"/>
</body>

</html>
