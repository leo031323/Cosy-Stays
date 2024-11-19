<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

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
        <button class="multisteps-form__progress-btn js-active" type="button" title="User Info" id="progressType">Property type</button>
        <button class="multisteps-form__progress-btn" type="button" title="Address" id="progressLocation">position</button>
        <button class="multisteps-form__progress-btn" type="button" title="Order Info" id="progressCharacteristic">Characteristics</button>
        <button class="multisteps-form__progress-btn" type="button" title="Comments" id="progressImage">Images</button>
        <button class="multisteps-form__progress-btn" type="button" title="Comments" id="progressAmenity">Specific characteristic</button>
      </div>
    </div>
  </div>
  <!--form panels-->
  <div class="row">
    <div class="m-auto col-12 col-lg-8 ">


      <div class="multisteps-form__form">

      <%--@elvariable id="publication" type=""--%>
      <form:form role="form" method="post" action="/publication/edition/${publication.id}" modelAttribute="publication" class="text-start" id="form" enctype="multipart/form-data" >

        <div class="multisteps-form__panel shadow p-4 rounded bg-white js-active" data-animation="scaleIn">
          <h3 class="multisteps-form__title">Property Type</h3>
          <div class="multisteps-form__content">


            <div class="form-row mt-4 shadow-none p-3 mb-5 bg-light rounded">

                <%--@elvariable id="types" type=""--%>
              <form:select path="typeId" class="multisteps-form__select form-control" id="inputType">
                <option>Select a property type</option>
                <c:forEach items="${types}" var="type">

                  <c:if test="${publication.typeId.id == type.id}">
                    <form:option value="${type.id}"  label="${type.type}" selected="true"/>
                  </c:if>
                  <c:if test="${publication.typeId.id != type.id}">
                    <form:option value="${type.id}" label="${type.type}"/>
                  </c:if>

                </c:forEach>
              </form:select>

              <form:errors path="typeId" cssClass="error" element="div" />
                  <div class="text-danger"  id="divType" ></div>


            </div>

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
              <div class="input-group input-group-outline o my-3 is-focused">
                <label class="form-label">Street(*)</label>
                <form:input class="multisteps-form__input form-control " type="text" path="street" id="inputStreet"/>
              </div>

                <div class="text-danger"  id="divStreet" ></div>
            </div>



            <div class="mt-5">
              <div class="input-group input-group-outline o my-3 is-focused">
                <label class="form-label">Height (*)</label>
                <form:input class="multisteps-form__input form-control" type="number" path="height"  id="inputRentPublication"/>
              </div>
              <div class="text-danger"  id="divRent" ></div>
            </div>



            <div class="form-row mt-4 shadow-none p-3 mb-5 bg-light rounded">
              <select class="multisteps-form__select form-control" name="province" id="inputProvince">
                <option >Select a province</option>
                <option value="Misiones" selected>ZheJiang</option>
              </select>
              <div class="text-danger"  id="divProvince" ></div>
            </div>

            <div class="form-row mt-4 shadow-none p-3 mb-5 bg-light rounded">
              <form:select path="cityId" class="multisteps-form__select form-control" id="inputCity">
                <option>Select a city</option>
                <c:forEach items="${cities}" var="city">

                  <c:if test="${publication.cityId.id == city.id}">
                    <form:option value="${city.id}" label="${city.city}" selected="true"/>
                  </c:if>
                  <c:if test="${publication.cityId.id != city.id}">
                    <form:option value="${city.id}" label="${city.city}"/>
                  </c:if>

                </c:forEach>

              </form:select>
              <div class="text-danger"  id="divCiudad" ></div>
            </div>


            <div class="form-row mt-4  shadow-none p-3 mb-5 bg-light rounded">
              <div class="col">

                <div id="map" style="width: 100%; height:450px"></div>


                <form:input type="hidden" id="latitud" name="latitud" path="latitude" value="${publication.latitude}"/>
                <form:input type="hidden" id="longitud" name="longitud" path="longitude" value="${publication.longitude}"/>
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

        <div class="multisteps-form__panel shadow p-4 rounded bg-white" data-animation="scaleIn">
          <h3 class="multisteps-form__title">General characteristics</h3>
          <div class="multisteps-form__content">

            <div class="mt-5">
              <div class="input-group input-group-outline o my-3 is-focused">
                <label class="form-label">LivingRooms</label>
                <form:input type="number" class="form-control"  path="livingRoom" id="inputLivingRoom"/>
              </div>
              <div class="text-danger"  id="divLivingRoom" ></div>
            </div>



            <div class="mt-5">
              <div class="input-group input-group-outline o my-3 is-focused">
                <label class="form-label">Bedrooms</label>
                <form:input type="number" class="form-control"  path="bedroom" id="inputBedroom"/>
              </div>
              <div class="text-danger"  id="divBedroom" ></div>
            </div>


            <div class="mt-5">
              <div class="input-group input-group-outline o my-3 is-focused">
                <label class="form-label">Bathrooms</label>
                <form:input type="number" class="form-control" path="bathroom" id="inputBathroom"/>
              </div>
              <div class="text-danger"  id="divBathroom" ></div>
            </div>



            <div class="mt-5">
              <div class="input-group input-group-outline o my-3 is-focused">
                <label class="form-label">Garage</label>
                <form:input type="number" class="form-control"  path="garage" id="inputGarage"/>
              </div>
              <div class="text-danger"  id="divGarage" ></div>
            </div>


            <div class="mt-5">
              <div class="input-group input-group-outline o my-3 is-focused">
                <label class="form-label">Covered area</label>
                <form:input type="number" class="form-control"  path="coveredArea" id="inputSurfaceCoverage"/>
              </div>
              <div class="text-danger"  id="divSurfaceCoverage" ></div>
            </div>


            <div class="mt-5">
              <div class="input-group input-group-outline o my-3 is-focused">
                <label class="form-label">Total area</label>
                <form:input type="number" class="form-control"  path="totalArea" id="inputSurfaceTotal"/>
              </div>
              <div class="text-danger"  id="divSurfaceTotal" ></div>
            </div>



            <div class="mt-5">
              <div class="input-group input-group-outline o my-3 is-focused">
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
              <div class="input-group input-group-outline o my-3 is-focused">
                <label class="form-label">Qualification (*)</label>
                <form:input class="multisteps-form__input form-control" type="text" path="title"  id="inputTitle"/>
              </div>
              <div class="text-danger"  id="divTitle" ></div>
            </div>

            <div class="mt-5">
              <div class="input-group input-group-outline my-3 is-focused">
              <label class="form-label">Publication description (*)</label>
                <form:textarea class="multisteps-form__input form-control" type="text" path="description"  id="inputDescription"/>
              </div>
              <div class="text-danger"  id="divDescription" ></div>
            </div>


            <div class="form-row mt-4  shadow-none p-3 mb-5 bg-light rounded">
              <div class="col">
                <div class="drop-area">
                  <div id="preview"></div>
                  <h2>Drag and drop images</h2>
                  <span>O</span>
                  <button type="button">Select your files</button>
                  <input type="file" name="file[]" placeholder="Imagen" multiple id="input-file" accept="image/*" hidden/>
                </div>
                <div class="text-danger"  id="divImages" ></div>
              </div>
            </div>

              <div class="form-row mt-4  shadow-none p-3 mb-5 bg-light rounded">
                <div class="col">
                  <c:forEach items="${publication.images}" var="imagen">
                          <img src="../../assets/img/rents/${imagen.url}" alt="imagen" height="100">


                    </c:forEach>
                </div>
              </div>

          </div>
        <form:input path="state" type="hidden"/>
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

`
          <c:forEach items="${amenities}" var="amenity">

            <div class="form-row mt-4  shadow-none p-3 mb-5 bg-light rounded">
              <h6>${amenity.amenity}</h6>
              <c:forEach items="${characteristicAmenities}"  var="characteristic" >

                <c:if test="${characteristic.amenityId.amenityId == amenity.amenityId}">
                    <div class="col form-check-inline">

                      <c:if test="${publication.characteristicAmenities.contains(characteristic)}">
                        <form:checkbox path="characteristicAmenities" value="${characteristic.characteristicId}" class="form-check-input" checked="true"/>
                        <label class="form-check-label" >${characteristic.characteristicName}</label>
                      </c:if>

                      <c:if test="${!publication.characteristicAmenities.contains(characteristic)}">
                        <form:checkbox path="characteristicAmenities" value="${characteristic.characteristicId}" class="form-check-input" />
                        <label class="form-check-label" >${characteristic.characteristicName}</label>
                      </c:if>

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
              <button class="btn btn-success ml-auto" type="submit" title="Send">Send</button>
            </div>
          </div>

        </div>

      </form:form>
      </div>
    </div>
  </div>
</div>

<script src="../../assets/js/plugins/multistep.js"></script>
<script src="../../assets/js/editMap.js"></script>
<script src="../../assets/js/validacionCrear.js"></script>
<script src="../../assets/js/dragAndDrop.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDFRitCKrHHCHbh9KlJed9j697DDQEW-Go&callback=iniciarMap"></script>
<script>document.querySelector('button[type="submit"]').addEventListener('click', function() {
    console.log('Submit button clicked');
});
</script>
</body>
</html>

