<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html lang="en" xmlns:th="http://www.w3.org/1999/xhtml">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Board - Admin</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
        <link href="/css/styles.css" rel="stylesheet" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
    </head>
    <body class="sb-nav-fixed">
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="/admin">ADMIN PAGE</a>
            <!-- Sidebar Toggle-->
            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
            <!-- Navbar Search-->
            <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
                <div class="input-group">
                    <input class="form-control" type="text" placeholder="Search for..." aria-label="Search for..." aria-describedby="btnNavbarSearch" />
                    <button class="btn btn-primary" id="btnNavbarSearch" type="button"><i class="fas fa-search"></i></button>
                </div>
            </form>
            <!-- Navbar-->
            <ul th:replace="/admin/adminNavbar.html :: admin-navbar" class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4"></ul>
        </nav>
        <div id="layoutSidenav">
            <div th:replace="/admin/adminSidenav.html :: admin-sidenav"></div>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">????????? ??????</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
                            <li class="breadcrumb-item active">????????? ??????</li>
                        </ol>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                User Control
                            </div>
                            <div class="card-body">
                                <table id="datatablesSimple">
                                    <thead>
                                        <tr>
                                            <th>??????</th>
                                            <th>ID</th>
                                            <th>??????</th>
                                            <th>?????????</th>
                                            <th>????????????</th>
                                            <th>?????? (0 : ?????? / 1 : ??????)</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>??????</th>
                                            <th>ID</th>
                                            <th>??????</th>
                                            <th>?????????</th>
                                            <th>????????????</th>
                                            <th>?????? (0 : ?????? / 1 : ??????)</th>
                                        </tr>
                                    </tfoot>
                                    <tbody class="user">

                                    </tbody>
                                </table>
                                <button id="deletePopup" type="button" onclick="" class="badge bg-secondary text-decoration-none link-light btn_open" style="float:right;">????????? ??????</button>
                                <button id="updatePopup" type="button" onclick="" class="badge bg-secondary text-decoration-none link-light btn_open" style="float:right;">??????????????? ??????/??????</button>
                                <button id="resetPopup" type="button" onclick="" class="badge bg-secondary text-decoration-none link-light btn_open" style="float:right;">???????????? ?????????</button>
                            </div>
                            <div id="userDelete" style="width:30%; margin-left:auto" class="card">
                                <div id="deleteMenu" class="card-body">
                                    <p>????????? ??????</p>
                                    <input id="userSeq" name="userSeq" class="userSeq" type="number" placeholder="????????? ??????"><br>
                                    <button style="float:right;" class="exit1 badge bg-secondary text-decoration-none link-light">??????</button>
                                    <button style="float:right;" class="badge bg-secondary text-decoration-none link-light" onclick="userDelete()">??????</button>
                                </div>
                            </div>
                            <div id="userUpdate" style="width:30%; margin-left:auto" class="card">
                                <div id="updateMenu" class="card-body">
                                    <p>??????????????? ??????/??????</p>
                                    <input id="userBlackSeq" name="userBlackSeq" class="userBlackSeq" type="number" placeholder="????????? ??????"><br>
                                    <input id="status" name="userBlackSeq" class="userBlackSeq" type="number" placeholder="???????????? (0 : ?????? / 1 : ?????? ?????????)"><br>
                                    <button style="float:right;" class="exit2 badge bg-secondary text-decoration-none link-light">??????</button>
                                    <button style="float:right;" class="badge bg-secondary text-decoration-none link-light" onclick="userUpdate()">??????</button>
                                </div>
                            </div>
                            <div id="userReset" style="width:30%; margin-left:auto" class="card">
                                <div id="resetMenu" class="card-body">
                                    <p>???????????? ?????????</p>
                                    <input id="userResetSeq" name="userResetSeq" class="userResetSeq" type="number" placeholder="????????? ??????"><br>
                                    <button style="float:right;" class="exit3 badge bg-secondary text-decoration-none link-light">??????</button>
                                    <button style="float:right;" class="badge bg-secondary text-decoration-none link-light" onclick="passwordReset()">?????????</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
                <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid px-4">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">Copyright &copy; Your Website 2021</div>
                            <div>
                                <a href="#">Privacy Policy</a>
                                &middot;
                                <a href="#">Terms &amp; Conditions</a>
                            </div>
                        </div>
                    </div>
                </footer>
            </div>
        </div>
        <!--<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>-->
        <script type="text/javascript" src="/js/jquery-3.6.0.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="/js/scripts.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script>
            $(document).ready(function() {
                const datatablesSimple = document.getElementById('datatablesSimple');
                if (datatablesSimple) {
                    new simpleDatatables.DataTable(datatablesSimple);
                }
            });

            $.ajax({
                type : "GET",
                url : "/admin/adminGetUser",
                dataType : "JSON",
                async : false,
                error : function(){
                    alert('????????????!!');
                },
                success : function(data){

                    var str = "";

                    for(var i = 0; Object.keys(data).length > i; i++){

                        var userSeq = data[Object.keys(data)[i]].userSeq;
                        var userId = data[Object.keys(data)[i]].userId;
                        var userName = data[Object.keys(data)[i]].userName;
                        var userBirth = data[Object.keys(data)[i]].userBirth;
                        var userPhone = data[Object.keys(data)[i]].userPhone;
                        var status = data[Object.keys(data)[i]].status;

                        if (status == 1) {
                            status = "?????? ????????? : 1"
                        }else {
                            status = "??????????????? ????????? : 0"
                        }

                        str += "<tr>" +
                            "<td>" + userSeq + "</td>" +
                            "<td>" + userId + "</td>" +
                            "<td>" + userName + "</td>" +
                            "<td>" + userBirth + "</td>" +
                            "<td>" + userPhone + "</td>" +
                            "<td>" + status + "</td>" +
                            "</tr>";

                        $("tbody.user").html(str);
                    }
                }
            });

            function userDelete(){
                var userSeq = $("#userSeq").val();

                $.ajax({
                    type: "DELETE",
                    url: "/admin/adminUserDelete",
                    dataType: "text",
                    async: false,
                    contentType: "application/json",
                    data: JSON.stringify({
                        "userSeq" : userSeq
                    }),
                    error: function () {
                        alert("????????? ????????? ?????? ???????????????!");
                        location.reload();
                    },
                    success: function (data) {
                        if (data == 1){
                            alert("???????????? ?????? ???????????????.");
                            location.reload();
                        }else{
                            alert("????????? ????????? ?????? ???????????????.");
                            location.reload();
                        }
                    }
                });
            }

            function userUpdate(){
                var userBlackSeq = $("#userBlackSeq").val();
                var status = $("#status").val();

                $.ajax({
                    type: "PUT",
                    url: "/admin/adminUserUpdate",
                    dataType: "text",
                    async: false,
                    contentType: "application/json",
                    data: JSON.stringify({
                        "userSeq" : userBlackSeq,
                        "status" : status
                    }),
                    error: function () {
                        alert("????????? ?????? ????????? ?????? ???????????????!");
                        location.reload();
                    },
                    success: function (data) {
                        if (data == 1){
                            alert("????????? ?????? ????????? ?????? ???????????????!");
                            location.reload();
                        }else{
                            alert("????????? ?????? ????????? ?????? ???????????????!");
                            location.reload();
                        }
                    }
                });
            }

            function passwordReset(){
                var userResetSeq = $("#userResetSeq").val();
                var userPw = 'securus11!';

                $.ajax({
                    type: "PUT",
                    url: "/admin/passwordReset",
                    dataType: "text",
                    async: false,
                    contentType: "application/json",
                    data: JSON.stringify({
                        "userSeq" : userResetSeq,
                        "userPw" : userPw
                    }),
                    error: function () {
                        alert("????????? ???????????? ???????????? ?????? ???????????????!");
                        location.reload();
                    },
                    success: function (data) {
                        if (data == 1){
                            alert("????????? ???????????? ???????????? ?????? ???????????????!");
                            location.reload();
                        }else{
                            alert("????????? ???????????? ???????????? ?????? ???????????????!");
                            location.reload();
                        }
                    }
                });
            }

            $("#userDelete").fadeOut("fast");

            $("#deletePopup").click(function() {
                $("#userDelete").fadeToggle();
                $("#userUpdate").fadeOut();
                $("#userReset").fadeOut();

                $("#userSeq").val("");
                $("#status").val("");
                $("#userBlackSeq").val("");
                $("#userResetSeq").val("");
            });

            $(".exit1").click(function() {
                $("#userUpdate").fadeOut();
                $("#userDelete").fadeOut();
                $("#userReset").fadeOut();

                $("#userSeq").val("");
                $("#status").val("");
                $("#userBlackSeq").val("");
                $("#userResetSeq").val("");
            });

            $("#userUpdate").fadeOut("fast");

            $("#updatePopup").click(function() {
                $("#userUpdate").fadeToggle();
                $("#userDelete").fadeOut();
                $("#userReset").fadeOut();

                $("#userSeq").val("");
                $("#status").val("");
                $("#userBlackSeq").val("");
                $("#userResetSeq").val("");
            });

            $(".exit2").click(function() {
                $("#userUpdate").fadeOut();
                $("#userDelete").fadeOut();
                $("#userReset").fadeOut();

                $("#userSeq").val("");
                $("#status").val("");
                $("#userBlackSeq").val("");
                $("#userResetSeq").val("");
            });

            $("#userReset").fadeOut("fast");

            $("#resetPopup").click(function() {

                $("#userReset").fadeToggle();
                $("#userUpdate").fadeOut();
                $("#userDelete").fadeOut();

                $("#userSeq").val("");
                $("#status").val("");
                $("#userBlackSeq").val("");
                $("#userResetSeq").val("");
            });

            $(".exit3").click(function() {
                $("#userUpdate").fadeOut();
                $("#userDelete").fadeOut();
                $("#userReset").fadeOut();

                $("#userSeq").val("");
                $("#status").val("");
                $("#userBlackSeq").val("");
                $("#userResetSeq").val("");
            });
        </script>
    </body>
</html>
