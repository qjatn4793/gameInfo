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
                                Board Control
                            </div>
                            <div class="card-body">
                                <table id="datatablesSimple">
                                    <thead>
                                        <tr>
                                            <th>????????? ??????</th>
                                            <th>??????</th>
                                            <th>??????</th>
                                            <th>????????? ???</th>
                                            <th>?????????</th>
                                            <th>?????????</th>
                                            <th>?????????</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>????????? ??????</th>
                                            <th>??????</th>
                                            <th>??????</th>
                                            <th>????????? ???</th>
                                            <th>?????????</th>
                                            <th>?????????</th>
                                            <th>?????????</th>
                                        </tr>
                                    </tfoot>
                                    <tbody class="board">

                                    </tbody>
                                </table>
                                <button id="deletePopup" type="button" onclick="" class="badge bg-secondary text-decoration-none link-light btn_open" style="float:right;">????????? ??????</button>
                            </div>
                            <div id="boardDelete" style="width:30%; margin-left:auto" class="card">
                                <div id="deleteMenu" class="card-body">
                                    <p>????????? ??????</p>
                                    <input id="boardSeq" name="boardSeq" class="boardSeq" type="number" placeholder="????????? ??????"><br>
                                    <button style="float:right;" class="exit1 badge bg-secondary text-decoration-none link-light">??????</button>
                                    <button style="float:right;" class="badge bg-secondary text-decoration-none link-light" onclick="boardDelete()">??????</button>
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
        <script src="/js/board.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script>
            function boardDelete(){
                var boardWriter = $("#boardWriter").text();
                var rBoardWriter = boardWriter.replace("????????? : ", "");

                var boardSeq = $("#boardSeq").val();

                $.ajax({
                    type: "DELETE",
                    url: "/board/" + boardSeq,
                    dataType: "text",
                    async: false,
                    contentType: "application/json",
                    data: JSON.stringify({
                        "boardWriter" : rBoardWriter
                    }),
                    error: function () {
                        alert("????????? ????????? ?????? ???????????????!");
                        sessionStorage.clear();
                    },
                    success: function (data) {
                        if (data == 1){
                            alert("???????????? ?????? ???????????????.");
                            location.replace("/mainBoard");
                        }else{
                            alert("????????? ????????? ?????? ???????????????.");
                            location.replace("/mainBoard");
                            sessionStorage.clear();
                        }
                    }
                });
            }

            $("#boardDelete").fadeOut("fast");

            $("#deletePopup").click(function() {
                $("#boardDelete").fadeToggle();

                $("#boardSeq").val("");
            });

            $(".exit1").click(function() {
                $("#boardDelete").fadeOut();
                $("#boardSeq").val("");
            });
        </script>
    </body>
</html>
