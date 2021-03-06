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
<div th:replace="/nav_board.jsp :: common-nav"></div>
<!-- Header-->
<div th:replace="/header_board.jsp :: common-header"></div>
<!-- Page content-->
<div class="container mt-5">
    <div class="row">
        <div class="col-lg-8">
            <!-- Post content-->
            <article>
                <!-- Post header-->
                <header class="mb-4">
                    <!-- Post title-->
                    <h1 id="boardTitle" class="fw-bolder mb-1"></h1>
                    <!-- Post meta content-->
                    <div id="regDate" class="text-muted fst-italic mb-2"></div>

                    <!-- Post categories-->
                    <a id="boardWriter" class="badge bg-secondary text-decoration-none link-light" href="">작성자</a>
                    <p id="boardViews" class="badge bg-secondary text-decoration-none link-light" href="">Web Design</p>
                    <!--<a class="badge bg-secondary text-decoration-none link-light" href="#!">Freebies</a>-->
                </header>
                <!-- Preview image figure-->
                <!--<figure class="mb-4"><img id="productImg" style="width:900px; height:400px;" class="img-fluid rounded" src="" alt="..." /></figure> 게시판 사진 영역-->
                <!-- Post content-->
                <section class="mb-5">
                    <p id="boardContents" class="fs-5 mb-4"></p>
                    <a id="deleteBoard" href="javascript:deleteBoard()"type="button" class="badge bg-secondary text-decoration-none link-light" style="float:right; display: none;">게시글 삭제</a>
                    <a type="button" href="/mainBoard" class="badge bg-secondary text-decoration-none link-light" style="float:right;">목록 보기</a>
                    <h2 class="fw-bolder mb-4 mt-5">댓글</h2>
                    <p class="fs-5 mb-4">로그인 후 댓글을 남겨 작성자와 소통해 보세요!</p>
                    <p class="fs-5 mb-4">다른 사람들이 자신의 의견을 공감할 수 있습니다.</p>
                </section>
            </article>
            <!-- Comments section-->
            <section class="mb-5">
                <div class="card bg-light">
                    <form class="mb-4"><textarea id="replyContents" class="form-control" rows="3" placeholder="댓글 내용을 입력해 주세요!" maxlength="80"></textarea>
                        <button type="button" onclick="createReply()" class="badge bg-secondary text-decoration-none link-light" style="float:right;">댓글 작성</button>
                    </form>
                    <div id = "boardReply" class="card-body">
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
                                <li><a href="#!">Web Design</a></li>
                                <li><a href="#!">HTML</a></li>
                                <li><a href="#!">Freebies</a></li>
                            </ul>
                        </div>
                        <div class="col-sm-6">
                            <ul class="list-unstyled mb-0">
                                <li><a href="#!">JavaScript</a></li>
                                <li><a href="#!">CSS</a></li>
                                <li><a href="#!">Tutorials</a></li>
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
<script src="/js/board.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
<script type="text/javascript" th:inline="javascript">
    var pathname = $(location).attr('pathname');
    var boardSeq = pathname.split("/");


    $(document).ready(function() {

        $.ajax({
            type: "GET",
            url: "/board/" + boardSeq[2],
            dataType: "JSON",
            async: false,
            error: function () {
                alert('통신실패!!');
            },
            success: function (data) {
                var boardTitle = data.boardTitle;
                var boardWriter = data.boardWriter;
                var boardLikes = data.boardLikes;
                var boardViews = data.boardViews;
                var boardContents = data.boardContents;
                var regDate = data.regDate;

                $("#boardTitle").text(boardTitle);
                $("#boardWriter").text("작성자 : " + boardWriter);
                $("#regDate").text("작성 시간 : " + regDate);
                $("#boardViews").text("조회 수 : " + boardViews);
                $("#boardContents").text(boardContents);

                var rBoardWriter = boardWriter.replace("작성자 : ", "");

                if(rBoardWriter == sessionStorage.getItem("userId")){
                    $("#deleteBoard").show();
                }else{
                    $("#deleteBoard").hide();
                }
            }
        });

        var str = "";

        $.ajax({
            type: "GET",
            url: "/boardReply/" + boardSeq[2],
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

                    $("#boardReply").html(str);
                }
            }
        });
    });



    function deleteBoard(){
        var boardWriter = $("#boardWriter").text();
        var rBoardWriter = boardWriter.replace("작성자 : ", "");

        $.ajax({
            type: "DELETE",
            url: "/board/" + boardSeq[2],
            dataType: "text",
            async: false,
            contentType: "application/json",
            data: JSON.stringify({
                "boardWriter" : rBoardWriter
            }),
            error: function () {
                alert("게시글 삭제를 실패 하였습니다!");
                sessionStorage.clear();
            },
            success: function (data) {
                if (data == 1){
                    alert("게시글을 삭제 하였습니다.");
                    location.replace("/mainBoard");
                }else{
                    alert("게시글 삭제를 실패 하였습니다.");
                    location.replace("/mainBoard");
                    sessionStorage.clear();
                }
            }
        });
    }

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
                url: "/boardReply/" + boardSeq[2],
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
                    } else{
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
            url: "/boardReply/" + boardSeq[2],
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
