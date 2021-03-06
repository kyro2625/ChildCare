<%-- 
    Document   : createService
    Created on : Jun 12, 2021, 5:15:57 PM
    Author     : HOANGKHOI
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page autoFlush="true" buffer="1094kb"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/homepage.css">
        <link rel="stylesheet" href="css/service/createService.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Niramit&display=swap" rel="stylesheet">

        <script src="https://cdn.tiny.cloud/1/2t4he0yxbmprjqhk0y813ygaxy9y5u0mjixyrmjobarrfcvj/tinymce/5/tinymce.min.js" referrerpolicy="origin"></script>
        <script>
            tinymce.init({
                selector: 'textarea#service-content',
                skin: 'bootstrap',
                plugins: 'lists, link, image, media',
                toolbar: 'h1 h2 bold italic strikethrough blockquote bullist numlist backcolor | link image media | removeformat help',
                menubar: false
            });
        </script>
        <script>
            tinymce.init({
                selector: 'textarea#service-content',
                menubar: false
            });
        </script>

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
        <title>D???ch v???</title>
    </head>
    <body>
        <jsp:include page="header.jsp" />
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

        <jsp:useBean id="specialty" class="web.models.tblSpecialty.SpecialtyDAO" scope="request"/>
        <div class="service-form-wrapper">         
            <h1>T???o m???i d???ch v???</h1>
            <form action="DispatchServlet" method="post" enctype="multipart/form-data" class="col-md-6">      
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="service-title">Ti??u ?????</label>
                        <input type="text" class="form-control" id="service-title" name="txtTitle" value="${param.txtTitle}">              
                        <c:if test="${not empty requestScope.CREATE_SERVICE_ERROR.titleLengthError}">
                            <div class="text-danger">
                                <small>${requestScope.CREATE_SERVICE_ERROR.titleLengthError}</small>
                            </div>
                        </c:if>
                    </div>

                    <div class="form-group col-md-6">
                        <label for="service-specialty">Chuy??n khoa</label>
                        <select id="service-specialty" class="form-control" name="cboSpecialty">
                            <c:forEach items="${specialty.viewSpecialtyList()}" var="dto">
                                <option value="${dto.specialtyId}">${dto.specialtyName}</option>
                            </c:forEach>                
                        </select>
                    </div>
                </div>

                <div class="form-group">
                    <label for="service-content">N???i d???ng</label>
                    <textarea id="service-content" name="txtServiceContent">${param.txtServiceContent}</textarea>
                    <c:if test="${not empty requestScope.CREATE_SERVICE_ERROR.descriptionLengthError}">
                        <div class="text-danger">
                            <small>${requestScope.CREATE_SERVICE_ERROR.descriptionLengthError}</small>
                        </div>
                    </c:if>
                </div>

                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="service-price">Nh???p gi?? ti???n</label>
                        <input type="text" id="service-price" class="form-control" value="${param.txtPrice}" name="txtPrice"/>
                        <c:if test="${not empty requestScope.CREATE_SERVICE_ERROR.priceFormat}">
                            <div class="text-danger">
                                <small>${requestScope.CREATE_SERVICE_ERROR.priceFormat}</small>
                            </div>
                        </c:if>
                    </div>
                    <div class="form-group col-md-6">
                        <label for="service-image">???nh n???n</label>
                        <input type="file" class="form-control" id="service-image" name="fImage">
                        <c:if test="${not empty requestScope.CREATE_SERVICE_ERROR.imageError}">
                            <div class="text-danger">
                                <small>${requestScope.CREATE_SERVICE_ERROR.imageError}</small>
                            </div>
                        </c:if>
                    </div>
                </div>

                <div class="text-center">
                    <button type="submit" class="btn btn-primary col-6 col-md-4" name="btAction" value="CreateService">T???o m???i</button>
                </div>

            </form>
        </div>

        <jsp:include page="footer.jsp"/>
        <script>
            window.addEventListener('load', function () {
                const loader = document.querySelector(".loader");
                loader.className += " hidden"; // class "loader hidden"
            });
        </script>

    </body>
</html>
