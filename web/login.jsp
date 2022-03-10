
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
        <jsp:include page='header.jsp'></jsp:include>
            <!-- ##### Header Area End ##### -->
            <!-- ##### Breadcumb Area Start ##### -->
            <div class="breadcumb-area bg-img bg-overlay" style="background-image: url(img/core-img/bg-1.jpg);">
                <div class="bradcumbContent" >              
                    <h2>Login</h2>
                </div>

            </div>
            <!-- ##### Login Area Start ##### -->
            <section class="login-area section-padding-100">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-12 col-lg-8">
                            <div class="login-content">
                                <h3>Welcome to RFT8</h3>
                                <!-- Login Form -->
                                <div class="login-form">
                                    <form action="login" method="post">
                                        <div class="form-group">
                                            <label for="email">Email address</label>
                                            <input name="email"type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter E-mail">
                                            <small id="emailHelp" class="form-text text-muted"><i class="fa fa-lock mr-2"></i>We'll never share your email with anyone else.</small>
                                        </div>
                                        <div class="form-group">
                                            <label for="pass">Password</label>
                                            <input name="pass" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                                        </div>
                                        <p class="alert-danger" role="alert">
                                        ${mess}
                                    </p>
                                    <button type="submit" class="btn oneMusic-btn mt-30">Login</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- ##### Login Area End ##### -->







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


