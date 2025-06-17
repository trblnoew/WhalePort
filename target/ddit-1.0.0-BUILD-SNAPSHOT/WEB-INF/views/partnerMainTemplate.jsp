<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en" dir="ltr" data-bs-theme="light" data-color-theme="Blue_Theme" data-layout="vertical">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>WhalePort Partner</title>
  <meta charset="UTF-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <link rel="shortcut icon" type="image/png" href="${pageContext.request.contextPath }/resources/assets/images/logos/whale-favi.png" />
  <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/css/styles.css" />
  <link rel="stylesheet" href="//cdn.datatables.net/2.1.8/css/dataTables.dataTables.min.css" />
  <link rel="stylesheet" href="//cdn.datatables.net/buttons/3.1.2/css/buttons.dataTables.css" />
  
  
  <link rel="stylesheet" href="//cdn.datatables.net/buttons/3.1.2/css/buttons.dataTables.css" />
  <link rel="stylesheet" href="//cdn.datatables.net/buttons/3.1.2/css/buttons.dataTables.css" />
  <link rel="stylesheet" href="//cdn.datatables.net/buttons/3.1.2/css/buttons.dataTables.css" />
  <link rel="stylesheet" href="//cdn.datatables.net/buttons/3.1.2/css/buttons.dataTables.css" />
  <link rel="stylesheet" href="//cdn.datatables.net/buttons/3.1.2/css/buttons.dataTables.css" />
  <link rel="stylesheet" href="//cdn.datatables.net/buttons/3.1.2/css/buttons.dataTables.css" />
  
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>

<body class="link-sidebar">
	<div class="main-wrapper">
		<!-- aside 영역 -->
		<tiles:insertAttribute name="partnerAside" />

		<div class="page-wrapper">
			<!-- header 영역 -->
			<tiles:insertAttribute name="partnerHeader" />
		
		<!-- content 영역 -->
		<tiles:insertAttribute name="partnerContent" />

		
		</div>
	</div>
	  <!-- Import Js Files -->
  <script src="${pageContext.request.contextPath }/resources/assets/js/vendor.min.js"></script>
  <script src="${pageContext.request.contextPath }/resources/assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
  <script src="${pageContext.request.contextPath }/resources/assets/libs/simplebar/dist/simplebar.min.js"></script>
  <script src="${pageContext.request.contextPath }/resources/assets/js/theme/app.init.js"></script>
  <script src="${pageContext.request.contextPath }/resources/assets/js/theme/theme.js"></script>
  <script src="${pageContext.request.contextPath }/resources/assets/js/theme/app.min.js"></script>
  <script src="${pageContext.request.contextPath }/resources/assets/js/theme/sidebarmenu.js"></script>
  

  <!-- solar icons -->
  <script src="https://cdn.jsdelivr.net/npm/iconify-icon@1.0.8/dist/iconify-icon.min.js"></script>
  <script src="${pageContext.request.contextPath }/resources/assets/libs/fullcalendar/index.global.min.js"></script>
  <script src="${pageContext.request.contextPath }/resources/assets/js/apps/calendar-init.js"></script>
  <script src="${pageContext.request.contextPath }/resources/assets/js/apps/chat.js"></script>
  <script src="${pageContext.request.contextPath }/resources/assets/libs/apexcharts/dist/apexcharts.min.js"></script>
  <script src="${pageContext.request.contextPath }/resources/assets/js/dashboards/dashboard5.js"></script>
  <script src="${pageContext.request.contextPath }/resources/assets/libs/tinymce/tinymce.min.js"></script>
  <script src="${pageContext.request.contextPath }/resources/assets/js/forms/tinymce-init.js"></script>
  <script src="${pageContext.request.contextPath }/resources/assets/libs/quill/dist/quill.min.js"></script>
  <script src="${pageContext.request.contextPath }/resources/assets/js/forms/quill-init.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
  
  <script src="${pageContext.request.contextPath }/resources/assets/js/extra-libs/jqbootstrapvalidation/validation.js"></script>
  <script src="${pageContext.request.contextPath }/resources/assets/js/forms/custom-validation-init.js"></script>
  <script src="https://cdn.datatables.net/2.1.8/js/dataTables.js"></script>


  <script src="https://cdn.datatables.net/buttons/3.1.2/js/dataTables.buttons.js"></script>
  <script src="https://cdn.datatables.net/buttons/3.1.2/js/buttons.dataTables.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.10.1/jszip.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.2.7/pdfmake.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.2.7/vfs_fonts.js"></script>
  <script src="https://cdn.datatables.net/buttons/3.1.2/js/buttons.html5.min.js"></script>
  <script src="https://cdn.datatables.net/buttons/3.1.2/js/buttons.print.min.js"></script>
  

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
	<c:remove var="message" scope="request" />
  </c:if>
  

</body>
</html>
