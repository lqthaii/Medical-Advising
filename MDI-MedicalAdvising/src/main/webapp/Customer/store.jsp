<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 23/11/2021
  Time: 11:55 PM
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
          crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="../assets/font/fontawesome/css/all.css">
    <link rel="stylesheet" href="../assets/css/base.css">
    <link rel="stylesheet" href="../assets/css/main.css">
    <link rel="stylesheet" href="../assets/css/order.css">
    <link rel="icon" href="../assets/image/881599_medical_512x512.png" type="image/x-icon">
    <script type="text/javascript" src="../js/map.js"></script>
    <script type="text/javascript" src="../js/main.js"></script>
    <script type="text/javascript" src="../js/order.js"></script>
    <title>Medical Advice</title>
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
                            <a href="#" class="category-item__link category-item__link--selected">Tất cả</a>
                        </li>
                        <li class="category-item">
                            <a href="#" class="category-item__link">Covid-19</a>
                        </li>
                        <li class="category-item">
                            <a href="#" class="category-item__link">Thuốc</a>
                        </li>
                        <li class="category-item">
                            <a href="#" class="category-item__link">Dụng cụ y tế</a>
                        </li>
                        <li class="category-item">
                            <a href="#" class="category-item__link">Sản phẩm khác</a>
                        </li>
                    </ul>
                </nav>
            </div>

            <div class="grid__column-9">
                <div class="product-container">
                    <div class="grid__row">
                        <div class="grid__column-3">
                            <a href="#" class="product-link">
                                <div class="product__image__wrapper">
                                    <img
                                            src="https://edoctor.s3.ap-southeast-1.amazonaws.com/epharmacy_product_image/2021/8/20/4f545d17-9953-414f-ae1b-e4e2e6ff230c.png"
                                            alt="Combo hỗ trợ điều trị covid-19">
                                </div>
                                <p class="product__name">COMBO HỖ TRỢ ĐIỀU TRỊ F0 COVID-19 CHO NGƯỜI CÁCH LY TẠI NHÀ</p>
                                <div class="product__price">220.500 ₫
                                    <i class="fas fa-cart-plus cart-icon"></i>
                                </div>
                            </a>
                        </div>
                        <div class="grid__column-3">
                            <a href="#" class="product-link">
                                <div class="product__image__wrapper">
                                    <img src="https://upload.api.edoctor.io/v1/attachment/image/5f7cc2741880ec001260c2ab/original"
                                         alt="KIÊM TIÊM DÙNG CHO BÚT TIÊM NOVOFINE 31G">
                                </div>
                                <p class="product__name">KIÊM TIÊM DÙNG CHO BÚT TIÊM NOVOFINE 31G</p>
                                <div class="product__price">2.230.500 ₫
                                    <i class="fas fa-cart-plus cart-icon"></i>
                                </div>
                            </a>
                        </div>
                        <div class="grid__column-3">
                            <a href="#" class="product-link">
                                <div class="product__image__wrapper">
                                    <img src="https://upload.api.edoctor.io/v1/attachment/image/5f6caaed84c6610ef671c7cc/original"
                                         alt="HAND SANITISER 100ML DR.BRAND (HƯƠNG CAM QUẾ)">
                                </div>
                                <p class="product__name">HAND SANITISER 100ML DR.BRAND (HƯƠNG CAM QUẾ)</p>
                                <div class="product__price">123.500 ₫
                                    <i class="fas fa-cart-plus cart-icon"></i>
                                </div>
                            </a>
                        </div>
                        <div class="grid__column-3">
                            <a href="#" class="product-link">
                                <div class="product__image__wrapper">
                                    <img src="https://upload.api.edoctor.io/v1/attachment/image/5f6caaed84c6610ef671c7cd/original"
                                         alt="HAND SANITISER 100ML DR.BRAND (HƯƠNG BẠC HÀ)">
                                </div>
                                <p class="product__name">HAND SANITISER 100ML DR.BRAND (HƯƠNG BẠC HÀ)</p>
                                <div class="product__price">342.500 ₫
                                    <i class="fas fa-cart-plus cart-icon"></i>
                                </div>
                            </a>
                        </div>
                        <div class="grid__column-3">
                            <a href="#" class="product-link">
                                <div class="product__image__wrapper">
                                    <img
                                            src="https://edoctor.s3.ap-southeast-1.amazonaws.com/epharmacy_product_image/2021/8/20/4f545d17-9953-414f-ae1b-e4e2e6ff230c.png"
                                            alt="Combo hỗ trợ điều trị covid-19">
                                </div>
                                <p class="product__name">COMBO HỖ TRỢ ĐIỀU TRỊ F0 COVID-19 CHO NGƯỜI CÁCH LY TẠI NHÀ</p>
                                <div class="product__price">220.500 ₫
                                    <i class="fas fa-cart-plus cart-icon"></i>
                                </div>
                            </a>
                        </div>
                        <div class="grid__column-3">
                            <a href="#" class="product-link">
                                <div class="product__image__wrapper">
                                    <img
                                            src="https://edoctor.s3.ap-southeast-1.amazonaws.com/epharmacy_product_image/2021/8/20/4f545d17-9953-414f-ae1b-e4e2e6ff230c.png"
                                            alt="Combo hỗ trợ điều trị covid-19">
                                </div>
                                <p class="product__name">COMBO HỖ TRỢ ĐIỀU TRỊ F0 COVID-19 CHO NGƯỜI CÁCH LY TẠI NHÀ</p>
                                <div class="product__price">220.500 ₫
                                    <i class="fas fa-cart-plus cart-icon"></i>
                                </div>
                            </a>
                        </div>
                        <div class="grid__column-3">
                            <a href="#" class="product-link">
                                <div class="product__image__wrapper">
                                    <img
                                            src="https://edoctor.s3.ap-southeast-1.amazonaws.com/epharmacy_product_image/2021/8/20/4f545d17-9953-414f-ae1b-e4e2e6ff230c.png"
                                            alt="Combo hỗ trợ điều trị covid-19">
                                </div>
                                <p class="product__name">COMBO HỖ TRỢ ĐIỀU TRỊ F0 COVID-19 CHO NGƯỜI CÁCH LY TẠI NHÀ</p>
                                <div class="product__price">220.500 ₫
                                    <i class="fas fa-cart-plus cart-icon"></i>
                                </div>
                            </a>
                        </div>
                        <div class="grid__column-3">
                            <a href="#" class="product-link">
                                <div class="product__image__wrapper">
                                    <img
                                            src="https://edoctor.s3.ap-southeast-1.amazonaws.com/epharmacy_product_image/2021/8/20/4f545d17-9953-414f-ae1b-e4e2e6ff230c.png"
                                            alt="Combo hỗ trợ điều trị covid-19">
                                </div>
                                <p class="product__name">COMBO HỖ TRỢ ĐIỀU TRỊ F0 COVID-19 CHO NGƯỜI CÁCH LY TẠI NHÀ</p>
                                <div class="product__price">220.500 ₫
                                    <i class="fas fa-cart-plus cart-icon"></i>
                                </div>
                            </a>
                        </div>
                        <div class="grid__column-3">
                            <a href="#" class="product-link">
                                <div class="product__image__wrapper">
                                    <img
                                            src="https://edoctor.s3.ap-southeast-1.amazonaws.com/epharmacy_product_image/2021/8/20/4f545d17-9953-414f-ae1b-e4e2e6ff230c.png"
                                            alt="Combo hỗ trợ điều trị covid-19">
                                </div>
                                <p class="product__name">COMBO HỖ TRỢ ĐIỀU TRỊ F0 COVID-19 CHO NGƯỜI CÁCH LY TẠI NHÀ</p>
                                <div class="product__price">220.500 ₫
                                    <i class="fas fa-cart-plus cart-icon"></i>
                                </div>
                            </a>
                        </div>
                        <div class="grid__column-3">
                            <a href="#" class="product-link">
                                <div class="product__image__wrapper">
                                    <img
                                            src="https://edoctor.s3.ap-southeast-1.amazonaws.com/epharmacy_product_image/2021/8/20/4f545d17-9953-414f-ae1b-e4e2e6ff230c.png"
                                            alt="Combo hỗ trợ điều trị covid-19">
                                </div>
                                <p class="product__name">COMBO HỖ TRỢ ĐIỀU TRỊ F0 COVID-19 CHO NGƯỜI CÁCH LY TẠI NHÀ</p>
                                <div class="product__price">220.500 ₫
                                    <i class="fas fa-cart-plus cart-icon"></i>
                                </div>
                            </a>
                        </div>
                        <div class="grid__column-3">
                            <a href="#" class="product-link">
                                <div class="product__image__wrapper">
                                    <img
                                            src="https://edoctor.s3.ap-southeast-1.amazonaws.com/epharmacy_product_image/2021/8/20/4f545d17-9953-414f-ae1b-e4e2e6ff230c.png"
                                            alt="Combo hỗ trợ điều trị covid-19">
                                </div>
                                <p class="product__name">COMBO HỖ TRỢ ĐIỀU TRỊ F0 COVID-19 CHO NGƯỜI CÁCH LY TẠI NHÀ</p>
                                <div class="product__price">220.500 ₫
                                    <i class="fas fa-cart-plus cart-icon"></i>
                                </div>
                            </a>
                        </div>
                        <div class="grid__column-3">
                            <a href="#" class="product-link">
                                <div class="product__image__wrapper">
                                    <img
                                            src="https://edoctor.s3.ap-southeast-1.amazonaws.com/epharmacy_product_image/2021/8/20/4f545d17-9953-414f-ae1b-e4e2e6ff230c.png"
                                            alt="Combo hỗ trợ điều trị covid-19">
                                </div>
                                <p class="product__name">COMBO HỖ TRỢ ĐIỀU TRỊ F0 COVID-19 CHO NGƯỜI CÁCH LY TẠI NHÀ</p>
                                <div class="product__price">220.500 ₫
                                    <i class="fas fa-cart-plus cart-icon"></i>
                                </div>
                            </a>
                        </div>
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
