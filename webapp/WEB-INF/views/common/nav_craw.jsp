<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html lang="en" xmlns:th="http://www.w3.org/1999/xhtml">
<head>

</head>
<body>
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
                    <li class="nav-item"><a class="nav-link" href="/mainBoard">Board</a></li>
                    <li class="nav-item"><a class="nav-link active" href="/mainCraw">Craw</a></li>
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
</body>
</html>