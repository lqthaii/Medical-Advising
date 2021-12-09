<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 24/11/2021
  Time: 5:38 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+JP&display=swap');

        * {
            box-sizing: border-box
        }

        body {
            font-family: 'Noto Sans JP', sans-serif;
        }

        h1, label {
            color: DodgerBlue;
        }

        .container input[type=text], input[type=password], input[type=password] {
            width: 100%;
            padding: 15px;
            margin: 5px 0 22px 0;
            display: inline-block;
            border: none;
            width: 100%;
            resize: vertical;
            padding: 15px;
            border-radius: 15px;
            border: 0;
            box-shadow: 4px 4px 10px rgba(0, 0, 0, 0.2);
        }

        .container input[type=text]:focus, input[type=password]:focus {
            outline: none;
        }


        hr {
            border: 1px solid #f1f1f1;
            margin-bottom: 25px;
        }

        button {
            background-color: var(--main-color);
            color: white;
            padding: 14px 20px;
            margin: 8px 0;
            border: none;
            cursor: pointer;
            width: 100%;
            opacity: 0.9;
        }

        button:hover {
            opacity: 1;
        }

        .cancelbtn {
            background-color: #999999;
            color: white;
            padding: 14px 20px;
            margin: 8px 0;
            border: none;
            cursor: pointer;
            width: 100%;
            opacity: 0.9;
            border-radius: 15px;
        }
        .cancelbtn:hover {
            opacity: 1;
        }
        .signupbtn {
            float: left;
            width: 100%;
            border-radius: 15px;
            border: 0;
            box-shadow: 4px 4px 10px rgba(0, 0, 0, 0.2);
        }

        .container {
            width: 60%;
            margin: auto;
            height: 300px;
            margin-bottom: 10px;
        }

        .clearfix::after {
            content: "";
            clear: both;
            display: table;
        }

        label {
            font-size: 15pt;
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
    </style>
</head>
<body>
<jsp:include page="header.jsp"/>
<div style="margin-top: 100px"></div>
<form action="/account?actionUser=register" method="post">
    <div class="container">
        <c:if test="${message!=null}">
            <div class="alert-fail">
                <span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span>
                    ${message}
            </div>
        </c:if>
        <h1>Đăng Ký</h1>
        <p>Xin hãy nhập biểu mẫu bên dưới để đăng ký.</p>
        <hr>
        <label><b>Họ tên</b></label>
        <input type="text" placeholder="Nhập Họ Tên của bạn" name="name" required>
        <label><b>Email</b></label>
        <input type="text" placeholder="Nhập Email" name="email" value="${email}" required>
        <label><b>Tên Đăng Nhập</b></label>
        <input type="text" placeholder="Nhập Tên Đăng Nhập" name="username" required>
        <label><b>Mật Khẩu</b></label>
        <input type="password" placeholder="Nhập Mật Khẩu" name="psw" required>
        <label><b>Nhập Lại Mật Khẩu</b></label>
        <input type="password" placeholder="Nhập Lại Mật Khẩu" name="psw-repeat" required>
        </label>
        <div class="clearfix">
            <button type="submit" class="signupbtn">Đăng ký</button>
        </div>
        <div class="clearfix">
            <button type="button" onclick="window.location.href='/medical?actionUser=login'" class="cancelbtn">Đăng Nhập</button>
        </div>
    </div>
</form>
<div style="margin-top: 400px"></div>
<jsp:include page="footer.jsp"/>
</body>
</html>
