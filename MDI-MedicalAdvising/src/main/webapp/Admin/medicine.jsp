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
    <link rel="stylesheet" type="text/css"
          href="https://cdn.datatables.net/v/bs4/jq-3.6.0/dt-1.11.3/datatables.min.css"/>
    <script type="text/javascript" src="https://cdn.datatables.net/v/bs4/jq-3.6.0/dt-1.11.3/datatables.min.js"></script>
    <!-- plugins:css -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <%--    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"--%>
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
                    <h3 class="page-title"> Qu???n l?? thu???c </h3>
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
                                <div class="alert alert-danger alert-dismissible">
                                    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                    <strong>L???i!</strong> ${error}
                                </div>
                            </c:if>
                            <div class="card-body">
                                <h4 class="card-title">Danh s??ch thu???c</h4>
                                <a class="float-left" href="/admin?actionUser=addDrug">
                                    <button class="btn-icon-text btn btn-sm btn-info"><i
                                            class="btn-icon-prepend fas fa-plus"></i>Th??m m???i thu???c
                                    </button>
                                </a>
                                <a class="float-left" href="/admin?actionUser=addTypeDrug" style="margin-left: 5px">
                                    <button class="btn-icon-text btn btn-sm btn-info"><i
                                            class="btn-icon-prepend fas fa-plus"></i>Th??m m???i lo???i thu???c
                                    </button>
                                </a>
                                <a href="#top" class="go-to-top">
                                    <button class="btn btn-gradient-info btn-rounded btn-icon"><i
                                            class="fas fa-arrow-up"></i></button>
                                </a>
                                <table class="table table-hover" id="usertable">
                                    <thead>
                                    <tr>
                                        <th> ID</th>
                                        <th> T??n Thu???c</th>
                                        <th> Gi?? Ni??m Y???t</th>
                                        <th> Lo???i thu???c</th>
                                        <th> M?? t??? chi ti???t</th>
                                        <th class="th-control">??i???u ch???nh</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${drugs}" var="drug">
                                        <tr>
                                            <td> ${drug.getId()}</td>
                                            <td><img src="data:image/jpg;base64,${drug.getImage()}"
                                                     alt="${drug.getName()}" style="border-radius: 50%">
                                                    ${drug.getName()} </td>
                                            <td> ${drug.getPrice()} </td>
                                            <td> ${drug.getTypeDrug().getName()} </td>
                                            <td> ${drug.getDescription()} </td>
                                            <td>
                                                <a href="/admin?actionUser=editDrug&id=${drug.getId()}">
                                                    <button class="btn btn-sm btn-icon-text btn-gradient-dark btn-edit">
                                                        <i
                                                                class=" btn-icon-prepend far fa-edit"></i>S???a
                                                    </button>
                                                </a>
                                                <button class="btn btn-sm btn-icon-text btn-gradient-danger btn-delete"
                                                        data-toggle="modal" data-target="#deleteModal-${drug.getId()}">
                                                    <i class=" btn-icon-prepend fas fa-trash-alt"></i>X??a
                                                </button>
                                                    <%--Modal delete--%>
                                                <div class="modal fade" id="deleteModal-${drug.getId()}" tabindex="-1" role="dialog"
                                                     aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                    <div class="modal-dialog" role="document">
                                                        <div class="modal-content">
                                                            <div class="modal-header">
                                                                <h5 class="modal-title" id="exampleModalLabel">X??c
                                                                    nh???n</h5>
                                                                <button type="button" class="close" data-dismiss="modal"
                                                                        aria-label="Close">
                                                                    <span aria-hidden="true">&times;</span>
                                                                </button>
                                                            </div>
                                                            <div class="modal-body">
                                                                B???n c?? mu???n xo?? thu???c ${drug.getName()} kh??ng?
                                                            </div>
                                                            <div class="modal-footer">
                                                                <button type="button" class="btn btn-secondary"
                                                                        data-dismiss="modal">Quay l???i
                                                                </button>
                                                                <a href="/admin?actionUser=deleteDrug&id=${drug.getId()}">
                                                                    <button type="button" class="btn btn-danger"><i
                                                                            class=" btn-icon-prepend fas fa-trash-alt"></i>
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
                                <h4 class="card-title" id="edit">C???p nh???t th??ng tin</h4>
                                <br>
                                <form class="forms-sample" enctype="multipart/form-data" action="/admin?actionUser=editDrug"
                                      method="post">
                                    <div class="form-group">
                                        <label>ID</label>
                                        <input type="text" class="form-control" name="idDrug" value="${drug.getId()}" readonly>
                                    </div>
                                    <div class="form-group">
                                        <label>T??n thu???c</label>
                                        <input type="text" class="form-control" name="name" placeholder="Nh???p t??n thu???c" value="${drug.getName()}">
                                    </div>
                                    <div class="form-group">
                                        <label>M?? t???</label>
                                        <textarea class="form-control" rows="4" name="description"></textarea>
                                    </div>
                                    <div class="form-group">
                                        <label>Lo???i thu???c</label>
                                        <select class="form-control" style="cursor: pointer;" name="type">
                                            <c:forEach items="${typeDrugs}" var="typeDrug">
                                                <option value="${typeDrug.getId()}">${typeDrug.getName()}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label>Gi??</label>
                                        <input type="number" class="form-control" placeholder="Nh???p gi??" name="price" value="${drug.getPrice()}">
                                    </div>
                                    <div class="form-group">
                                        <!-- <label>???nh</label>
                                          <input type="file" name="img[]" class="file-upload-default">
                                          <div class="input-group col-xs-12">
                                            <input type="text" class="form-control file-upload-info" disabled placeholder="Upload Image">
                                            <span class="input-group-append">
                                              <button class="file-upload-browse btn btn-gradient-primary" type="button">Upload</button>
                                            </span>
                                          </div> -->
                                        <label>???nh</label>
                                        <div class="input-group">
                                            <input class="form-control" type="file" accept="image/*" name="image">
                                            <div class="question__form__img-review">
                                                <!-- js here -->
                                            </div>
                                        </div>
                                    </div>
                                    <button type="submit" class="btn btn-icon-text btn-gradient-info mr-2 btn-submit"><i
                                            class="btn-icon-prepend fas fa-paper-plane"></i>S???a
                                    </button>
                                    <button class="btn btn-icon-text btn-gradient-dark btn-reset"><i
                                            class=" btn-icon-prepend fas fa-redo-alt"></i>?????t l???i
                                    </button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            </c:if>
            <c:if test="${action.equals('addType')}">
            <div class="row">
                <div class="col-12 grid-margin stretch-card">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title">Th??m lo???i thu???c</h4>
                            <br>
                            <form class="forms-sample" action="/admin?actionUser=addType" method="post">
                                <div class="form-group">
                                    <label>T??n Lo???i thu???c</label>
                                    <input type="text" class="form-control" placeholder="Nh???p t??n lo???i thu???c" name="typeName">
                                </div>
                                <button type="submit" class="btn btn-icon-text btn-gradient-info mr-2 btn-submit"><i
                                        class="btn-icon-prepend fas fa-paper-plane"></i>Th??m
                                </button>
                                <button class="btn btn-icon-text btn-gradient-dark btn-reset"><i
                                        class=" btn-icon-prepend fas fa-redo-alt"></i>?????t l???i
                                </button>
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
                        <h4 class="card-title">Th??m thu???c</h4>
                        <br>
                        <form class="forms-sample" enctype="multipart/form-data" action="/admin?actionUser=addDrug"
                              method="post">
                            <div class="form-group">
                                <label>T??n thu???c</label>
                                <input type="text" class="form-control" name="name" placeholder="Nh???p t??n thu???c">
                            </div>
                            <div class="form-group">
                                <label>M?? t???</label>
                                <textarea class="form-control" rows="4" name="description"></textarea>
                            </div>
                            <div class="form-group">
                                <label>Lo???i thu???c</label>
                                <select class="form-control" style="cursor: pointer;" name="type">
                                    <c:forEach items="${typeDrugs}" var="typeDrug">
                                        <option value="${typeDrug.getId()}">${typeDrug.getName()}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Gi??</label>
                                <input type="number" class="form-control" placeholder="Nh???p gi??" name="price">
                            </div>
                            <div class="form-group">
                                <!-- <label>???nh</label>
                                  <input type="file" name="img[]" class="file-upload-default">
                                  <div class="input-group col-xs-12">
                                    <input type="text" class="form-control file-upload-info" disabled placeholder="Upload Image">
                                    <span class="input-group-append">
                                      <button class="file-upload-browse btn btn-gradient-primary" type="button">Upload</button>
                                    </span>
                                  </div> -->
                                <label>???nh</label>
                                <div class="input-group">
                                    <input class="form-control" type="file" accept="image/*" name="image">
                                    <div class="question__form__img-review">
                                        <!-- js here -->
                                    </div>
                                </div>
                            </div>
                            <button type="submit" class="btn btn-icon-text btn-gradient-info mr-2 btn-submit"><i
                                    class="btn-icon-prepend fas fa-paper-plane"></i>Th??m
                            </button>
                            <button class="btn btn-icon-text btn-gradient-dark btn-reset"><i
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
    $(document).ready(function () {
        $('#usertable').DataTable({
            "lengthMenu": [[5], [5]],
            "dom": '<"toolbar">frtip',
            "language": {
                "zeroRecords": "Kh??ng t??m th???y thu???c m?? b???n c???n t??m",
                "info": "Hi???n th??? _START_ t???i _END_ c???a _TOTAL_ thu???c",
                "infoEmpty": "Kh??ng c?? thu???c n??o trong d??? li???u",
                "infoFiltered": "(C?? _MAX_ thu???c ???????c t??m th???y)",
                "search": "T??m ki???m:",
                "lengthMenu": "Hi???n th??? _MENU_ d??? li???u",
                "paginate": {
                    "first": "?????u ti??n",
                    "last": "Cu???i c??ng",
                    "next": "Sau",
                    "previous": "Tr?????c"
                },
            }
        });
    });
</script>
</body>
</html>
