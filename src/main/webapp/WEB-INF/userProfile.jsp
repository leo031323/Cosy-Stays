
<%@page contentType="text/html;charset=UTF-8"%>
<%@taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page import="com.unam.poo.models.City"%>

<%@page session='true'%> 
<%
System.out.println("----------------------------------------------");
System.out.println("ID Sesion: " + session.getId());
System.out.println("Users ID: " + session.getAttribute("userId"));
System.out.println("----------------------------------------------");
%>
<tags:jsp_imports/>
<html>
<head>
  <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    
    <title>Profile</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

    <tags:css_imports/>

  <!-- Latest compiled and minified JavaScript -->

  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.tablesorter/2.29.0/js/jquery.tablesorter.combined.js" integrity="sha256-AQTn9CwiNvZG2zsoT0gswugjZp0alCQySLyt9brT9Cg="
          crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.tablesorter/2.29.0/js/jquery.tablesorter.js" integrity="sha256-serXvhbeEKdQIfTFSD3wpNCGNx2+/9py7VXfwLhYTfk="
          crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.tablesorter/2.29.0/js/jquery.tablesorter.widgets.js" integrity="sha256-U+0DXO4scYcNVpt7pnud6Fx3KZqK2I5mI6KOeAjSqOE="
          crossorigin="anonymous"></script>


</head>
<body class="container bg-gray-200">
<%@include file="common/navBar2.jsp"%>
<div class="container-fluid px-2 px-md-4 mt-8">
  <div class="page-header min-height-300 border-radius-xl mt-4 align-items-center" style="background-image: url('${users.photo.front}');">
    <h2 class="text-white z-index-1 ms-5 bg-gradient-faded-dark border-radius-xl shadow-dark " style="padding-left: 10px; padding-right: 10px"> Personal profile</h2>
    <span class="mask  bg-gradient-primary  opacity-0">
    </span>
  </div>
  <div class="card card-body mx-3 mx-md-4 mt-n6">
    <div class="row gx-4 mb-2">
      <div class="col-auto">
        <div class="avatar avatar-xl position-relative">
          <img src="${users.photo.profile}" alt="profile_image" class="w-100 border-radius-lg shadow-xl">
        </div>
      </div> 

      <div class="col-auto my-auto">
        <div class="h-100">
          <h5 class="mb-1">
            ${users.name}
          </h5>
          <p class="mb-0 font-weight-normal text-sm">
            <i class="fas fa-map-marker-alt text-sm me-1 text-primary"></i>  ${users.city.city}, ${users.city.provinceId.province}
          </p>
        </div>
      </div>
    </div>

<%--    selector start--%>
    <section class="mb-2 mt-2">
      <div class="container">
        <div class="nav-wrapper position-relative end-0">
          <ul class="nav nav-pills nav-fill p-1" role="tablist">
            <li class="nav-item ps-3 pe-3">
              <a class="nav-link mb-0 px-0 py-1 active" data-bs-toggle="tab" href="#profile-tab" role="tab" aria-controls="profile" aria-selected="true">
               <i class="fas fa-circle-user text-primary me-3"></i> Profile
              </a>
            </li>
            <li class="nav-item ps-3 pe-3">
              <a class="nav-link mb-0 px-0 py-1" data-bs-toggle="tab" href="#dashboard-tab" role="tab" aria-controls="dashboard" aria-selected="false">
                <i class="fas fa-square-poll-horizontal text-primary me-3"></i> My publications
              </a>
            </li>
            <li class="nav-item ps-3 pe-3">
              <a class="nav-link mb-0 px-0 py-1" data-bs-toggle="tab" href="#favorites-tab" role="tab" aria-controls="dashboard" aria-selected="false">
                <i class="fas fa-heart text-primary me-3"></i> My favorites
              </a>
            </li>
            <li class="nav-item ps-3 pe-3">
              <a class="nav-link mb-0 px-0 py-1" data-bs-toggle="tab" href="#settings-tab" role="tab" aria-controls="settings" aria-selected="false">
                <i class="fas fa-gear text-primary me-3"></i> Configuration
              </a>
          </ul>
        </div>
      </div>
    </section>


    <div class="tab-content">

      <div class="tab-pane fade show active" id="profile-tab" role="tabpanel" aria-labelledby="profile-tab">
            <div class="card mb-4 w-xxl-100">
              <div class="card-header pb-0">
                <h6> Personal information <a class="ms-3"><i class="fas fa-user-edit text-secondary " data-bs-toggle="modal" data-bs-target="#datosModal" aria-hidden="true" aria-label="Edit Profile" data-bs-original-title="Edit Profile"></i><span class="sr-only">Edit Profile</span></a>
                </h6>
              </div>
              <div class="card-body pt-3">
                <div class="container">
                  <div class="row">
                    <div class="col card bg-gray-100 m-3">
                      <ul class="list-group">
                        <li class="list-group-item border-0 ps-0 bg-transparent"><strong class="text-dark">Full name:</strong> &nbsp; ${users.name} ${users.lastname}</li>
                        <li class="list-group-item border-0 ps-0 bg-transparent"><strong class="text-dark">Telephone:</strong> &nbsp; ${users.telephone}</li>
                        <li class="list-group-item border-0 ps-0 bg-transparent"><strong class="text-dark">Email:</strong> &nbsp; ${users.correo}</li>
                        <li class="list-group-item border-0 ps-0 bg-transparent"><strong class="text-dark">Position:</strong> ${users.city.city}, ${users.city.provinceId.province}, ${users.city.provinceId.countryId.country}</li>
                      </ul>
                    </div>
                    <div class="col card bg-gray-100 m-3">
                      <strong class="text-dark">Description:</strong>
                      <p>
                        ${users.description}
                      </p>
                    </div>
                  </div>
                </div>
                </div>
              </div>
            </div>

      <div class="tab-pane fade" id="dashboard-tab" role="tabpanel" aria-labelledby="dashboard-tab">
        <div class="card w-xxl-100">
          <div class="card-body">
            <div class="container">
              <div class="card h-100 align-content-xxl-center">
                <div class="card">
                  <div class="row text-center py-2 mt-3">
                    <div class="col-4 mx-auto">
                      <div class="input-group input-group-dynamic mb-4">
                        <span class="input-group-text"><i class="fas fa-search text-primary" aria-hidden="true"></i></span>
                        <input class="form-control" placeholder="Search" type="text" id="myInput">
                      </div>
                    </div>
                  </div>
                  <div class="table-responsive">
                    <table class="table align-items-center mb-0">
                      <thead>
                      <tr>
                        <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7" data-order="desc">Publication   <i id="imagen1" class="fa-solid fa-chevron-down"></i> </th>
                        <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2" data-order="desc">Type</th>
                        <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7" data-order="desc">State</th>
                        <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7" data-order="desc">Visualization</th>
                        <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7" data-order="desc">Date of publication</th>
                        <th class="text-secondary opacity-7"></th>
                      </tr>
                      </thead>
                      <tbody id="myTable">
                      <c:forEach items="${publications}" var="property">
                        <tr style="height:100px">
                          <td>
                            <div class="d-flex px-2 py-1">
                              <div>
                                <img src="../assets/img/rents/1.webp" class="avatar avatar-xl me-3" alt="logo">
                              </div>
                              <div class="d-flex flex-column justify-content-center">
                                <a class="mb-0 h6" href="${pageContext.request.contextPath}/publication/chosen-publication/${property.id}">${property.title}</a>
                                <p class="text-xs text-secondary mb-0">${property.price}</p>
                              </div>
                            </div>
                          </td>
                          <td>
                            <p class="text-xs text-secondary mb-0">${property.typeId.type}</p>
                          </td>
                          <td class="align-middle text-center">
                            <span class="badge bg-gradient-<c:if test="${property.state == \"Rented\"}">warning</c:if><c:if test="${property.state == \"active\"}">success</c:if>" href="www.google.com">${property.state}</span>
                          </td>

                          <td class="align-middle text-center">
                            <span class="text-secondary text-xs font-weight-normal">420</span>
                          </td>
                          <td class="align-middle text-center">
                            <span class="text-secondary text-xs font-weight-normal">${property.dateTime.toLocalDate()}</span>
                          </td>
                          <td class="align-middle">
                            <form:form action="/publication/publication-removal-self/${property.id}" method="post" modelAttribute="publications" name="${property.id}">
                              <button type="submit" class="m-3" style="border: none; background: transparent; padding: 0;">
                                <i class="fas fa-trash"></i>
                              </button>
                            </form:form>
                          </td>
                        </tr>
                      </c:forEach>
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>
            </div>
          </div>
      </div>
    </div>

      <div class="tab-pane fade" id="favorites-tab" role="tabpanel" aria-labelledby="dashboard-tab">
        <div class="card w-xxl-100">
          <div class="card-body">
            <div class="container">
              <div class="card h-100 align-content-xxl-center">
                <div class="card">
                  <div class="row text-center py-2 mt-3">
                    <div class="col-4 mx-auto">
                      <div class="input-group input-group-dynamic mb-4">
                        <span class="input-group-text"><i class="fas fa-search text-primary" aria-hidden="true"></i></span>
                        <input class="form-control" placeholder="Search" type="text" id="myInput2">
                      </div>
                    </div>
                  </div>
                  <div class="table-responsive">
                    <table class="table align-items-center mb-0">
                      <thead>
                      <tr>
                        <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7" data-order="desc">Publication   <i class="fa-solid fa-sort fa-lg"></i> </th>
                        <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2" data-order="desc">Type</th>
                        <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7" data-order="desc">State</th>
                        <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7" data-order="desc">Visualization</th>
                        <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7" data-order="desc">Date of publication</th>
                        <th class="text-secondary opacity-7"></th>
                      </tr>
                      </thead>
                      <tbody id="myTable2">
                      <c:forEach items="${publications}" var="property">

                        <c:if test="${users.favorites.contains(property)}">
<%--                          <%System.out.println("PRUEBAAAAA");%>--%>

                        <tr style="height:100px">
                          <td>
                            <div class="d-flex px-2 py-1">
                              <div>
                                <img src="../assets/img/rents/1.webp" class="avatar avatar-xl me-3" alt="logo">
                              </div>
                              <div class="d-flex flex-column justify-content-center">
                                <a class="mb-0 h6" href="${pageContext.request.contextPath}/publication/chosen-publication/${property.id}">${property.title}</a>
                                <p class="text-xs text-secondary mb-0">${property.price}</p>
                              </div>
                            </div>
                          </td>
                          <td>
                            <p class="text-xs text-secondary mb-0">${property.typeId.type}</p>
                          </td>
                          <td class="align-middle text-center">
                            <span class="badge bg-gradient-<c:if test="${property.state == \"Rented\"}">warning</c:if><c:if test="${property.state == \"active\"}">success</c:if>" href="www.google.com">${property.state}</span>
                          </td>

                          <td class="align-middle text-center">
                            <span class="text-secondary text-xs font-weight-normal">420</span>
                          </td>
                          <td class="align-middle text-center">
                            <span class="text-secondary text-xs font-weight-normal">${property.dateTime.toLocalDate()}</span>
                          </td>
                          <td class="align-middle">
                            <form:form action="/publication/favorite-removal-self/${property.id}" method="post" modelAttribute="publications" name="${property.id}">
                              <button type="submit" class="m-3" style="border: none; background: transparent; padding: 0;">
                                <i class="fas fa-trash"></i>
                              </button>
                            </form:form>
                          </td>
                        </tr>
                        </c:if>
                      </c:forEach>
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>

      <div class="tab-pane fade" id="settings-tab" role="tabpanel" aria-labelledby="settings-tab">
        <div class="card card-plain h-100">
          <div class="card-body p-3">
            <div class="container">
              <div class="row">
                <div class="col mt-3">
                  <h4 class="text-uppercase text-xs font-weight-bolder"><i class="fas fa-envelope me-3 text-primary"></i>Notifications</h4>
                  <ul class="list-group">
                    <li class="list-group-item border-0 px-0">
                      <div class="form-check form-switch ps-0">
                        <input class="form-check-input ms-auto form-control-color" type="checkbox" id="flexSwitchCheckDefault9" checked="">
                        <label class="form-check-label text-body ms-3 text-truncate w-80 mb-0" for="flexSwitchCheckDefault9">When someone collects publications</label>
                      </div>
                    </li>
                    <li class="list-group-item border-0 px-0">
                      <div class="form-check form-switch ps-0">
                        <input class="form-check-input ms-auto" type="checkbox" id="flexSwitchCheckDefault1">
                        <label class="form-check-label text-body ms-3 text-truncate w-80 mb-0" for="flexSwitchCheckDefault1">When someone wants to contact me</label>
                      </div>
                    </li>
                    <li class="list-group-item border-0 px-0">
                      <div class="form-check form-switch ps-0">
                        <input class="form-check-input ms-auto" type="checkbox" id="flexSwitchCheckDefault2" checked="">
                        <label class="form-check-label text-body ms-3 text-truncate w-80 mb-0" for="flexSwitchCheckDefault2">When I make the payment</label>
                      </div>
                    </li>
                  </ul>
                </div>
                <div class="col mt-3">
                  <h4 class="text-uppercase text-xs font-weight-bolder"><i class="fa-solid fa-shield-halved me-3 text-primary"></i>Account and Security</h4>
                  <ul class="list-group">
                    <li class="list-group-item border-0 px-0">
                      <div class="text-center">
                        <button type="button" class="btn btn-outline-dark btn-sm mb-0 w-100" data-bs-toggle="modal" data-bs-target="#datosModal"><i class="fas fa-user me-3"></i>Edit personal information</button>
                      </div>
                    </li>
                    <li class="list-group-item border-0 px-0">
                      <div class="text-center">
                        <button type="button" class="btn btn-outline-dark btn-sm mb-0 w-100" data-bs-toggle="modal" data-bs-target="#pwdModal"><i class="fas fa-key me-3"></i>Change password</button>
                      </div>
                    </li>
                    <li class="list-group-item border-0 px-0">
                      <div class="text-center">
                        <button type="button" class="btn btn-outline-primary btn-sm mb-0 w-100" data-bs-toggle="modal" data-bs-target="#desactivarModal"><i class="fas fa-exclamation-triangle me-3 text-red"></i>Delete account </button>
                      </div>
                    </li>
                  </ul>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>

      </div>
      </div>
    </div>

<div class="modal fade" id="datosModal" tabindex="-1" aria-labelledby="datosModal" aria-hidden="true">
  <div class=" modal-dialog modal-dialog-centered modal-xl ">
    <div class="modal-content">
      <div class="modal-header align-content-center">
        <h3 class="text-center w-100">Update your data</h3>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <section>
          <div class="container py-4">
            <div class="row">
              <div class="col mx-auto d-flex justify-content-center flex-column">

                <form:form id="updateForm" role="form" action="${pageContext.request.contextPath}/user/update" method="post" modelAttribute="UsuarioDto">
                  <div class="card-body">
                    <div class="row">
                      <div class="col">
                        <div class="input-group input-group-dynamic m-4">
                          <label class="form-label">Name</label>
                          <input type="text" name="nombre" id="nombre" class="inputs form-control" value="${users.name}">
                        </div>
                      </div>
                      <div class="col">
                        <div class="input-group input-group-dynamic m-4">
                          <label class="form-label">Lastname</label>
                          <input type="text" name="apellido" id="apellido" class="inputs form-control" value="${users.lastname}">
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col">
                        <div class="input-group input-group-dynamic m-4">
                          <label class="form-label">Email</label>
                          <input type="email" name="correo" id="correo" class="inputs form-control" value="${users.correo}">
                        </div>
                      </div>
                      <div class="col">
                        <div class="input-group input-group-dynamic m-4">
                          <label class="form-label">Telephone number</label>
                          <input type="number" name="telefono" id="telefono" class="inputs form-control" value="${users.telephone}">
                        </div>
                      </div>
                    </div>
                      <div class="row">
                        <div class="col">
                            <div class="input-group input-group-dynamic m-4">
                              <select id="city" name="city" class="form-control">
                                <option disabled value="">Select a city</option>
                                <c:forEach items="${cities}" var="city">
                                  <c:choose>
                                    <c:when test="${users.city == city}"><option selected value="${city.id}">${city.city}</option></c:when>
                                    <c:otherwise><option value="${city.id}">${city.city}</option></c:otherwise>
                                 </c:choose>
                                </c:forEach>
                            </select>
                            </div>
                        </div>
                    <div class="input-group input-group-static m-2 mt-4 row">
                      <label><i class="fas fa-circle-info me-3"></i>Information</label>
                      <textarea name="descripcion" class="inputs form-control" id="descripcion" rows="4">${users.description}</textarea>
                    </div>
                    <div class="row">
                      <ul class="list-group">
                        <li class="list-group-item border-0 px-0">
                          <div class="text-center">
                            <button type="button" class="btn btn-outline-dark btn-sm mb-0 w-100" data-bs-toggle="modal" data-bs-target="#fotoModal"><i class="fas fa-user me-3"></i>Update photo configuration file</button>
                          </div>
                        </li>
                        <li class="list-group-item border-0 px-0">
                          <div class="text-center">
                            <button type="button" class="btn btn-outline-dark btn-sm mb-0 w-100" data-bs-toggle="modal" data-bs-target="#portadaModal"><i class="fas fa-key me-3"></i>Update photo cover</button>
                          </div>
                        </li>
                      </ul>
                    </div>
                  </div>
                  <div class="d-flex mt-3 justify-content-between">
                    <button type="button" class="btn bg-gradient-dark" data-bs-dismiss="modal">Cancel</button>
                    <button type="submit" class="btn bg-gradient-primary">Save</button>
                  </div>
                </form:form> 
              </div>
            </div>
          </div>
          </div>
        </section>
      </div>
    </div>
  </div>
</div>

<div class="modal fade" id="pwdModal" tabindex="-1" aria-labelledby="pwdModal" aria-hidden="true">
  <div class=" modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header align-content-center">
        <h3 class="text-center w-100">Change your password</h3>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <section>
          <div class="container py-4">
            <div class="row">
              <div class="col mx-auto d-flex justify-content-center flex-column">
                <form role="form" id="update-form2" method="post" action="${pageContext.request.contextPath}/user/password" autocomplete="off">
                  <div class="card-body">
                    <div class="row">
                      <div class="col">
                        <div class="input-group input-group-dynamic m-4">
                          <label class="form-label"><i class="fas fa-key me-3"></i>Current password</label>
                          <input type="password" class="form-control" name="currentPassword">
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col">
                        <div class="input-group input-group-dynamic m-4">
                          <label class="form-label"><i class="fas fa-key me-3"></i>New password</label>
                          <input type="password" class="form-control" name="newPassword">
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col">
                        <div class="input-group input-group-dynamic m-4">
                          <label class="form-label"><i class="fas fa-key me-3"></i>Confirm password</label>
                          <input type="password" class="form-control" name="confirmPassword">
                          <!-- 可选：显示密码的功能 -->
                          <div class="input-group-append">
                            <span class="input-group-text" onclick="password_show_hide();">
                              <i class="fas fa-eye" id="show_eye"></i>
                              <i class="fas fa-eye-slash d-none" id="hide_eye"></i>
                            </span>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                  <!-- 将按钮放在表单内 -->
                  <div class="modal-footer justify-content-between">
                    <button type="button" class="btn bg-gradient-dark" data-bs-dismiss="modal">Cancel</button>
                    <button type="submit" class="btn bg-gradient-primary">Save</button>
                  </div>
                </form>
              </div>
            </div>
          </div>
        </section>
      </div>
    </div>
  </div>
</div>


<div class="modal fade" id="fotoModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class=" modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header align-content-center">
        <h3 class="text-center w-100">Update your profile photo</h3>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <section>
          <div class="container py-4">
            <div class="row">
              <div class="col mx-auto d-flex justify-content-center flex-column">

                <form role="form" action="${pageContext.request.contextPath}/user/configProfile" method="post">
                <div class="card-body">
                  <div class="row">
                    <div class="col">
                      <label class="form-label"><i class="fas fa-image me-3 text-primary"></i>Personal profile photo</label>
                      <div class="input-group input-group-dynamic m-4"> 
                          <input id="imagen" name="imagen" #imagen type="text" class="form-control" placeholder="" aria-label="Last Name..." >
                      </div>
                      </div>
                      </div>
                  </div>
                  
                <div class="d-flex justify-content-between">
                  <button type="button" class="btn bg-gradient-dark" data-bs-dismiss="modal">Cancel</button>
                  <button type="submit" class="btn bg-gradient-primary">Save</button>
                </div>
              </form> </div>
                </div>
                </div>
                </section>
                </div>
    </div>
  </div>
</div>

<div class="modal fade" id="desactivarModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class=" modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header align-content-center">
        <h3 class="text-center w-100">Delete account </h3>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <section>
          <div class="container py-4">
            <div class="row">
              <div class="col mx-auto d-flex justify-content-center flex-column">
                
                <%--@elvariable id="LoginDto" type="com.unam.poo.dto.LoginDto"--%>
                <form:form role="form" action="${pageContext.request.contextPath}/user/Account" method="post" modelAttribute="LoginDto">
                  <div class="card-body">
                    <div class="row">
                      <h5><i class="fas fa-warning text-3xl text-danger me-3"></i>This action cannot be processed</h5>
                      <h6 class="text-body ms-5 text-xxs">Confirm entering your email and password</h6>
                      <div class="col">
                        <div class="input-group input-group-dynamic m-4">
                          <label class="form-label"><i class="fas fa-user me-3"></i>Email</label>
                          <input #correo type="email" name="correo" id="correo" class="form-control">
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col">
                        <div class="input-group input-group-dynamic m-4">
                          <label class="form-label"><i class="fas fa-key me-3"></i>Password</label>
                          <input #contrasena path="contrasena" name="contrasena" type="password" class="form-control is-invalid" required>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="d-flex justify-content-between">
                    <button type="button" class="btn bg-gradient-dark" data-bs-dismiss="modal">Cancel</button>
                    <button type="submit" class="btn bg-gradient-danger">Confirm</button>
                  </div>
                </form:form>

              </div>
            </div>
          </div>
        </section>
      </div> 
    </div>
  </div>
</div>

<div class="modal fade" id="portadaModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class=" modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header align-content-center">
        <h3 class="text-center w-100">Update your cover photo</h3>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <section>
          <div class="container py-4">
            <div class="row">
              <div class="col mx-auto d-flex justify-content-center flex-column">
                <form role="form" action="${pageContext.request.contextPath}/user/configCover" method="post">
                  <div class="card-body">
                    <div class="row">
                      <div class="col">
                        <label class="form-label"><i class="fas fa-image me-3 text-primary"></i>Cover Photo </label>
                        <div class="input-group input-group-dynamic m-4">
                          <input id="portada" name="portada" #portada type="text" class="form-control" aria-label="Last Name..." >
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="d-flex justify-content-between">
                    <button type="button" class="btn bg-gradient-dark" data-bs-dismiss="modal">Cancel</button>
                    <button type="submit" class="btn bg-gradient-primary">Save</button>
                  </div>
                </form>
                
              </div>
            </div>
          </div>
        </section>
      </div> 
    </div>
  </div>
</div>

<script>
  function password_show_hide() {
    let x = document.getElementById("password");
    let y = document.getElementById("show_eye");
    let z = document.getElementById("hide_eye");
    if (x.type === "password") {
      x.type = "text";
      y.classList.add("d-none");
      z.classList.remove("d-none");
    } else {
      x.type = "password";
      y.classList.remove("d-none");
      z.classList.add("d-none");
    }
  }
</script>
<tags:js_imports/>

<script>
  $(document).ready(function(){
    $("#myInput").on("keyup", function() {
      var value = $(this).val().toLowerCase();
      $("#myTable tr").filter(function() {
        $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
      });
    });
  });
</script>

<script>


    $(document).ready(function(){
      $('th').on('click', function(){
          // ordenar la columna de publicacion de forma ascendente sin importar mayusculas o minusculas, y al volver a darle click ordenar de forma descendente

          // si cantidadClicks es igual a 0, ordenar de forma ascendente

          var order = $(this).data('order')

          if(order == 'desc'){
            document.getElementById("imagen1").className = "fa-solid fa-chevron-up"
            $(this).data('order', "asc")
            $("#myTable").find("tr").sort(function (a, b) {
              var keyA = $(a).find("td").eq(0).text().toUpperCase();
              var keyB = $(b).find("td").eq(0).text().toUpperCase();
              if (keyA < keyB) return -1;
              if (keyA > keyB) return 1;
              // cambiar la clase de la flecha

              return 0;
            }).appendTo("#myTable");
          }else{
            document.getElementById("imagen1").className = "fa-solid fa-chevron-down"
            $(this).data('order', "desc")
            $("#myTable").find("tr").sort(function (a, b) {
              var keyA = $(a).find("td").eq(0).text().toUpperCase();
              var keyB = $(b).find("td").eq(0).text().toUpperCase();
              if (keyA > keyB) return -1;
              if (keyA < keyB) return 1;
                // cambiar la clase de la flecha

              return 0;
            }).appendTo("#myTable");
          }

        });
    });



  </script>

</body>
</html>
