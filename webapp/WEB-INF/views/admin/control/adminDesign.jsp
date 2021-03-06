<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html lang="en" xmlns:th="http://www.w3.org/1999/xhtml">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Product - Admin</title>
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

                        <!--????????? ??? ??????-->
                        <div class="design-side" style="background-color:#212529;">
                            <div>
                                <div>
                                    <div type="button" onclick="viewMainDesign()" class="sb-sidenav-dark nav-link">
                                        ?????? ?????????
                                    </div>
                                    <a class="sb-sidenav-dark nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayouts2" aria-expanded="false" aria-controls="collapseLayouts2">
                                        ?????? ?????????
                                    </a>
                                    <div class="collapse" id="collapseLayouts2" aria-labelledby="headingOne" data-bs-parent="#design-side">
                                        <nav class="sb-sidenav-menu-nested nav">
                                            <div type="button" onclick="viewProductDesign()" class="sb-sidenav-dark nav-link" style="margin-left:10px;" href="#">Product ?????? ?????????</div>
                                            <div type="button" onclick="viewBoardDesign()" class="sb-sidenav-dark nav-link" style="margin-left:10px;" href="#">Board ?????? ?????????</div>
                                            <div type="button" onclick="viewCrawDesign()" class="sb-sidenav-dark nav-link" style="margin-left:10px;" href="#">Craw ?????? ?????????</div>
                                        </nav>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--????????? ??? ???-->
                        <div class="card" style="float:right; width:82%; height:620px;">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                Design Control
                            </div>
                            <div class="selectImg" style="width:100%; height:100%;">
                                <img src=""/>
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
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="/js/scripts.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="/js/datatables-simple-demo.js"></script>
        <!--<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>-->
        <script type="text/javascript" src="/js/jquery-3.6.0.js"></script>
        <script>
            var imgHeight = $(".selectImg").css("height");

            function viewMainDesign(){
                $(".selectImg").children().remove();
                let mainImg1 = "<input id='mainImg1' type='file' onchange='adminDesign(this.id, this.value)' class='file-style' accept='image/png'/><label for='mainImg1' class='btn-style'>????????? ??????</label><img src='/assets/img/mainImg1.jpg' style='width:24.9%; height:"+ imgHeight +";'/>";
                let mainImg2 = "<input id='mainImg2' type='file' onchange='adminDesign(this.id, this.value)' class='file-style' accept='image/png'/><label for='mainImg2' class='btn-style'>????????? ??????</label><img src='/assets/img/mainImg2.jpg' style='width:24.9%; height:"+ imgHeight +";'/>";
                let mainImg3 = "<input id='mainImg3' type='file' onchange='adminDesign(this.id, this.value)' class='file-style' accept='image/png'/><label for='mainImg3' class='btn-style'>????????? ??????</label><img src='/assets/img/mainImg3.jpg' style='width:24.9%; height:"+ imgHeight +";'/>";
                let mainImg4 = "<input id='mainImg4' type='file' onchange='adminDesign(this.id, this.value)' class='file-style' accept='image/png'/><label for='mainImg4' class='btn-style'>????????? ??????</label><img src='/assets/img/mainImg4.jpg' style='width:24.9%; height:"+ imgHeight +";'/>";

                $(".selectImg").append(mainImg1);
                $(".selectImg").append(mainImg2);
                $(".selectImg").append(mainImg3);
                $(".selectImg").append(mainImg4);

            }
            function viewProductDesign(){
                $(".selectImg").children().remove();

                let productImg = "<input id='productImg' type='file' onchange='adminDesign(this.id, this.value)' class='file-style' accept='image/png' value='????????? ??????'/><label for='productImg' class='btn-style'>????????? ??????</label><img src='/assets/img/productImg.jpg' style='width:100%; height:"+ imgHeight +";'/>";

                $(".selectImg").append(productImg);
            }
            function viewBoardDesign(){
                $(".selectImg").children().remove();

                let boardImg = "<input id='boardImg' type='file' onchange='adminDesign(this.id, this.value)' class='file-style' accept='image/png' value='????????? ??????'/><label for='boardImg' class='btn-style'>????????? ??????</label><img src='/assets/img/boardImg.jpg' style='width:100%; height:"+ imgHeight +";'/>";

                $(".selectImg").append(boardImg);
            }
            function viewCrawDesign(){
                $(".selectImg").children().remove();

                let crawImg = "<input id='crawImg' type='file' onchange='adminDesign(this.id, this.value)' class='file-style' accept='image/png' value='????????? ??????'/><label for='crawImg' class='btn-style'>????????? ??????</label><img src='/assets/img/crawImg.jpg' style='width:100%; height:"+ imgHeight +";'/>";

                $(".selectImg").append(crawImg);
            }

            function adminDesign(fileName, uploadPath) {

                uploadPath = uploadPath.replace("fakepath", "uploadPath"); // C:\uploadPath\?????????.png

                $.ajax({
                    type: "POST",
                    url: "/admin/adminDesign/" + fileName,
                    dataType: "text",
                    async: false,
                    contentType: "application/json",
                    data: JSON.stringify({
                        "uploadPath" : uploadPath
                    }),
                    error: function () {
                        alert("????????? ????????? ?????? ???????????????!");
                    },
                    success: function (data) {
                        if (data == 1) {
                            alert("???????????? ?????????????????????.");
                            //location.replace("/admin/adminDesign");
                            window.location.reload(true);
                        } else {
                            alert("????????? ????????? ?????? ???????????????!");
                            window.location.reload(true);
                        }
                    }
                });
            }
        </script>
    </body>
</html>
