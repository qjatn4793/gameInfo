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
