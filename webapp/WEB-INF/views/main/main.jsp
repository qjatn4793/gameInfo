<%@ taglib prefix="th" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html lang="en">
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
    </head>
    <body>
        <!-- Navigation-->
        <%--<div th:replace="common/nav_main.jsp :: common-nav"></div>--%>
        <nav th:fragment="common-nav" class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="/">KShopping</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                        <li class="nav-item"><a class="nav-link active" href="/">Home</a></li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Shop</a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="/mainProduct">All Products</a></li>
                                <li><hr class="dropdown-divider" /></li>
                                <li><a class="dropdown-item" href="/popularProduct">Popular Items</a></li>
                                <!--<li><a class="dropdown-item" href="#!">New Arrivals</a></li>-->
                            </ul>
                        </li>
                        <!--<li class="nav-item"><a id="mainProduct" class="nav-link" href="/mainProduct">Product</a></li>-->
                        <li class="nav-item"><a class="nav-link" href="/mainBoard">Board</a></li>
                        <li class="nav-item"><a class="nav-link" href="/mainCraw">Craw</a></li>
                    </ul>
                    <form th:if="${session.loginCheck == 'success'}" class="d-flex">
                        <a class="btn btn-outline-white" href="/userMypage" type="submit">
                            <!--<i class="bi-cart-fill me-1"></i>-->
                            <i class="me-1"></i>
                            MyPage
                            <!--<span class="badge bg-dark text-white ms-1 rounded-pill">0</span>-->
                        </a>
                        <a class="btn btn-outline-white" onclick="userLogout()">
                            <i class="me-1">logout</i>
                        </a>
                    </form>
                    <form th:if="${session.loginCheck == null}" class="d-flex">
                        <a class="btn btn-outline-white" href="/userRegister">
                            <i class="me-1">register</i>
                        </a>
                        <a class="btn btn-outline-white" href="/login">
                            <i class="me-1">login</i>
                        </a>
                    </form>
                </div>
            </div>
        </nav>
        <!-- Page Content-->
        <section>
            <!--<div class="container px-4 px-lg-5">
                <div class="row gx-4 gx-lg-5">
                    <div class="col-lg-6">
                        <h1 class="mt-5">The Big Picture</h1>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Deserunt voluptates rerum eveniet sapiente repellat esse, doloremque quod recusandae deleniti nostrum assumenda vel beatae sed aut modi nesciunt porro quisquam voluptatem.</p>
                    </div>
                </div>
            </div>-->
            <div class="banner-container">
                <div class="banner">
                    <div data-index=1></div>
                    <div data-index=2></div>
                    <div data-index=3></div>
                    <div data-index=4></div>
                </div>
            </div>
            <!--<div class="list-button">
                <span class="list-button-item active"></span>
                <span class="list-button-item"></span>
                <span class="list-button-item"></span>
                <span class="list-button-item"></span>
            </div>-->
        </section>
        <%--<script src="/js/jquery-3.6.0.js"></script>--%>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="/js/scripts.js"></script>
        <script type="text/javascript">
            //???????????? ???????????? ??????
            let interval;
            let activeIndex = 1;

            $(document).ready(function(){
                interval = setInterval(changeActiveIndex,2500);
                $('.list-button-item').on('click',function(){
                    // list button??? ?????? ??????
                    const index = $(this).index();
                    activeIndex = index;
                    changeActiveIndex();
                    clearInterval(interval);
                    // animation ???????????? ?????? animation??? ?????? ????????????.
                    $('.banner').css('animation','none');
                    // animation ?????????
                    $('.banner').animate({marginLeft:`${-100*index}%`},1,function(){
                        //1?????? ?????? ??????(?????? ???????????? ???????????? animation??? ?????? ??????)??? ?????? ?????? animation??? ????????????.
                        setTimeout(function(){
                            $('.banner').css('animation',`animation${index+1} 10s infinite`)

                            interval = setInterval(changeActiveIndex,2500);
                        }, 2000)
                    })
                })
            });
            function changeActiveIndex(){
                if(activeIndex>3) {
                    activeIndex%=4;
                }
                changeActiveBtn();
                activeIndex+=1;
            }
            function changeActiveBtn(){
                $('.list-button-item').removeClass('active');
                $(`.list-button span:eq(${activeIndex})`).addClass('active');
            }
        </script>
    </body>
</html>
