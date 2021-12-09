<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 12/2/2021
  Time: 5:28 PM
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
    <!-- <link rel="stylesheet" href="../../assets/vendors/css/vendor.bundle.base.css"> -->
    <!-- endinject -->
    <!-- Plugin css for this page -->
    <!-- End plugin css for this page -->
    <!-- inject:css -->
    <!-- endinject -->
    <!-- Layout styles -->
    <link rel="stylesheet" href="../assets/css/admin.css">
    <!-- End layout styles -->
</head>

<body>
<div class="container-scroller">
    <!-- partial:../../partials/_navbar.html -->
    <nav class="navbar default-layout-navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
        <div class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-center">
            <a class="navbar-brand brand-logo" href="./index.html"><img
                    src="https://raw.githubusercontent.com/BootstrapDash/PurpleAdmin-Free-Admin-Template/62c7c39e98f107b89af42ef9826923d8ae0a87c8/assets/images/logo.svg"
                    alt="logo" /></a>
        </div>
        <div class="navbar-menu-wrapper d-flex align-items-stretch">
            <button class="navbar-toggler navbar-toggler align-self-center" type="button" data-toggle="minimize">
                <span class="mdi mdi-menu"></span>
            </button>
            <div class="search-field d-none d-md-block">
                <form class="d-flex align-items-center h-100" action="#">
                    <div class="input-group">
                        <div class="input-group-prepend bg-transparent">
                            <i class="input-group-text border-0 mdi mdi-magnify"></i>
                        </div>
                    </div>
                </form>
            </div>
            <ul class="navbar-nav navbar-nav-right">
                <li class="nav-item nav-profile dropdown">
                    <a class="nav-link dropdown-toggle profile-dropdown" href="#">
                        <div class="nav-profile-img">
                            <img class="avatar" src="../assets/image/maxresdefault.jpg" alt="image">
                            <span class="availability-status online"></span>
                        </div>
                        <div class="nav-profile-text">
                            <p class="mb-1 text-black">Nguyễn Anh Quốc</p>
                        </div>
                    </a>
                    <div class="dropdown-menu navbar-dropdown drop-item">
                        <a class="dropdown-item" href="../login.html">
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
    </nav>
    <!-- partial -->
    <div class="container-fluid page-body-wrapper">
        <!-- partial:../../partials/_sidebar.html -->
        <nav class="sidebar sidebar-offcanvas" id="sidebar">
            <ul class="nav">
                <li class="nav-item nav-profile">
                    <a href="#" class="nav-link">
                        <div class="nav-profile-image">
                            <img class="avatar" src="../assets/image/maxresdefault.jpg" alt="profile">
                            <!--change to offline or busy as needed-->
                        </div>
                        <div class="nav-profile-text d-flex flex-column">
                            <span class="font-weight-bold mb-2">Nguyễn Anh Quốc</span>
                            <span class="text-secondary text-small">Admin</span>
                        </div>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="index.html">
                        <span class="menu-title">Dashboard</span>
                        <i class="mdi fas fa-home menu-icon"></i>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="./user.html">
                        <span class="menu-title">Người dùng</span>
                        <i class="mdi fas fa-users-cog menu-icon"></i>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="./doctor.html">
                        <span class="menu-title">Bác sĩ</span>
                        <i class="mdi fas fa-user-md menu-icon"></i>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="./pharmacy.html">
                        <span class="menu-title">Nhà thuốc</span>
                        <i class="mdi fas fa-cannabis menu-icon"></i>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="./medicine.html">
                        <span class="menu-title">Quản lí thuốc</span>
                        <i class="mdi fas fa-capsules menu-icon"></i>
                    </a>
                </li>
            </ul>
        </nav>
        <!-- partial -->
        <div class="main-panel" id="top">
            <div class="content-wrapper">
                <div class="page-header">
                    <h3 class="page-title"> Quản lí thuốc </h3>
                    <nav aria-label="breadcrumb">
                    </nav>
                </div>
                <div class="row">
                    <div class="col-12 grid-margin stretch-card">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">Danh sách thuốc</h4>
                                <a class="float-right" href="#add"><button class="btn-icon-text btn btn-sm btn-info"><i
                                        class="btn-icon-prepend fas fa-plus"></i>Thêm mới</button></a>
                                <a href="#top" class="go-to-top"><button class="btn btn-gradient-info btn-rounded btn-icon"><i
                                        class="fas fa-arrow-up"></i></button></a>
                                <table class="table table-hover">
                                    <thead>
                                    <tr>
                                        <th> Tên thuốc </th>
                                        <th> Mô tả </th>
                                        <th> Loại thuốc </th>
                                        <th> Giá </th>
                                        <th> ID </th>
                                        <th class="th-control">Điều chỉnh</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td> Tên 1 </td>
                                        <td>Mô tả</td>
                                        <td>
                                            <label class="badge badge-success">Kháng sinh</label>
                                        </td>
                                        <td> 100.000đ </td>
                                        <td> T01 </td>
                                        <td>
                                            <a href="#add"><button class="btn btn-sm btn-icon-text btn-gradient-dark btn-edit"><i
                                                    class=" btn-icon-prepend far fa-edit"></i>Sửa</button></a>
                                            <button class="btn btn-sm btn-icon-text btn-gradient-danger btn-delete"><i
                                                    class=" btn-icon-prepend fas fa-trash-alt"></i>Xóa</button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td> Tên 2 </td>
                                        <td>Mô tả</td>
                                        <td>
                                            <label class="badge badge-info">Covid-19</label>
                                        </td>
                                        <td> 230.000đ </td>
                                        <td> T02 </td>
                                        <td>
                                            <a href="#add"><button class="btn btn-sm btn-icon-text btn-gradient-dark btn-edit"><i
                                                    class=" btn-icon-prepend far fa-edit"></i>Sửa</button></a>
                                            <button class="btn btn-sm btn-icon-text btn-gradient-danger btn-delete"><i
                                                    class=" btn-icon-prepend fas fa-trash-alt"></i>Xóa</button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td> Tên 3 </td>
                                        <td>Mô tả</td>
                                        <td>
                                            <label class="badge badge-warning">Tiêu hóa</label>
                                        </td>
                                        <td> 52.000đ </td>
                                        <td> T03 </td>
                                        <td>
                                            <a href="#add"><button class="btn btn-sm btn-icon-text btn-gradient-dark btn-edit"><i
                                                    class=" btn-icon-prepend far fa-edit"></i>Sửa</button></a>
                                            <button class="btn btn-sm btn-icon-text btn-gradient-danger btn-delete"><i
                                                    class=" btn-icon-prepend fas fa-trash-alt"></i>Xóa</button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td> Tên 3 </td>
                                        <td>Mô tả</td>
                                        <td>
                                            <label class="badge badge-warning">Tiêu hóa</label>
                                        </td>
                                        <td> 52.000đ </td>
                                        <td> T03 </td>
                                        <td>
                                            <a href="#add"><button class="btn btn-sm btn-icon-text btn-gradient-dark btn-edit"><i
                                                    class=" btn-icon-prepend far fa-edit"></i>Sửa</button></a>
                                            <button class="btn btn-sm btn-icon-text btn-gradient-danger btn-delete"><i
                                                    class=" btn-icon-prepend fas fa-trash-alt"></i>Xóa</button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td> Tên 4 </td>
                                        <td>Mô tả</td>
                                        <td>
                                            <label class="badge badge-danger">Huyết áp</label>
                                        </td>
                                        <td> 1.234.567đ </td>
                                        <td> T04 </td>
                                        <td>
                                            <a href="#add"><button class="btn btn-sm btn-icon-text btn-gradient-dark btn-edit"><i
                                                    class=" btn-icon-prepend far fa-edit"></i>Sửa</button></a>
                                            <button class="btn btn-sm btn-icon-text btn-gradient-danger btn-delete"><i
                                                    class=" btn-icon-prepend fas fa-trash-alt"></i>Xóa</button>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12 grid-margin stretch-card">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title" id="add">Thêm thuốc mới/ Cập nhật</h4>
                                <br>
                                <form class="forms-sample">
                                    <div class="form-group">
                                        <label for="exampleInputName1">Tên thuốc</label>
                                        <input type="text" class="form-control" id="exampleInputName" placeholder="Nhập tên thuốc">
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleTextarea1">Mô tả</label>
                                        <textarea class="form-control" id="exampleTextarea1" rows="4"></textarea>
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleSelectGender">Loại thuốc</label>
                                        <select class="form-control" id="exampleSelectGender" style="cursor: pointer;">
                                            <option value="Tiêu hóa">Tiêu hóa</option>
                                            <option value="Kháng sinh">Kháng sinh</option>
                                            <option value="Covid-19">Covid-19</option>
                                            <option value="Huyết áp">Huyết áp</option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputName1">Giá</label>
                                        <input type="number" class="form-control" id="exampleInputName1" placeholder="Nhập giá">
                                    </div>
                                    <div class="form-group">
                                        <!-- <label>Ảnh</label>
                                          <input type="file" name="img[]" class="file-upload-default">
                                          <div class="input-group col-xs-12">
                                            <input type="text" class="form-control file-upload-info" disabled placeholder="Upload Image">
                                            <span class="input-group-append">
                                              <button class="file-upload-browse btn btn-gradient-primary" type="button">Upload</button>
                                            </span>
                                          </div> -->
                                        <label>Ảnh</label>
                                        <div class="input-group">
                                            <input class="form-control" type="file" accept="image/*" id="upload-photo">
                                            <div class="question__form__img-review">
                                                <!-- js here -->
                                            </div>
                                        </div>
                                    </div>
                                    <button type="submit" class="btn btn-icon-text btn-gradient-info mr-2 btn-submit"><i
                                            class="btn-icon-prepend fas fa-paper-plane"></i>Thêm</button>
                                    <button class="btn btn-icon-text btn-gradient-dark btn-reset"><i
                                            class=" btn-icon-prepend fas fa-redo-alt"></i>Đặt lại</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- content-wrapper ends -->
            <!-- partial:../../partials/_footer.html -->
            <!-- partial -->
        </div>
        <!-- main-panel ends -->
    </div>
    <!-- page-body-wrapper ends -->
</div>
<!-- modal -->
<div class="modal">
    <div class="overlay">
        <div class="modal__body">
            <h3>Bạn có muốn xóa dữ liệu này?</h3>
            <div class="btn-wrapper">
                <button class="btn btn-gradient-success mr-2 btn-agree">Đồng ý</button>
                <button class="btn btn-gradient-danger mr-2 btn-reject">Quay lại</button>
            </div>
        </div>
    </div>
</div>
<script src="../js/admin.js"></script>
</body>

</html>
