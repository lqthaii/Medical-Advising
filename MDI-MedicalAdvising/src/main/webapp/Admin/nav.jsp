<%@ page import="model.Admin" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 9/12/2021
  Time: 8:50 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Purple Admin</title>
    <!-- plugins:css -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="assets/vendors/mdi/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="assets/vendors/css/vendor.bundle.base.css">
    <!-- endinject -->
    <!-- Plugin css for this page -->
    <!-- End plugin css for this page -->
    <!-- inject:css -->
    <!-- endinject -->
    <!-- Layout styles -->
    <link rel="stylesheet" href="../assets/css/admin.css"/>
    <!-- End layout styles -->
    <link rel="shortcut icon" href="assets/images/favicon.ico" />
</head>
<body>
<nav class="sidebar sidebar-offcanvas" id="sidebar">
    <ul class="nav">
        <li class="nav-item nav-profile">
            <a href="#" class="nav-link">
                <div class="nav-profile-image">
                    <img class="avatar" src="../assets/image/maxresdefault.jpg" alt="profile">
                    <!--change to offline or busy as needed-->
                </div>
                <div class="nav-profile-text d-flex flex-column">
                    <span class="font-weight-bold mb-2"><%=((Admin) request.getSession().getAttribute("admin")).getFullName()%></span>
                    <span class="text-secondary text-small"><%=((Admin) request.getSession().getAttribute("admin")).getAccount().getTypeAccount().getTypeName()%></span>
                </div>
            </a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="/admin">
                <span class="menu-title">Trang chính</span>
                <i class="mdi fas fa-home menu-icon"></i>
            </a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="/admin?actionUser=customer">
                <span class="menu-title">Người dùng</span>
                <i class="mdi fas fa-users-cog menu-icon"></i>
            </a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="./admin?actionUser=doctor">
                <span class="menu-title">Bác sĩ</span>
                <i class="mdi fas fa-user-md menu-icon"></i>
            </a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="./admin?actionUser=pharmacy">
                <span class="menu-title">Nhà thuốc</span>
                <i class="mdi fas fa-cannabis menu-icon"></i>
            </a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="/admin?actionUser=drugManager">
                <span class="menu-title">Quản lí thuốc</span>
                <i class="mdi fas fa-capsules menu-icon"></i>
            </a>
        </li>
    </ul>
</nav>
</body>
</html>
