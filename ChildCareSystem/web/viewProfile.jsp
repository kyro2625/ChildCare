<%-- 
    Document   : viewProfile
    Created on : Jun 3, 2021, 9:57:49 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Niramit&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="css/homepage.css">
        <style>
            * {
                font-family: 'Niramit', sans-serif;
            }
            .wrapper {
                display: flex;
                flex-direction: column;
                align-items: center;
                padding: 4rem 0 6rem 0;

            }

            .wrapper form {
                width: 40%;

            }

            .wrapper h1 {
                margin-bottom: 20px;
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
        <title>Profile Page</title>
    </head>
    <body>
        <jsp:useBean id="specialty" class="web.models.tblSpecialty.SpecialtyDAO" scope="request"/>
        <jsp:include page="header.jsp"/>

        <c:set var="userProfileDTO" value="${sessionScope.USER_PROFILE}"/>
        <div class="wrapper px-5">
            <div class="loader">
                <img src="images/loading.gif" alt="Loading..." />
            </div>
            <h1>Th??ng tin t??i kho???n</h1>

            <form action="DispatchServlet?btAction=UpdateProfile" method="POST">
                <div class="form-row">
                    <label for="fullNanme">H??? v?? t??n</label>
                    <input type="text" name="fullName" class="form-control" value="${userProfileDTO.fullName}" required="true"></div>
                <div class="form-row">  
                    <label for="fullNanme">?????a ch???</label>
                    <input type="text" name="address" class="form-control" value="${userProfileDTO.address}" required="true"></div>

                <div class="form-row"> 
                    <div class="form-group col-md-6">
                        <label for="fullNanme">Ng??y sinh</label>
                        <input type="date" name="birthday" class="form-control" value="${userProfileDTO.birthday}" required="true">
                    </div>
                    <div class="form-group col-md-6"> 
                        <label for="fullNanme">CCCD</label>
                        <input type="text" name="citizenID" class="form-control" value="${userProfileDTO.citizenID}" readonly></div>
                </div>
                <div class="form-row"> 
                    <div class="form-group col-md-6">
                        <label for="fullNanme">S??? ??i???n tho???i</label>
                        <input type="text" name="phoneNum" class="form-control" value="${userProfileDTO.phoneNumber}" readonly>
                    </div>
                    <div class="form-group col-md-6">
                        <label for="fullNanme">Email</label>
                        <input type="text" name="email" class="form-control" value="${userProfileDTO.identityDTO.email}" readonly>
                    </div>
                </div>
                <c:if test="${userProfileDTO.specialtyID != null}">
                    <div class="form-row">  
                        <label for="fullNanme">Chuy??n khoa</label> <select name="specialtyID" class="form-control" required="true">
                            <option>-Chuy??n khoa-</option>
                            <c:forEach items="${specialty.viewSpecialtyList()}" var="dto">
                                <c:if test="${userProfileDTO.specialtyID eq dto.specialtyId}">
                                    <option value="${dto.specialtyId}" selected>${dto.specialtyName}</option>
                                </c:if>
                                <c:if test="${userProfileDTO.specialtyID != dto.specialtyId}">
                                    <option value="${dto.specialtyId}">${dto.specialtyName}</option>
                                </c:if>
                            </c:forEach>
                        </select>
                    </div>
                </c:if>
                <input type="hidden" name="identityID" value="${userProfileDTO.identityDTO.identityID}"> </br>
                <div class="text-center">
                    <button type="submit" class="btn btn-primary col-md-4">C???p nh???t</button>
                </div>
            </form>
            <c:if test="${requestScope.SUCCESS !=null}">
                <div class="alert alert-success"role="alert">
                    ${requestScope.SUCCESS}
                </div>
            </c:if>
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
