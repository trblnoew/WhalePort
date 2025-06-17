<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en" dir="ltr" data-bs-theme="light" data-color-theme="Blue_Theme" data-layout="vertical">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="shortcut icon" type="image/png" href="${pageContext.request.contextPath }/resources/assets/images/logos/whale-favi.png" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/css/styles.css" />
<title>고객 로그인 페이지</title>
</head>
<body>
<div id="main-wrapper" class="auth-customizer-none">
	<div class="position-relative overflow-hidden radial-gradient min-vh-100 w-100">
		<div class="position-relative z-index-5">
			<div class="row">
				<div class="col-xl-7 col-xxl-8">
					<a href="/customer/main" class="text-nowrap logo-img d-block px-4 py-9 w-100"> 
						<div class="d-none d-xl-flex align-items-center justify-content-center h-n80">
							<img src="${pageContext.request.contextPath }/resources/assets/images/logos/logo_symboltype.png" alt="modernize-img" class="img-fluid" width="280">
						</div>
					</a>
				</div>
				<div class="col-xl-5 col-xxl-4">
					<div class="authentication-login min-vh-100 bg-body row justify-content-center align-items-center p-4">
						<div class="auth-max-width col-sm-8 col-md-6 col-xl-7 px-4">
							<h2 class="mb-1 fs-6 fw-bolder" style="text-align: center">WhalePort에 오신 것을 환영합니다!</h2>
							<div class="position-relative text-center my-4">
								<p class="mb-0 fs-4 px-3 d-inline-block bg-body text-dark z-index-5 position-relative">LoginForm</p>
								<span class="border-top w-100 position-absolute top-50 start-50 translate-middle"></span>
							</div>
							<form id="loginForm">
								<div class="mb-3" style="text-align: center;">
									<button type="button" class="btn btn-outline-primary" id="autoValBtn">자동입력</button>
								</div>
								<div class="mb-3">
 									<label class="form-label">ID</label> 
							        <input type="text" class="form-control login" id="cusId" name="cusId" placeholder="ID를 입력해주세요" data-validation="N" data-name="아이디">
								</div>							        
							    <div class="mb-4">
							        <label class="form-label">Password</label> 
							        <input type="password" class="form-control login" id="cusPw" name="cusPw" placeholder="비밀번호를 입력해주세요" data-validation="N" data-name="비밀번호">
							    </div>
							    <div class="d-flex align-items-center justify-content-between mb-4">
							        <div class="form-check">
							            <input class="form-check-input primary" type="checkbox" checked id="saveId">
							            <label class="form-check-label text-dark fs-3">아이디 저장</label>
							        </div>
							        <a class="text-primary fw-medium fs-3" href="https://example.com" data-bs-target="#login-modal" data-bs-toggle="modal">Forgot ID?</a>
							        <a class="text-primary fw-medium fs-3" href="https://example.com" data-bs-target="#login-modal2" data-bs-toggle="modal">Forgot PW?</a>
							    </div>
							    <button class="btn btn-primary w-100 py-8 mb-4 rounded-2" id="loginBtn">Login</button>
							    <div class="d-flex align-items-center justify-content-center">
							        <p class="fs-4 mb-0 fw-medium">계정이 없으신가요?</p>
							        <a class="text-primary fw-medium ms-2" href="/customer/signup">회원가입</a>
							    </div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
	
<!-- 아이디 찾기 모달창 START -->
<div id="login-modal" class="modal fade" tabindex="-1" aria-hidden="true">
	<div class="modal-dialog modal-dialog-scrollable modal-lg">
		<div class="modal-content">
			<div class="modal-body">
				<div class="text-center mt-2 mb-4">
					<a href="https://example.com" class="text-success">
						<span>
							<img src="${pageContext.request.contextPath }/resources/assets/images/logos/favicon.png" class="me-3 img-fluid" alt="modernize-img" />
						</span>
					</a>
				</div>
				<form action="#" class="ps-3 pr-3">
					<div class="mb-3">
						<label for="emailaddress1">이름</label>
						<input class="form-control" name="cusName" id="cusName" type="text" placeholder="이름을 입력하세요" data-validation = "N" data-name="이름"/>
					</div>
					<div class="mb-3">
						<label for="password1">핸드폰 번호</label>
						<input class="form-control" name="cusTel" id="cusTel" type="text" placeholder="'-'를 포함한 핸드폰 번호를 입력하세요" data-validation = "N" data-name="핸드폰 번호"/>
					</div>
					<div class="mb-3" id="findIdArea"></div>
					<div class="mb-3 text-center">
						<button class="btn btn-rounded bg-info-subtle text-info" type="button" id="findIdBtn">아이디 찾기</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<!-- 아이디 찾기 모달창  END -->

<!-- 비밀번호 찾기 모달창 START -->
<div id="login-modal2" class="modal fade" tabindex="-1" aria-hidden="true">
	<div class="modal-dialog modal-dialog-scrollable modal-lg">
		<div class="modal-content">
			<div class="modal-body">
				<div class="text-center mt-2 mb-4">
					<a href="https://example.com" class="text-success">
						<span>
							<img src="${pageContext.request.contextPath }/resources/assets/images/logos/favicon.png" class="me-3 img-fluid" alt="modernize-img" />
						</span>
					</a>
				</div>
				<form action="#" class="ps-3 pr-3">
					<div class="mb-3">
						<label for="emailaddress1">이름</label>
						<input class="form-control" name="cusName" id="cusName2" type="text" placeholder="이름을 입력하세요" data-validation = "N" data-name="이름"/>
					</div>
					<div class="mb-3">
						<label for="emailaddress1">아이디</label>
						<input class="form-control" name="cusId" id="cusId2"type="text" placeholder="아이디를 입력하세요" data-validation = "N" data-name="아이디"/>
					</div>
					<div class="mb-3">
						<label for="password1">핸드폰 번호</label>
						<input class="form-control" type="text" id="cusTel2" name="cusTel" placeholder="'-'를 포함한 핸드폰 번호를 입력하세요" data-validation = "N" data-name="핸드폰 번호">
					</div>
					<div class="mb-3 text-center">
						<button class="btn btn-rounded bg-info-subtle text-info" type="button" id="tempPwBtn">임시 비밀번호 발급</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<!-- 비밀번호 찾기 모달창  END -->

<!-- 유효성 검사 모달 START -->
<div class="modal fade" id="al-warning-alert" tabindex="-1" aria-labelledby="vertical-center-modal" aria-hidden="true">
	<div class="modal-dialog modal-sm">
		<div class="modal-content modal-filled bg-warning-subtle">
			<div class="modal-body p-4">
				<div class="text-center text-warning">
					<i class="ti ti-alert-octagon fs-7"></i>
					<h4 class="mt-2">Warning</h4>
					<p class="mt-3"></p>
					<button type="button" class="btn btn-light my-2" data-bs-dismiss="modal">확인</button>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- 유효성 검사 모달 END -->
	
<script src="${pageContext.request.contextPath }/resources/assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/assets/libs/simplebar/dist/simplebar.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/assets/js/theme/app.init.js"></script>
<script src="${pageContext.request.contextPath }/resources/assets/js/theme/theme.js"></script>
<script src="${pageContext.request.contextPath }/resources/assets/js/theme/app.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/iconify-icon@1.0.8/dist/iconify-icon.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="${pageContext.request.contextPath }/resources/assets/libs/sweetalert2/dist/sweetalert2.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/assets/js/forms/sweet-alert.init.js"></script>
<!-- 쿠키 라이브러리 -->
<script src="https://cdn.jsdelivr.net/npm/js-cookie@3.0.1/dist/js.cookie.min.js"></script>
<script type="text/javascript">
	var loginBtn = $("#loginBtn");		// 로그인 버튼
	var loginForm = $("#loginForm");	// 로그인 폼
	var login = $(".login");			// 로그인 클래스를 가지고 있는 input elements
	var findIdBtn = $("#findIdBtn");	// 아이디 찾기 버튼
	var tempPwBtn = $("#tempPwBtn");	// 비밀번호 찾기 버튼
	
	// 쿠키 값 가져오기
	var savedId = Cookies.get('savedId');
    if (savedId) {
        $('#cusId').val(savedId);
        $('#saveId').prop('checked', true); // 체크박스 체크 상태로 설정
    }
	// 로그인 엔터키 이벤트
	$("#loginBtn").on("click", function(event){
	    event.preventDefault(); // 기본 폼 제출 방지
	
	    $('#cusId').attr('data-validation', 'Y');
	    $('#cusPw').attr('data-validation', 'Y');
	    
	    if (!validation()) {
	        return false;
	    }
	
	    var formData = $("#loginForm").serialize();
	    var saveIdChk = $('#saveId').is(':checked');

        // 아이디 저장 체크 여부에 따라 쿠키 설정/삭제
        if (saveIdChk) {
            Cookies.set('savedId', $('#cusId').val(), { expires: 7 }); // 쿠키에 아이디 저장, 7일간 유효
        } else {
            Cookies.remove('savedId'); // 쿠키 삭제
        }
	
	    $.ajax({
	        url: "/customer/loginChk",
	        type: "POST",
	        data: formData,
	        success: function(response) {
	            if (response.success) {
	                window.location.href = "/customer/main";
	            } else {
	            	$('#al-warning-alert').find('p.mt-3').text("로그인 정보를 제대로 입력해주세요.");
	                $('#al-warning-alert').modal('show');
	            }
	        }
	    });
	});

	
	// 아이디 찾기 버튼 이벤트
	findIdBtn.on("click", function(){
		var cusName = $("#cusName").val();	// 이름 값
		var cusTel  = $("#cusTel").val();	// 휴대폰 번호 값
		
		$('#cusName').attr('data-validation', 'Y');
        $('#cusTel').attr('data-validation', 'Y');
        
		var data = {
			cusName : cusName,
			cusTel  : cusTel
		};
		
		console.log("data : ", data);

		if (!validation()) {
	        return false;
	    }
		
		$.ajax({
			url : "/customer/forgetId",
			type : "POST",
			data : JSON.stringify(data),
			contentType : "application/json; charset=utf-8",
			success : function(rst){
				console.log('rst:',rst);
				$("#findIdArea").show();
				$("#findIdArea").html("");
				if (!rst) {
					$("#findIdArea").html('<h2 style="text-align:center;">아이디를 찾지 못했습니다.</h2>');
		        } else {
		            $("#findIdArea").html("<h2 style=text-align:center;>회원님의 아이디는 " + rst + "입니다.</h2>");
		        }
			},
		}); 
	});
	
	// 임시 비밀번호  버튼 이벤트
	tempPwBtn.on("click", function(){
		var cusName = $("#cusName2").val();	// 이름 값
		var cusId   = $("#cusId2").val();	// 아이디 값
		var cusTel  = $("#cusTel2").val();	// 휴대폰 번호 값
		
		$('#cusName2').attr('data-validation', 'Y');
		$('#cusId2').attr('data-validation', 'Y');
        $('#cusTel2').attr('data-validation', 'Y');
		
		var data = {
			cusName : cusName,
			cusId   : cusId,
			cusTel  : cusTel
		};
		console.log("data : ", data);
		
		if (!validation()) {
	        return false;
	    }
		
		$.ajax({
			url : "/customer/forgetPw",
			type : "POST",
			data : JSON.stringify(data),
			contentType : "application/json; charset=utf-8",
			success : function(rst){
				console.log('rst:',rst);
				alert("전송이 완료 되었습니다.")
			} 
		}); 
	});
	
	// 자동 입력 버튼 - 최종 프로젝트를 위한
	$("#autoValBtn").on("click", function(){
		$("#cusId").val("kyj12345");         
        $("#cusPw").val("dnpdlf1!"); //웨일1!
	});
	
	
	
// 유효성 검사
function validation(){
	var msg;
	var valiId;
	var valiName;

	var valiChk = false;
	$('[data-validation = Y]').each(function(){
		if($(this).val() == ''){
			valiChk = true;
			valiId = $(this).attr('id');
			valiName = $(this).attr('data-name');
			return false;
		}
	});

	if(valiChk){
		$('#al-warning-alert').find('p.mt-3').text(valiName + '를(을) 입력해 주세요.');
        $('#al-warning-alert').modal('show');
		return false;
	}
	return true;
}
</script>
<c:if test="${not empty message }">
	<script type="text/javascript">
	console.log("${message}");
	Swal.fire({
        title: '${msg}',
        text: '${message}',
        icon: '${msg2}',
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