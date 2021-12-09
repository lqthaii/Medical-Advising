<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 24/11/2021
  Time: 1:37 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <link rel="stylesheet" href="../assets/font/fontawesome/css/all.css">
    <link rel="stylesheet" href="../assets/css/base.css">
    <link rel="stylesheet" href="../assets/css/main.css">
    <link rel="stylesheet" href="../assets/css/question.css">
    <link rel="icon" href="../assets/image/881599_medical_512x512.png" type="image/x-icon">
    <title>Medical Advice</title>
    <style>
        .question__content{
            height: auto !important;
        }
        input{
            width: 100%;
            border-radius: 8px;
            resize: none;
            padding: 16px;
            outline: none;
            margin-bottom: 8px;
        }
    </style>
</head>
<!--Start of Tawk.to Script-->
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
<!--End of Tawk.to Script-->

<body>
<div class="app">
    <jsp:include page="header.jsp"/>
    <div style="margin-top: 100px"></div>
    <!-- Container Begin -->
    <div class="container">
        <div class="grid">
            <div class="grid__row">
                <div class="grid__column-9">
                    <div class="question">
                        <div class="question__form">
                            <div class="pharmacy__wrapper">
                                <div class="pharmacy__info">
                                    <h1>${question.getTitle()}</h1>
                                    <div class="question__content">
                                        <p class="name">Người hỏi: <b>${question.getCustomer().getFullName()}</b></p>
                                        <p class="content">Nội dung câu hỏi: <b>${question.getQuestion()}</b></p>
                                        <p class="datetime">Thời gian: <b>${question.getTimeQuestion()}</b></p>
                                    </div>
                                    <h1>Trả lời</h1>
                                    <div class="question__content">
                                        <p class="name">Bác sĩ trả lời: <b> ${question.getDoctor().getFullName()} </b> </p>
                                        <p class="content">Nội dung câu trả lời: <b>${question.getAnswer()}</b></p>
                                        <p class="datetime">Thời gian: <b> ${question.getTimeAnswer()}</b></p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="question__container">
                        <div class="question__view">
                            <c:forEach items="${questions}" var="question">
                                <div class="question__answer__container">
                                    <a href="/question?actionUser=questionDetail&id=${question.getId()}">
                                        <img src="https://upload.api.edoctor.io/image/614aba56d6e2474f11138a1e" alt=""
                                             class="question__answer__img">
                                        <h2 class="question__answer__heading">${question.getTitle()}</h2>
                                        <div class="answer__container">
                                            <img src="../assets/image/maxresdefault.jpg"
                                                 alt="" class="doctor__img">
                                            <div class="answer__info">
                                                <div class="answer__hint">Được trả lời bởi</div>
                                                <div class="doctor__name">${question.getDoctor().getFullName()}</div>
                                            </div>
                                        </div>

                                    </a>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
                <div class="question__filter grid__column-3">
                    <div class="question__filter__wrapper">
                        <input type="text" class="question__input" placeholder="Tìm kiếm câu hỏi">
                        <button class="question-search__btn">Tìm kiếm</button>
                    </div>
                    <div class="question-popular__wrapper">
                        <h2 class="question-popular__heading">Tìm kiếm phổ biến</h2>
                        <div class="question-popular__container">
                            <span class="question-popular__content">Đau bụng</span>
                            <span class="question-popular__content">Đau bụng bụng</span>
                            <span class="question-popular__content">Đau bụng</span>
                            <span class="question-popular__content">Đau bụng</span>
                            <span class="question-popular__content">Đau bụng</span>
                            <span class="question-popular__content">Đau bụng</span>
                            <span class="question-popular__content">Đau bụng bụng</span>
                            <span class="question-popular__content">Đau bụng</span>
                            <span class="question-popular__content">Đau bụng</span>
                            <span class="question-popular__content">Đau bụng bụng</span>
                            <span class="question-popular__content">Đau bụng</span>
                            <span class="question-popular__content">Đau bụng bụng</span>
                            <span class="question-popular__content">Đau bụng bụng bụng</span>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
    <!-- Container End -->
    <!-- Container End -->

    <!-- Footer Begin -->
    <div class="footer-main">
        <footer>
            <div class="social"><a href="#"><i class="fab fa-facebook"></i></a><a href="#"><i
                    class="fab fa-facebook-messenger"></i></a><a href="#"><i class="fab fa-twitter"></i></a><a
                    href="#"><i class="fab fa-instagram"></i></a></div>
            <ul class="list-inline">
                <li class="list-inline-item"><a href="#">Trang chủ</a></li>
                <li class="list-inline-item"><a href="#">Services</a></li>
                <li class="list-inline-item"><a href="#">About</a></li>
                <li class="list-inline-item"><a href="#">Terms</a></li>
                <li class="list-inline-item"><a href="#">Privacy Policy</a></li>
            </ul>
            <p class="copyright">Company Name © 2021</p>
        </footer>
    </div>
    <!-- Footer End -->
</div>
</body>
<script src="../js/main.js"></script>
<script src="../js/question.js"></script>
</html>
