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
<%--<div th:replace="/nav_board.jsp :: common-nav"></div>--%>
<nav th:fragment="common-nav" class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container px-4 px-lg-5">
        <a class="navbar-brand" href="/">KShopping</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                <li class="nav-item"><a class="nav-link" aria-current="page" href="/">Home</a></li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Shop</a>
                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="/mainProduct">All Products</a></li>
                        <li><hr class="dropdown-divider" /></li>
                        <li><a class="dropdown-item" href="/popularProduct">Popular Items</a></li>
                        <!--<li><a class="dropdown-item" href="#!">New Arrivals</a></li>-->
                    </ul>
                </li>
                <!--<li class="nav-item"><a class="nav-link" href="/mainProduct">Product</a></li>-->
                <li class="nav-item"><a class="nav-link active" href="/mainBoard">Board</a></li>
                <li class="nav-item"><a class="nav-link" href="/mainCraw">Craw</a></li>
            </ul>
            <form th:if="${session.loginCheck == 'success'}" class="d-flex">
                <a class="btn btn-outline-dark" href="/userMypage">
                    <i class="me-1"></i>
                    MyPage
                    <!--<span class="badge bg-dark text-white ms-1 rounded-pill">0</span>-->
                </a>
                <a class="btn btn-outline-dark" onclick="userLogout()">
                    <i class="me-1">logout</i>
                </a>
            </form>
            <form th:if="${session.loginCheck == null}" class="d-flex">
                <a class="btn btn-outline-dark" href="/userRegister">
                    <i class="me-1">register</i>
                </a>
                <a class="btn btn-outline-dark" href="/login">
                    <i class="me-1">login</i>
                </a>
            </form>
        </div>
    </div>
</nav>
<!-- Header-->
<%--<div th:replace="/header_board.jsp :: common-header"></div>--%>
<header th:fragment="common-header" class="bg-dark py-5 bg-board">
    <div class="container px-4 px-lg-5 my-5">
        <div class="text-center text-white">
            <h1 class="display-4 fw-bolder">Board</h1>
            <p class="lead fw-normal text-white-50 mb-0">With the board</p>
        </div>
    </div>
</header>
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
