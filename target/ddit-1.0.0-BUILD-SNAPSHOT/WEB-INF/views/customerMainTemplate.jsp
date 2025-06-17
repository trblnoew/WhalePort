<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en" dir="ltr" data-bs-theme="light" data-color-theme="Blue_Theme" data-layout="vertical">

<head>
  <!-- Required meta tags -->
  <meta charset="UTF-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />

  <!-- Favicon icon-->
  <link rel="shortcut icon" type="image/png" href="${pageContext.request.contextPath }/resources/assets/images/logos/whale-favi.png" />

  <!-- Core Css -->
  <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/css/styles.css" />

  <title>WhalePort</title>
  <!-- Owl Carousel  -->
  <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/libs/owl.carousel/dist/assets/owl.carousel.min.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/libs/aos/dist/aos.css" />
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>

<body>
  <!-- ------------------------------------- -->
  <!-- Top Bar Start -->
  <!-- ------------------------------------- -->
  <div class="topbar-image bg-primary py-1 rounded-0 mb-0 alert alert-dismissible fade show" role="alert">
    <div class="d-flex justify-content-center gap-sm-3 gap-2 align-items-center text-center flex-md-nowrap flex-wrap">
      <span class="badge bg-white bg-opacity-10 fs-2 fw-bolder px-2">New</span>
      <p class="mb-0 text-white fw-bold">WhalePort 신입 채용 안내 !</p>
    </div>
    <button type="button" class="btn-close btn-close-white p-2 fs-2" data-bs-dismiss="alert" aria-label="Close"></button>
  </div>
  <!-- ------------------------------------- -->
  <!-- Top Bar End -->
  <!-- ------------------------------------- -->

   
   <!-- header -->
   <tiles:insertAttribute name="cusHeader" />
   
   <!-- content -->
   <tiles:insertAttribute name="cusContent" />    

   <!-- footer -->
   <tiles:insertAttribute name="cusFooter" />    
   
   
      <!-- Scroll Top -->
  <a href="javascript:void(0)" class="top-btn btn btn-primary d-flex align-items-center justify-content-center round-54 p-0 rounded-circle">
    <i class="ti ti-arrow-up fs-7"></i>
  </a>

  <script src="${pageContext.request.contextPath }/resources/assets/js/vendor.min.js"></script>
  <!-- Import Js Files -->
  <script src="${pageContext.request.contextPath }/resources/assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
  <script src="${pageContext.request.contextPath }/resources/assets/libs/simplebar/dist/simplebar.min.js"></script>
  <script src="${pageContext.request.contextPath }/resources/assets/js/theme/app.init.js"></script>
  <script src="${pageContext.request.contextPath }/resources/assets/js/theme/theme.js"></script>
  <script src="${pageContext.request.contextPath }/resources/assets/js/theme/app.min.js"></script>
   <script src="${pageContext.request.contextPath }/resources/assets/js/theme/app.rtl.init.js"></script>

  <!-- solar icons -->
  <script src="https://cdn.jsdelivr.net/npm/iconify-icon@1.0.8/dist/iconify-icon.min.js"></script>
  <script src="${pageContext.request.contextPath }/resources/assets/libs/owl.carousel/dist/owl.carousel.min.js"></script>
  <script src="${pageContext.request.contextPath }/resources/assets/libs/jquery-steps/build/jquery.steps.min.js"></script>
  <script src="${pageContext.request.contextPath }/resources/assets/libs/jquery-validation/dist/jquery.validate.min.js"></script>
  <script src="${pageContext.request.contextPath }/resources/assets/js/forms/form-wizard.js"></script>
  <script src="${pageContext.request.contextPath }/resources/assets/js/apps/productDetail.js"></script>
  <script src="${pageContext.request.contextPath }/resources/assets/libs/quill/dist/quill.min.js"></script>
  <script src="${pageContext.request.contextPath }/resources/assets/js/forms/quill-init.js"></script>
  
    
  <script src="${pageContext.request.contextPath }/resources/assets/js/extra-libs/jqbootstrapvalidation/validation.js"></script>
  <script src="${pageContext.request.contextPath }/resources/assets/js/forms/custom-validation-init.js"></script>
  
  
  <!-- SweetAlert2 -->
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
  <script src="${pageContext.request.contextPath }/resources/assets/libs/sweetalert2/dist/sweetalert2.min.js"></script>
  <script src="${pageContext.request.contextPath }/resources/assets/js/forms/sweet-alert.init.js"></script>
  <c:if test="${not empty message }">
	<script type="text/javascript">
	console.log("${message}");
	Swal.fire({
        title: '${msg}',
        text: '${message}',
        icon: '${msg ne "오류"? "success":"error" }',
        confirmButtonText: '확인'
     });
	
	 $(document).on('keypress', function(e) {
         if (e.which === 13) { // Enter 키 코드
            $('.swal2-modal').hide(); // SweetAlert 모달 닫기
         }
      });
	
	</script>
	<c:remove var="message" scope="session" />
</c:if>


</body>

</html>