<%@page contentType="text/html;charset=UTF-8"%>
<%@taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page import="com.unam.poo.models.City"%>
<%@page import="com.unam.poo.models.Users"%>
<%@page session='true'%>

<tags:jsp_imports/>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <title>User Management</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

    <tags:css_imports/>

</head>
<body class="container bg-gray-200">

<%@include file="common/navBar2.jsp"%>

<!-- 用户列表部分 -->
<div class="container mt-5">
    <h2 style="margin-top: 100px;">User Management</h2>

    <table class="table">
        <thead>
            <tr>
                <th class="align-middle">ID</th>
                <th class="align-middle">Name</th>
                <th class="align-middle">Lastname</th>
                <th class="align-middle">Email</th>
                <th class="align-middle">Actions</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${users}" var="user">
                <c:if test="${user.active == true}">
                    <tr>
                        <td class="align-middle">${user.id}</td>
                        <td class="align-middle">${user.name}</td>
                        <td class="align-middle">${user.lastname}</td>
                        <td class="align-middle">${user.correo}</td>
                        <td>
                            <!-- Edit Button -->
                            <button type="button" class="btn btn-primary edit-user" data-bs-toggle="modal" data-bs-target="#datosModal"
                                    data-id="${user.id}" data-name="${user.name}" data-lastname="${user.lastname}" data-email="${user.correo}"
                                    data-telephone="${user.telephone}" data-description="${user.description}" data-city="${user.city.id}">
                                Edit
                            </button>
                            <!-- Delete Button -->
                            <form:form action="${pageContext.request.contextPath}/manage/account" method="post" modelAttribute="users" style="display:inline;">
                                <input type="hidden" name="id" value="${user.id}">
                                <form:button type="submit" class="btn btn-danger">Delete</form:button>
                            </form:form>
                        </td>
                    </tr>
                </c:if>
            </c:forEach>
        </tbody>
    </table>
</div>


<!-- 模态框：编辑用户信息 -->
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

                <%--@elvariable id="Users" type=""--%>
                    <form:form id="updateForm" role="form" action="${pageContext.request.contextPath}/manage/updateuser" method="post" modelAttribute="Users">
                    <input type="hidden" name="id" id="userId" value="">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <div class="input-group input-group-dynamic m-4">
                                    <label class="form-label">Name</label>
                                    <input type="text" name="name" id="name" class="inputs form-control">
                                </div>
                            </div>
                            <div class="col">
                                <div class="input-group input-group-dynamic m-4">
                                    <label class="form-label">Lastname</label>
                                    <input type="text" name="lastname" id="lastname" class="inputs form-control">
                                </div>
                            </div>
                        </div>
                    <div class="row">
                      <div class="col">
                        <div class="input-group input-group-dynamic m-4">
                          <label class="form-label">Email</label>
                          <input type="email" name="correo" id="correo" class="inputs form-control">
                        </div>
                      </div>
                      <div class="col">
                        <div class="input-group input-group-dynamic m-4">
                          <label class="form-label">Telephone number</label>
                          <input type="number" name="telephone" id="telephone" class="inputs form-control">
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
                                    <c:when test="${user.city.id == city.id}">
                                      <option selected value="${city.id}">${city.city}</option>
                                    </c:when>
                                    <c:otherwise>
                                      <option value="${city.id}">${city.city}</option>
                                    </c:otherwise>
                                 </c:choose>
                                </c:forEach>
                            </select>
                            </div>
                        </div>
                    </div>
                    <div class="input-group input-group-static m-2 mt-4 row">
                      <label><i class="fas fa-circle-info me-3"></i>Information</label>
                      <textarea name="description" class="inputs form-control" id="description" rows="4"></textarea>
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
        </section>
      </div>
    </div>
  </div>
</div>
</body>

<script>
    // 当模态框显示时，填充用户数据
    var myModal = document.getElementById('datosModal')
    myModal.addEventListener('show.bs.modal', function (event) {
        var button = event.relatedTarget; // 获取触发模态框的按钮
        var userId = button.getAttribute('data-id');
        var userName = button.getAttribute('data-name');
        var userLastname = button.getAttribute('data-lastname');
        var userEmail = button.getAttribute('data-email');
        var userTelephone = button.getAttribute('data-telephone');
        var userDescription = button.getAttribute('data-description');
        var userCityId = button.getAttribute('data-city');

        console.log('User ID:', userId);
        console.log('Name:', userName);
        console.log('Last Name:', userLastname);
        console.log('Email:', userEmail);
        console.log('Telephone:', userTelephone);
        console.log('Description:', userDescription);
        console.log('City ID:', userCityId);

        // 填充表单字段
        // document.getElementById('userId').value = userId;
        // document.getElementById('name').value = userName;
        // document.getElementById('lastname').value = userLastname;
        // document.getElementById('correo').value = userEmail;
        // document.getElementById('telephone').value = userTelephone;
        // document.getElementById('description').value = userDescription;
        document.getElementById('correo').value = userEmail;
        document.getElementById('name').value = userName;
        document.getElementById('lastname').value = userLastname;
        document.getElementById('telephone').value = userTelephone;
        document.getElementById('description').value = userDescription;


        // 填充城市下拉框
        var citySelect = document.getElementById('city');
        for (var i = 0; i < citySelect.options.length; i++) {
            if (citySelect.options[i].value === userCityId) {
                citySelect.selectedIndex = i;
                break;
            }
        }
        document.getElementById('userId').value = userId;
    });
</script>

</html>