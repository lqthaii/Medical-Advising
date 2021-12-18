<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 19/12/2021
  Time: 3:24 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thông tin của bạn</title>
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
    <link rel="icon"
          href="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSbgGffbZA2ax_FVv_UC18ggK7jEZBoNwG7DAwm0als-jmiBvADqJRK3cg8OAP5yB675As&usqp=CAU"
          type="image/x-icon">
    <link rel="stylesheet" href="assets/css/profile.css">
    <style>
        h1{
            font-size:4rem;
            height:100px;
        }
        strong{
            color: var(--main-color);
            cursor: text;
            font-weight: 700;
        }
        h2{
            font-size: 2rem;
            height: 30px;
            font-weight: 400;
        }
        .profile-body{
            height: 400px;
        }
    </style>
</head>

<body>
<jsp:include page="/header.jsp"/>
<div class="container" style="margin-top: 180px">
<div class="profile__container grid__column-12 profile-body">
    <div class="profile__content">
        <div class="profile__body">
            <h1>Hãy tham gia cùng chúng tôi!</h1>
            <h2 style="font-weight: 400;">
                Gửi CV của bạn cho chúng tôi tại địa chỉ email:  <strong>medicladvising@gmail.com</strong>
            </h2>
            <h2>Chúng tôi sẽ xem xét CV của bạn và thông báo kết quả qua email bạn sử dụng để gửi CV</h2>
        </div>
    </div>
</div>
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
</div>
<script src="js/profile.js"></script>
</body>

</html>
