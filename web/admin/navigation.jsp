<%@page import="com.rft8.model.Album"%>
<%@page import="com.rft8.model.Genre"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.rft8.model.Artist"%>
<%@page import="com.rft8.dao.DAO"%>
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
        <title>RFT8 Admin</title>
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
    </head>

    <body>

        <%
            DAO dao = new DAO();
            ArrayList<Artist> allArtist = dao.getAllArtists();
            ArrayList<Genre> allGenres = dao.getAllGenres();
            ArrayList<Album> allAlbums = dao.getAllAlbums();
            session.setAttribute("allArtist", allArtist);
            session.setAttribute("allGenres", allGenres);
            session.setAttribute("allAlbums", allAlbums);
        %>
        <!-- wrapper -->
        <div class="wrapper">
            <!--sidebar-wrapper-->
            <div class="sidebar-wrapper" data-simplebar="true">
                <div class="sidebar-header">
                    <div class="">
                        <a href="../home">
                             <img src="../img/core-img/logo.png" class="logo-icon-2" style="
                             width: 70%" alt="logo" />
                        </a>
                       
                    </div>

                    <a href="javascript:;" class="toggle-btn ml-auto">
                        <i class="bx bx-menu"></i>
                    </a>
                </div>
                <!--navigation-->
                <ul class="metismenu" id="menu">
              
                    <li class="menu-label">Manage</li>
                    <li>
                        <a class="has-arrow" href="javascript:;">
                            <div class="parent-icon icon-color-1">
                                <i class="bx bx-comment-add"></i>
                            </div>
                            <div class="menu-title">Add</div>
                        </a>
                        <ul>
                            <li>
                                <a href="add-artist.jsp"
                                   ><i class="bx bx-right-arrow-alt"></i>Add Artist</a
                                >
                            </li>
                            <li>
                                <a href="add-genres.jsp"
                                   ><i class="bx bx-right-arrow-alt"></i>Add Genre</a
                                >
                            </li>
                            <li>
                                <a href="add-album.jsp"
                                   ><i class="bx bx-right-arrow-alt"></i>Add Album</a
                                >
                            </li>
                            <li>
                                <a href="add-track.jsp"
                                   ><i class="bx bx-right-arrow-alt"></i>Add Track</a
                                >
                            </li>

                        </ul>
                    </li>
                    <li>
                        <a class="has-arrow" href="javascript:;">
                            <div class="parent-icon icon-color-1">
                                <i class="bx bx-comment-edit"></i>
                            </div>
                            <div class="menu-title">Edit</div>
                        </a>
                        <ul>
                            <li>
                                <a href="edit-artist.jsp"
                                   ><i class="bx bx-right-arrow-alt"></i>Edit Artist</a
                                >
                            </li>
                            <li>
                                <a href="edit-genre.jsp"
                                   ><i class="bx bx-right-arrow-alt"></i>Edit Genre</a
                                >
                            </li>
                            <li>
                                <a href="edit-album.jsp"
                                   ><i class="bx bx-right-arrow-alt"></i>Edit Album</a
                                >
                            </li>   
                            <li>
                                <a href="edit-track.jsp"
                                   ><i class="bx bx-right-arrow-alt"></i>Edit Track</a
                                >
                            </li>

                        </ul>
                    </li>
                  
                    
             

                   
                </ul>
                <!--end navigation-->
            </div>
            <!--end sidebar-wrapper-->
            <!--header-->
            <header class="top-header">
                <nav class="navbar navbar-expand">
                    <div class="left-topbar d-flex align-items-center">
                        <a href="javascript:;" class="toggle-btn">
                            <i class="bx bx-menu"></i>
                        </a>
                    </div>
                    <div class="flex-grow-1 search-bar">
                        <div class="input-group">
                            <div class="input-group-append"></div>
                        </div>
                    </div>
                    <div class="right-topbar ml-auto">
                        <ul class="navbar-nav">
                            <li class="nav-item search-btn-mobile">
                                <a class="nav-link position-relative" href="javascript:;">
                                    <i class="bx bx-search vertical-align-middle"></i>
                                </a>
                            </li>

                            <li class="nav-item dropdown dropdown-user-profile">
                                <a
                                    class="nav-link dropdown-toggle dropdown-toggle-nocaret"
                                    href="javascript:;"
                                    data-toggle="dropdown"
                                    >
                                    <div class="media user-box align-items-center">
                                        <div class="media-body user-info">
                                            <p class="user-name mb-0">${sessionScope.user.getUsername()}</p>
                                            <p class="designattion mb-0">Admin</p>
                                        </div>

                                    </div>
                                </a>
                                <div class="dropdown-menu dropdown-menu-right">
                                    <a class="dropdown-item" href="javascript:;"
                                       ><i class="bx bx-user"></i><span>Profile</span></a
                                    >
                                    <a class="dropdown-item" href="javascript:;"
                                       ><i class="bx bx-cog"></i><span>Settings</span></a
                                    >
                                    <a class="dropdown-item" href="javascript:;"
                                       ><i class="bx bx-tachometer"></i><span>Dashboard</span></a
                                    >
                                    <a class="dropdown-item" href="javascript:;"
                                       ><i class="bx bx-wallet"></i><span>Earnings</span></a
                                    >
                                    <a class="dropdown-item" href="javascript:;"
                                       ><i class="bx bx-cloud-download"></i
                                        ><span>Downloads</span></a
                                    >
                                    <div class="dropdown-divider mb-0"></div>
                                    <a class="dropdown-item" href="javascript:;"
                                       ><i class="bx bx-power-off"></i><span>Logout</span></a
                                    >
                                </div>
                            </li>

                        </ul>
                    </div>
                </nav>
            </header>
            <!--end header-->

            <!--start overlay-->


            <!-- end footer -->
        </div>
        <!-- end wrapper -->
        <!--start switcher-->
        <div class="switcher-wrapper">
            <div class="switcher-btn"><i class="bx bx-cog bx-spin"></i></div>
            <div class="switcher-body">
                <h5 class="mb-0 text-uppercase">Theme Customizer</h5>
                <hr />
                <h6 class="mb-0">Theme Styles</h6>
                <hr />
                <div class="d-flex align-items-center justify-content-between">
                    <div class="custom-control custom-radio">
                        <input
                            type="radio"
                            id="darkmode"
                            name="customRadio"
                            class="custom-control-input"
                            />
                        <label class="custom-control-label" for="darkmode">Dark Mode</label>
                    </div>
                    <div class="custom-control custom-radio">
                        <input
                            type="radio"
                            id="lightmode"
                            name="customRadio"
                            checked
                            class="custom-control-input"
                            />
                        <label class="custom-control-label" for="lightmode"
                               >Light Mode</label
                        >
                    </div>
                </div>
                <hr />
                <div class="custom-control custom-switch">
                    <input
                        type="checkbox"
                        class="custom-control-input"
                        id="DarkSidebar"
                        />
                    <label class="custom-control-label" for="DarkSidebar"
                           >Dark Sidebar</label
                    >
                </div>
                <hr />
                <div class="custom-control custom-switch">
                    <input
                        type="checkbox"
                        class="custom-control-input"
                        id="ColorLessIcons"
                        />
                    <label class="custom-control-label" for="ColorLessIcons"
                           >Color Less Icons</label
                    >
                </div>
            </div>
        </div>
        <!--end switcher-->
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

