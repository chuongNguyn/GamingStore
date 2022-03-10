
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

            <!-- ##### Hero Area Start ##### -->
            <section class="hero-area">

                <div class="hero-slides owl-carousel">
                    <!-- Single Hero Slide -->
                    <div
                        class="
                        single-hero-slide
                        d-flex
                        align-items-center
                        justify-content-center
                        "
                        >
                        <!-- Slide Img -->
                        <div
                            class="slide-img bg-img"
                            style="background-image: url(img/core-img/bg-1.jpg)"
                            ></div>
                        <!-- Slide Content -->
                        <div class="container">

                            <div class="row">
                                <div class="col-12">
                                    <div class="hero-slides-content text-center">
                                        <h6 data-animation="fadeInUp" data-delay="100ms">RAP FAN</h6>
                                        <h2 data-animation="fadeInUp" data-delay="300ms">
                                            THÁNG 8 <span>THÁNG 8</span>
                                        </h2>
                                        <button
                                            data-animation="fadeInUp"
                                            data-delay="500ms"
                                            class="btn oneMusic-btn mt-50"
                                            onclick="display()"
                                            >Discover <i class="fa fa-angle-double-right"></i
                                            ></button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Single Hero Slide -->
                </div>
            </section>
            <!-- ##### Hero Area End ##### -->

            <!-- ##### ARTISTS Area Start ##### -->
            <section class="latest-albums-area section-padding-100">          
                <div class="container">

                    <div class="row">
                        <div class="col-12">
                            <div class="section-heading style-2">
                                <h2>ALL ARTISTS</h2>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-12">
                            <div class="albums-slideshow owl-carousel">

                            <c:forEach items="${listA}" var="a">

                                <div class="single-album">
                                    <a href="artist?aid=${a.getId()}">
                                        <img src="img/artist-img/${a.getPic()} " alt="${a.getName()}" />
                                    </a>



                                    <div class="album-info">
                                        <a href="#">
                                            <h5>${a.getName()}</h5>
                                        </a>
                                        <p>Artist</p>
                                    </div>
                                </div>


                            </c:forEach>


                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- ##### ARTISTS Area End ##### -->
        <hr />

        <!-- ##### Miscellaneous Area Start ##### -->
        <section class="miscellaneous-area section-padding-100-0">
            <div class="container">
                <div class="row">
                    <!-- ***** Weeks Top ***** -->
                    <div class="col-12 col-lg-6">
                        <div class="weeks-top-area mb-100">
                            <div
                                class="section-heading text-left mb-50 wow fadeInUp"
                                data-wow-delay="50ms"
                                >
                                <h2>NEW ALBUM</h2>
                            </div>

                            <c:forEach items="${listAlbum}" var="a">                   
                                <div
                                    class="single-top-item d-flex wow fadeInUp"
                                    data-wow-delay="100ms"
                                    >
                                    <div class="thumbnail">
                                        <a href="album?albumId=${a.getId()}">
                                            <img src="img/album-img/${a.getPic()}" alt="${a.getPic()}" />
                                        </a>

                                    </div>
                                    <div class="content-">
                                        <h6>${a.getName()}</h6>
                                        <p>${dao.getArtistNameById(a.getArtist())}</p>
                                        <c:url var="unlike" value="unlikeAlbumHome">
                                            <c:param name="userId" value="${sessionScope.user.id}" ></c:param>
                                            <c:param name="albumId" value="${a.id}" ></c:param>
                                        </c:url>
                                        <c:url var="like" value="likeAlbumHome">
                                            <c:param name="userId" value="${sessionScope.user.id}" ></c:param>
                                            <c:param name="albumId" value="${a.id}" ></c:param>
                                        </c:url>
                                        <c:if test="${sessionScope.user!=null}">
                                            <c:if test="${dao.checkFavoriteAlbumIdExist(sessionScope.user.id, a.id)}">
                                                <a href="${unlike}">
                                                    <div class="col-sm-4 col-lg-4 col-md-4 col-sm-4 col-xs-12"style="padding:0" >
                                                        <button type="button" class="btn btn-danger ">Unlike</button>
                                                    </div>
                                                </a>
                                            </c:if>
                                            <c:if test="${!dao.checkFavoriteAlbumIdExist(sessionScope.user.id, a.id)}">
                                                <a href="${like}">
                                                    <div class="col-sm-4 col-lg-4 col-md-4 col-sm-4 col-xs-12"style="padding:0" >
                                                        <button type="button" class="btn btn-primary ">Like</button>
                                                    </div>
                                                </a>
                                            </c:if>    
                                        </c:if>
                                    </div>
                                </div>
                            </c:forEach> 
                        </div>
                    </div>

                    <!-- ***** New Hits Songs ***** -->
                    <div class="col-12 col-lg-6">
                        <div class="new-hits-area mb-100">
                            <div
                                class="section-heading text-left mb-50 wow fadeInUp"
                                data-wow-delay="50ms"
                                >
                                <h2>New Track</h2>
                            </div>
                            <c:forEach items="${listT}" var="t">
                                <div
                                    class="
                                    single-new-item
                                    d-flex
                                    align-items-center
                                    justify-content-between
                                    wow
                                    fadeInUp
                                    "
                                    data-wow-delay="100ms"
                                    >
                                    <div class="first-part d-flex align-items-center">
                                        <div class="thumbnail">
                                            <img src="img/artist-img/${dao.getArtistPicById(t.getArtistId())}" alt="" />
                                        </div>
                                        <div class="content-">
                                            <h6>${t.getName()}</h6>
                                            <p>${dao.getArtistNameById(t.getArtistId())}</p>

                                            <c:url var="like" value="likeTrackHome">
                                                <c:param name="userId" value="${sessionScope.user.id}" ></c:param>
                                                <c:param name="trackId" value="${t.id}" ></c:param>
                                            </c:url>
                                            <c:url var="unlike" value="unlikeTrackHome">
                                                <c:param name="userId" value="${sessionScope.user.id}" ></c:param>
                                                <c:param name="trackId" value="${t.id}" ></c:param>
                                            </c:url>

                                            <c:if test="${sessionScope.user!=null}">
                                                <c:if test="${dao.checkFavoriteTrackIdExist(sessionScope.user.id, t.id)}">
                                                    <a href="${unlike}">
                                                        <div class="col-sm-4 col-lg-4 col-md-4 col-sm-4 col-xs-12"style="padding:0" >
                                                            <button type="button" class="btn btn-danger ">Unlike</button>
                                                        </div>
                                                    </a>
                                                </c:if>
                                                <c:if test="${!dao.checkFavoriteTrackIdExist(sessionScope.user.id, t.id)}">
                                                    <a href="${like}">
                                                        <div class="col-sm-4 col-lg-4 col-md-4 col-sm-4 col-xs-12"style="padding:0" >
                                                            <button type="button" class="btn btn-primary ">Like</button>
                                                        </div>
                                                    </a>
                                                </c:if>    
                                            </c:if>

                                        </div>
                                    </div>
                                    <audio preload="auto" controls>
                                        <source src="audio/${t.getNameFile()}" />
                                    </audio>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- ##### Miscellaneous Area End ##### -->


        <script>
            function display() {
                document.getElementById("aplayer").style.display = "block",
                        console.log("hi");
            }

            const ap = new APlayer({
                container: document.getElementById("aplayer"),
                listFolded: true,
                audio: [
            <c:forEach items="${dao.getAllTracks()}" var="t">
                    {
                        name: "${t.getName()}",
                        artist: "${dao.getArtistNameById(t.getArtistId())}",
                        url: "audio/${t.getNameFile()}",
                        cover: "img/artist-img/${dao.getArtistPicById(t.getArtistId())}",

                    },
            </c:forEach>


                ],
            });


        </script>




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
