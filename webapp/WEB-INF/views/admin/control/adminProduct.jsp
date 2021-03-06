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
                        <h1 class="mt-4">?????? ??????</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
                            <li class="breadcrumb-item active">?????? ??????</li>
                        </ol>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                Products Control
                            </div>
                            <div class="card-body">
                                <table id="datatablesSimple">
                                    <thead>
                                    <tr>
                                        <th>?????? ??????</th>
                                        <th>?????? ??????</th>
                                        <th>????????????</th>
                                        <th>?????? ?????? 1</th>
                                        <th>?????? ?????? 2</th>
                                        <th>?????? ?????? 3</th>
                                        <th>????????? ???</th>
                                        <th>?????? ???</th>
                                        <th>?????????</th>
                                        <th>?????????</th>
                                    </tr>
                                    </thead>
                                    <tfoot>
                                    <tr>
                                        <th>?????? ??????</th>
                                        <th>?????? ??????</th>
                                        <th>????????????</th>
                                        <th>?????? ?????? 1</th>
                                        <th>?????? ?????? 2</th>
                                        <th>?????? ?????? 3</th>
                                        <th>????????? ???</th>
                                        <th>?????? ???</th>
                                        <th>?????????</th>
                                        <th>?????????</th>
                                    </tr>
                                    </tfoot>
                                    <tbody class="product">

                                    </tbody>
                                </table>
                                <br>
                                <button id="deletePopup" type="button" onclick="" class="badge bg-secondary text-decoration-none link-light btn_open" style="float:right;">?????? ??????</button>
                                <button id="updatePopup" type="button" onclick="" class="badge bg-secondary text-decoration-none link-light btn_open" style="float:right;">?????? ??????</button>
                                <button id="createPopup" type="button" onclick="" class="badge bg-secondary text-decoration-none link-light btn_open" style="float:right;">?????? ??????</button>
                            </div>
                            <form id="productCreate" style="width:30%; margin-left:auto" class="card">
                                <div id="createMenu" class="card-body">
                                    <p>?????? ??????</p>
                                    <input id="productName" name="productName" class="productName" type="text" placeholder="?????????"><br>
                                    <div class="dataTable-dropdown">
                                        <label>
                                            <select id="productCategory" class="dataTable-selector">
                                                <option value="??????" selected="">??????</option>
                                                <option value="??????">??????</option>
                                                <option value="??????">??????</option>
                                                <option value="??????">??????</option>
                                                <option value="??????">??????</option>
                                                <option value="??????">??????</option>
                                            </select> ???????????? ??????
                                        </label>
                                    </div><br>
                                    <input id="productImg" name="productImg" class="productImg" type="file" placeholder="?????? ??????" accept="image/png"><br>
                                    <label for="productImg"></label>
                                    <div style="margin: 20px 0;" class="selectImg"><img src="" /></div>
                                    <textarea id="productContents1" name="productContents1" class="productContents1" type="text" placeholder="?????? ?????? 1" maxlength="190" style="word-wrap: break-word;"></textarea><br>
                                    <textarea id="productContents2" name="productContents2" class="productContents2" type="text" placeholder="?????? ?????? 2" maxlength="190" style="word-wrap: break-word;"></textarea><br>
                                    <textarea id="productContents3" name="productContents3" class="productContents3" type="text" placeholder="?????? ?????? 3" maxlength="190" style="word-wrap: break-word;"></textarea><br>
                                    <button style="float:right;" class="exit2 badge bg-secondary text-decoration-none link-light">??????</button>
                                    <button style="float:right;" class="badge bg-secondary text-decoration-none link-light" onclick="productCreate()">??????</button>
                                </div>
                            </form>
                            <div id="productDelete" style="width:30%; margin-left:auto" class="card">
                                <div id="deleteMenu" class="card-body">
                                    <p>?????? ??????</p>
                                    <input id="productSeq" name="productSeq" class="productSeq" type="number" placeholder="?????? ??????"><br>
                                    <button style="float:right;" class="exit1 badge bg-secondary text-decoration-none link-light">??????</button>
                                    <button style="float:right;" class="badge bg-secondary text-decoration-none link-light" onclick="productDelete()">??????</button>
                                </div>
                            </div>
                            <div id="productUpdate" style="width:30%; margin-left:auto" class="card">
                                <div id="updateMenu" class="card-body">
                                    <p>?????? ??????</p>
                                    <input id="updateProductSeq" name="updateProductSeq" class="updateProductSeq" type="number" placeholder="?????? ??????"><br><br>
                                    <input name="productName" class="productName" type="text" placeholder="?????????"><br>
                                    <div class="dataTable-dropdown">
                                        <label>
                                            <select id="updateCategory" class="dataTable-selector">
                                                <option value="??????" selected="">??????</option>
                                                <option value="??????">??????</option>
                                                <option value="??????">??????</option>
                                                <option value="??????">??????</option>
                                                <option value="??????">??????</option>
                                                <option value="??????">??????</option>
                                            </select> ???????????? ??????
                                        </label>
                                    </div><br>
                                    <textarea name="productContents1" class="productContents1" type="text" placeholder="?????? ?????? 1" maxlength="190" style="word-wrap: break-word;"></textarea><br>
                                    <textarea name="productContents2" class="productContents2" type="text" placeholder="?????? ?????? 2" maxlength="190" style="word-wrap: break-word;"></textarea><br>
                                    <textarea name="productContents3" class="productContents3" type="text" placeholder="?????? ?????? 3" maxlength="190" style="word-wrap: break-word;"></textarea><br>
                                    <button style="float:right;" class="exit badge bg-secondary text-decoration-none link-light">??????</button>
                                    <button style="float:right;" class="badge bg-secondary text-decoration-none link-light" onclick="productUpdate()">??????</button>
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
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="/js/scripts.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="/js/datatables-simple-demo.js"></script>
        <!--<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>-->
        <script type="text/javascript" src="/js/jquery-3.6.0.js"></script>
        <script>
            $(document).ready(function() {

                $("#productDelete").fadeOut("fast");

                $("#deletePopup").click(function() {
                    $("#productDelete").fadeToggle();
                    $("#productCreate").fadeOut();
                    $("#productUpdate").fadeOut();

                    $("#productName").val("");
                    $("#productSeq").val("");
                    $("#productContents1").val("");
                    $("#productContents2").val("");
                    $("#productContents3").val("");
                    $("#productImg").val("");
                    $(".selectImg img").attr("src", "");
                });

                $(".exit1").click(function() {
                    $("#productDelete").fadeOut();
                    $("#productSeq").val("");
                });

                $("#productCreate").fadeOut("fast");

                $("#createPopup").click(function() {
                    $("#productCreate").fadeToggle();
                    $("#productDelete").fadeOut();
                    $("#productUpdate").fadeOut();

                    $("#productName").val("");
                    $("#productSeq").val("");
                    $("#productContents1").val("");
                    $("#productContents2").val("");
                    $("#productContents3").val("");
                    $("#productImg").val("");
                    $(".selectImg img").attr("src", "");
                });

                $("#productUpdate").fadeOut("fast");

                $(".exit2").click(function() {
                    $("#productCreate").fadeOut();
                    $("#productName").val("");
                    $("#productContents1").val("");
                    $("#productContents2").val("");
                    $("#productContents3").val("");
                    $("#productImg").val("");
                    $(".selectImg img").attr("src", "");
                });

                $(".exit").click(function() {
                    $("#productUpdate").fadeOut();
                    $("#updateMenu .productName").val("");
                    $("#updateMenu .productSeq").val("");
                    $("#updateMenu .productContents1").val("");
                    $("#updateMenu .productContents2").val("");
                    $("#updateMenu .productContents3").val("");
                });

                $("#updatePopup").click(function() {
                    $("#productUpdate").fadeToggle();
                    $("#productCreate").fadeOut();
                    $("#productDelete").fadeOut();

                    $("#updateMenu .productName").val("");
                    $("#updateMenu .productSeq").val("");
                    $("#updateMenu .productContents1").val("");
                    $("#updateMenu .productContents2").val("");
                    $("#updateMenu .productContents3").val("");
                });
            });

            $.ajax({
                type : "GET",
                url : "/admin/product",
                dataType : "JSON",
                async : false,
                error : function(){
                    alert('????????????!!');
                },
                success : function(data){
                    var str = "";

                    for(var i = 0; Object.keys(data).length > i; i++){

                        var productSeq = data[Object.keys(data)[i]].productSeq;
                        var productName = data[Object.keys(data)[i]].productName;
                        var productCategory = data[Object.keys(data)[i]].productCategory;
                        var productContents1 = data[Object.keys(data)[i]].productContents1;
                        var productContents2 = data[Object.keys(data)[i]].productContents2;
                        var productContents3 = data[Object.keys(data)[i]].productContents3;
                        var productLikes = data[Object.keys(data)[i]].productLikes;
                        var productViews = data[Object.keys(data)[i]].productViews;
                        var regDate = data[Object.keys(data)[i]].regDate;
                        var modDate = data[Object.keys(data)[i]].modDate;

                        str += "<tr>" +
                            "<td>" + productSeq + "</td>" +
                            "<td>" + productName + "</td>" +
                            "<td>" + productCategory + "</td>" +
                            "<td>" + productContents1 + "</td>" +
                            "<td>" + productContents2 + "</td>" +
                            "<td>" + productContents3 + "</td>" +
                            "<td>" + productLikes + "</td>" +
                            "<td>" + productViews + "</td>" +
                            "<td>" + regDate + "</td>" +
                            "<td>" + modDate + "</td>" +
                            "</tr>";

                        $("tbody.product").html(str);
                    }
                }
            });

            function productCreate(){
                var productName = $("#createMenu .productName").val();
                var productContents1 = $("#createMenu .productContents1").val();
                var productContents2 = $("#createMenu .productContents2").val();
                var productContents3 = $("#createMenu .productContents3").val();

                var productImg = $("#createMenu .productImg").val();
                var productCategory = $("#productCategory option:selected").val();

                if(productCategory == "??????"){
                    productCategory = "??????";
                    productCategory = productCategory.toString();
                }
                //?????? ????????? ????????? ????????? C:fakepath ??? ???????????? ?????? ????????? ?????? ????????? ?????? ????????? ????????? ????????? ??????
                //C:fakepath ??? C:uploadPath ??? ??????????????? ?????? ????????? ?????? ??????
                if (productImg != null || productImg != ""){ // ????????? ???????????? ?????? ?????? ????????? ????????? ?????????????????? ???
                    productImg = productImg.replace("fakepath", "uploadPath");

                    //alert(productImg);
                }

                if(productName == ""){
                    alert("????????? ?????? ????????? ??????????????????");
                }else {
                    var result = confirm(productName + " (???)??? ?????????????????????????");

                    if(result) {
                        $.ajax({
                            type : "POST",
                            url : "/admin/product",
                            dataType : "text",
                            enctype : "multipart/form-data",
                            async : false,
                            contentType: "application/json",
                            data: JSON.stringify({
                                "productName" : productName,
                                "productContents1" : productContents1,
                                "productContents2" : productContents2,
                                "productContents3" : productContents3,
                                "productImg" : productImg,
                                "productCategory" : productCategory
                            }),
                            error : function(){
                                alert('?????? ?????? ??????, ???????????? ?????? ????????? ?????????!');
                                location.reload();
                            },
                            success : function(data){
                                if(data == 1){
                                    alert('?????? ?????? ??????!!');
                                    window.location.reload(true);
                                }else {
                                    alert('?????? ?????? ??????, ???????????? ?????? ????????? ?????????!');
                                    window.location.reload(true);
                                }
                                location.reload();
                            }
                        });
                    }else {
                        alert('??????');
                    }
                }
            }

            function productDelete(){
                var productSeq = $("#deleteMenu .productSeq").val();

                var result2 = confirm(productSeq + "??? ????????? ????????? ?????????????????????????\n?????? ????????? ????????? ????????? ?????? ????????????.");

                if(result2){
                    $.ajax({
                        type : "DELETE",
                        url : "/admin/product",
                        dataType : "text",
                        async : false,
                        contentType: "application/json",
                        data: JSON.stringify({
                            "productSeq" : productSeq
                        }),
                        error : function(){
                            alert('?????? ?????? ??????, ???????????? ?????? ????????? ?????????!');
                            location.reload();
                        },
                        success : function(data){
                            if (data == 1){
                                alert('?????? ?????? ??????!!');
                                window.location.reload(true);
                            }else {
                                alert('?????? ?????? ??????, ???????????? ?????? ????????? ?????????!');
                                window.location.reload(true);
                            }
                            location.reload();
                        }
                    });
                }else {
                    alert('??????');
                }
            }

            function productUpdate(){
                var productName = $("#updateMenu .productName").val();
                var productSeq = $("#updateMenu .updateProductSeq").val();
                var productContents1 = $("#updateMenu .productContents1").val();
                var productContents2 = $("#updateMenu .productContents2").val();
                var productContents3 = $("#updateMenu .productContents3").val();
                var updateCategory = $("#updateCategory option:selected").val();

                if(updateCategory == "??????"){
                    updateCategory = "??????";
                }

                if(productName == "" && productName == null){
                    alert("????????? ?????? ????????? ??????????????????");
                }else if (productSeq == "" && productSeq == null){
                    alert("????????? ?????? ????????? ??????????????????");
                }else {
                    var result = confirm(productName + " (???)??? ?????????????????????????");

                    if(result) {
                        $.ajax({
                            type : "PUT",
                            url : "/admin/product",
                            dataType : "text",
                            async : false,
                            contentType: "application/json",
                            data: JSON.stringify({
                                "productName" : productName,
                                "productSeq" : productSeq,
                                "productCategory" : updateCategory,
                                "productContents1" : productContents1,
                                "productContents2" : productContents2,
                                "productContents3" : productContents3,

                            }),
                            error : function(){
                                alert('?????? ?????? ??????, ???????????? ?????? ????????? ?????????!');
                                location.reload();
                            },
                            success : function(data){
                                if(data == 1){
                                    alert('?????? ?????? ??????!!');
                                    window.location.reload(true);
                                }else {
                                    alert('?????? ?????? ??????, ???????????? ?????? ????????? ?????????!');
                                    window.location.reload(true);
                                }
                                location.reload();
                            }
                        });
                    }else {
                        alert('??????');
                    }
                }
            }


            $("#productImg").change(function(){
                if(this.files && this.files[0]) {
                    var reader = new FileReader;
                    reader.onload = function(data) {
                        $(".selectImg img").attr("src", data.target.result).width(500);
                    }
                    reader.readAsDataURL(this.files[0]);
                }
            });
        </script>
    </body>
</html>
