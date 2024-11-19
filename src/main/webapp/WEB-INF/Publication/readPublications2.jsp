<%--
  Created by IntelliJ IDEA.
  User: gq
  Date: 29/10/2022
  Time: 10:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<tags:jsp_imports/>
<html>
<head>
    <title>Check publication</title>
  <tags:css_imports/>
</head>
<body class="bg-gray-200">
<%@include file="../common/navBar2.jsp"%>
<div class="container-fluid pt-5 mt-5">
  <div class="row px-xl-5">

    <!-- Search Filter sidebar -->
    <div class="col-lg-3 col-md-12 p-3">
        <div class="card p-3">
          <div class="card-header">
            <h4 class="card-title">Can be filtered through:</h4>
          </div>
        <!-- Price start -->
        <div class="border-bottom mb-4 pb-4">
          <h5 class="font-weight-semi-bold mb-4"><i class="fas fa-dollar-sign text-primary me-3"></i>Price</h5>
          <form>
            <div class="form-group mb-4">
              <label>Since:</label>
              <input type="range" value="1" min="1000" max="100000" step="500" oninput="this.nextElementSibling.value = this.value">
              $<output>1</output>
            </div>
            <div class="form-group mb-4">
              <label>Until:</label>
              <input type="range" value="15000" min="1000" max="100000" step="500" oninput="this.nextElementSibling.value = this.value">
              $<output>15000</output>
            </div>
          </form>
        </div>
        <!-- Price end -->

          <!-- Dimensions start -->
          <div class="border-bottom mb-4 pb-4">
            <h5 class="font-weight-semi-bold mb-4"><i class="fas fa-ruler-combined text-primary me-3"></i>Dimensions </h5>
            <form>
              <div class="form-group mb-4">
                <label>Since:</label>
                <input type="range" value="1" min="0" max="100000" step="500" oninput="this.nextElementSibling.value = this.value">
                <output>1</output> m2
              </div>
              <div class="form-group mb-4">
                <label>Until:</label>
                <input type="range" value="15000" min="0" max="100000" step="500" oninput="this.nextElementSibling.value = this.value">
                <output>15000</output> m2
              </div>
            </form>
          </div>
          <!-- Dimensions end -->

            <!-- Type of property start -->
            <div class="border-bottom mb-4 pb-4">
              <h5 class="font-weight-semi-bold mb-4"><i class="fas fa-home text-primary me-3"></i>Type of Property</h5>
              <form>
                <div class="form-check">
                  <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault33">
                  <label class="form-check-label" for="flexCheckDefault33">
                    House
                  </label>
                </div>
                <div class="form-check">
                  <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault98">
                  <label class="form-check-label" for="flexCheckDefault98">
                    Single apartment
                  </label>
                </div>
                <div class="form-check">
                  <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault44">
                    <label class="form-check-label" for="flexCheckDefault44">
                      Duplexes
                    </label>
                </div>
                <div class="form-check">
                  <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault39">
                  <label class="form-check-label" for="flexCheckDefault39">
                    Locals
                  </label>
                </div>
                <div class="form-check">
                  <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault374">
                  <label class="form-check-label" for="flexCheckDefault374">
                    Offices
                  </label>
                </div>
                <div class="form-check">
                  <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault334">
                  <label class="form-check-label" for="flexCheckDefault334">
                    Cabins
                  </label>
                </div>
                </form>
            </div>

            <!-- Type of property end -->

            <!-- Location start -->
            <div class="border-bottom mb-4 pb-4">
              <h5 class="font-weight-semi-bold mb-4"><i class="fas fa-map-marker-alt text-primary me-3"></i>Location</h5>
              <form>
                <div class="form-group">
                  <label class="form-label">Province</label>
                  <select class="form-select" aria-label="Default select example">
                    <option selected>Select a Province</option>
                    <option value="1">北京市 (Beijing)</option>
                    <option value="2">天津市 (Tianjin)</option>
                    <option value="3">河北省 (Hebei)</option>
                    <option value="4">山西省 (Shanxi)</option>
                    <option value="5">内蒙古自治区 (Inner Mongolia)</option>
                    <option value="6">辽宁省 (Liaoning)</option>
                    <option value="7">吉林省 (Jilin)</option>
                    <option value="8">黑龙江省 (Heilongjiang)</option>
                    <option value="9">上海市 (Shanghai)</option>
                    <option value="10">江苏省 (Jiangsu)</option>
                    <option value="11">浙江省 (Zhejiang)</option>
                    <option value="12">安徽省 (Anhui)</option>
                    <option value="13">福建省 (Fujian)</option>
                    <option value="14">江西省 (Jiangxi)</option>
                    <option value="15">山东省 (Shandong)</option>
                    <option value="16">河南省 (Henan)</option>
                    <option value="17">湖北省 (Hubei)</option>
                    <option value="18">湖南省 (Hunan)</option>
                    <option value="19">广东省 (Guangdong)</option>
                    <option value="20">广西壮族自治区 (Guangxi)</option>
                    <option value="21">海南省 (Hainan)</option>
                    <option value="22">重庆市 (Chongqing)</option>
                    <option value="23">四川省 (Sichuan)</option>
                    <option value="24">贵州省 (Guizhou)</option>
                    <option value="25">云南省 (Yunnan)</option>
                    <option value="26">西藏自治区 (Tibet)</option>
                    <option value="27">陕西省 (Shaanxi)</option>
                    <option value="28">甘肃省 (Gansu)</option>
                    <option value="29">青海省 (Qinghai)</option>
                    <option value="30">宁夏回族自治区 (Ningxia)</option>
                    <option value="31">新疆维吾尔自治区 (Xinjiang)</option>
                    <option value="32">香港特别行政区 (Hong Kong)</option>
                    <option value="33">澳门特别行政区 (Macau)</option>
                    <option value="34">从数据库获取 (Fetch from database)</option>
                  </select>
                </div>
              </form>
            </div>
            <!-- Location end -->

            <!-- Services start -->
            <div class="border-bottom mb-4 pb-4">
              <h5 class="font-weight-semi-bold mb-4"><i class="fas fa-tools text-primary me-3"></i>Services</h5>
              <form>
                <div class="form-check">
                  <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault3112">
                    <label class="form-check-label" for="flexCheckDefault3112">
                      Sink
                    </label>
                </div>
                <div class="form-check">
                  <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault3113">
                  <label class="form-check-label" for="flexCheckDefault3113">
                    They bring you dinner in bed
                  </label>
                </div>
<%--                <div class="form-check">--%>
<%--                  <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault3115">--%>
<%--                  <label class="form-check-label" for="flexCheckDefault3115">--%>
<%--                    I guess this is from the db, so I leave it as it is.--%>
<%--                  </label>--%>
<%--                </div>--%>
                </form>
            </div>

            <!-- Pet friendly start -->
            <div class="border-bottom mb-4 pb-4">
              <h5 class="font-weight-semi-bold mb-4"><i class="fas fa-paw text-primary me-3"></i>Pet friendly</h5>
              <form>
                <div class="form-check">
                  <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault35">
                    <label class="form-check-label" for="flexCheckDefault35">
                      Yes
                    </label>
                </div>
                <div class="form-check">
                  <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault789">
                  <label class="form-check-label" for="flexCheckDefault789">
                    No
                  </label>
                </div>
             </form>
            </div>
            <!-- Pet friendly end -->

          <!-- Garage start -->
          <div class="border-bottom mb-4 pb-4">
            <h5 class="font-weight-semi-bold mb-4"><i class="fas fa-car text-primary me-3"></i>Garage</h5>
            <form>
              <div class="form-check">
                <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault089">
                <label class="form-check-label" for="flexCheckDefault089">
                  Yes
                </label>
              </div>
              <div class="form-check">
                <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault345">
                <label class="form-check-label" for="flexCheckDefault345">
                  No
                </label>
              </div>
            </form>
          </div>
          <!-- Garage end -->

    </div>
    </div>
    <!-- Shop Sidebar End -->

    <!-- Shop Product Start -->
    <div class="col-lg-9 col-md-12 p-3">
      <div class="card p-3">
      <div class="row pb-3">
        <div class="col-12 pb-1">
          <div class="d-flex align-items-center justify-content-between mb-4">
<%--            <form action="">--%>
<%--              <div class="input-group input-group-dynamic w-lg-auto">--%>
<%--                <input type="text" class="form-control" placeholder="Search by name or description">--%>
<%--                <div class="input-group-append">--%>
<%--                  <span class="input-group-text bg-transparent text-primary">--%>
<%--                    <i class="fa fa-search"></i>--%>
<%--                  </span>--%>
<%--                </div>--%>
<%--              </div>--%>
<%--            </form>--%>
  <div class="input-group input-group-dynamic mb-4">
    <span class="input-group-text"><i class="fas fa-search text-primary" aria-hidden="true"></i></span>
    <input class="form-control" placeholder="Look for" type="text" >
  </div>
              <div class="d-flex align-items-center">
                <div class="d-flex align-items-center">
                    <label class="mb-0 me-2">Sort by:</label>
                    <select class="form-select form-select-sm">
                    <option selected>Name</option>
                    <option value="1">Price</option>
                    <option value="2">Dimensions</option>
                    </select>
                </div>
                </div>
          </div>
        </div>
<%--        Publications start--%>
        <div class="row row-cols-1 row-cols-md-3 g-4 mb-5">

          <c:forEach items="${publications}" var="publication">
          <div class="col">
            <div class="card" style="--bs-btn-hover-bg:100">
              <a href="${pageContext.request.contextPath}/publication/chosen-publication/${publication.id}" class="position-relative overflow-hidden" target="_blank">
                <div class="ratio ratio-1x1">
                  <div id="carousel-12" class="carousel slide" data-bs-ride="false">
                    <div class="carousel-inner">
                        <c:if test="${publication != null && publication.images != null && !publication.images.isEmpty()}">
                           <div class="carousel-item active ratio ratio-1x1">
                                <img class="w-100 d-block card-img-top" style="object-fit:cover; height:100%; width: 100%;"
                                    src="../../assets/img/rents/${publication.images.get(0).url}" alt="Slide Image"/>
                           </div>
                        </c:if>

                      <div class="carousel-item ratio ratio-1x1"><img class="w-100 d-block card-img-top" style="object-fit:cover; height:100%; width: 100%;" src="../../assets/img/rents/2.webp" alt="Slide Image" /></div>
                      <div class="carousel-item ratio ratio-1x1"><img class="w-100 d-block card-img-top" style="object-fit:cover; height:100%; width: 100%;" src="../../assets/img/rents/3.webp" alt="Slide Image" /></div>
                    </div>
                    <div><a class="carousel-control-prev" role="button" data-bs-slide="prev"><span class="carousel-control-prev-icon" aria-hidden="true"></span><span class="visually-hidden">Previous</span></a><a class="carousel-control-next" href="#carousel-12" role="button" data-bs-slide="next"><span class="carousel-control-next-icon" aria-hidden="true"></span><span class="visually-hidden">Next</span></a></div>
                    <ol class="carousel-indicators">
                      <li class="active" data-bs-target="#carousel-1" data-bs-slide-to="0"></li>
                      <li data-bs-target="#carousel-12" data-bs-slide-to="1"></li>
                      <li data-bs-target="#carousel-12" data-bs-slide-to="2"></li>
                    </ol>
                  </div>
                </div>
              </a>
              <div class="card-body">
                <h5 class="card-title">${publication.title}</h5>
                <h2 class="card-text"> $ ${publication.price.intValue()}</h2>
                <p class="card-text">
                    ${publication.description}
                </p>
              </div>
            </div>
          </div>
          </c:forEach>

<%--          <div class="col">--%>
<%--            <div class="card">--%>
<%--              <div class="ratio ratio-1x1">--%>
<%--                <img class="card-img-top" style="object-fit:cover; height:100%; width: 100%;" src="../../assets/img/rents/3.webp" alt="Card image cap">--%>
<%--              </div>--%>
<%--              <div class="card-body">--%>
<%--                <h5 class="card-title">hover</h5>--%>
<%--                <p class="card-text">--%>
<%--                  This is a longer card with supporting text below as a natural lead-in to additional content.--%>
<%--                </p>--%>
<%--              </div>--%>
<%--            </div>--%>
<%--          </div>--%>
<%--          <div class="col">--%>
<%--            <div class="card">--%>
<%--              <div class="ratio ratio-1x1">--%>
<%--                <img class="card-img-top" style="object-fit:cover; height:100%; width: 100%;" src="../../assets/img/rents/4.webp" alt="Card image cap">--%>
<%--              </div>--%>
<%--              <div class="card-body">--%>
<%--                <h5 class="card-title">Card title</h5>--%>
<%--                <p class="card-text">--%>
<%--                  This is a longer card with supporting text below as a natural lead-in to additional content.--%>
<%--                  This content is a little bit longer.--%>
<%--                </p>--%>
<%--              </div>--%>
<%--            </div>--%>
<%--          </div>--%>
<%--          <div class="col">--%>
<%--            <div class="card">--%>
<%--              <div class="ratio ratio-1x1">--%>
<%--                <img class="card-img-top" style="object-fit:cover; height:100%; width: 100%;" src="../../assets/img/rents/5.webp" alt="Card image cap">--%>
<%--              </div>--%>
<%--              <div class="card-body">--%>
<%--                <h5 class="card-title">Card title</h5>--%>
<%--                <p class="card-text">--%>
<%--                  This is a longer card with supporting text below as a natural lead-in to additional content.--%>
<%--                  This content is a little bit longer.--%>
<%--                </p>--%>
<%--              </div>--%>
<%--            </div>--%>
<%--          </div>--%>


<%--          <div class="col">--%>
<%--            <div class="card">--%>
<%--              <div class="ratio ratio-1x1">--%>
<%--                <img class="card-img-top" style="object-fit:cover; height:100%; width: 100%;" src="../../assets/img/rents/6.webp" alt="Card image cap">--%>
<%--              </div>--%>
<%--              <div class="card-body">--%>
<%--                <h5 class="card-title"></h5>--%>
<%--                <p class="card-text">--%>

<%--                </p>--%>
<%--              </div>--%>
<%--            </div>--%>
<%--          </div>--%>

        </div>
<%--        Publicaciones end--%>
        <div class="col-12 pb-1">
          <nav aria-label="Page navigation">
            <ul class="pagination justify-content-center mb-3">
              <li class="page-item disabled">
                <a class="page-link" href="#" aria-label="Previous">
                  <span aria-hidden="true">«</span>
                  <span class="sr-only">Anterior</span>
                </a>
              </li>
              <li class="page-item active"><a class="page-link" href="#">1</a></li>
              <li class="page-item"><a class="page-link" href="#">2</a></li>
              <li class="page-item"><a class="page-link" href="#">3</a></li>
              <li class="page-item">
                <a class="page-link" href="#" aria-label="Next">
                  <span aria-hidden="true">»</span>
                  <span class="sr-only">Next</span>
                </a>
              </li>
            </ul>
          </nav>
        </div>
      </div>
    </div>
    </div>
  </div>
    <!-- Shop Product End -->
  </div>


<tags:js_imports/>

<script>
    const buscador = document.querySelector('#buscador');
    const publicaciones = ${publications};

    buscador.addEventListener('keyup', (e) => {

        console.log("holaaaa");
        const text = e.target.value.toLowerCase();
        const cards = document.querySelectorAll('.card');
        cards.forEach((card) => {
            const titulo = card.querySelector('.card-title').textContent.toLowerCase();
            const descripcion = card.querySelector('.card-text').textContent.toLowerCase();
            if (titulo.indexOf(text) != -1 || descripcion.indexOf(text) != -1) {
                card.style.display = 'block';
            } else {
                card.style.display = 'none';
            }
        });
    });

</script>

</body>
</html>
