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
        .alert-success {
            padding: 20px;
            background-color: var(--main-color);
            color: white;
            margin-top: 15px;
            border-radius: 15px;
        }

        .alert-fail {
            padding: 20px;
            background-color: #f44336;
            color: white;
            margin-top: 15px;
            border-radius: 15px;
        }

        /* The close button */
        .closebtn {
            margin-left: 15px;
            color: white;
            font-weight: bold;
            float: right;
            font-size: 22px;
            line-height: 20px;
            cursor: pointer;
            transition: 0.3s;
        }

        /* When moving the mouse over the close button */
        .closebtn:hover {
            color: black;
        }

        input {
            width: 100%;
            border-radius: 8px;
            resize: none;
            padding: 16px;
            outline: none;
            margin-bottom: 8px;
        }

        .input__non_select {
            user-select: none;
            border: none;
        }

        .input__non_display {
            display: none;
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
    <jsp:include page="../header.jsp"/>
    <div style="margin-top: 100px"></div>
    <!-- Container Begin -->
    <div class="container">
        <div class="grid">
            <div class="grid__row">
                <div class="grid__column-9">
                    <div class="question">
                        <div class="question__form">
                            <c:forEach items="${questions}" var="question">
                            <form action="/question?action=reply" method="post">
                                <div class="question__form__container">
                                    <h3>Câu hỏi của khách hàng: <span
                                            style="color: crimson">${question.getCustomer().getFullName()}</span></h3>
                                    <div class="question__content">
                                        <label>Tiêu đề</label>
                                        <input class="input__non_select" type="text" name="title"
                                               value="${question.getTitle()}">
                                        <input class="input__non_display" type="text" name="idQuestion"
                                               value="${question.getId()}">
                                        <label>Nội dung</label>
                                        <input class="input__non_select" name="questionContent"
                                               value="${question.getQuestion()}" spellcheck="true">
                                        <input name="answerContent" placeholder="Vui lòng điền câu trả lời tại đây"
                                               spellcheck="true">
                                        <!-- js here -->
                                    </div>
                                    <div class="question__form__upload">
                                        <button class="btn_question_submit" type="submit">Gửi</button>
                                    </div>
                                    <c:if test="${success!=null}">
                                        <div class="alert-success">
                                            <span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span>
                                                ${success}
                                        </div>
                                    </c:if>
                                    <c:if test="${fail!=null}">
                                        <div class="alert-fail">
                                            <span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span>
                                                ${fail}
                                        </div>
                                    </c:if>
                                </div>
                            </form>
                        </div>
                        </c:forEach>
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
