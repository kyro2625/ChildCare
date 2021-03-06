<%--
    Document   : createBlog
    Created on : May 26, 2021, 9:50:33 AM
    Author     : DELL
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page autoFlush="true" buffer="1094kb"%>
<!doctype html>
<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Bootstrap CSS -->       
        <link rel="stylesheet" href="css/homepage.css">
        <link rel="stylesheet" href="./css/blog/createBlog.css" />
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Niramit&display=swap" rel="stylesheet">
        <script src="https://cdn.tiny.cloud/1/2t4he0yxbmprjqhk0y813ygaxy9y5u0mjixyrmjobarrfcvj/tinymce/5/tinymce.min.js" referrerpolicy="origin"></script>
        <script>
            tinymce.init({
                selector: 'textarea#blog-content',
                skin: 'bootstrap',
                plugins: 'lists, link, image, media',
                toolbar: 'h1 h2 bold italic strikethrough blockquote bullist numlist backcolor | link image media | removeformat help',
                menubar: false
            });
        </script>
        <script>
            tinymce.init({
                selector: 'textarea#blog-content',
                menubar: false
            });
        </script>

        <title>Blog</title>
        <style>
            body {
                font-family: 'Niramit', sans-serif;
            }
            .loader {
                position: fixed;
                z-index: 99;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background: white;
                display: flex;
                justify-content: center;
                align-items: center;
            }

            .loader > img {
                width: 100px;
            }

            .loader.hidden {
                animation: fadeOut 1s;
                animation-fill-mode: forwards;
            }

            @keyframes fadeOut {
                100% {
                    opacity: 0;
                    visibility: hidden;
                }
            }
        </style>
    </head>

    <body>
        <jsp:include page="header.jsp"/>
        <div class="loader">
            <img src="images/loading.gif" alt="Loading..." />
        </div>
        <!-- Authorize -->
        <c:if test="${empty sessionScope.ROLE}">
            <c:set var="DID_LOGIN" scope="request" value="B???n c???n ????ng nh???p ????? th???c hi???n thao t??c n??y"/>
            <jsp:forward page="login.jsp"/>
        </c:if>

        <c:if test="${sessionScope.ROLE != 'staff' and sessionScope.ROLE != 'manager'}">
            <jsp:forward page="accessDenied.jsp"/>
        </c:if>
        <!-- -->


        <c:set var="err" value="${requestScope.CREATE_BLOG}"/>
        <jsp:useBean id="cate" class="web.models.tblBlogCategory.BlogCategoryDAO" scope="request"/>
        <div class="blog-wrapper">
            <h1 class="h2 mb-4">T???o b??i vi???t m???i</h1>
            <form action="DispatchServlet" method="post" enctype="multipart/form-data" class="col-md-6">
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="title">Ti??u ?????</label>
                        <input class="form-control" type="text" name="txtTitle" value="${param.txtTitle}" id="title"/>
                        <c:if test="${not empty err.titleLengthErr}">
                            <small class="text-danger">${err.titleLengthErr}</small>
                        </c:if>
                    </div>
                    <div class="form-group col-md-6">
                        <label for="category">Th??? lo???i</label>
                        <select class="form-control" name="category" id="category">
                            <c:forEach items="${cate.viewBlogCategory()}" var="dto">
                                <option value="${dto.categoryID}">${dto.categoryName}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>

                <div class="form-group">
                    <label for="content">N???i dung b??i vi???t</label>
                    <textarea class="form-control" id="blog-content" name="txtBody">${param.txtBody}</textarea>
                    <c:if test="${not empty err.descriptionErr}">
                        <small class="text-danger">${err.descriptionErr}</small>
                    </c:if>
                </div>
                <div class="form-group">
                    <label for="image">???nh n???n</label>
                    <input type="file" class="form-control" name="imageURL" id="image">
                    <c:if test="${not empty err.imgErr}">
                        <div class="text-danger">
                            <small>${err.imgErr}</small>
                        </div>
                    </c:if>
                </div>
                <div class="text-center">                
                    <button class="btn btn-primary col-6 col-md-3" type="submit" name="btAction" value="CreateBlog" >T???o b??i vi???t</button>
                    <a class="btn btn-secondary col-6 col-md-3" onclick="return cancelConfirm()" href="ViewBlogByAuthorServlet">H???y</a>
                </div>
            </form>
        </div>

        <jsp:include page="footer.jsp"/>

        <script src="./js/main.js"></script>
        <script>
            window.addEventListener('load', function () {
                const loader = document.querySelector(".loader");
                loader.className += " hidden"; // class "loader hidden"
            });
        </script>
    </body>
</html>
