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

        .container input[type=text], input[type=password] {
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

        .button-form {
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
    </style>
</head>
<body>
<jsp:include page="header.jsp"/>
<form action="/account?actionUser=login" method="post">
    <div class="container">
        <h1>Đăng Nhập</h1>
        <p>Vui lòng đăng nhập để sử dụng dịch vụ</p>
        <hr>
        <label><b>Email</b></label>
        <input type="text" placeholder="Nhập Tên Đăng Nhập" name="username" required>
        <label><b>Mật Khẩu</b></label>
        <input type="password" placeholder="Nhập Mật Khẩu" name="psw" required>
        <label>
            <label style="color: red">${message}</label><br><br>
            <input type="checkbox" checked="checked" name="remember" style="margin-bottom:15px"> Nhớ Đăng Nhập
        </label>
        <div class="clearfix">
            <button type="submit" class="signupbtn button-form ">Đăng nhập</button>
        </div>
        <div class="clearfix">
            <button type="button" onclick="window.location.href='/medical'" class="cancelbtn">Quay lại</button>
        </div>
    </div>
</form>
<jsp:include page="footer.jsp"/>
</body>
</html>
