<%-- Created by IntelliJ IDEA. User: gq Date: 13/09/2022 Time: 10:22 To change this template use File | Settings | File
  Templates. --%>
  <%@ page contentType="text/html;charset=UTF-8" %>
    <%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
      <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
        <%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c' %>

          <tags:jsp_imports />

          <!DOCTYPE html>
            <html lang="en" itemscope itemtype="http://schema.org/WebPage">

            <head>
              <title>Forgot your password?</title>
              <!-- Favicon -->
              <link rel="icon" type="image/x-icon" href="../static/img/favicon/favicon.ico" />

              <!-- Fonts -->
              <link rel="preconnect" href="https://fonts.googleapis.com" />
              <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
              <link
                href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap"
                rel="stylesheet" />

              <!-- Icons. Uncomment required icon fonts -->
              <link rel="stylesheet" href="../static/vendor/fonts/boxicons.css" />

              <!-- Core CSS -->
              <link rel="stylesheet" href="../assets/css/core.css" class="template-customizer-core-css" />
              <link rel="stylesheet" href="../assets/css/theme-default.css"
                class="template-customizer-theme-css" />
              <link rel="stylesheet" href="../assets/css/demo.css" />

              <!-- Vendors CSS -->
              <link rel="stylesheet" href="../assets/libs/perfect-scrollbar/perfect-scrollbar.css" />

              <!-- Page CSS -->
              <!-- Page -->
              <link rel="stylesheet" href="../assets/css/pages/page-auth.css" />
              <!-- Helpers -->
              <script src="../assets/js/helpers.js"></script>

              <!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
              <!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
              <script src="../assets/js/config.js"></script>

              <tags:css_imports />
            </head>

            <body>
              <%--Body--%>
                <div class="d-flex justify-content-center align-items-center" style="height: 100vh; background: url(../assets/img/bgdep2.jpg); background-repeat: no-repeat; background-size: cover;">
                  <div class="authentication-wrapper authentication-basic container-p-y">
                    <div class="authentication-inner py-4">
                      <!-- Forgot Password -->
                      <div class="card">
                        <div class="card-body text-center">
                          <!-- Logo -->
                          <div class="app-brand justify-content-center">
                            <a href="${get.context.path}" class="app-brand-link gap-2">
                              <span class="app-brand-logo demo">
                                <svg width="25" viewBox="0 0 25 42" version="1.1" xmlns="http://www.w3.org/2000/svg"
                                  xmlns:xlink="http://www.w3.org/1999/xlink">
                                  <defs>
                                    <path
                                      d="M13.7918663,0.358365126 L3.39788168,7.44174259 C0.566865006,9.69408886 -0.379795268,12.4788597 0.557900856,15.7960551 C0.68998853,16.2305145 1.09562888,17.7872135 3.12357076,19.2293357 C3.8146334,19.7207684 5.32369333,20.3834223 7.65075054,21.2172976 L7.59773219,21.2525164 L2.63468769,24.5493413 C0.445452254,26.3002124 0.0884951797,28.5083815 1.56381646,31.1738486 C2.83770406,32.8170431 5.20850219,33.2640127 7.09180128,32.5391577 C8.347334,32.0559211 11.4559176,30.0011079 16.4175519,26.3747182 C18.0338572,24.4997857 18.6973423,22.4544883 18.4080071,20.2388261 C17.963753,17.5346866 16.1776345,15.5799961 13.0496516,14.3747546 L10.9194936,13.4715819 L18.6192054,7.984237 L13.7918663,0.358365126 Z"
                                      id="path-1"></path>
                                    <path
                                      d="M5.47320593,6.00457225 C4.05321814,8.216144 4.36334763,10.0722806 6.40359441,11.5729822 C8.61520715,12.571656 10.0999176,13.2171421 10.8577257,13.5094407 L15.5088241,14.433041 L18.6192054,7.984237 C15.5364148,3.11535317 13.9273018,0.573395879 13.7918663,0.358365126 C13.5790555,0.511491653 10.8061687,2.3935607 5.47320593,6.00457225 Z"
                                      id="path-3"></path>
                                    <path
                                      d="M7.50063644,21.2294429 L12.3234468,23.3159332 C14.1688022,24.7579751 14.397098,26.4880487 13.008334,28.506154 C11.6195701,30.5242593 10.3099883,31.790241 9.07958868,32.3040991 C5.78142938,33.4346997 4.13234973,34 4.13234973,34 C4.13234973,34 2.75489982,33.0538207 2.37032616e-14,31.1614621 C-0.55822714,27.8186216 -0.55822714,26.0572515 -4.05231404e-15,25.8773518 C0.83734071,25.6075023 2.77988457,22.8248993 3.3049379,22.52991 C3.65497346,22.3332504 5.05353963,21.8997614 7.50063644,21.2294429 Z"
                                      id="path-4"></path>
                                    <path
                                      d="M20.6,7.13333333 L25.6,13.8 C26.2627417,14.6836556 26.0836556,15.9372583 25.2,16.6 C24.8538077,16.8596443 24.4327404,17 24,17 L14,17 C12.8954305,17 12,16.1045695 12,15 C12,14.5672596 12.1403557,14.1461923 12.4,13.8 L17.4,7.13333333 C18.0627417,6.24967773 19.3163444,6.07059163 20.2,6.73333333 C20.3516113,6.84704183 20.4862915,6.981722 20.6,7.13333333 Z"
                                      id="path-5"></path>
                                  </defs>
                                  <g id="g-app-brand" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                                    <g id="Brand-Logo" transform="translate(-27.000000, -15.000000)">
                                      <g id="Icon" transform="translate(27.000000, 15.000000)">
                                        <g id="Mask" transform="translate(0.000000, 8.000000)">
                                          <mask id="mask-2" fill="white">
                                            <use xlink:href="#path-1"></use>
                                          </mask>
                                          <use fill="#696cff" xlink:href="#path-1"></use>
                                          <g id="Path-3" mask="url(#mask-2)">
                                            <use fill="#696cff" xlink:href="#path-3"></use>
                                            <use fill-opacity="0.2" fill="#FFFFFF" xlink:href="#path-3"></use>
                                          </g>
                                          <g id="Path-4" mask="url(#mask-2)">
                                            <use fill="#696cff" xlink:href="#path-4"></use>
                                            <use fill-opacity="0.2" fill="#FFFFFF" xlink:href="#path-4"></use>
                                          </g>
                                        </g>
                                        <g id="Triangle"
                                          transform="translate(19.000000, 11.000000) rotate(-300.000000) translate(-19.000000, -11.000000) ">
                                          <use fill="#696cff" xlink:href="#path-5"></use>
                                          <use fill-opacity="0.2" fill="#FFFFFF" xlink:href="#path-5"></use>
                                        </g>
                                      </g>
                                    </g>
                                  </g>
                                </svg>
                              </span>
                              <span class="app-brand-text demo text-body fw-bolder">Cosy Stays</span>
                            </a>
                          </div>
                          <h4 class="mb-2">Forgot your password? 🔒</h4>
                          <p class="mb-4">Enter your email, and we will send you instructions to restore your account.</p>
                         
                          
                          <form:form id="formAuthentication" role="multipart/form-data"
                            action="${pageContext.request.contextPath}/forgotpsw/sendCode" method="post">
                            <div class="input-group input-group-outline mb-3">
                              <label for="correo" class="form-label">Enter your email</label>
                              <input #correo name="correo" type="email" class="form-control"
                              autofocus />
                            </div>
                            <button type="submit" class="btn btn-primary d-grid w-100">Send recovery code</button>
                          </form:form>
                          <div class="container">
                            <p class="mt-4 mb-4">After requesting your code, continue to fill out and submit the following form:</p>
                          </div>
                          <form:form id="formReestablecerPass" role="multipart/form-data"
                            action="${pageContext.request.contextPath}/forgotpsw/reestablishPassword" method="post">
                            <div class="input-group input-group-outline mb-3">
                              <label for="correo" class="form-label">Enter your email</label>
                              <input #correo id="correo" name="correo" type="email" class="form-control"
                              autofocus />
                            </div>
                            <div class="input-group input-group-outline mb-3">
                              <label for="codigo" class="form-label">Recovery code</label>
                              <input #codigo id="codigo" name="codigo" type="text" class="form-control"
                              autofocus/>
                            </div>
                            <div class="input-group input-group-outline mb-3">
                              <label class="form-label">New password</label>
                              <input #password path="password" name="password" id="floatingPassword1" type="password"
                                class="form-control is-invalid" oninput="verificarPasswords(); return false" required>
                            </div>
                            <div class="input-group input-group-outline mb-3">
                              <label class="form-label">Confirm your password</label>
                              <input id="floatingPassword2" type="password" class="form-control is-invalid"
                                oninput="verificarPasswords(); return false" required>
                            </div>
                            <div id="error816" class="text-danger d-none">
                              Password must be greater than 8 characters and less than 16 characters
                            </div>
                            <div id="error" class="text-danger d-none">
                              Password mismatch
                            </div>
                            <div id="ok" class="text-success d-none">
                              Password matching
                            </div>
                            <button type="submit" class="btn btn-primary d-grid w-100">Reset password</button>
                          </form:form>
                          <script>
                            function verificarPasswords() {
                              clave1 = document.getElementById("floatingPassword1");
                              clave2 = document.getElementById("floatingPassword2");
                              if (clave1.value.length > 7 && clave1.value.length < 17) {
                                if (clave1.value !== "") {
                                  if (clave2.value !== "") {
                                    if (clave1.value !== clave2.value) {
                                      document.getElementById("error").classList.remove("d-none");
                                      document.getElementById("ok").classList.add("d-none");
                                      document.getElementById("error816").classList.add("d-none");
                                      document.getElementById("btnRegistrar").disabled = true;
                                      document.getElementById("btnRegistrar").style = "border-color: grey !important; background-color: ghostwhite !important; color: grey !important;";
                                      //return false;
                                    } else {
                                      document.getElementById("error").classList.add("d-none");
                                      document.getElementById("error816").classList.add("d-none");
                                      document.getElementById("ok").classList.remove("d-none");
                                      document.getElementById("btnRegistrar").disabled = false;
                                      document.getElementById("btnRegistrar").style = "border-color: black !important; background-color: palevioletred !important; color: white !important";
                                      //return true;
                                    }
                                  } else {
                                    defaultValues();
                                  }
                                } else {
                                  defaultValues();
                                }
                              } else {
                                defaultValues();
                                document.getElementById("error816").classList.remove("d-none");
                              }
                            }

                            function defaultValues() {
                              document.getElementById("error").classList.add("d-none");
                              document.getElementById("error816").classList.add("d-none");
                              document.getElementById("ok").classList.add("d-none");
                              document.getElementById("btnRegistrar").disabled = true;
                              document.getElementById("btnRegistrar").style = "border-color: grey !important; background-color: ghostwhite !important; color: grey !important;";
                            }

                          </script>
                          <div class="text-center">
                            <a href="/login" class="d-flex align-items-center justify-content-center">
                              <i class="bx bx-chevron-left scaleX-n1-rtl bx-sm"></i>
                              Login again
                            </a>
                          </div>
                        </div>
                      </div>
                      <!-- /Forgot Password -->
                    </div>
                  </div>
                </div>

                <!-- Core JS -->
                <!-- build:js assets/vendor/js/core.js -->
                <script src="../static/vendor/libs/jquery/jquery.js"></script>
                <script src="../static/vendor/libs/popper/popper.js"></script>
                <script src="../static/vendor/js/bootstrap.js"></script>
                <script src="../static/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>

                <script src="../static/vendor/js/menu.js"></script>
                <!-- endbuild -->

                <!-- Vendors JS -->

                <!-- Main JS -->
                <script src="../static/js/main.js"></script>

                <!-- Page JS -->

                <!-- Place this tag in your head or just before your close body tag. -->
                <script async defer src="https://buttons.github.io/buttons.js"></script>
            </body>
            <tags:js_imports />

            </html>