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
<!-- Section-->
<section class="py-5">
    <div class="container px-4 px-lg-5 mt-5">
    <!--<div class="card mb-4">-->
        <div class="card-header">
            <i class="fas fa-table me-1"></i>
            게시판
        </div>
        <div id="layoutSidenav_content">
            <main>
                <div class="container-fluid px-4">
                    <div class="card-body">
                        <table id="datatablesSimple">
                            <thead>
                            <tr>
                                <th>게시글 번호</th>
                                <th>제목</th>
                                <th>내용</th>
                                <th>좋아요 수</th>
                                <th>조회수</th>
                                <th>작성자</th>
                                <th>생성일</th>
                            </tr>
                            </thead>
                            <tfoot>
                            <tr>
                                <th>게시글 번호</th>
                                <th>제목</th>
                                <th>내용</th>
                                <th>좋아요 수</th>
                                <th>조회수</th>
                                <th>작성자</th>
                                <th>생성일</th>
                            </tr>
                            </tfoot>
                            <tbody class="board">

                            </tbody>
                        </table>
                        <!--<a th:if="${session.loginCheck == 'success' && session.userId != null && session.userId != '' && session.userPw != null && session.userPw != ''}" href="/createBoard" class="badge bg-secondary text-decoration-none link-light" style="float:right;">글 작성</a>-->
                        <button onclick="createBoardView()" class="badge bg-secondary text-decoration-none link-light" style="float:right;">글 작성</button>
                    </div>
                </div>
            </main>
        </div>
    </div>
</section>
<!-- Footer-->
<footer th:replace="/footer.html :: common-footer" class="py-5 bg-dark"></footer>
<!-- Core theme JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="/js/scripts.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
<script src="/js/board.js"></script>
<script>
    function createBoardView(){
        if (sessionStorage.getItem("userId") != null) {
            location.replace("/createBoard");
        }else {
            alert("로그인 후 이용 가능합니다");
        }
    }

</script>
</body>
</html>