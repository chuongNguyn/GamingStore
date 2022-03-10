
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
                    <h2>${dao.getAlbumNameById(albumId)}</h2>
            </div>

        </div>
        <!-- ##### Breadcumb Area End ##### -->

        <div class="container">    
            <div class="row">
              <div class="col-12 col-lg-4">
                        <div class="weeks-top-area mb-100"style="margin-top: 50px;">
                            <div
                                class="section-heading text-left mb-50 wow fadeInUp"
                                data-wow-delay="50ms"
                                >
                                <h2>Information</h2>
                             
                            </div>     
                                <div
                                    class="single-top-item d-flex wow fadeInUp"
                                    data-wow-delay="100ms"
                                    >  
                                    <div class="content-">
                                        <h6>Name: ${dao.getAlbumNameById(albumId)}</h6>
                                        <br>
                                        <h6>Artist: ${dao.getArtistNameById(dao.getAlbumArtistIdIdById(albumId))}</h6> 
                                        <br>
                                        <h6>Release Year: ${dao.getAlbumReleaseById(albumId)}</h6>
                                        <br>
                                        <h6>Genre: ${dao.getGenreNameById(dao.getAlbumGenreIdById(albumId))}</h6>
                                    </div>
                                </div> 
                        </div>
                    </div>
                <div class="col-12 col-lg-4">


                    <div class="card" style="width: 20rem;     margin-top: 50px;">
                        <img class="card-img-top" src="img/album-img/${dao.getAlbumPicById(albumId)}" alt="${dao.getAlbumPicById(albumId)}">
                        <div class="card-body">
                            <h5 class="card-text" style="text-align: center;margin-bottom: 20px;">${dao.getArtistDesById(artistId)}</h5>

                            <div class="row" style="justify-content: space-around;" >

                                <div class="col-sm-4 col-md-offset-2  col-sm-offset-2 col-lg-offset-2   col-lg-4 col-md-4 col-sm-4 col-xs-12" style="text-align:center;">
                                    <button type="button" class="btn btn-dark btn-block" onclick="display()">Play</button>
                                </div>

                                <c:url var="unlike" value="unlikeOnPageAlbum">
                                    <c:param name="userId" value="${sessionScope.user.id}" ></c:param>
                                    <c:param name="albumId" value="${albumId}" ></c:param>
                                </c:url>
                                <c:url var="like" value="likeOnPageAlbum">
                                    <c:param name="userId" value="${sessionScope.user.id}" ></c:param>
                                    <c:param name="albumId" value="${albumId}" ></c:param>
                                </c:url>

                                <c:if  test="${sessionScope.user!=null}">      
                                    <c:if test="${dao.checkFavoriteAlbumIdExist(sessionScope.user.id, albumId)}">
                                        <a href="${unlike}">
                                            <div class="col-sm-4 col-lg-4 col-md-4 col-sm-4 col-xs-12"style="padding:0" >
                                                <button type="button" class="btn btn-danger ">Unlike</button>
                                            </div>
                                        </a>
                                    </c:if>
                                    <c:if test="${!dao.checkFavoriteAlbumIdExist(sessionScope.user.id, albumId)}">
                                        <a href="${like}">
                                            <div class="col-sm-4 col-lg-4 col-md-4 col-sm-4 col-xs-12" >
                                                <button type="button" class="btn btn-primary "style="padding-left:20px ;padding-right:20px">Like</button>
                                            </div>
                                        </a>
                                    </c:if>
                                </c:if>
                            </div>
                        </div>

                    </div>
                </div>
                <div class="col-12 col-lg-4">
                    <div class="new-hits-area mb-100"style="margin-top: 50px;">
                        <div
                            class="section-heading text-left mb-50 wow fadeInUp"
                            data-wow-delay="50ms"
                            >
                            <h2>Tracks</h2>
                            
                        </div>
                        <c:forEach items="${dao.getTracksByAlbumId(albumId)}" var="t">
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








        <script>
            function display() {
                document.getElementById("aplayer").style.display = "block",
                        console.log("hi");
            }

            const ap = new APlayer({
                container: document.getElementById("aplayer"),
                listFolded: true,
                audio: [
            <c:forEach items="${dao.getTracksByAlbumId(albumId)}" var="t">
                    {
                        name: "${t.getName()}",
                        artist: "${dao.getArtistNameById(t.getArtistId())}",
                        url: "audio/${t.getNameFile()}",
                        cover: "img/album-img/${dao.getAlbumPicById(albumId)}",

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


