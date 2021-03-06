<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 12/4/2021
  Time: 11:11 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Medical Advising Admin</title>
    <%-- Datatable--%>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/bs4/jq-3.6.0/dt-1.11.3/datatables.min.css"/>
    <script type="text/javascript" src="https://cdn.datatables.net/v/bs4/jq-3.6.0/dt-1.11.3/datatables.min.js"></script>
    <!-- plugins:css -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <%--<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"--%>
            integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
            crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
            integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
            crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
            integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
            crossorigin="anonymous"></script>
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
    <jsp:include page="navtop.jsp"/>
    <!-- partial -->
    <div class="container-fluid page-body-wrapper">
        <!-- partial:../../partials/_sidebar.html -->
        <jsp:include page="nav.jsp"/>
        <!-- partial -->
        <div class="main-panel" id="top">
            <div class="content-wrapper">
                <div class="page-header">
                    <h3 class="page-title"> Qu???n l?? ng?????i d??ng </h3>
                    <nav aria-label="breadcrumb">
                    </nav>
                </div>
                <div class="row">
                    <div class="col-12 grid-margin stretch-card">
                        <div class="card">
                            <c:if test="${messeger!=null}">
                                <div class="alert alert-success alert-dismissible">
                                    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                    <strong>Thao t??c th??nh c??ng!</strong> ${messeger}
                                </div>
                            </c:if>
                            <c:if test="${error!=null}">
                                <div class="alert alert-success alert-dismissible">
                                    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                    <strong>L???i!</strong> ${error}
                                </div>
                            </c:if>
                            <div class="card-body">
                                <h4 class="card-title">Danh s??ch ng?????i d??ng</h4>
                                <a class="float-left" href="/admin?actionUser=addCustomer">
                                    <button class="btn-icon-text btn btn-sm btn-info"><i
                                            class="btn-icon-prepend fas fa-plus"></i>Th??m m???i
                                    </button>
                                </a>
                                <a href="#top" class="go-to-top">
                                    <button class="btn btn-gradient-info btn-rounded btn-icon"><i
                                            class="fas fa-arrow-up"></i></button>
                                </a>
                                <table class="table table-hover display" id="usertable">
                                    <thead>
                                    <tr>
                                        <th> ID</th>
                                        <th> H??? T??n</th>
                                        <th> T??n ????ng nh???p</th>
                                        <th> S??? ??i???n tho???i</th>
                                        <th> Ng??y sinh</th>
                                        <th> Email</th>
                                        <th> Vai tr??</th>
                                        <th class="th-control">??i???u ch???nh</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${customers}" var="customer">
                                        <tr>
                                            <td> ${customer.getId()}</td>
                                            <td> ${customer.getFullName()} </td>
                                            <td> ${customer.getAccount().getUserName()} </td>
                                            <td> ${customer.getNumberPhone()} </td>
                                            <td> ${customer.getBirthday()} </td>
                                            <td> ${customer.getAccount().getEmail()} </td>
                                            <td> ${customer.getAccount().getTypeAccount().getTypeName()} </td>
                                            <td>
                                                <a href="/admin?actionUser=editCustomer&id=${customer.getId()}">
                                                    <button class="btn btn-sm btn-icon-text btn-gradient-dark btn-edit">
                                                        <i
                                                                class=" btn-icon-prepend far fa-edit"></i>S???a
                                                    </button>
                                                </a>
                                                <button class="btn btn-sm btn-icon-text btn-gradient-danger btn-delete" data-toggle="modal" data-target="#deleteModal-${customer.getId()}">
                                                    <i class=" btn-icon-prepend fas fa-trash-alt"></i>X??a
                                                </button>
                                                    <%--Modal delete--%>
                                                <div class="modal fade" id="deleteModal-${customer.getId()}" tabindex="-1" role="dialog"
                                                     aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                    <div class="modal-dialog" role="document">
                                                        <div class="modal-content">
                                                            <div class="modal-header">
                                                                <h5 class="modal-title" id="exampleModalLabel">X??c nh???n</h5>
                                                                <button type="button" class="close" data-dismiss="modal"
                                                                        aria-label="Close">
                                                                    <span aria-hidden="true">&times;</span>
                                                                </button>
                                                            </div>
                                                            <div class="modal-body">
                                                                B???n c?? mu???n xo?? ng?????i d??ng ${customer.getFullName()} kh??ng?
                                                            </div>
                                                            <div class="modal-footer">
                                                                <button type="button" class="btn btn-secondary"
                                                                        data-dismiss="modal">Quay l???i
                                                                </button>
                                                                <a href="/admin?actionUser=deleteCustomer&id=${customer.getId()}">
                                                                    <button type="button" class="btn btn-danger"> <i class=" btn-icon-prepend fas fa-trash-alt"></i>
                                                                        ?????ng ??
                                                                    </button>
                                                                </a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                    <%--End modal--%>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>

                <c:if test="${action.equals('edit')}">
                <div class="row">
                    <div class="col-12 grid-margin stretch-card">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title" id="add">C???p nh???t th??ng tin</h4>
                                <br>
                                <form class="forms-sample" method="post" action="/admin?actionUser=editCustomer">
                                    <div class="form-group">
                                        <label for="exampleTextarea1">ID</label>
                                        <input class="form-control" readonly rows="4"
                                               value="${customer.getId()}" name="id"/>
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputName1">H??? t??n</label>
                                        <input type="text" class="form-control" id="exampleInputName1"
                                               placeholder="Nh???p h??? t??n" value="${customer.getFullName()}" name="name">
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleTextarea1">Username</label>
                                        <input class="form-control" readonly  rows="4"
                                               value="${customer.getAccount().getUserName()}" name="username"/>
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleTextarea1">Number Phone</label>
                                        <input class="form-control"  rows="4"
                                               value="${customer.getNumberPhone()}" name="numberphone"/>
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleTextarea1">Birthday</label>
                                        <input type="date" class="form-control"  rows="4"
                                               value="${customer.getBirthday()}" name="birthday"/>
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleTextarea1">Email</label>
                                        <input class="form-control"  id="exampleTextarea1" rows="4"
                                               value="${customer.getAccount().getEmail()}" name="email"/>
                                    </div>
                                    <%--<div class="form-group">
                                        <label for="exampleInputName1">Vai tr??</label>
                                        <select class="form-control" id="exampleSelectGender" style="cursor: pointer;" name="typeAccount">
                                            <c:forEach var="typeAccount" items="${typeAccounts}">
                                                <option value="${typeAccount.getId()}">${typeAccount.getTypeName()}</option>
                                            </c:forEach>
                                        </select>
                                    </div>--%>
                                    <button type="submit" class="btn btn-icon-text btn-gradient-info mr-2 btn-submit"><i
                                            class="btn-icon-prepend fas fa-paper-plane"></i>S???a th??ng tin
                                    </button>
                                    <a href="/admin?actionUser=customer"><button type="button" class="btn btn-icon-text btn-gradient-dark btn-reset">Quay l???i
                                    </button></a>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            </c:if>
            <c:if test="${action.equals('add')}">
            <div class="row">
                <div class="col-12 grid-margin stretch-card">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title">Th??m ng?????i d??ng</h4>
                            <br>
                            <form class="forms-sample" method="post" action="/admin?actionUser=add">
                                <div class="form-group">
                                    <label for="inputName">H??? t??n</label>
                                    <input type="text" class="form-control" id="inputName"
                                           placeholder="Nh???p h??? t??n" name="name">
                                </div>
                                <div class="form-group">
                                    <label for="inputEmail">Email</label>
                                    <input type="email" class="form-control" id="inputEmail"
                                           placeholder="Nh???p h??? t??n" name="email">
                                </div>
                                <div class="form-group">
                                    <label for="inputUserName">Username</label>
                                    <input class="form-control"  id="inputUserName" rows="4" placeholder="Nh???p t??n ng?????i d??ng" name="username"/>
                                </div>
                                <div class="form-group">
                                    <label for="inputPassword">Password</label>
                                    <input type="password" class="form-control" id="inputPassword" rows="4" name="psw"/>
                                </div>
                                <button type="submit" class="btn btn-icon-text btn-gradient-info mr-2 btn-submit"><i
                                        class="btn-icon-prepend fas fa-paper-plane"></i>Th??m
                                </button>
                                <button type="reset" class="btn btn-icon-text btn-gradient-dark btn-reset"><i
                                        class=" btn-icon-prepend fas fa-redo-alt"></i>?????t l???i
                                </button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        </c:if>
            <!-- content-wrapper ends -->
            <!-- partial:../../partials/_footer.html -->
            <!-- partial -->
        </div>
        <!-- main-panel ends -->
    </div>
    <!-- page-body-wrapper ends -->
</div>
<script src="../js/admin.js"></script>
<script>
    $(document).ready(function() {
        $('#usertable').DataTable( {
            "lengthMenu": [[5],[5]],
            "dom": '<"toolbar">frtip',
            "language": {
                "zeroRecords": "Kh??ng t??m th???y ng?????i d??ng m?? b???n c???n t??m",
                "info": "Hi???n th??? _START_ t???i _END_ c???a _TOTAL_ ng?????i d??ng",
                "infoEmpty": "Kh??ng c?? ng?????i d??ng n??o trong d??? li???u",
                "infoFiltered": "(C?? _MAX_ ng?????i d??ng ???????c t??m th???y)",
                "search": "T??m ki???m:",
                "lengthMenu": "Hi???n th??? _MENU_ d??? li???u",
                "paginate": {
                    "first": "?????u ti??n",
                    "last": "Cu???i c??ng",
                    "next": "Sau",
                    "previous": "Tr?????c"
                },
            }
        } );
    } );
</script>
</body>
</html>
