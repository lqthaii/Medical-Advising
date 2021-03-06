<%@ page import="model.Admin" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 12/4/2021
  Time: 10:07 PM
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
<div class="container-scroller">
    <!-- partial:partials/_navbar.html -->
    <jsp:include page="navtop.jsp"/>
    <%--<nav class="navbar default-layout-navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
        <div class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-center">
            <a class="navbar-brand brand-logo" href="/admin"><img src="https://raw.githubusercontent.com/BootstrapDash/PurpleAdmin-Free-Admin-Template/62c7c39e98f107b89af42ef9826923d8ae0a87c8/assets/images/logo.svg" alt="logo" /></a>
        </div>
        <div class="navbar-menu-wrapper d-flex align-items-stretch">
            <ul class="navbar-nav navbar-nav-right">
                <li class="nav-item nav-profile dropdown">
                    <a class="nav-link dropdown-toggle" id="profileDropdown" href="#" data-toggle="dropdown" aria-expanded="false">
                        <div class="nav-profile-img">
                            <img class="avatar" src="../assets/image/maxresdefault.jpg" alt="image">
                            <span class="availability-status online"></span>
                        </div>
                        <div class="nav-profile-text">
                            <p class="mb-1 text-black"> <%=((Admin) request.getSession().getAttribute("admin")).getFullName()%></p>
                        </div>
                    </a>
                    <div class="dropdown-menu navbar-dropdown drop-item">
                        <a class="dropdown-item" href="/account?actionUser=logout">
                            <i class="mdi mdi-logout mr-2 text-primary"></i> Signout </a>
                    </div>
                </li>
                <li class="nav-item nav-logout d-none d-lg-block">
                    <a class="nav-link" href="#">
                        <i class="mdi mdi-power"></i>
                    </a>
                </li>
                <li class="nav-item nav-settings d-none d-lg-block">
                    <a class="nav-link" href="#">
                        <i class="mdi mdi-format-line-spacing"></i>
                    </a>
                </li>
            </ul>
        </div>
    </nav>--%>
    <!-- partial -->
    <div class="container-fluid page-body-wrapper">
        <!-- partial:partials/_sidebar.html -->
        <jsp:include page="nav.jsp"/>
        <%--<nav class="sidebar sidebar-offcanvas" id="sidebar">
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
                        <span class="menu-title">Trang ch??nh</span>
                        <i class="mdi fas fa-home menu-icon"></i>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/admin?actionUser=customer">
                        <span class="menu-title">Ng?????i d??ng</span>
                        <i class="mdi fas fa-users-cog menu-icon"></i>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="./admin?actionUser=doctor">
                        <span class="menu-title">B??c s??</span>
                        <i class="mdi fas fa-user-md menu-icon"></i>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="./admin?actionUser=pharmacy">
                        <span class="menu-title">Nh?? thu???c</span>
                        <i class="mdi fas fa-cannabis menu-icon"></i>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/admin?actionUser=drugmanager">
                        <span class="menu-title">Qu???n l?? thu???c</span>
                        <i class="mdi fas fa-capsules menu-icon"></i>
                    </a>
                </li>
            </ul>
        </nav>--%>
        <!-- partial -->
        <div class="main-panel">
            <div class="content-wrapper">
                <div class="page-header">
                    <h3 class="page-title">
                <span class="page-title-icon bg-gradient-primary text-white mr-2">
                    <i class="fas fa-home"></i>
                </span> Trang t???ng quan
                    </h3>
                    <nav aria-label="breadcrumb">
                        <ul class="breadcrumb">
                            <li class="breadcrumb-item active" aria-current="page">
                                <!-- <i class="fas fa-info-circle"></i> -->
                                <span></span>Trang t???ng quan <i class="fas fa-info-circle text-primary"></i>
                            </li>
                        </ul>
                    </nav>
                </div>
                <div class="row">
                    <div class="col-md-4 stretch-card grid-margin">
                        <div class="card bg-gradient-danger card-img-holder text-white">
                            <div class="card-body">
                                <h4 class="font-weight-normal mb-3">S??? l?????ng b??c s??<i class="mdi mdi-chart-line mdi-24px float-right"></i>
                                </h4>
                                <h2 class="mb-5">${doctorStatic}</h2>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 stretch-card grid-margin">
                        <div class="card bg-gradient-info card-img-holder text-white">
                            <div class="card-body">
                                <h4 class="font-weight-normal mb-3">S??? l?????ng c??u h???i <i class="mdi mdi-bookmark-outline mdi-24px float-right"></i>
                                </h4>
                                <h2 class="mb-5">${questionStatic}</h2>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 stretch-card grid-margin">
                        <div class="card bg-gradient-success card-img-holder text-white">
                            <div class="card-body">
                                <h4 class="font-weight-normal mb-3">S??? l?????ng kh??ch h??ng ???? ????ng k?? <i class="mdi mdi-diamond mdi-24px float-right"></i>
                                </h4>
                                <h2 class="mb-5">${customerStatic}</h2>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12 grid-margin">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">Danh s??ch t??i kho???n m???i</h4>
                                <div class="table-responsive">
                                    <table class="table">
                                        <thead>
                                        <tr>
                                            <th> ID </th>
                                            <th> T??n ng?????i d??ng </th>
                                            <th> H??? t??n </th>
                                            <th> Email </th>
                                            <th> Lo???i t??i kho???n </th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${customers}" var="customer">
                                        <tr>
                                            <td>
                                                 ${customer.getId()}
                                            </td>
                                            <td> ${customer.getAccount().getUserName()} </td>
                                            <td> ${customer.getFullName()} </td>
                                            <td> ${customer.getAccount().getEmail()} </td>
                                            <td> <label class="badge badge-gradient-success">
                                                    ${customer.getAccount().getTypeAccount().getTypeName()}</label></td>
                                        </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-7 grid-margin stretch-card">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">C??u h???i m???i</h4>
                                <div class="table-responsive">
                                    <table class="table">
                                        <thead>
                                        <tr>
                                            <th> ID </th>
                                            <th> Ng?????i h???i </th>
                                            <th> Th???i gian </th>
                                            <th> Ti??u ????? </th>
                                            <th> Tr???ng th??i </th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${questions}" var="question">
                                            <tr>
                                                <td> ${question.getId()} </td>
                                                <td> ${question.getCustomer().getFullName()} </td>
                                                <td> ${question.getTimeQuestion()} </td>
                                                <td> ${question.getTitle()} </td>
                                                <td> <c:if test="${question.getStatus()==1}">Ch??a tr??? l???i</c:if>
                                                    <c:if test="${question.getStatus()==2}">???? tr??? l???i</c:if>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-5 grid-margin stretch-card">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">Danh s??ch lo???i thu???c</h4>
                                <form action="/admin?actionUser=addType" method="post">
                                <div class="add-items d-flex">
                                    <input type="text" class="form-control todo-list-input" placeholder="Vui l??ng ??i???n lo???i thu???c b???n mu???n th??m" name="typeName">
                                    <button class="add btn btn-gradient-primary font-weight-bold todo-list-add-btn" id="add-task" type="submit">Th??m</button>
                                </div>
                                </form>
                                <div class="list-wrapper">
                                    <ul class="d-flex flex-column-reverse todo-list todo-list-custom">
                                        <c:forEach items="${typeDrugs}" var="typeDrug">
                                            <li>
                                                <div class="form-check">
                                                    <label class="form-check-label">
                                                        <input class="checkbox" type="checkbox"> ${typeDrug.getName()} </label>
                                                </div>
                                                <i class="remove mdi mdi-close-circle-outline"></i>
                                            </li>
                                        </c:forEach>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- content-wrapper ends -->
            <!-- partial:partials/_footer.html -->
            <!-- partial -->
        </div>
        <!-- main-panel ends -->
    </div>
    <!-- page-body-wrapper ends -->
</div>
<!-- container-scroller -->
<!-- plugins:js -->
<script src="assets/vendors/js/vendor.bundle.base.js"></script>
<!-- endinject -->
<!-- Plugin js for this page -->
<script src="assets/vendors/chart.js/Chart.min.js"></script>
<!-- End plugin js for this page -->
<!-- inject:js -->
<script src="assets/js/off-canvas.js"></script>
<script src="assets/js/hoverable-collapse.js"></script>
<script src="assets/js/misc.js"></script>
<!-- endinject -->
<!-- Custom js for this page -->
<script src="assets/js/dashboard.js"></script>
<script src="assets/js/todolist.js"></script>
<!-- End custom js for this page -->
</body>
</html>
