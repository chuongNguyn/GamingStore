<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8" />
        <meta
            name="viewport"
            content="width=device-width, initial-scale=1, shrink-to-fit=no"
            />
        <title>Edit genre form</title>
        <!--favicon-->
       <link rel="icon" href="../img/core-img/favicon.ico" type="image/png" />
        <!-- Vector CSS -->
        <link
            href="assets/plugins/vectormap/jquery-jvectormap-2.0.2.css"
            rel="stylesheet"
            />
        <!--plugins-->
        <link href="assets/plugins/simplebar/css/simplebar.css" rel="stylesheet" />
        <link
            href="assets/plugins/perfect-scrollbar/css/perfect-scrollbar.css"
            rel="stylesheet"
            />
        <link
            href="assets/plugins/metismenu/css/metisMenu.min.css"
            rel="stylesheet"
            />
        <!-- loader-->
        <link href="assets/css/pace.min.css" rel="stylesheet" />
        <script src="assets/js/pace.min.js"></script>
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="assets/css/bootstrap.min.css" />
        <!-- Icons CSS -->
        <link rel="stylesheet" href="assets/css/icons.css" />
        <!-- App CSS -->
        <link rel="stylesheet" href="assets/css/app.css" />
        <link rel="stylesheet" href="assets/css/dark-sidebar.css" />
        <link rel="stylesheet" href="assets/css/dark-theme.css" />
        <jsp:useBean id="dao" class="com.rft8.dao.DAO" scope="application"></jsp:useBean>
        </head>

        <body>
        <jsp:include page="navigation.jsp" />  
        <!--page-wrapper-->
        <div class="page-wrapper">
            <!--page-content-wrapper-->
            <div class="page-content-wrapper">
                <div class="page-content">
                    <!--breadcrumb-->
                    <div
                        class="page-breadcrumb d-none d-md-flex align-items-center mb-3"
                        >
                        <h2>Edit Genre</h2>

                    </div>
                    <!--end breadcrumb-->

                    <div class="card">
                        <div class="card-body">
                            <div>
                                <form action="../adminEditGenre" method="post" >
                                   
                                    <div class="form-group">
                                        <label>Id:</label>
                                        <input readonly  type="text" name="id" class="form-control" value="${sessionScope.editGenreId}"/>
                                    </div>
      
                                    <div class="form-group">
                                        <label>Name:</label>
                                        <input type="text" name="name" class="form-control" value="${dao.getGenreNameById(sessionScope.editGenreId)}"/>
                                    </div>
                                    <div class="form-group">
                                        <label>Description:</label>
                                        <input type="text" name="des" class="form-control" value="${dao.getGenreDesById(sessionScope.editGenreId)}" />
                                    </div>
                                 
                                    <p class="alert-danger" role="alert">
                                        ${sessionScope.editGenremess}
                                    </p>
                                    <button type="submit" class="btn btn-primary">Save</button>
                                </form>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
            <!--end page-content-wrapper-->
        </div>
        <!--end page-wrapper-->








        <!-- JavaScript -->
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script src="assets/js/jquery.min.js"></script>
        <script src="assets/js/popper.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>
        <!--plugins-->
        <script src="assets/plugins/simplebar/js/simplebar.min.js"></script>
        <script src="assets/plugins/metismenu/js/metisMenu.min.js"></script>
        <script src="assets/plugins/perfect-scrollbar/js/perfect-scrollbar.js"></script>
        <!-- Vector map JavaScript -->
        <script src="assets/plugins/vectormap/jquery-jvectormap-2.0.2.min.js"></script>
        <script src="assets/plugins/vectormap/jquery-jvectormap-world-mill-en.js"></script>
        <script src="assets/plugins/vectormap/jquery-jvectormap-in-mill.js"></script>
        <script src="assets/plugins/vectormap/jquery-jvectormap-us-aea-en.js"></script>
        <script src="assets/plugins/vectormap/jquery-jvectormap-uk-mill-en.js"></script>
        <script src="assets/plugins/vectormap/jquery-jvectormap-au-mill.js"></script>
        <script src="assets/plugins/apexcharts-bundle/js/apexcharts.min.js"></script>
        <script src="assets/js/index.js"></script>
        <!-- App JS -->
        <script src="assets/js/app.js"></script>
        <script>
            new PerfectScrollbar(".dashboard-social-list");
            new PerfectScrollbar(".dashboard-top-countries");
        </script>
    </body>
</html>

