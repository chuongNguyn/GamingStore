<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>RFT8</title>
        <!-- Favicon -->
        <link rel="icon" href="img/core-img/favicon.ico" />

        <!-- Stylesheet -->
        <link rel="stylesheet" href="style.css" />

        <!-- Aplayer -->
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/aplayer/1.10.1/APlayer.min.css"
            />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/aplayer/1.10.1/APlayer.min.js"></script>
        <jsp:useBean id="dao" class="com.rft8.dao.DAO" scope="application"></jsp:useBean>
        </head>
        <body>
            <style>
                #aplayer {
                    position: fixed;
                    bottom: 0;
                    display:none;
                    left: 0;
                    width: 100%;
                    margin: 0;
                    box-shadow: 0 -2px 2px #dadada;
                    background-color: #fff;
                    transition: all ease 0.5s;
                }

            </style>

            <!-- ##### Header Area Start ##### -->
            <header class="header-area">
                <!-- Navbar Area -->
                <div class="oneMusic-main-menu">

                    <div class="classy-nav-container breakpoint-off">

                        <div class="container">

                            <!-- Menu -->
                            <nav class="classy-navbar justify-content-between" id="oneMusicNav">
                                <!-- Nav brand -->
                                <a href="home" class="nav-brand"
                                   ><img src="img/core-img/logo.png" alt="logo"
                                      /></a>

                                <!-- Navbar Toggler -->
                                <div class="classy-navbar-toggler">
                                    <span class="navbarToggler"
                                          ><span></span><span></span><span></span
                                        ></span>
                                </div>

                                <!-- Menu -->
                                <div class="classy-menu">
                                    <!-- Close Button -->
                                    <div class="classycloseIcon">
                                        <div class="cross-wrap">
                                            <span class="top"></span><span class="bottom"></span>
                                        </div>
                                    </div>

                                    <!-- Nav Start -->
                                    <div class="classynav">
                                        <ul>
                                            <li><a href="home">Home</a></li>
                                            <li><a href="albumstore.jsp">Albums</a></li>     
                                            <li><a href="trackstore.jsp">Tracks</a></li>
                                            <c:if test="${sessionScope.user!=null}">
                                            <li><a href="favorite.jsp">Favorites</a></li>
                                            </c:if>
                                            <c:if test="${sessionScope.user.isAdmin()}">
                                            <li><a href="admin/navigation.jsp">Admin</a></li>
                                            </c:if>
                                    </ul>

                                    <!-- Login/Register & Cart Button -->
                                    <div
                                        class="login-register-cart-button d-flex align-items-center"
                                        >
                                        <!-- Login/Register -->
                                        <c:if test="${sessionScope.user!=null}">
                                            <div class="login-register-btn mr-50">
                                                <a>${sessionScope.user.getUsername()}</a>                                            
                                            </div>
                                            <div class="login-register-btn mr-50">
                                                <a href="logout" id="loginBtn">Logout</a>
                                            </div>
                                        </c:if>

                                        <c:if test="${sessionScope.user==null}">
                                            <div class="login-register-btn mr-50">
                                                <a href="login.jsp" id="loginBtn">Login</a>
                                            </div>
                                            <div class="login-register-btn mr-50">
                                                <a href="register.jsp" id="loginBtn">Register</a>
                                            </div>
                                        </c:if>


                                        <!-- Cart Button -->
                                    </div>
                                </div>
                                <!-- Nav End -->
                            </div>
                        </nav>
                    </div>
                </div>
            </div>
            <div id="aplayer" class="test"></div>
        </header>
        <!-- ##### Header Area End ##### -->









        <!-- ##### All Javascript Script ##### -->
        <!-- jQuery-2.2.4 js -->
        <script src="js/jquery/jquery-2.2.4.min.js"></script>
        <!-- Popper js -->
        <script src="js/bootstrap/popper.min.js"></script>
        <!-- Bootstrap js -->
        <script src="js/bootstrap/bootstrap.min.js"></script>
        <!-- All Plugins js -->
        <script src="js/plugins/plugins.js"></script>
        <!-- Active js -->
        <script src="js/active.js"></script>
    </body>
</html>