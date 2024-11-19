<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>

<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <tags:css_imports/>

    <title>Document</title>
</head>
<body>

<div class="page-header align-items-start min-vh-100" style="background-image: url('../../assets/img/bgdep2.jpg');">
    <span class="mask bg-gradient-dark opacity-5"></span>
    <%--            NavbarStart--%>
    <%@include file="../common/navBar2.jsp"%>
    <%--            NavbarEnd--%>
    <div class="container my-auto mt-8">
        <div class="row">
            <div class="col-lg-7 col-md-10">
                <h1 class="text-white">Register your property</h1>
            </div>
        </div>
        <div class="card h-100 align-content-xxl-center mt-3">
            <%@include file="../common/multistepForm.jsp"%>
        </div>

    </div>
    <%-- JS_Imports --%>
    <tags:js_imports/>
    <%-- JS_Imports --%>
</div>

</body>
</html>

