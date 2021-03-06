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
                    <!-- Post meta content-->
                    <div id="regDate" class="text-muted fst-italic mb-2"></div>

                    <!-- Post categories-->
                    <a id="boardWriter" class="badge bg-secondary text-decoration-none link-light" href="">작성자</a>
                    <a id="boardViews" class="badge bg-secondary text-decoration-none link-light" href="">조회수</a>
                    <!--<a class="badge bg-secondary text-decoration-none link-light" href="#!">Freebies</a>-->
                </header>
                <!-- Preview image figure-->
                <!--<figure class="mb-4"><img id="productImg" style="width:900px; height:400px;" class="img-fluid rounded" src="" alt="..." /></figure> 게시판 사진 영역-->
                <!-- Post content-->
                <section class="mb-5">
                    <p class="fs-5 mb-4">
                        <textarea id="boardTitle" class="form-control" rows="3" placeholder="글 제목을 작성해 주세요."></textarea><br>
                        <textarea id="boardContents" class="form-control" rows="3" placeholder="글 내용을 작성해 주세요."></textarea><br>
                        <a type="button" onclick="createBoard()" class="badge bg-secondary text-decoration-none link-light" style="float:right;">글 작성</a>
                        <a type="button" href="/mainBoard" class="badge bg-secondary text-decoration-none link-light" style="float:right;">글 작성 취소</a>
                    </p>
                </section>
            </article>
            <!-- Comments section-->
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
<footer th:replace="/footer.html :: common-footer" class="py-5 bg-dark"></footer>
<!-- Core theme JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="/js/scripts.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
<script>
    function createBoard(){

        var boardTitle = $("#boardTitle").val();
        var boardContents = $("#boardContents").val();

        // 특정 문자열 발견시 공백으로 치환 : boardContents
        boardContents = boardContents.replace(/\</g,'');
        boardContents = boardContents.replace(/\>/g,'');
        boardContents = boardContents.replace(/\#/g,'');
        boardContents = boardContents.replace(/\$/g,'');
        boardContents = boardContents.replace(/\@/g,'');
        boardContents = boardContents.replace(/\^/g,'');
        boardContents = boardContents.replace(/\&/g,'');
        boardContents = boardContents.replace(/\*/g,'');
        boardContents = boardContents.replace(/\(/g,'');
        boardContents = boardContents.replace(/\)/g,'');
        boardContents = boardContents.replace(/\;/g,'');
        boardContents = boardContents.replace(/\=/g,'');
        boardContents = boardContents.replace(/\'/g,'');
        boardContents = boardContents.replace(/\"/g,'');

        if (boardContents == "" || boardContents == null || boardTitle == "" || boardTitle == null){
            alert("글 제목 또는 글 내용이 비어있습니다. 다시 한번 확인해 주세요");
        }else {

            var referrer = document.referrer;

            $.ajax({
                type : "POST",
                url : "/board",
                dataType : "text",
                contentType: "application/json",
                data: JSON.stringify({
                    "boardTitle" : boardTitle,
                    "boardContents" : boardContents
                    //"boardWriter" : boardWriter
                }),
                async : false,
                error : function(){
                    alert('글 작성을 실패하였습니다. 로그인 상태를 확인해주세요!');
                },
                success : function(data){
                    if(data == "1"){
                        if(referrer != ""){
                            alert("작성하신 글을 등록하였습니다.")
                            location.replace(referrer);
                        }else {
                            location.replace("/");
                        }
                    }else{
                        alert('글 작성을 실패하였습니다. 로그인 상태를 확인해주세요');
                    }
                }
            });
        }
    };
</script>
</body>
</html>
