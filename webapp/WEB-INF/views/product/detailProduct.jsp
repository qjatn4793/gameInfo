<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html lang="en" xmlns:th="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>KShopping</title>
    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
    <!-- Bootstrap icons-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="/css/styles.css" rel="stylesheet" />

    <!--<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>-->
    <script type="text/javascript" src="/js/jquery-3.6.0.js"></script>
</head>
<body>
<!-- Navigation-->
<div th:replace="/nav_product.jsp :: common-nav"></div>
<!-- Header-->
<div th:replace="/header_product.jsp :: common-header"></div>
<!-- Page content-->
<div class="container mt-5">
    <div class="row">
        <div class="col-lg-8">
            <!-- Post content-->
            <article>
                <!-- Post header-->
                <header class="mb-4">
                    <!-- Post title-->
                    <h1 id="productName" class="fw-bolder mb-1"></h1>
                    <!-- Post meta content-->
                    <div id="regDate" class="text-muted fst-italic mb-2"></div>
                    <!-- Post categories-->
                    <p id="productViews" class="badge bg-secondary text-decoration-none link-light" href="#!">Web Design</p>
                    <a id="productCategory" class="badge bg-secondary text-decoration-none link-light" href="#!">Freebies</a>
                </header>
                <!-- Preview image figure-->
                <figure class="mb-4"><img id="productImg" style="width:900px; height:400px;" class="img-fluid rounded" src="https://dummyimage.com/900x400/ced4da/6c757d.jpg" alt="..." /></figure>
                <!-- Post content-->
                <section class="mb-5">
                    <p id="productContents1" class="fs-5 mb-4">Science is an enterprise that should be cherished as an activity of the free human mind. Because it transforms who we are, how we live, and it gives us an understanding of our place in the universe.</p>
                    <p id="productContents2" class="fs-5 mb-4">The universe is large and old, and the ingredients for life as we know it are everywhere, so there's no reason to think that Earth would be unique in that regard. Whether of not the life became intelligent is a different question, and we'll see if we find that.</p>
                    <p id="productContents3" class="fs-5 mb-4">If you get asteroids about a kilometer in size, those are large enough and carry enough energy into our system to disrupt transportation, communication, the food chains, and that can be a really bad day on Earth.</p>
                    <a type="button" href="/mainProduct" class="badge bg-secondary text-decoration-none link-light" style="float:right;">목록 보기</a>
                    <h2 class="fw-bolder mb-4 mt-5">상품 후기</h2>
                    <p class="fs-5 mb-4">상품 후기를 남겨 다른 사람들에게 공유해 주세요</p>
                </section>
            </article>
            <!-- Comments section-->
            <section class="mb-5">
                <div class="card bg-light">
                    <form class="mb-4"><textarea id="replyContents" class="form-control" rows="3" placeholder="댓글 내용을 입력해 주세요!" maxlength="80"></textarea>
                        <button type="button" onclick="createReply()" class="badge bg-secondary text-decoration-none link-light" style="float:right;">댓글 작성</button>
                    </form>
                    <div id = "productReply" class="card-body">
                        <!-- 댓글-->
                    </div>
                </div>
            </section>
        </div>
        <!-- Side widgets-->
        <div class="col-lg-4">
            <!-- Search widget-->
            <div class="card mb-4">
                <div class="card-header">Search</div>
                <div class="card-body">
                    <div class="input-group">
                        <input class="form-control" type="text" placeholder="Enter search term..." aria-label="Enter search term..." aria-describedby="button-search" />
                        <button class="btn btn-primary" id="button-search" type="button">Go!</button>
                    </div>
                </div>
            </div>
            <!-- Categories widget-->
            <div class="card mb-4">
                <div class="card-header">Categories</div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-sm-6">
                            <ul class="list-unstyled mb-0">
                                <li><a href="/mainProduct">전체</a></li>
                                <li><a id ="search" href="/mainProduct">과일</a></li>
                                <li><a id ="search2" href="/mainProduct">의류</a></li>
                            </ul>
                        </div>
                        <div class="col-sm-6">
                            <ul class="list-unstyled mb-0">
                                <li><a id ="search3" href="/mainProduct">가구</a></li>
                                <li><a id ="search4" href="/mainProduct">잡화</a></li>
                                <li><a id ="search5" href="/mainProduct">기타</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Side widget-->
            <div class="card mb-4">
                <div class="card-header">Side Widget</div>
                <div class="card-body">You can put anything you want inside of these side widgets. They are easy to use, and feature the Bootstrap 5 card component!</div>
            </div>
        </div>
    </div>
</div>
<!-- Footer-->
<footer th:replace="/footer.jsp :: common-footer" class="py-5 bg-dark"></footer>
<!-- Core theme JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="/js/scripts.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
<script src="/js/datatables-simple-demo.js"></script>
<script>
    var pathname = $(location).attr('pathname');
    var productSeq = pathname.split("/");

    $(document).ready(function() {

        $.ajax({
            type: "GET",
            url: "/product/" + productSeq[2],
            dataType: "JSON",
            async: false,
            error: function () {
                alert('통신실패!!');
            },
            success: function (data) {
                let productSeq = data.productSeq;
                let productName = data.productName;
                let productLikes = data.productLikes;
                let productViews = data.productViews;
                let productContents1 = data.productContents1;
                let productContents2 = data.productContents2;
                let productContents3 = data.productContents3;
                let regDate = data.regDate;
                let modDate = data.modDate;
                let productImg = data.productImg;
                let productCategory = data.productCategory;

                if(productCategory == null){
                    productCategory = "";
                }

                $("#productName").text(productName);
                $("#regDate").text("작성 시간 : " + regDate);
                $("#productViews").text("조회 수 : " + productViews);
                $("#productContents1").text(productContents1);
                $("#productContents2").text(productContents2);
                $("#productContents3").text(productContents3);
                $("#productCategory").text(productCategory);

                if (productImg == "" || productImg == null){
                    productImg = "https://dummyimage.com/900x400/ced4da/6c757d.jpg";
                }else {
                    productImg = productImg.replace("\\", "/");
                    productImg = "/img" + productImg;
                }

                //alert(productImg);

                $("#productImg").attr("src", productImg);
            }
        });

        var str = "";

        $.ajax({
            type: "GET",
            url: "/productReply/" + productSeq[2],
            dataType: "JSON",
            async: false,
            error: function () {
                alert('통신실패!!');
            },
            success: function (data) {
                for (var i = 0; Object.keys(data).length > i; i++) {

                    var replySeq = data[Object.keys(data)[i]].replySeq;
                    var replyWriter = data[Object.keys(data)[i]].replyWriter;
                    var replyContents = data[Object.keys(data)[i]].replyContents;

                    var deleteBtnHide = "</div>";
                    var deleteBtnShow = "&nbsp;<a id='replySeq"+ replySeq +"' style='visibility: visible; float:right; display:block; height:22px;' href='javascript:deleteReply("+replySeq+")' type='button' class='badge bg-secondary text-decoration-none link-light'>X</a></div>";

                    str +=  "<div class='d-flex mb-4'>" +
                        "<div class='flex-shrink-0'><img class='rounded-circle' src='https://dummyimage.com/50x50/ced4da/6c757d.jpg' alt='...' /></div>" +
                        "<div class='ms-3'>" +
                        "<div id='replyWriter"+ replySeq +"' class='fw-bold'>작성자 : " + replyWriter +"</div>" +
                        "<p id='replyContents'>" + replyContents + "</p></div>";

                    if(replyWriter == sessionStorage.getItem("userId")){ // 세션 id 값과 글쓴이가 같으면 삭제 버튼 출력
                        str += deleteBtnShow;
                    }else {
                        str += deleteBtnHide;
                    }

                    $("#productReply").html(str);

                }
            }
        });
    });

    function createReply() {

        var replyContents = $("#replyContents").val();
        var replyWriter = sessionStorage.getItem("userId");


        // 특정 문자열 발견시 공백으로 치환
        replyContents = replyContents.replace(/\</g,'');
        replyContents = replyContents.replace(/\>/g,'');
        replyContents = replyContents.replace(/\#/g,'');
        replyContents = replyContents.replace(/\$/g,'');
        replyContents = replyContents.replace(/\@/g,'');
        replyContents = replyContents.replace(/\^/g,'');
        replyContents = replyContents.replace(/\&/g,'');
        replyContents = replyContents.replace(/\*/g,'');
        replyContents = replyContents.replace(/\(/g,'');
        replyContents = replyContents.replace(/\)/g,'');
        replyContents = replyContents.replace(/\;/g,'');


        /*if(replyContents != '' && replyContents != null) {*/
            $.ajax({
                type: "POST",
                url: "/productReply/" + productSeq[2],
                dataType: "JSON",
                async: false,
                contentType: "application/json",
                data: JSON.stringify({
                    "replyWriter": replyWriter,
                    "replyContents": replyContents
                }),
                error: function () {
                    alert('통신실패!!');
                    location.reload();
                },
                success: function (data) {
                    if (data == 1) {
                        alert("댓글이 작성되었습니다.");
                        location.reload();
                    } else if (data == 2) {
                        alert("로그인 후 이용해 주세요!");
                        /*location.replace("/login");*/
                    }else {
                        alert("통신실패");
                        location.reload();
                    }
                }
            });
        /*}else {
            alert("댓글 내용을 입력해 주세요");
        }*/
    }

    function deleteReply(replySeq){

        var rReplyWriter = $("#replyWriter" + replySeq).text();
        var replyWriter = rReplyWriter.replace("작성자 : ", "");

        $.ajax({
            type: "DELETE",
            url: "/productReply/" + productSeq[2],
            dataType: "text",
            async: false,
            contentType: "application/json",
            data: JSON.stringify({
                "replyWriter" : replyWriter,
                "replySeq" : replySeq
            }),
            error: function () {
                alert("댓글 삭제를 실패 하였습니다!");
                location.reload();
            },
            success: function (data) {
                if (data == 1){
                    alert("댓글을 삭제 하였습니다.");
                    location.reload();
                }else{
                    alert("댓글 삭제를 실패 하였습니다.");
                    location.reload();
                }
            }
        });
    }
</script>
</body>
</html>
