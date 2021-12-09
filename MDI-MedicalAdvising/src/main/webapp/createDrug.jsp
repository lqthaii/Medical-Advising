<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 24/11/2021
  Time: 2:02 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 23/11/2021
  Time: 9:20 PM
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
    <link rel="stylesheet" href="/assets/font/fontawesome/css/all.css">
    <link rel="stylesheet" href="/assets/css/base.css">
    <link rel="stylesheet" href="/assets/css/main.css">
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
</head>
<body>
<jsp:include page="header.jsp"/>
    <!-- Container Begin -->
    <div class="container">
        <div class="grid">
            <div class="grid__row">
                <div class="grid__column-12">
                    <h2 class="title_news">Covid-19</h2>
                    <div class="slider">
                        <ul class="slider-dots">
                            <li class="slider-dot-item active" data-index="0"></li>
                            <li class="slider-dot-item" data-index="1"></li>
                            <li class="slider-dot-item" data-index="2"></li>
                            <li class="slider-dot-item" data-index="3"></li>
                            <li class="slider-dot-item" data-index="4"></li>
                            <li class="slider-dot-item" data-index="5"></li>
                        </ul>
                        <div class="slider-wrapper">
                            <div class="slider-main">
                                <div class="slider-item">
                                    <img src="../assets/image/5k.png" alt=""/>
                                </div>
                                <div class="slider-item">
                                    <img src="../assets/image/Khẩu Trang.png" alt=""/>
                                </div>
                                <div class="slider-item">
                                    <img src="../assets/image/Khu-khuan.png" alt=""/>
                                </div>
                                <div class="slider-item">
                                    <img src="../assets/image/khong-tu-tap.png" alt=""/>
                                </div>
                                <div class="slider-item">
                                    <img src="../assets/image/khoang-cach.png" alt=""/>
                                </div>
                                <div class="slider-item">
                                    <img src="../assets/image/khai_bao_y_te.png" alt=""/>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="grid__grow">
                <h2 class="title_news" onclick="createBlog()">Tin tức</h2>
                <div class="news__container">
                    <div class="news__blog">
                        <div class="news__blog__img">
                            <img src="../assets/image/luu.jpg" alt="">
                        </div>
                        <div class="news__blog__info">
                            <h4 class="news__blog__info__header">12 lợi ích sức khỏe của quả lựu</h4>
                            <div class="news__blog__info__content"><span>Lựu được xem là một trong những loại trái cây
                                    tốt nhất cho sức khỏe. Trong quả lựu chứa một loạt các hợp chất từ thực vật có lợi
                                    mà nhiều loại thực phẩm khác không thể so sánh được. Các nghiên cứu đã cho thấy rằng
                                    chúng có thể có nhiều lợi ích cho cơ thể và làm giảm nguy cơ mắc nhiều bệnh khác
                                    nhau. Dưới đây là 12 lợi ích sức khỏe dựa trên bằng chứng của quả lựu.</span>
                                <a href="#" class="news__blog__link">xem thêm...</a>
                            </div>
                        </div>
                    </div>
                    <div class="news__blog">
                        <div class="news__blog__img">
                            <img src="../assets/image/nho.jpg" alt="">
                        </div>
                        <div class="news__blog__info">
                            <h4 class="news__blog__info__header">12 lợi ích sức khỏe của việc ăn nho hàng ngày</h4>
                            <div class="news__blog__info__content"><span>Nho là loại quả chứa nhiều chất dinh dưỡng,
                                    chất xơ, kali... Nho cung cấp rất nhiều lợi ích sức khỏe do hàm lượng chất dinh
                                    dưỡng và chất chống oxy hóa cao. Dưới đây là 12 lợi ích sức khỏe hàng đầu của
                                    nho.</span>
                                <a href="#" class="news__blog__link">xem thêm...</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Container End -->
<jsp:include page="footer.jsp"/>
</body>
</html>

</body>
</html>
