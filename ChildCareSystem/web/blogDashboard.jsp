<%--
    Document   : dashboard
    Created on : Jul 1, 2021, 1:15:32 AM
    Author     : Admin
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page autoFlush="true" buffer="1094kb"%>
<!DOCTYPE html>
<html  lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <title>Thống kê bài viết - Blog Dashboard</title>
        <link rel="stylesheet" href="https://maxst.icons8.com/vue-static/landings/line-awesome/font-awesome-line-awesome/css/all.min.css">
        <link rel="stylesheet" href="https://maxst.icons8.com/vue-static/landings/line-awesome/line-awesome/1.3.0/css/line-awesome.min.css">
        <link rel="stylesheet" href="css\dashboard.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
              integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css"
              href="https://cdn.datatables.net/1.10.22/css/dataTables.bootstrap4.min.css" />

        <link rel="stylesheet" href="./viewAllAccounts.css">
        <script src="https://kit.fontawesome.com/9ba09bf17b.js" crossorigin="anonymous"></script>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Niramit&display=swap" rel="stylesheet">

        <style>
            body {
                font-family: 'Niramit', sans-serif;
            }

            #side-bar-icon {
                padding-left: 1rem;
                padding-right: 1rem;
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

    <div class="loader">
        <img src="images/loading.gif" alt="Loading..." />
    </div>
    <body style="font-family: 'Poppins', sans-serif; font-size: 0.75rem; font-weight: 200; ">
        <c:if test="${empty sessionScope.ROLE}">
            <c:set var="DID_LOGIN" scope="request" value="Bạn cần đăng nhập để thực hiện thao tác này"/>
            <jsp:forward page="login.jsp"/>
        </c:if>

        <c:if test="${sessionScope.ROLE eq 'customer'}">
            <jsp:forward page="accessDenied.jsp"/>
        </c:if>
        <input type="checkbox" id="nav-toggle">
        <div class="sidebar" style: background="#3287a8">
            <div class ="sidebar-brand">
                <a  href="StartupServlet" class="link-primary" style="color: white">
                    <h3><span class="lab la-accusoft"></span><span class="lmao" style="font-size: 1.5rem">Child Care System</span></h3>
                </a>
            </div>
            <div class ="sidebar-menu">
                <ul>
                    <c:if test="${sessionScope.ROLE eq 'manager' || sessionScope.ROLE eq 'admin'}">
                        <li style="padding-left:0.25rem">
                            <a href="thong-ke-tong-quat" class="btn btn-outline-light" style="border: none; border-radius: 30px 0px 0px 30px;text-align: left"><span id="side-bar-icon" class="fas fa-tv"></span>
                                <span >Tổng quát</span></a>
                        </li>
                    </c:if>
                    <c:if test="${sessionScope.ROLE eq 'manager' || sessionScope.ROLE eq 'admin'}">
                        <li style="padding-left:0.25rem">
                            <a href="thong-ke-tai-khoan"  class="btn btn-outline-light" style="border: none; border-radius: 30px 0px 0px 30px;text-align: left"><span id="side-bar-icon" class="fas fa-users"></span>
                                <span>Tài khoản </span></a>
                        </li>
                    </c:if>
<!--                    <li style="padding-left:0.25rem">
                        <c:if test="${sessionScope.ROLE eq 'manager'}">
                            <a href="ViewServiceByStaffServlet" class="btn btn-outline-light" style="border: none; border-radius: 30px 0px 0px 30px;text-align: left"><span id="side-bar-icon" class="fas fa-first-aid"></span>
                                <span>Dịch vụ của tôi</span></a>
                            </c:if>
                    </li>-->
                    <li style="padding-left:0.25rem">
                        <c:if test="${sessionScope.ROLE eq 'staff'}">
                            <a href="dich-vu-cua-ban" class="btn btn-outline-light" style="border: none; border-radius: 30px 0px 0px 30px;text-align: left"><span id="side-bar-icon" class="fas fa-first-aid"></span>
                                <span>Dịch vụ của tôi</span></a>
                            </c:if>
                            <c:if test="${sessionScope.ROLE eq 'manager' || sessionScope.ROLE eq 'admin'}">
                            <a href="ViewAllServiceListServlet" class="btn btn-outline-light" style="border: none; border-radius: 30px 0px 0px 30px;text-align: left"><span id="side-bar-icon" class="fas fa-first-aid"></span>
                                <span>Dịch vụ</span></a>
                            </c:if>
                    </li>
                    <li style="padding-left:0.25rem">
                        <c:if test="${sessionScope.ROLE eq 'staff'}">
                            <a href="bai-viet-cua-ban" class="active" class="btn btn-outline-light" style="border: none; border-radius: 30px 0px 0px 30px;text-align: left"><span id="side-bar-icon" class="fas fa-file-alt"></span>
                                <span>Bài viết của tôi</span></a>
                            </c:if>
                    </li>
                    <li style="padding-left:0.25rem">
                        <%--<c:if test="${sessionScope.ROLE eq 'staff'}">
                            <a href="ViewBlogByAuthorServlet" class="" class="btn btn-outline-light" style="border: none; border-radius: 30px 0px 0px 30px;text-align: left"><span id="side-bar-icon" class="fas fa-file-alt"></span>
                                <span>Bài viết của tôi</span></a>
                        </c:if>--%>
                        <c:if test="${sessionScope.ROLE eq 'manager' || sessionScope.ROLE eq 'admin'}">
                            <a href="ViewAllBlogListServlet" class="active" class="btn btn-outline-light" style="border: none; border-radius: 30px 0px 0px 30px;text-align: left"><span id="side-bar-icon" class="fas fa-file-alt"></span>
                                <span>Bài viết</span></a>
                            </c:if>
                    </li>
                    <li style="padding-left:0.25rem">
                        <c:if test="${sessionScope.ROLE eq 'manager' || sessionScope.ROLE eq 'admin'}">
                            <a href="thong-ke-Don-dat-kham" class="btn btn-outline-light" style="border: none; border-radius: 30px 0px 0px 30px;text-align: left"><span id="side-bar-icon" class="fas fa-notes-medical"></span>
                                <span>Đơn đặt khám</span></a>
                            </c:if>
                            <c:if test="${sessionScope.ROLE eq 'staff'}">
                            <a href="lich-kham-benh" class="btn btn-outline-light" style="border: none; border-radius: 30px 0px 0px 30px;text-align: left"><span id="side-bar-icon" class="fas fa-notes-medical"></span>
                                <span>Đơn đặt khám</span></a>
                            </c:if>
                    </li>
                    <c:if test="${sessionScope.ROLE eq 'manager' || sessionScope.ROLE eq 'admin'}">
                        <li style="padding-left:0.25rem">
                            <a href="thong-ke-phan-hoi" class="btn btn-outline-light" style="border: none; border-radius: 30px 0px 0px 30px;text-align: left"><span id="side-bar-icon" class="far fa-comments"></span>
                                <span>Phản hồi</span></a>
                        </li>
                    </c:if>
                    <c:if test="${sessionScope.ROLE eq 'admin'}">
                        <li style="padding-left:0.25rem">
                            <a href="cau-hinh-he-thong" class="btn btn-outline-light" style="border: none; border-radius: 30px 0px 0px 30px;text-align: left"><span id="side-bar-icon" class="fas fa-cogs"></span>
                                <span>Cấu hình hệ thống</span></a>
                        </li>
                    </c:if>
                </ul>
            </div>
        </div>
        <div class="main-content">
            <header>
                <h2>
                    <label for="nav-toggle">
                        <span class="las la-bars"></span>
                    </label>
                    Thống kê
                </h2>
            </header>
            <main>
                <div class="cards">
                    <div class="card-single">
                        <div>
                            <h1>${requestScope.ALL_BLOG}</h1>
                            <span>Bài đăng</span>
                        </div>
                        <div>
                            <span class="fas fa-file-alt"></span>
                        </div>
                    </div>
                    <div class="card-single">
                        <div>
                            <h1>${requestScope.ACTIVE_BLOG}</h1>
                            <span>Đang hiển thị</span>
                        </div>
                        <div>
                            <span class="fas fa-eye"></span>
                        </div>
                    </div>
                    <div class="card-single">
                        <div>
                            <h1>${requestScope.PENDING_BLOG}</h1>
                            <span>Đang chờ duyệt</span>
                        </div>
                        <div>
                            <span class="fas fa-spinner"></span>
                        </div>
                    </div>
                </div>
                <div class="recent-grid">
                    <div class="projects">
                        <div class="card">
                            <div class="card-header">
                                <nav>
                                    <div class="nav nav-tabs" id="nav-tab" role="tablist" style="font-size: large">
                                        <c:if test="${sessionScope.ROLE eq 'admin'}">
                                            <a class="nav-link active" id="nav-all-tab" data-toggle="tab" href="#nav-all" role="tab" aria-controls="nav-all" aria-selected="false">Tất cả bài viết</a>
                                        </c:if>
                                        <c:if test="${sessionScope.ROLE eq 'manager'}">
                                            <a class="nav-link" id="nav-all-tab" data-toggle="tab" href="#nav-all" role="tab" aria-controls="nav-all" aria-selected="false">Tất cả bài viết</a>
                                            <a class="nav-link active" id="nav-individual-tab" data-toggle="tab" href="#nav-individual" role="tab" aria-controls="nav-individual" aria-selected="true">Bài viết của tôi</a>
                                        </c:if>

                                    </div>
                                </nav>
                            </div>
                            <div class="card-body">
                                <div class="tab-content" id="nav-tabContent">
                                    <c:if test="${sessionScope.ROLE eq 'manager'}">

                                        <div class="tab-pane fade" id="nav-all" role="tabpanel" aria-labelledby="nav-all-tab">
                                        </c:if>
                                        <c:if test="${sessionScope.ROLE eq 'admin'}">
                                            <div class="tab-pane fade show active" id="nav-all" role="tabpanel" aria-labelledby="nav-all-tab">
                                            </c:if>
                                            <div class="card">
                                                <div class="card-header">
                                                    <h3>Danh sách bài viết</h3>
                                                </div>
                                                <div class="card-body">
                                                    <jsp:useBean id="identity" class="web.models.tblIdentity.IdentityDAO" scope="request"/>
                                                    <div class="userPosts__wrapper">
                                                        <div class="status-dropdown px-3 mb-4">
                                                            <button class="btn btn-primary dropdown-toggle selectButton" type="button" id="dropdownMenu2"
                                                                    data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                                Trạng thái
                                                            </button>
                                                            <div class="dropdown-menu" aria-labelledby="dropdownMenu2">
                                                                <div class="nav flex-column nav-pills navbar-expand-lg bg-white" id="v-pills-tab" role="tablist"
                                                                     aria-orientation="vertical">
                                                                    <a class="nav-link" id="v-pills-changeUsername-tab" data-toggle="pill" href="#all"
                                                                       role="tab" aria-controls="v-pills-changeUsername" aria-selected="true"
                                                                       onclick="toggleButton(this)">Tất cả</a>
                                                                    <a class="nav-link" id="v-pills-changePassword-tab" data-toggle="pill" href="#public"
                                                                       role="tab" aria-controls="v-pills-changePassword" aria-selected="false"
                                                                       onclick="toggleButton(this)">Chấp thuận</a>
                                                                    <a class="nav-link" id="v-pills-changePassword-tab" data-toggle="pill" href="#pending"
                                                                       role="tab" aria-controls="v-pills-changePassword" aria-selected="false"
                                                                       onclick="toggleButton(this)">Đang chờ</a>
                                                                    <a class="nav-link" id="v-pills-changePassword-tab" data-toggle="pill" href="#deny"
                                                                       role="tab" aria-controls="v-pills-changePassword" aria-selected="false"
                                                                       onclick="toggleButton(this)">Từ chối</a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-sm-12 table__wrapper bg-white">
                                                            <div class="tab-content" id="v-pills-tabContent">
                                                                <c:if test="${not empty requestScope.BLOG_LIST}">

                                                                    <!--All-->
                                                                    <div class="tab-pane fade show active bg-white" id="all" role="tabpanel"
                                                                         aria-labelledby="v-pills-changePassword-tab">
                                                                        <table class="table table-striped table-bordered mydatatable">
                                                                            <thead>
                                                                                <tr>
                                                                                    <th>No</th>
                                                                                    <th>ID</th>
                                                                                    <th>Tiêu đề</th>
                                                                                    <th>Tác giả</th>
                                                                                    <th>Trạng thái</th>
                                                                                    <th></th>
                                                                                    <th></th>
                                                                                </tr>
                                                                            </thead>
                                                                            <tbody id="tableBodyAccepted">
                                                                                <c:set var="count" value="0"/>
                                                                                <c:forEach items="${requestScope.BLOG_LIST}" var="dto">
                                                                                    <tr>
                                                                                        <c:if test="${dto.statusID eq 1}">
                                                                                            <c:set var="count" value="${count+1}"/>
                                                                                            <td>
                                                                                                ${count}
                                                                                            </td>
                                                                                            <td>${dto.blogID}</td>
                                                                                            <td>${dto.title}</td>
                                                                                            <td>
                                                                                                <c:set var="staffID" value="${dto.authorID}"/>
                                                                                                ${identity.getStaffOrManagerNameByIdentityId(staffID)}
                                                                                            </td>
                                                                                            <td class="alert alert-success">Chấp thuận</td>
                                                                                            <td>
                                                                                                <a href="chi-tiet-bai-viet?id=${dto.blogID}">Xem chi tiết</a>
                                                                                            </td>
                                                                                            <td>
                                                                                                <a class="btn btn-danger" onclick="return confirmation()" href="xoa-bai-viet?id=${dto.blogID}" role="button">Xóa</a>
                                                                                            </td>
                                                                                        </c:if>
                                                                                        <c:if test="${dto.statusID eq 0}">
                                                                                            <c:set var="count" value="${count+1}"/>
                                                                                            <td>
                                                                                                ${count}
                                                                                            </td>
                                                                                            <td>${dto.blogID}</td>
                                                                                            <td>${dto.title}</td>
                                                                                            <td>
                                                                                                <c:set var="staffID" value="${dto.authorID}"/>
                                                                                                ${identity.getStaffOrManagerNameByIdentityId(staffID)}
                                                                                            </td>
                                                                                            <td class="alert alert-warning">Đang chờ</td>
                                                                                            <td>
                                                                                                <a href="chi-tiet-bai-viet?id=${dto.blogID}">Xem chi tiết</a>
                                                                                            </td>
                                                                                            <td>
                                                                                                <a class="btn btn-danger" onclick="return confirmation()" href="xoa-bai-viet?id=${dto.blogID}" role="button">Xóa</a>
                                                                                            </td>
                                                                                        </c:if>
                                                                                        <c:if test="${dto.statusID eq 2}">
                                                                                            <c:set var="count" value="${count+1}"/>
                                                                                            <td>
                                                                                                ${count}
                                                                                            </td>
                                                                                            <td>${dto.blogID}</td>
                                                                                            <td>${dto.title}</td>
                                                                                            <td>
                                                                                                <c:set var="staffID" value="${dto.authorID}"/>
                                                                                                ${identity.getStaffOrManagerNameByIdentityId(staffID)}
                                                                                            </td>
                                                                                            <td class="alert alert-danger">Từ chối</td>
                                                                                            <td>
                                                                                                <a href="chi-tiet-bai-viet?id=${dto.blogID}">Xem chi tiết</a>
                                                                                            </td>
                                                                                            <td>
                                                                                                <a class="btn btn-danger" onclick="return confirmation()" href="xoa-bai-viet?id=${dto.blogID}" role="button">Xóa</a>
                                                                                            </td>
                                                                                        </c:if>
                                                                                    </tr>
                                                                                </c:forEach>
                                                                            </tbody>
                                                                        </table>
                                                                    </div>

                                                                    <!--Public-->
                                                                    <div class="tab-pane fade show bg-white" id="public" role="tabpanel"
                                                                         aria-labelledby="v-pills-changePassword-tab">
                                                                        <table class="table table-striped table-bordered mydatatable">
                                                                            <thead>
                                                                                <tr>
                                                                                    <th>No</th>
                                                                                    <th>ID</th>
                                                                                    <th>Tiêu đề</th>
                                                                                    <th>Tác giả</th>
                                                                                    <th>Trạng thái</th>
                                                                                        <c:if test="${sessionScope.ROLE eq 'manager'}">
                                                                                        <th>Hiện trên slider</th>
                                                                                        </c:if>
                                                                                    <th></th>
                                                                                    <th></th>

                                                                                </tr>
                                                                            </thead>

                                                                            <tbody id="tableBodyAccepted">
                                                                                <c:set var="count" value="0"/>
                                                                                <c:forEach items="${requestScope.BLOG_LIST}" var="dto" varStatus="counter">
                                                                                    <c:if test="${dto.statusID eq 1}">
                                                                                        <c:set var="count" value="${count+1}"/>
                                                                                        <tr>
                                                                                            <td>
                                                                                                ${count}
                                                                                            </td>
                                                                                            <td>${dto.blogID}</td>
                                                                                            <td>${dto.title}</td>
                                                                                            <td>
                                                                                                <c:set var="staffID" value="${dto.authorID}"/>
                                                                                                ${identity.getStaffOrManagerNameByIdentityId(staffID)}
                                                                                            </td>
                                                                                            <td class="alert alert-success">Chấp thuận</td>
                                                                                            <c:if test="${sessionScope.ROLE eq 'manager'}">
                                                                                                <td>
                                                                                                    <form action="DispatchServlet" method="post">
                                                                                                        <c:choose>
                                                                                                            <c:when test="${dto.onSlider}">
                                                                                                                <input type="checkbox" name="chkSlider" value="ON" checked />
                                                                                                            </c:when>
                                                                                                            <c:otherwise>
                                                                                                                <input type="checkbox" name="chkSlider" value="ON" />
                                                                                                            </c:otherwise>
                                                                                                        </c:choose>
                                                                                                        <input name="txtBlogId" value="${dto.blogID}" hidden />
                                                                                                        <button type="submit" class="btn btn-primary" name="btAction" value="UpdateSlider">Cập nhật</button>
                                                                                                    </form>
                                                                                                </td>
                                                                                            </c:if>

                                                                                            <td>
                                                                                                <a href="chi-tiet-bai-viet?id=${dto.blogID}">Xem chi tiết</a>
                                                                                            </td>
                                                                                            <td>
                                                                                                <a class="btn btn-danger" onclick="return confirmation()" href="xoa-bai-viet?id=${dto.blogID}" role="button">Xóa</a>
                                                                                            </td>
                                                                                        </tr>
                                                                                    </c:if>
                                                                                </c:forEach>
                                                                            </tbody>
                                                                        </table>

                                                                    </div>
                                                                    <!--Pending-->
                                                                    <div class="tab-pane fade show bg-white" id="pending" role="tabpanel"
                                                                         aria-labelledby="v-pills-changePassword-tab">
                                                                        <table class="table table-striped table-bordered mydatatable">
                                                                            <thead>
                                                                                <tr>
                                                                                    <th>No</th>
                                                                                    <th>ID</th>
                                                                                    <th>Tiêu đề</th>
                                                                                    <th>Tác giả</th>
                                                                                    <th>Trạng thái</th>
                                                                                    <th></th>
                                                                                    <th></th>
                                                                                </tr>
                                                                            </thead>

                                                                            <tbody id="tableBodyAccepted">
                                                                                <c:set var="count" value="0"/>
                                                                                <c:forEach items="${requestScope.BLOG_LIST}" var="dto" varStatus="counter">
                                                                                    <c:if test="${dto.statusID eq 0}">
                                                                                        <c:set var="count" value="${count+1}"/>
                                                                                        <tr>
                                                                                            <td>
                                                                                                ${count}
                                                                                            </td>
                                                                                            <td>${dto.blogID}</td>
                                                                                            <td>${dto.title}</td>
                                                                                            <td>
                                                                                                <c:set var="staffID" value="${dto.authorID}"/>
                                                                                                ${identity.getStaffOrManagerNameByIdentityId(staffID)}
                                                                                            </td>
                                                                                            <td class="alert alert-warning">Đang chờ</td>
                                                                                            <td>
                                                                                                <a href="chi-tiet-bai-viet?id=${dto.blogID}">Xem chi tiết</a>
                                                                                            </td>
                                                                                            <td>
                                                                                                <a class="btn btn-danger" onclick="return confirmation()" href="xoa-bai-viet?id=${dto.blogID}" role="button">Xóa</a>
                                                                                            </td>
                                                                                        </tr>
                                                                                    </c:if>
                                                                                </c:forEach>
                                                                            </tbody>
                                                                        </table>

                                                                    </div>
                                                                    <!--deny-->
                                                                    <div class="tab-pane fade show bg-white" id="deny" role="tabpanel"
                                                                         aria-labelledby="v-pills-changePassword-tab">

                                                                        <table class="table table-striped table-bordered mydatatable">
                                                                            <thead>
                                                                                <tr>
                                                                                    <th>No</th>
                                                                                    <th>ID</th>
                                                                                    <th>Tiêu đề</th>
                                                                                    <th>Tác giả</th>
                                                                                    <th>Trạng thái</th>
                                                                                    <th></th>
                                                                                    <th></th>
                                                                                </tr>
                                                                            </thead>

                                                                            <tbody id="tableBodyAccepted">
                                                                                <c:set var="count" value="0"/>
                                                                                <c:forEach items="${requestScope.BLOG_LIST}" var="dto" varStatus="counter">
                                                                                    <c:if test="${dto.statusID eq 2}">
                                                                                        <c:set var="count" value="${count+1}"/>
                                                                                        <tr>
                                                                                            <td>
                                                                                                ${count}
                                                                                            </td>
                                                                                            <td>${dto.blogID}</td>
                                                                                            <td>${dto.title}</td>
                                                                                            <td>
                                                                                                <c:set var="staffID" value="${dto.authorID}"/>
                                                                                                ${identity.getStaffOrManagerNameByIdentityId(staffID)}
                                                                                            </td>
                                                                                            <td class="alert alert-danger">Từ chối</td>
                                                                                            <td>
                                                                                                <a href="chi-tiet-bai-viet?id=${dto.blogID}">Xem chi tiết</a>
                                                                                            </td>
                                                                                            <td>
                                                                                                <a class="btn btn-danger" onclick="return confirmation()" href="xoa-bai-viet?id=${dto.blogID}" role="button">Xóa</a>
                                                                                            </td>
                                                                                        </tr>
                                                                                    </c:if>
                                                                                </c:forEach>
                                                                            </tbody>
                                                                        </table>
                                                                    </div>
                                                                </c:if>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                        </div>
                                        <c:if test="${sessionScope.ROLE eq 'manager'}">

                                            <div class="tab-pane fade show active" id="nav-individual" role="tabpanel" aria-labelledby="nav-individual-tab">

                                                <div class="card">
                                                    <div class="card-header">
                                                        <h3>Danh sách bài viết của tôi</h3>
                                                    </div>
                                                    <div class="card-body">
                                                        <jsp:useBean id="identity1" class="web.models.tblIdentity.IdentityDAO" scope="request"/>
                                                        <div class="userPosts__wrapper">
                                                            <div class="status-dropdown px-3 mb-4">
                                                                <button class="btn btn-primary dropdown-toggle selectButton" type="button" id="dropdownMenu2"
                                                                        data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                                    Trạng thái
                                                                </button>
                                                                <div class="dropdown-menu" aria-labelledby="dropdownMenu2">
                                                                    <div class="nav flex-column nav-pills navbar-expand-lg bg-white" id="v-pills-tab" role="tablist"
                                                                         aria-orientation="vertical">
                                                                        <a class="nav-link" id="v-pills-changeUsername-tab" data-toggle="pill" href="#all"
                                                                           role="tab" aria-controls="v-pills-changeUsername" aria-selected="true"
                                                                           onclick="toggleButton(this)">Tất cả</a>
                                                                        <a class="nav-link" id="v-pills-changePassword-tab" data-toggle="pill" href="#public"
                                                                           role="tab" aria-controls="v-pills-changePassword" aria-selected="false"
                                                                           onclick="toggleButton(this)">Chấp thuận</a>
                                                                        <a class="nav-link" id="v-pills-changePassword-tab" data-toggle="pill" href="#pending"
                                                                           role="tab" aria-controls="v-pills-changePassword" aria-selected="false"
                                                                           onclick="toggleButton(this)">Đang chờ</a>
                                                                        <a class="nav-link" id="v-pills-changePassword-tab" data-toggle="pill" href="#deny"
                                                                           role="tab" aria-controls="v-pills-changePassword" aria-selected="false"
                                                                           onclick="toggleButton(this)">Từ chối</a>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-sm-12 table__wrapper bg-white">
                                                                <div class="tab-content" id="v-pills-tabContent">
                                                                    <c:if test="${not empty requestScope.BLOG_LIST_MANAGER}">

                                                                        <!--All-->
                                                                        <div class="tab-pane fade show active bg-white" id="all" role="tabpanel"
                                                                             aria-labelledby="v-pills-changePassword-tab">
                                                                            <table class="table table-striped table-bordered mydatatable">
                                                                                <thead>
                                                                                    <tr>
                                                                                        <th>No</th>
                                                                                        <th>ID</th>
                                                                                        <th>Tiêu đề</th>
                                                                                        <th>Tác giả</th>
                                                                                        <th>Trạng thái</th>
                                                                                        <th></th>
                                                                                        <th></th>
                                                                                    </tr>
                                                                                </thead>
                                                                                <tbody id="tableBodyAccepted">
                                                                                    <c:set var="count" value="0"/>
                                                                                    <c:forEach items="${requestScope.BLOG_LIST_MANAGER}" var="dto">
                                                                                        <tr>
                                                                                            <c:if test="${dto.statusID eq 1}">
                                                                                                <c:set var="count" value="${count+1}"/>
                                                                                                <td>
                                                                                                    ${count}
                                                                                                </td>
                                                                                                <td>${dto.blogID}</td>
                                                                                                <td>${dto.title}</td>
                                                                                                <td>
                                                                                                    <c:set var="staffID" value="${dto.authorID}"/>
                                                                                                    ${identity1.getStaffOrManagerNameByIdentityId(staffID)}
                                                                                                </td>
                                                                                                <td class="alert alert-success">Chấp thuận</td>
                                                                                                <td>
                                                                                                    <a href="ViewBlogDetailServlet?id=${dto.blogID}">Xem chi tiết</a>
                                                                                                </td>
                                                                                                <td>
                                                                                                    <a class="btn btn-danger" onclick="return confirmation()" href="DeleteBlogServlet?id=${dto.blogID}" role="button">Xóa</a>
                                                                                                </td>
                                                                                            </c:if>
                                                                                            <c:if test="${dto.statusID eq 0}">
                                                                                                <c:set var="count" value="${count+1}"/>
                                                                                                <td>
                                                                                                    ${count}
                                                                                                </td>
                                                                                                <td>${dto.blogID}</td>
                                                                                                <td>${dto.title}</td>
                                                                                                <td>
                                                                                                    <c:set var="staffID" value="${dto.authorID}"/>
                                                                                                    ${identity1.getStaffOrManagerNameByIdentityId(staffID)}
                                                                                                </td>
                                                                                                <td class="alert alert-warning">Đang chờ</td>
                                                                                                <td>
                                                                                                    <a href="ViewBlogDetailServlet?id=${dto.blogID}">Xem chi tiết</a>
                                                                                                </td>
                                                                                                <td>
                                                                                                    <a class="btn btn-danger" onclick="return confirmation()" href="DeleteBlogServlet?id=${dto.blogID}" role="button">Xóa</a>
                                                                                                </td>
                                                                                            </c:if>
                                                                                            <c:if test="${dto.statusID eq 2}">
                                                                                                <c:set var="count" value="${count+1}"/>
                                                                                                <td>
                                                                                                    ${count}
                                                                                                </td>
                                                                                                <td>${dto.blogID}</td>
                                                                                                <td>${dto.title}</td>
                                                                                                <td>
                                                                                                    <c:set var="staffID" value="${dto.authorID}"/>
                                                                                                    ${identity1.getStaffOrManagerNameByIdentityId(staffID)}
                                                                                                </td>
                                                                                                <td class="alert alert-danger">Từ chối</td>
                                                                                                <td>
                                                                                                    <a href="ViewBlogDetailServlet?id=${dto.blogID}">Xem chi tiết</a>
                                                                                                </td>
                                                                                                <td>
                                                                                                    <a class="btn btn-danger" onclick="return confirmation()" href="DeleteBlogServlet?id=${dto.blogID}" role="button">Xóa</a>
                                                                                                </td>
                                                                                            </c:if>
                                                                                        </tr>
                                                                                    </c:forEach>
                                                                                </tbody>
                                                                            </table>
                                                                        </div>

                                                                        <!--Public-->
                                                                        <div class="tab-pane fade show bg-white" id="public" role="tabpanel"
                                                                             aria-labelledby="v-pills-changePassword-tab">
                                                                            <table class="table table-striped table-bordered mydatatable">
                                                                                <thead>
                                                                                    <tr>
                                                                                        <th>No</th>
                                                                                        <th>ID</th>
                                                                                        <th>Tiêu đề</th>
                                                                                        <th>Tác giả</th>
                                                                                        <th>Trạng thái</th>
                                                                                            <c:if test="${sessionScope.ROLE eq 'manager'}">
                                                                                            <th>Hiện trên slider</th>
                                                                                            </c:if>
                                                                                        <th></th>
                                                                                        <th></th>

                                                                                    </tr>
                                                                                </thead>

                                                                                <tbody id="tableBodyAccepted">
                                                                                    <c:set var="count" value="0"/>
                                                                                    <c:forEach items="${requestScope.BLOG_LIST_MANAGER}" var="dto" varStatus="counter">
                                                                                        <c:if test="${dto.statusID eq 1}">
                                                                                            <c:set var="count" value="${count+1}"/>
                                                                                            <tr>
                                                                                                <td>
                                                                                                    ${count}
                                                                                                </td>
                                                                                                <td>${dto.blogID}</td>
                                                                                                <td>${dto.title}</td>
                                                                                                <td>
                                                                                                    <c:set var="staffID" value="${dto.authorID}"/>
                                                                                                    ${identity1.getStaffOrManagerNameByIdentityId(staffID)}
                                                                                                </td>
                                                                                                <td class="alert alert-success">Chấp thuận</td>
                                                                                                <c:if test="${sessionScope.ROLE eq 'manager'}">
                                                                                                    <td>
                                                                                                        <form action="DispatchServlet" method="post">
                                                                                                            <c:choose>
                                                                                                                <c:when test="${dto.onSlider}">
                                                                                                                    <input type="checkbox" name="chkSlider" value="ON" checked />
                                                                                                                </c:when>
                                                                                                                <c:otherwise>
                                                                                                                    <input type="checkbox" name="chkSlider" value="ON" />
                                                                                                                </c:otherwise>
                                                                                                            </c:choose>
                                                                                                            <input name="txtBlogId" value="${dto.blogID}" hidden />
                                                                                                            <button type="submit" class="btn btn-primary" name="btAction" value="UpdateSlider">Cập nhật</button>
                                                                                                        </form>
                                                                                                    </td>
                                                                                                </c:if>

                                                                                                <td>
                                                                                                    <a href="ViewBlogDetailServlet?id=${dto.blogID}">Xem chi tiết</a>
                                                                                                </td>
                                                                                                <td>
                                                                                                    <a class="btn btn-danger" onclick="return confirmation()" href="DeleteBlogServlet?id=${dto.blogID}" role="button">Xóa</a>
                                                                                                </td>
                                                                                            </tr>
                                                                                        </c:if>
                                                                                    </c:forEach>
                                                                                </tbody>
                                                                            </table>

                                                                        </div>
                                                                        <!--Pending-->
                                                                        <div class="tab-pane fade show bg-white" id="pending" role="tabpanel"
                                                                             aria-labelledby="v-pills-changePassword-tab">
                                                                            <table class="table table-striped table-bordered mydatatable">
                                                                                <thead>
                                                                                    <tr>
                                                                                        <th>No</th>
                                                                                        <th>ID</th>
                                                                                        <th>Tiêu đề</th>
                                                                                        <th>Tác giả</th>
                                                                                        <th>Trạng thái</th>
                                                                                        <th></th>
                                                                                        <th></th>
                                                                                    </tr>
                                                                                </thead>

                                                                                <tbody id="tableBodyAccepted">
                                                                                    <c:set var="count" value="0"/>
                                                                                    <c:forEach items="${requestScope.BLOG_LIST_MANAGER}" var="dto" varStatus="counter">
                                                                                        <c:if test="${dto.statusID eq 0}">
                                                                                            <c:set var="count" value="${count+1}"/>
                                                                                            <tr>
                                                                                                <td>
                                                                                                    ${count}
                                                                                                </td>
                                                                                                <td>${dto.blogID}</td>
                                                                                                <td>${dto.title}</td>
                                                                                                <td>
                                                                                                    <c:set var="staffID" value="${dto.authorID}"/>
                                                                                                    ${identity1.getStaffOrManagerNameByIdentityId(staffID)}
                                                                                                </td>
                                                                                                <td class="alert alert-warning">Đang chờ</td>
                                                                                                <td>
                                                                                                    <a href="ViewBlogDetailServlet?id=${dto.blogID}">Xem chi tiết</a>
                                                                                                </td>
                                                                                                <td>
                                                                                                    <a class="btn btn-danger" onclick="return confirmation()" href="DeleteBlogServlet?id=${dto.blogID}" role="button">Xóa</a>
                                                                                                </td>
                                                                                            </tr>
                                                                                        </c:if>
                                                                                    </c:forEach>
                                                                                </tbody>
                                                                            </table>

                                                                        </div>
                                                                        <!--deny-->
                                                                        <div class="tab-pane fade show bg-white" id="deny" role="tabpanel"
                                                                             aria-labelledby="v-pills-changePassword-tab">

                                                                            <table class="table table-striped table-bordered mydatatable">
                                                                                <thead>
                                                                                    <tr>
                                                                                        <th>No</th>
                                                                                        <th>ID</th>
                                                                                        <th>Tiêu đề</th>
                                                                                        <th>Tác giả</th>
                                                                                        <th>Trạng thái</th>
                                                                                        <th></th>
                                                                                        <th></th>
                                                                                    </tr>
                                                                                </thead>

                                                                                <tbody id="tableBodyAccepted">
                                                                                    <c:set var="count" value="0"/>
                                                                                    <c:forEach items="${requestScope.BLOG_LIST_MANAGER}" var="dto" varStatus="counter">
                                                                                        <c:if test="${dto.statusID eq 2}">
                                                                                            <c:set var="count" value="${count+1}"/>
                                                                                            <tr>
                                                                                                <td>
                                                                                                    ${count}
                                                                                                </td>
                                                                                                <td>${dto.blogID}</td>
                                                                                                <td>${dto.title}</td>
                                                                                                <td>
                                                                                                    <c:set var="staffID" value="${dto.authorID}"/>
                                                                                                    ${identity1.getStaffOrManagerNameByIdentityId(staffID)}
                                                                                                </td>
                                                                                                <td class="alert alert-danger">Từ chối</td>
                                                                                                <td>
                                                                                                    <a href="ViewBlogDetailServlet?id=${dto.blogID}">Xem chi tiết</a>
                                                                                                </td>
                                                                                                <td>
                                                                                                    <a class="btn btn-danger" onclick="return confirmation()" href="DeleteBlogServlet?id=${dto.blogID}" role="button">Xóa</a>
                                                                                                </td>
                                                                                            </tr>
                                                                                        </c:if>
                                                                                    </c:forEach>
                                                                                </tbody>
                                                                            </table>
                                                                        </div>
                                                                    </c:if>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:if>

                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </main>
        </div>
        <!--JQuery-->
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
                integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
                integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
                integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>

        <!--Custom JS-->
        <script type="text/javascript" src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.min.js"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/1.10.22/js/dataTables.bootstrap4.min.js"></script>
        <script>
                                                                                                        $(".mydatatable").DataTable();
        </script>


        <script>
            window.addEventListener('load', function () {
                const loader = document.querySelector(".loader");
                loader.className += " hidden"; // class "loader hidden"
            });
        </script>
        <script>
            function confirmation() {
                var r = confirm("Bạn có chắc muốn xóa bài viết này?");
                return r;
            }
        </script>
    </body>
</html>
