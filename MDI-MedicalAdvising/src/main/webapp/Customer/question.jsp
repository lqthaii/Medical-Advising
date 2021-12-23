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
<body>
<div class="app">
    <jsp:include page="/header.jsp"/>
    <div style="margin-top: 100px"></div>
    <!-- Container Begin -->
    <div class="container">
        <div class="grid">
            <div class="grid__row">
                <div class="grid__column-9">
                    <div class="question">
                        <div class="question__form" style="height: 525px">
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
                            <form action="/question?action=question" method="post">
                                <div class="question__form__container">
                                    <h3>Đặt câu hỏi miễn phí</h3>
                                    <div class="question__content">
                                    <h4>Tiêu đề</h4>
                                    <input type="text" name="title" placeholder="Chủ đề câu hỏi">
                                    <h4>Nội dung</h4>
                                    <textarea rows="5" id="question__content__textarea" name="questionContent"
                                              placeholder="Lưu ý mô tả chi tiết nội dung muốn hỏi bác sĩ:
                                    - Giới tính, tuổi;
                                    - Triệu chứng gặp phải;
                                    - Bắt đầu có triệu chứng khi nào;
                                    - Đã dùng biện pháp xử lý nào chưa?" spellcheck="true"></textarea>
                                        <div class="question__form__img-review">
                                            <!-- js here -->
                                        </div>
                                        <div class="question__form__upload">
                                            <button class="btn_question_submit" type="submit">Gửi</button>
                                        </div>
                                    </div>
                                </div>
                            </form>
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

    <jsp:include page="/footer.jsp"/>
</div>
</body>
<script src="../js/main.js"></script>
<script src="../js/question.js"></script>
</html>
