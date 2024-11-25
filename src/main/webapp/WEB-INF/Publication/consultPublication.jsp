    <%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<tags:jsp_imports/>

<!doctype html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <tags:css_imports/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

    <title>Check its properties</title>
</head>
<body>


<div class="page-header align-items-start min-vh-100" style="background-image: url('../../assets/img/bgdep2.jpg');">
    <span class="mask bg-gradient-dark opacity-5"></span>
    <%--            NavbarStart--%>
    <%@include file="../common/navBar2.jsp"%>
    <%--            NavbarEnd--%>
    <div class="container my-auto mt-7">
        <div class="row">
            <div class="col-lg-7 col-md-10">
                <h1 class="text-white">Check its properties</h1>
            </div>
        </div>
        <div class="container mt-sm-5 mt-3">
        <div class="card h-100 align-content-xxl-center">
            <div class="card">
                <div class="row text-center py-2 mt-3">
                    <div class="col-4 mx-auto">
                        <div class="input-group input-group-dynamic mb-4">
                            <span class="input-group-text"><i class="fas fa-search" aria-hidden="true"></i></span>
                            <input class="form-control" placeholder="Search" type="text" id="myInput">
                        </div>
                    </div>
                </div>
                <div class="table-responsive">
                    <table class="table align-items-center mb-0">
                        <thead>
                        <tr>
                            <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Publication</th>
                            <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">Type</th>
                            <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">State</th>
                            <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Views</th>
                            <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Publication date</th>
                            <th class="text-secondary opacity-7"></th>
                        </tr>
                        </thead>
                        <tbody id="myTable">

                        <c:forEach items="${publications}" var="property">


                        <tr style="height:100px">
                            <td>
                                <div class="d-flex px-2 py-1">
                                    <c:if test="${property != null && property.images != null && !property.images.isEmpty()}">
                                        <div>
                                           <img src="../../assets/img/rents/${property.images.get(0).url}" class="avatar avatar-xl me-3" alt="logo">
                                        </div>
                                    </c:if>

                                    <div class="d-flex flex-column justify-content-center">
                                        <a class="mb-0 h6" href="${pageContext.request.contextPath}/publication/chosen-publication/${property.id}">${property.title}</a>
                                        <p class="text-xs text-secondary mb-0">${property.price}</p>
                                    </div>
                                </div>
                            </td>
                            <td>
<%--                                <p class="font-weight-bold mb-0"></p>--%>
                                <p class="text-xs text-secondary mb-0">${property.typeId.type}</p>
                            </td>
                            <td class="align-middle text-center">
                                <c:choose>
                                    <c:when test="${property.state == \"active\" }">
                                        <span class="badge bg-gradient-success">${property.state}</span>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="badge bg-gradient-warning">${property.state}</span>
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td class="align-middle text-center">
                                <span class="text-secondary text-xs font-weight-normal">420</span>
                            </td>
                            <td class="align-middle text-center">
                                <span class="text-secondary text-xs font-weight-normal">${property.dateTime.toLocalDate()}</span>
                            </td>
                            <td class="align-middle">

                                <form:form action="publication-removal-pub/${property.id}" method="post" modelAttribute="publications" name="${property.id}">

<%--                                    class="fa fa-trash"--%>
                                    <form:button type="submit" >Delete</form:button>
                                </form:form>
                            </td>
<%--                                        <a class="fas fa-trash m-3" data-toggle="tooltip" data-original-title="Borrar publicacion"  data-bs-toggle="modal" data-bs-target="#es${propiedad.id}"></a>--%>
<%--                                        <button type="button" onclick="pregunta(${propiedad.id})" class="btn btn-primary"> WENAS TARDES</button>--%>
                            <td class="align-middle">

                                <a href="${pageContext.request.contextPath}/publication/edition/${property.id}"  data-original-title="Editar">EDIT</a>

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






<%-- JS_Imports --%>
    <tags:js_imports/>

    <%-- JS_Imports --%>



    <script>
        function pregunta(id){
            console.log(id);
            document.id.submit()
        }
    </script>

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
                    $(this).data('order', "asc")
                    $("#myTable").find("tr").sort(function (a, b) {
                        var keyA = $(a).find("td").eq(0).text().toUpperCase();
                        var keyB = $(b).find("td").eq(0).text().toUpperCase();
                        if (keyA < keyB) return -1;
                        if (keyA > keyB) return 1;
                        return 0;
                    }).appendTo("#myTable");
                }else{
                    $(this).data('order', "desc")
                    $("#myTable").find("tr").sort(function (a, b) {
                        var keyA = $(a).find("td").eq(0).text().toUpperCase();
                        var keyB = $(b).find("td").eq(0).text().toUpperCase();
                        if (keyA > keyB) return -1;
                        if (keyA < keyB) return 1;
                        return 0;
                    }).appendTo("#myTable");
                }

            });
        });



    </script>
</div>
</body>
</html>

