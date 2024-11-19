<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: gq
  Date: 27/09/2022
  Time: 16:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<tags:jsp_imports/>
<html>
<head>
    <title>Title</title>
  <link href="../../assets/css/multistep.css" rel="stylesheet" />
  <link rel="stylesheet" href="https://unpkg.com/leaflet@1.9.1/dist/leaflet.css" integrity="sha256-sA+zWATbFveLLNqWO2gtiw3HL/lh1giY/Inf1BJ0z14=" crossorigin=""/>
  <link href="../../assets/css/dragAndDrop.css" rel="stylesheet">

</head>

<body>
<div class="multisteps-form">
  <!--progress bar-->
  <div class="row mt-5">
    <div class=" ml-auto mr-auto mb-4">
      <div class="multisteps-form__progress">
        <button class="multisteps-form__progress-btn js-active" type="button" title="User Info" id="progressType">Property Type</button>
        <button class="multisteps-form__progress-btn" type="button" title="Address" id="progressLocation">Location</button>
        <button class="multisteps-form__progress-btn" type="button" title="Order Info" id="progressCharacteristic">Characteristics</button>
        <button class="multisteps-form__progress-btn" type="button" title="Comments" id="progressImage">Images</button>
        <button class="multisteps-form__progress-btn" type="button" title="Comments" id="progressAmenity">Specific characteristics</button>
      </div>
    </div>
  </div>
  <!--form panels-->
  <div class="row">
    <div class="m-auto col-12 col-lg-8 ">


      <div class="multisteps-form__form">

      <%--@elvariable id="publication" type=""--%>
      <form:form role="form" method="post" action="/publication/new" modelAttribute="publication"  class="text-start" id="form" enctype="multipart/form-data" >

        <!--PANEL TIPO DE PROPIEDAD-->
        <div class="multisteps-form__panel shadow p-4 rounded bg-white js-active" data-animation="scaleIn">
          <h3 class="multisteps-form__title">Property Type</h3>
          <div class="multisteps-form__content">

            <div class="form-row mt-4 shadow-none p-3 mb-5 bg-light rounded">
                <%--@elvariable id="types" type=""--%>
              <form:select path="typeId" class="multisteps-form__select form-control" id="inputType">
                <option value="">Select a property type (*)</option>
                <c:forEach items="${types}" var="type">
                  <form:option value="${type.id}" label="${type.type}" />
                </c:forEach>
              </form:select>

              <form:errors path="typeId" cssClass="text-danger" element="div"/>
                  <div class="text-danger"  id="divType" ></div>


            </div>
<%--            Los campos marcados con * son obligatorios--%>
            <div>Fields marked with (*) are required</div>
            <div class="button-row d-flex mt-4">
              <button class="btn btn-primary ml-auto js-btn-next" type="button" title="Next">Next</button>
            </div>
          </div>
        </div>


        <!--PANEL UBICACIÓN-->
        <div class="multisteps-form__panel shadow p-4 rounded bg-white" data-animation="scaleIn">
          <h3 class="multisteps-form__title">Address</h3>
          <div class="multisteps-form__content">



            <div>
              <div class="input-group input-group-outline my-3 ">
                <label class="form-label">Street (*)</label>
                <form:input class="multisteps-form__input form-control " type="text" path="street" id="inputStreet"/>
              </div>
              <div class="text-danger"  id="divStreet" ></div>
            </div>

            <div class="mt-5">
              <div class="input-group input-group-outline my-3 ">
                <label class="form-label">Height (*)</label>
                <form:input class="multisteps-form__input form-control" type="number" path="height"  id="inputRentPublication"/>
              </div>
              <div class="text-danger"  id="divRent" ></div>
            </div>

            <div class="form-row mt-4 shadow-none p-3 mb-5 bg-light rounded">
              <select class="multisteps-form__select form-control" name="province" id="inputProvince">
                <option value="">Select a province (*)</option>
                <option value="Misiones">ZheJiang</option>
              </select>
              <div class="text-danger"  id="divProvince" ></div>
            </div>

            <div class="form-row mt-4 shadow-none p-3 mb-5 bg-light rounded">
              <form:select path="cityId" class="multisteps-form__select form-control" id="inputCity">
                <option value="">Select a city (*)</option>
                <c:forEach items="${cities}" var="city">
                  <form:option value="${city.id}" label="${city.city}"/>
                </c:forEach>
              </form:select>
              <div class="text-danger"  id="divCiudad" ></div>
            </div>


            <div class="form-row mt-4  shadow-none p-3 mb-5 bg-light rounded">
              <div class="col">
<%--                  <div id="map"></div>--%>
                <div id="map" style="width: 100%; height:450px"></div>

<%--                <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d4198.158044205938!2d-55.77119880812339!3d-27.77231641207666!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x94563758e73ae093%3A0x4642bcf36db682e7!2sKulipadel!5e0!3m2!1ses-419!2sar!4v1664591023556!5m2!1ses-419!2sar"  width="100%" height="450" frameborder="0" style="border:0" allowfullscreen></iframe>--%>

                <form:input type="hidden" id="latitud" name="latitud" path="latitude" />
                <form:input type="hidden" id="longitud" name="longitud" path="longitude"/>
                <div class="text-danger"  id="divMap" ></div>
              </div>
            </div>

          <div class="button-row d-flex mt-4 " >
            <div class="col">
              <button class="btn btn-primary js-btn-prev" type="button" title="Prev">Previous</button>
            </div>
            <div class="col text-md-end">
              <button class="btn btn-primary js-btn-next " type="button" title="Next">Next</button>
            </div>
          </div>
        </div>
        </div>

        <!--PANEL CARACTERÍSTICAS-->
        <div class="multisteps-form__panel shadow p-4 rounded bg-white" data-animation="scaleIn">
          <h3 class="multisteps-form__title">General Features</h3>
          <div class="multisteps-form__content">

            <div class="mt-5">
              <div class="input-group input-group-outline my-3 ">
                <label class="form-label">LivingRooms</label>
                <form:input type="number" class="form-control"  path="livingRoom" id="inputLivingRoom"/>
              </div>
              <div class="text-danger"  id="divLivingRoom" ></div>
            </div>


            <div class="mt-5">
              <div class="input-group input-group-outline my-3">
                <label class="form-label">Bedrooms</label>
                <form:input type="number" class="form-control"  path="bedroom" id="inputBedroom"/>
              </div>
              <div class="text-danger"  id="divBedroom" ></div>
            </div>

            <div class="mt-5">
              <div class="input-group input-group-outline my-3 ">
                <label class="form-label">Bathrooms</label>
                <form:input type="number" class="form-control" path="bathroom" id="inputBathroom"/>
              </div>
              <div class="text-danger"  id="divBathroom" ></div>
            </div>

            <div class="mt-5">
              <div class="input-group input-group-outline  my-3 ">
                <label class="form-label">Garage</label>
                <form:input type="number" class="form-control"  path="garage" id="inputGarage"/>
              </div>
              <div class="text-danger"  id="divGarage" ></div>
            </div>

            <div class="mt-5">
              <div class="input-group input-group-outline my-3 ">
                <label class="form-label">Covered area</label>
                <form:input type="number" class="form-control"  path="coveredArea" id="inputSurfaceCoverage"/>
              </div>
              <div class="text-danger"  id="divSurfaceCoverage" ></div>
            </div>

            <div class="mt-5">
              <div class="input-group input-group-outline my-3 ">
                <label class="form-label">Total surface area</label>
                <form:input type="number" class="form-control"  path="totalArea" id="inputSurfaceTotal"/>
              </div>
              <div class="text-danger"  id="divSurfaceTotal" ></div>
            </div>

            <div class="mt-5">
              <div class="input-group input-group-outline my-3 ">
                <label class="form-label">Price (*)</label>
                <form:input type="number" class="form-control" path="price"  id="inputPrice"/>
              </div>
              <div class="text-danger"  id="divPrice" ></div>
            </div>

          </div>

          <div class="button-row d-flex mt-4 " >
            <div class="col">
              <button class="btn btn-primary js-btn-prev" type="button" title="Prev">Previous</button>
            </div>
            <div class="col text-md-end">
              <button class="btn btn-primary js-btn-next " type="button" title="Next">Next</button>
            </div>
          </div>

        </div>

        <!--PANEL IMAGENES-->
        <div class="multisteps-form__panel shadow p-4 rounded bg-white" data-animation="scaleIn">
          <h3 class="multisteps-form__title">Property photos. You can upload up to 3 images</h3>
          <div class="multisteps-form__content">


            <div class="mt-5">
              <div class="input-group input-group-outline my-3">
                <label class="form-label">Qualification (*)</label>
                <form:input class="multisteps-form__input form-control" type="text" path="title"  id="inputTitle"/>
              </div>
              <div class="text-danger"  id="divTitle" ></div>
            </div>

            <div class="mt-5">
              <div class="input-group input-group-outline my-3 is-focused">
                <label class="form-label">Publication description (*)</label>
                <form:textarea class="multisteps-form__input form-control" type="text" path="description" id="inputDescription"/>
              </div>
              <div class="text-danger"  id="divDescription" ></div>
            </div>

            <div class="form-row mt-4 shadow-none p-3 mb-5 bg-light rounded">
              <div class="col">
<%--                <input type="file" name="file[]" placeholder="Image" multiple id="inputImagen" accept="image/*"/>--%>

                <div class="drop-area">
                  <div id="preview"></div>
                  <h2>Drag and drop the image</h2>
                  <span>O</span>
                  <button type="button">Select your files</button>
<%--                  <!-- <input type="file" multiple> -->--%>
                  <input type="file" name="file[]" placeholder="Imagen" multiple id="input-file" accept="image/*" hidden/>
<%--                  <input type="file" name="" id="input-file"  multiple />--%>
                </div>


<%--                accept="image/png,image/jpeg"--%>
                <div class="text-danger"  id="divImages" ></div>
              </div>
            </div>


          </div>

          <div class="button-row d-flex mt-4 " >
            <div class="col">
              <button class="btn btn-primary js-btn-prev" type="button" title="Prev">Previous</button>
              </div>
            <div class="col text-md-end">
                <button class="btn btn-primary js-btn-next " type="button" title="Next">Next</button>
            </div>
          </div>

        </div>

        <!--PANEL COMODIDADES-->
        <div class="multisteps-form__panel shadow p-4 rounded bg-white" data-animation="scaleIn">
          <h3 class="multisteps-form__title">Amenities</h3>
          <div class="multisteps-form__content">


          <c:forEach items="${amenities}" var="amenity">

            <div class="form-row mt-4  shadow-none p-3 mb-5 bg-light rounded">
              <h6>${amenity.amenity}</h6>
              <c:forEach items="${characteristicAmenities}"  var="characteristic" >

                <c:if test="${characteristic.amenityId.amenityId == amenity.amenityId}">
                    <div class="col form-check-inline">
                      <form:checkbox path="caracteristicasComodidades" value="${characteristic.characteristicId}" class="form-check-input "/>
                      <label class="form-check-label" >${characteristic.characteristicName}</label>
                    </div>
                </c:if>

              </c:forEach>
            </div>

          </c:forEach>



          </div>



          <div class="button-row d-flex mt-4 " >
            <div class="col">
              <button class="btn btn-primary js-btn-prev" type="button" title="Prev">Previous</button>
            </div>
            <div class="col text-md-end">
              <button class="btn btn-success ml-auto" type="submit" title="Send" id="ENVIAR">Send</button>
            </div>
          </div>

        </div>

      </form:form>
      </div>
    </div>
  </div>
</div>

<script src="../../assets/js/plugins/multistep.js"></script>
<%--<script src="https://unpkg.com/leaflet@1.9.1/dist/leaflet.js" integrity="sha256-NDI0K41gVbWqfkkaHj15IzU7PtMoelkzyKp8TOaFQ3s=" crossorigin=""></script>--%>
<script src="../../assets/js/createMap.js"></script>
<script src="../../assets/js/validacionCrear.js"></script>
<script src="../../assets/js/dragAndDrop.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDFRitCKrHHCHbh9KlJed9j697DDQEW-Go&callback=iniciarMap"></script>


</body>
</html>

