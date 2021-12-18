<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 14/12/2021
  Time: 9:58 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
    <link rel="stylesheet" href="../assets/font/fontawesome/css/all.css">
    <link rel="stylesheet" href="../assets/css/base.css">
    <link rel="stylesheet" href="../assets/css/main.css">
    <link rel="stylesheet" href="../assets/css/order.css">
    <link rel="icon" href="../assets/image/881599_medical_512x512.png" type="image/x-icon">
    <title>Product detail</title>
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,700" rel="stylesheet">
    <style>
        /*****************globals*************/
        body {
            font-family: 'open sans';
            overflow-x: hidden;
        }

        img {
            max-width: 100%;
        }
        .tab-pane img{
            height: 200px;
        }
        .preview {
            display: -webkit-box;
            display: -webkit-flex;
            display: -ms-flexbox;
            display: flex;
            -webkit-box-orient: vertical;
            -webkit-box-direction: normal;
            -webkit-flex-direction: column;
            -ms-flex-direction: column;
            flex-direction: column;
            max-width: 300px;
            max-height: 300px;
            object-fit: cover;
        }

        .slick-slider {
            display: flex;
            align-items: center;
        }

        .slick-prev {
            background-color: #248eff;
            color: #fff;
            left: 0;
            position: absolute;
            z-index: 2;
            width: 20px;
            border-radius: 50px;
            text-align: center;
            font-size: 20px;
        }

        .slick-next {
            background-color: #248eff;
            color: #fff;
            right: 0;
            position: absolute;
            z-index: 2;
            width: 20px;
            border-radius: 50px;
            text-align: center;
            font-size: 20px;
        }

        @media screen and (max-width: 996px) {
            .preview {
                margin-bottom: 20px;
            }
        }

        .preview-pic {
            -webkit-box-flex: 1;
            -webkit-flex-grow: 1;
            -ms-flex-positive: 1;
            flex-grow: 1;
        }

        .preview-thumbnail.nav-tabs {
            border: none;
            margin-top: 15px;
        }

        .preview-thumbnail.nav-tabs li {
            width: 18%;
            margin-right: 2.5%;
        }

        .preview-thumbnail.nav-tabs li img {
            max-width: 100%;
            display: block;
        }

        .preview-thumbnail.nav-tabs li a {
            padding: 0;
            margin: 0;
        }

        .preview-thumbnail.nav-tabs li:last-of-type {
            margin-right: 0;
        }

        .tab-content {
            overflow: hidden;
        }

        .tab-content img {
            width: 100%;
            -webkit-animation-name: opacity;
            animation-name: opacity;
            -webkit-animation-duration: .3s;
            animation-duration: .3s;
        }

        .card {
            padding: 20px 70px;
            line-height: 1.5em;
        }

        @media screen and (min-width: 997px) {
            .wrapper {
                display: -webkit-box;
                display: -webkit-flex;
                display: -ms-flexbox;
                display: flex;
                justify-content: space-around;
            }
        }

        .details {
            display: -webkit-box;
            display: -webkit-flex;
            display: -ms-flexbox;
            display: flex;
            -webkit-box-orient: vertical;
            -webkit-box-direction: normal;
            -webkit-flex-direction: column;
            -ms-flex-direction: column;
            flex-direction: column;
            flex: 1;
            padding-left: 200px;
        }

        .colors {
            -webkit-box-flex: 1;
            -webkit-flex-grow: 1;
            -ms-flex-positive: 1;
            flex-grow: 1;
        }

        .product-title,
        .price,
        .sizes,
        .colors {
            text-transform: UPPERCASE;
            font-weight: bold;
        }

        .checked,
        .price span {
            color: #248eff;
        }

        .product-title,
        .rating,
        .product-description,
        .price,
        .vote,
        .sizes {
            margin-bottom: 15px;
        }

        .product-title {
            margin-top: 0;
        }

        .size {
            margin-right: 10px;
        }

        .size:first-of-type {
            margin-left: 40px;
        }

        .color {
            display: inline-block;
            vertical-align: middle;
            margin-right: 10px;
            height: 2em;
            width: 2em;
            border-radius: 2px;
        }

        .color:first-of-type {
            margin-left: 20px;
        }

        .other + .other {
            margin-left: 10px;
        }

        .center {
            text-align: center;
        }

        .add-to-cart,
        .like {
            background: #248eff;
            padding: 1.2em 1.5em;
            border: none;
            text-transform: UPPERCASE;
            font-weight: bold;
            color: #fff;
            -webkit-transition: background .3s ease;
            transition: background .3s ease;
        }

        .add-to-cart:hover,
        .like:hover {
            background: #1f79d9;
            color: #fff;
        }

        .not-available {
            text-align: center;
            line-height: 2em;
        }

        .not-available:before {
            font-family: fontawesome;
            content: "\f00d";
            color: #fff;
        }

        .main {
            font-family: Arial;
            width: 100%;
            display: block;
            margin: 0 auto;
        }

        .tooltip-inner {
            padding: 1.3em;
        }

        @-webkit-keyframes opacity {
            0% {
                opacity: 0;
                -webkit-transform: scale(3);
                transform: scale(3);
            }

            100% {
                opacity: 1;
                -webkit-transform: scale(1);
                transform: scale(1);
            }
        }

        @keyframes opacity {
            0% {
                opacity: 0;
                -webkit-transform: scale(3);
                transform: scale(3);
            }

            100% {
                opacity: 1;
                -webkit-transform: scale(1);
                transform: scale(1);
            }
        }

        /*# sourceMappingURL=style.css.map */
    </style>
</head>

<body>
<div class="app">
    <jsp:include page="header.jsp"/>
    <div style="margin-top: 100px"></div>
    <!-- Container Begin -->
    <div class="container" style="width: 1200px;max-width: 100%;margin: 0 auto;">
        <div class="card">
            <div class="container-fliud">
                <div class="wrapper row">
                    <div class="preview col-md-6">

                        <div class="preview-pic tab-content">
                            <div class="tab-pane active" id="pic-1"><img
                                    src="data:image/jpg;base64,${drug.getImage()}"/>
                            </div>
                        </div>

                    </div>
                    <div class="details col-md-6">
                        <h3 class="product-title">${drug.getName()}</h3>
                        <h3>MÔ TẢ</h3>
                        <p class="product-description">
                            ${drug.getDescription()}
                        </p>
                        <h4 class="price">GIÁ: <span>${drug.priceFormat()} ₫</span></h4>
                        <div class="action">
                            <button class="add-to-cart btn btn-default" type="button" onclick="window.location.href='/cart?actionUser=add&drugId=${drug.getId()}'">Add to cart</button>
                            <a href="order.html" class="like btn btn-default" type="button"><i
                                    class="fas fa-long-arrow-alt-left"></i></a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container-fliud">
                <h3>SẢN PHẨM CÙNG LOẠI</h3>
                <div class="wrapper row">
                    <div class="main">
                        <div class=" slider-nav">
                            <c:forEach items="${drugs}" var="drug">
                                <div class="preview col-md-3 other">
                                    <div class="preview-pic tab-content">
                                        <div class="tab-pane active"><img
                                                src="data:image/jpg;base64,${drug.getImage()}" style="object-fit: cover"/>
                                        </div>
                                        <a href="/medical?actionUser=drugDetail&idDrug=${drug.getId()}" style="text-decoration: none">
                                        <div class="product-title center">
                                                ${drug.getName()}
                                        </div>
                                        </a>
                                    </div>
                                </div>

                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Container End -->
            <!-- Container End -->


        </div>
    </div>
    <jsp:include page="footer.jsp"/>
</div>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<script>
    $('.slider-nav').slick({
        slidesToShow: 5,
        slidesToScroll: 1,
        prevArrow: '<div class="slick-prev"><i class="fa fa-angle-left" aria-hidden="true"></i></div>',
        nextArrow: '<div class="slick-next"><i class="fa fa-angle-right" aria-hidden="true"></i></div>'
    });
</script>

</body>
</html>
