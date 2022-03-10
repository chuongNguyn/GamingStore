
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
        
            <!-- ##### Header Area Start ##### -->
        <jsp:include page='header.jsp'></jsp:include>
            <!-- ##### Header Area End ##### -->
            <!-- ##### Breadcumb Area Start ##### -->
            <div class="breadcumb-area bg-img bg-overlay" style="background-image: url(img/core-img/bg-1.jpg);">
                <div class="bradcumbContent" >              
                    <h2 style="color:red ">Error!</h2>
                </div>

            </div>

            <!-- ##### Breadcumb Area End ##### --> 
            <div class="col-12 col-lg-12">

                <div id="content" class="weeks-top-area mb-100" style="margin-top:20px">


                    <h2 style="text-align:center">You don't have permission to access</h2>

            </div>

        </div>







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


