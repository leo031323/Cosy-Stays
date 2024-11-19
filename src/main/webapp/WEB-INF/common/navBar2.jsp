<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.Set" %>
<html>

<nav class="navbar navbar-expand-lg border-radius-xl top-0 z-index-3 shadow position-absolute my-3 py-2 start-5 end-5" style="backdrop-filter:blur(2px); background-color: rgba(255, 255, 255, .75);">
  <div class="container-fluid px-0">
    <a class="navbar-brand font-weight-bolder ms-sm-3" href="${pageContext.request.contextPath}/mainpage/" rel="tooltip" title="Pagina de inicio" data-placement="bottom" >
      <i class="fa-brands fa-airbnb me-2"></i>Cozy-Stays
    </a>
    <button class="navbar-toggler shadow-none ms-2" type="button" data-bs-toggle="collapse" data-bs-target="#navigation" aria-controls="navigation" aria-expanded="true" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon mt-2">
        <span class="navbar-toggler-bar bar1"></span>
        <span class="navbar-toggler-bar bar2"></span>
        <span class="navbar-toggler-bar bar3"></span>
      </span>
    </button>
    <div class="navbar-collapse pt-3 pb-2 py-lg-0 w-100 collapse show" id="navigation">
      <ul class="navbar-nav navbar-nav-hover ms-auto">
<%--  home --%>
        <li class="nav-item dropdown dropdown-hover mx-2">
          <a class="nav-link ps-2 d-flex cursor-pointer align-items-center" id="dropdownMenuPages" data-bs-toggle="dropdown" aria-expanded="false">
            <i class="material-icons opacity-6 me-2 text-md">home</i>
            Home
            <img src="../../assets/img/down-arrow-dark.svg" alt="down-arrow" class="arrow ms-auto ms-md-2">
          </a>
          <div class="dropdown-menu dropdown-menu-animation ms-n3 dropdown-md p-3 border-radius-xl mt-0 mt-lg-3" aria-labelledby="dropdownMenuPages">
            <div class="d-none d-lg-block">
              <h6 class="dropdown-header text-dark font-weight-bolder d-flex align-items-center px-1">
                <i class="material-icons opacity-6 me-2">home</i>Home
              </h6>
              <a href="${pageContext.request.contextPath}/mainpage/" class="dropdown-item border-radius-md">
                <span>Home</span>
              </a>
              <a href="#" class="dropdown-item border-radius-md">¸
                <span>FAQ</span>
              </a>
              <a href="https://github.com/leo031323/" class="dropdown-item border-radius-md">
                <span>Contact information</span>
              </a>
            </div>
            <div class="d-lg-none">
              <h6 class="dropdown-header text-dark font-weight-bolder d-flex align-items-center px-1">
                Optimize search
              </h6>

              <a href="#" class="dropdown-item border-radius-md">
                <span>Home</span>
              </a>
              <a href="#" class="dropdown-item border-radius-md">
                <span>FAQ</span>
              </a>
              <a href="https://github.com/leo031323/" class="dropdown-item border-radius-md">
                <span>Contact information</span>
              </a>
            </div>
          </div>
        </li>

  <li class="nav-item dropdown dropdown-hover mx-2">
    <a class="nav-link ps-2 d-flex cursor-pointer align-items-center" id="dropdownMenuPages5" data-bs-toggle="dropdown" aria-expanded="false">
      <i class="material-icons opacity-6 me-2 text-md">search</i>
      Search
      <img src="../../assets/img/down-arrow-dark.svg" alt="down-arrow" class="arrow ms-auto ms-md-2">
    </a>
    <div class="dropdown-menu dropdown-menu-animation ms-n3 dropdown-md p-3 border-radius-xl mt-0 mt-lg-3" aria-labelledby="dropdownMenuPages">
      <div class="d-none d-lg-block">
        <h6 class="dropdown-header text-dark font-weight-bolder d-flex align-items-center px-1">
          Optimize search
        </h6>
        <a href="${pageContext.request.contextPath}/publication/chosen-publications" class="dropdown-item border-radius-md">
          <span>Apartment</span>
        </a>
        <a href="${pageContext.request.contextPath}/publication/chosen-publications" class="dropdown-item border-radius-md">
          <span>House</span>
        </a>
        <a href="${pageContext.request.contextPath}/publication/chosen-publications" class="dropdown-item border-radius-md">
          <span>Duplexes</span>
        </a>
      </div>
      <%--Duplicado para cuando la barra esta colapsada--%>
      <div class="d-lg-none">
        <h6 class="dropdown-header text-dark font-weight-bolder d-flex align-items-center px-1">
          Optimize search
        </h6>

        <a href="${pageContext.request.contextPath}/publication/chosen-publications" class="dropdown-item border-radius-md">
          <span>Apartment</span>
        </a>
        <a href="${pageContext.request.contextPath}/publication/chosen-publications" class="dropdown-item border-radius-md">
          <span>Houses</span>
        </a>
        <a href="${pageContext.request.contextPath}/publication/chosen-publications" class="dropdown-item border-radius-md">
          <span>Duplexes</span>
        </a>
      </div>
    </div>
  </li>

        <li class="nav-item dropdown dropdown-hover mx-2">
          <a class="nav-link ps-2 d-flex cursor-pointer align-items-center" id="dropdownMenuPages2" data-bs-toggle="dropdown" aria-expanded="false">
            <i class="material-icons opacity-6 me-2 text-md">publish</i>
            Release
<%--            <img src="../../assets/img/down-arrow-dark.svg" alt="down-arrow" class="arrow ms-auto ms-md-2">--%>
          </a>
          <div class="dropdown-menu dropdown-menu-animation ms-n3 dropdown-md p-3 border-radius-xl mt-0 mt-lg-3" aria-labelledby="dropdownMenuPages">
            <div class="d-none d-lg-block">
              <h6 class="dropdown-header text-dark font-weight-bolder d-flex align-items-center px-1">
                Publication
              </h6>
              <a href="${pageContext.request.contextPath}/publication/creation" class="dropdown-item border-radius-md">
                <span>Create a new publication</span>
              </a>
              <a href="${pageContext.request.contextPath}/publication/consultation" class="dropdown-item border-radius-md">
                <span>My publications</span>
              </a>
            </div>
            <div class="d-lg-none">
              <h6 class="dropdown-header text-dark font-weight-bolder d-flex align-items-center px-1">
                Publication
              </h6>

              <a href="#" class="dropdown-item border-radius-md">
                <span>Create a new publication</span>
              </a>
              <a href="#" class="dropdown-item border-radius-md">
                <span>My publications</span>
              </a>
            </div>
          </div>
        </li>


        <li class="nav-item dropdown ">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            <i class="fa fa-user me-1"></i>
            <span class="d-sm-inline d-md-none">Account</span>
          </a>
          <%
            Set<String> roles = (Set<String>) session.getAttribute("roles");
          %>
          <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdownMenuLink"> 
             <% 
             if (session.getAttribute("authentication") != "true"){
             %>
            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/login">Sign in</a></li>
            <%
            }
            %>
            <%
             if (session.getAttribute("authentication") == "true"){
             %>
            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/logout">Sign out</a></li>
            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/user/profile">Personal data</a></li>
            <%if (roles != null && roles.contains("ROLE_ADMIN")){
              %>
            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/manage/user">Manage users</a></li>
            <%
              }
            %>
            <%
            }
            %> 
          </ul>
        </li>
      </ul>
    </div>
  </div>
</nav>
</html>
