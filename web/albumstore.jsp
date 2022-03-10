
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
                    <h2>Albums store</h2>
                </div>

            </div>

            <!-- ##### Breadcumb Area End ##### --> 
            <div class="col-12 col-lg-12">

                <div id="content" class="weeks-top-area mb-100" style="margin-top:20px">


                <c:forEach items="${dao.getAllAlbums()}" var="a">                   
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
                            <c:url var="unlike" value="unlikeAlbumstore">
                                <c:param name="userId" value="${sessionScope.user.id}" ></c:param>
                                <c:param name="albumId" value="${a.id}" ></c:param>
                            </c:url>
                            <c:url var="like" value="favoriteAlbum">
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



        <script>
            function display() {
                document.getElementById("aplayer").style.display = "block",
                        console.log("hi");
            }

            const ap = new APlayer({
                container: document.getElementById("aplayer"),
                listFolded: true,
                audio: [
            <c:forEach items="${dao.getTracksByArtistId(artistId)}" var="t">
                    {
                        name: "${t.getName()}",
                        artist: "${dao.getArtistNameById(artistId)}",
                        url: "audio/${t.getNameFile()}",
                        cover: "img/artist-img/${dao.getArtistPicById(artistId)}",

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


