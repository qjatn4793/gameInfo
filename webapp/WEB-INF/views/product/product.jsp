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
        <%--<div th:replace="/nav_product.jsp :: common-nav"></div>--%>
        <nav th:fragment="common-nav" class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="/">KShopping</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                        <li class="nav-item"><a class="nav-link" aria-current="page" href="/">Home</a></li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle active" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Shop</a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="/mainProduct">All Products</a></li>
                                <li><hr class="dropdown-divider" /></li>
                                <li><a class="dropdown-item" href="/popularProduct">Popular Items</a></li>
                                <!--<li><a class="dropdown-item" href="#!">New Arrivals</a></li>-->
                            </ul>
                        </li>
                        <!--<li class="nav-item"><a class="nav-link active" href="/mainProduct">Product</a></li>-->
                        <li class="nav-item"><a class="nav-link" href="/mainBoard">Board</a></li>
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
        <%--<div th:replace="/header_product.jsp :: common-header"></div>--%>
        <header th:fragment="common-header" class="bg-dark py-5 bg-product">
            <div class="container px-4 px-lg-5 my-5">
                <div class="text-center text-white">
                    <h1 class="display-4 fw-bolder">Product</h1>
                    <p class="lead fw-normal text-white-50 mb-0">With the product</p>
                </div>
            </div>
        </header>
        <!-- Section-->

        <section class="py-5">
            <div class="container px-4 px-lg-5 mt-5">
                <div class="card-header">
                    <i class="fas fa-table me-1"></i>
                    상품
                </div><br>
                <div class="dataTable-top">
                    <div class="dataTable-dropdown">
                        <label>
                            <select id="product-select" class="dataTable-selector">
                                <option value="4">4</option>
                                <option value="8" selected="">8</option>
                                <option value="12">12</option>
                                <option value="16">16</option>
                                <option value="20">20</option>
                            </select> entries per page
                        </label>
                    </div>
                    <div class="dataTable-search">
                        <input class="dataTable-input" placeholder="Search..." type="text">
                        <div class="dataTable-top">
                            <div class="dataTable-dropdown">
                                <label>
                                    <select id="productCategory" class="dataTable-selector">
                                        <option value="선택" selected="">선택</option>
                                        <option value="과일">과일</option>
                                        <option value="의류">의류</option>
                                        <option value="가구">가구</option>
                                        <option value="잡화">잡화</option>
                                        <option value="기타">기타</option>
                                    </select> 카테고리를 선택하세요
                                </label>
                            </div>
                        </div>
                        <button class="dataTable-input" id="searchBtn">검색</button>
                    </div>
                </div>
                <div class="main-product row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">

                </div>
                <div class="dataTable-bottom">
                    <!--<div class="dataTable-info">Showing 1 to 5 of 7 entries</div>-->
                    <div class="dataTable-info"></div>
                    <nav class="dataTable-pagination">
                        <ul class="dataTable-pagination-list">
                            <!--<li id="1" class="active"><a href="#" data-page="1">1</a></li>
                            <li id="2" class=""><a href="#" data-page="2">2</a></li>
                            <li id="3" class=""><a href="#" data-page="3">3</a></li>
                            <li id="4" class=""><a href="#" data-page="4">4</a></li>
                            <li class="pager"><a href="#" data-page="2">›</a></li>-->
                        </ul>
                    </nav>
                </div>
            </div>
        </section>
        <!-- Footer-->
        <footer th:replace="/footer.jsp :: common-footer" class="py-5 bg-dark"></footer>
        <!-- Core theme JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="/js/scripts.js"></script>
        <script src="/js/product.js"></script>
        <script>
            $(document).ready(function() {
                $(".dataTable-input").keyup(function (keyNum) { // 엔터키 입력 감지
                    if (keyNum.keyCode == 13) {
                        $("#searchBtn").click();
                    }
                });
            });
        </script>
    </body>
</html>
