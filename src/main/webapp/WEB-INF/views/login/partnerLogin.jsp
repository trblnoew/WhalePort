<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html lang="en" dir="ltr" data-bs-theme="light" data-color-theme="Blue_Theme" data-layout="vertical">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <link rel="shortcut icon" type="image/png" href="${pageContext.request.contextPath }/resources/assets/images/logos/whale-favi.png" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/css/styles.css" />
<title>협력업체 로그인 페이지</title>
</head>
<body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script type="text/javascript">
// Simple Captcha
function resetCaptcha() {
    document.getElementById('captcha-image').src = '/user/image?' + new Date().getTime();
}
</script>
<div class="preloader">
	<img src="${pageContext.request.contextPath }/resources/assets/images/logos/favicon.png" alt="loader" class="lds-ripple img-fluid" />
</div>
<div id="main-wrapper" class="auth-customizer-none">
	<div class="position-relative overflow-hidden radial-gradient min-vh-100 w-100 d-flex align-items-center justify-content-center">
		<div class="d-flex align-items-center justify-content-center w-100">
			<div class="row justify-content-center w-100">
				<div class="col-md-8 col-lg-6 col-xxl-3 auth-card">
					<div class="card mb-0">
						<div class="card-body">
							<a href="${pageContext.request.contextPath}/resources/main/index.html" class="text-nowrap logo-img text-center d-block mb-5 w-100">
								<img src="${pageContext.request.contextPath}/resources/assets/images/logos/headertype-01.png" class="dark-logo" alt="Logo-Dark" style="width:190px; margin-left: -20px;" />
							</a>
							<form action="/partner/login" method="post" id="partnerForm" class="login-form">
								<div class="mb-3" style="text-align: center;">
									<button type="button" class="btn btn-outline-primary" id="autoValBtn">자동입력</button>
								</div>
								<div class="mb-3">
									<label class="form-label">협력업체 ID</label>
									<input type="text" class="form-control login2" name="ptId" id="ptId" data-validation="N" data-name="협력업체 아이디">
								</div>
								<div class="mb-4">
									<label class="form-label">협력업체 PassWord</label>
									<input type="password" class="form-control login2" name="ptPw" id="ptPw" data-validation="N" data-name="협력업체 비밀번호">
								</div>
								<div class="d-flex align-items-center justify-content-between mb-4">
									<div class="form-check">
										<input class="form-check-input primary" type="checkbox" id="saveId">
							            <label class="form-check-label text-dark fs-3">아이디 저장</label>
									</div>
									<a class="text-primary fw-medium fs-3" data-bs-target="#login-modal3" data-bs-toggle="modal">Forgot ID?</a>
									<a class="text-primary fw-medium fs-3" data-bs-target="#login-modal4" data-bs-toggle="modal">Forgot PW?</a>
								</div>
								<button class="btn btn-primary w-100 py-8 mb-4 rounded-2" id="partnerLoginBtn">Login</button>
								<div class="d-flex align-items-center justify-content-center">
									<p class="fs-4 mb-0 fw-medium">New to Account?</p>
									<a class="text-primary fw-medium ms-2" href="/partner/account/register">Partner Sign Up</a>
								</div>
								<sec:csrfInput/>
							</form>
							<div class="mb-3" id="loginError">
								<label class="form-label" style="color: red">비밀번호 3회 오류</label><br>
								<form action="/captcha/submit" method="POST" id="captchaForm">
									<img id="captcha-image" src="/captcha/image" alt="CAPTCHA 이미지"/><br>
									<input type="text" name="captcha" class="form-control" id="captcha" aria-describedby="textHelp" placeholder="캡챠 입력"><br>
									<span id="captcha-text" style="display: none;">{{captchaText}}</span>
									<button type="button" class="btn rounded-pill waves-effect waves-light btn-outline-primary" onclick="resetCaptcha()">리셋</button>
									<button type="button" class="btn rounded-pill waves-effect waves-light btn-outline-primary" id="sendBtn">제출</button>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- 협력업체 아이디 찾기 모달창 START -->
<div id="login-modal3" class="modal fade" tabindex="-1" aria-hidden="true">
	<div class="modal-dialog modal-dialog-scrollable modal-lg">
		<div class="modal-content">
			<div class="modal-body">
				<div class="text-center mt-2 mb-4">
					<a href="https://example.com" class="text-success">
						<span>
							<img src="${pageContext.request.contextPath }/resources/assets/images/logos/whale-favi.png" class="me-3 img-fluid" alt="modernize-img" width="50"/>
						</span>
					</a>
				</div>
				<form action="#" class="ps-3 pr-3">
					<div class="mb-3">
						<label for="emailaddress1">업체 이름</label>
						<input class="form-control" name="ptName" id="ptName" type="text" placeholder="업체 이름을 입력하세요" data-validation = "N" data-name="업체 이름"/>
					</div>
					<div class="mb-3">
						<label for="password1">업체 대표자 명</label>
						<input class="form-control" name="ptCeo" id="ptCeo" type="text" placeholder="업체 대표자 명을 입력하세요" data-validation = "N" data-name="업체 대표자 명"/>
					</div>
					<div class="mb-3" id="findIdArea2"></div>
					<div class="mb-3 text-center">
						<button class="btn btn-rounded bg-info-subtle text-info" type="button" id="partnerFindIdBtn">아이디 찾기</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<!-- 협력업체 아이디 찾기 모달창  END -->
<!-- 협력업체 비밀번호 찾기 모달창 START -->
<div id="login-modal4" class="modal fade" tabindex="-1" aria-hidden="true">
	<div class="modal-dialog modal-dialog-scrollable modal-lg">
		<div class="modal-content">
			<div class="modal-body">
				<div class="text-center mt-2 mb-4">
					<a href="https://example.com" class="text-success">
						<span>
							<img src="${pageContext.request.contextPath }/resources/assets/images/logos/whale-favi.png" class="me-3 img-fluid" alt="modernize-img" width="50"/>
						</span>
					</a>
				</div>
				<form action="#" class="ps-3 pr-3">
					<div class="mb-3">
						<label for="emailaddress1">업체 이름</label>
						<input class="form-control" name="ptName" id="ptName2" type="text" placeholder="업체 이름을 입력하세요" data-validation = "N" data-name="이름"/>
					</div>
					<div class="mb-3">
						<label for="emailaddress1">아이디</label>
						<input class="form-control" name="ptId" id="ptId2" type="text" placeholder="아이디를 입력하세요" data-validation = "N" data-name="아이디"/>
					</div>
					<div class="mb-3">
						<label for="password1">사업자등록번호</label>
						<input class="form-control" type="text" id="ptBusnum" name="ptBusnum" placeholder="사업자 등록번호를 입력하세요" data-validation = "N" data-name="핸드폰 번호">
					</div>
					<div class="mb-3 text-center">
						<button class="btn btn-rounded bg-info-subtle text-info" type="button" id="partnerTempPwBtn">임시 비밀번호 발급</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<!-- 협력업체 비밀번호 찾기 모달창  END -->

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

<div class="modal fade" id="al-info-alert" tabindex="-1" aria-labelledby="vertical-center-modal" aria-hidden="true">
	<div class="modal-dialog modal-sm">
		<div class="modal-content modal-filled bg-info-subtle">
			<div class="modal-body p-4">
				<div class="text-center text-info">
					<i class="ti ti-info-circle fs-7"></i>
					<h4 class="mt-2">Success</h4>
					<p class="mt-3"></p>
					<button type="button" class="btn btn-light my-2" data-bs-dismiss="modal">확인</button>
				</div>
			</div>
		</div>
	</div>
</div>
<script src="${pageContext.request.contextPath }/resources/assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/assets/libs/simplebar/dist/simplebar.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/assets/js/theme/app.init.js"></script>
<script src="${pageContext.request.contextPath }/resources/assets/js/theme/theme.js"></script>
<script src="${pageContext.request.contextPath }/resources/assets/js/theme/app.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/assets/js/plugins/toastr-init.js"></script>
<script src="https://cdn.jsdelivr.net/npm/iconify-icon@1.0.8/dist/iconify-icon.min.js"></script>
<!-- 쿠키 라이브러리 -->
<script src="https://cdn.jsdelivr.net/npm/js-cookie@3.0.1/dist/js.cookie.min.js"></script>
<script type="text/javascript">
$(function(){
	$("#loginError").hide();							// 캡챠 영역 숨김
	$("#findIdArea2").hide();							// 협력업체 아이디 찾기 구역 숨김
	$("#findPwArea2").hide();							// 협력업체 비밀번호 찾기 구역 숨김
	var partnerForm = $("#partnerForm");				// 협력업체 로그인 폼
	var partnerLoginBtn = $("#partnerLoginBtn");		// 협럭업체 로그인 버튼
	var login2 = $(".login2");							// 협력업체 로그인 클래스를 가지고 있는 input elements
	var empTempPwBtn = $("#empTempPwBtn");				// 직원 임시 비밀번호 전송 버튼
	var partnerFindIdBtn = $("#partnerFindIdBtn");		// 협력업체 아이디 찾기 버튼
	var partnerTempPwBtn = $("#partnerTempPwBtn");		// 협력업체 임시 비밀번호 전송 버튼
	var captchaForm = $("#captchaForm");				// captchaForm Elem
	var sendBtn = $("#sendBtn");						// 제출 버튼(리캡차)
	var captchaChk = true;								// 캡챠 Flag
	
	// 협력업체 로그인 Enter 키 이벤트
	login2 .on("keydown", function(event){
		if(event.keyCode == 13){
			loginForm.submit();
		}
	});
	
	var urlStr = window.location.href;
	var url = new URL(urlStr);
	console.log('url:::'+url);
	var cnt = sessionStorage.getItem('cnt') ? parseInt(sessionStorage.getItem('cnt')) : 0;

	if (url.href.includes('error')) {
	    cnt++;
	    console.log('cnt: ' + cnt);
	    
	    sessionStorage.setItem('cnt', cnt);
	    $('#al-warning-alert').find('p.mt-3').html('로그인 실패<br>' + cnt + ' / 3회 시도하였습니다.');
        $('#al-warning-alert').modal('show');
	}
	
	if (cnt >= 1) {
	    $("#loginError").show();
	    captchaChk = false;
	    console.log("captchaChk : " + captchaChk);
	    var empId = sessionStorage.getItem("empId");
	    
	    console.log("empId value:", empId);
	    
	    var data = {
	        empId: empId
	    };

	    $.ajax({
	        url: "/common/lockAccount",
	        type: "POST",
	        data: JSON.stringify(data),
	        contentType: "application/json; charset=utf-8",
	        success: function(rst) {
	        	$('#al-warning-alert').find('p.mt-3').html('계정이 잠겼습니다.<br>캡챠를 통해 풀어주세요');
                $('#al-warning-alert').modal('show');
	        },
	        error: function(xhr, status, error) {
	            alert('오류가 발생했습니다. 다시 시도하세요.');
	        }
	    });
	}
	
	// 캡챠 제출 버튼
	sendBtn.on("click", function(){
		var data = {
			captcha : $("#captcha").val(),
			empId : sessionStorage.getItem('empId')
		}
		
		$.ajax({
			url: "/captcha/submit",
	        type: "POST",
	        data: JSON.stringify(data),
	        contentType: "application/json; charset=utf-8",
	        success: function(rst) {
	            if(rst === "SUCCESS"){
	            	$('#al-info-alert').find('p.mt-3').text('캡챠 인증이 완료 되었습니다.');
	                $('#al-info-alert').modal('show');
	            	$("#loginError").hide();
	            	sessionStorage.setItem('cnt', 0);
	            	captchaChk = true;
	            }else{
	            	$('#al-warning-alert').find('p.mt-3').text('캡챠 인증을 완료 해주세요.');
	                $('#al-warning-alert').modal('show');
	            }
	        },
	        error: function(xhr, status, error) {
	            alert('오류가 발생했습니다. 다시 시도하세요.');
	        }
		});
	});
	
	// 쿠키 값 가져오기
// 	var savedId = Cookies.get('savedId');
//     if (savedId) {
//         $('#ptId').val(savedId);
//         $('#saveId').prop('checked', true); // 체크박스 체크 상태로 설정
//     }
	
	// 협력업체 로그인 버튼 이벤트
	partnerLoginBtn.on("click", function(){
		$('#ptId').attr('data-validation', 'Y');
        $('#ptPw').attr('data-validation', 'Y');
		
		if (!validation()) {
	        return false;
	    }
		
// 		var formData = $("#partnerForm").serialize();
// 	    var saveIdChk = $('#saveId').is(':checked');
	    
// 	 	// 아이디 저장 체크 여부에 따라 쿠키 설정/삭제
//         if (saveIdChk) {
//             Cookies.set('savedId', $('#ptId').val(), { expires: 7 }); // 쿠키에 아이디 저장, 7일간 유효
//         } else {
//             Cookies.remove('savedId'); // 쿠키 삭제
//         }
		
		partnerForm.submit();
	});
	
	// 협력업체 아이디 찾기 버튼 이벤트
	partnerFindIdBtn.on("click", function(){
		var ptName = $("#ptName").val();	// 이름 값
		var ptCeo  = $("#ptCeo").val();	// 휴대폰 번호 값
		
		$('#ptName').attr('data-validation', 'Y');
        $('#ptCeo').attr('data-validation', 'Y');
		
		var data = {
			ptName : ptName,
			ptCeo : ptCeo
		};

		if (!validation()) {
	        return false;
	    }
		
		$.ajax({
			url : "/common/partnerForgetId",
			type : "POST",
			data : JSON.stringify(data),
			contentType : "application/json; charset=utf-8",
			success : function(rst){
				console.log('rst:',rst);
				$("#findIdArea2").show();
				$("#findIdArea2").html("");
				if (!rst) {
					$("#findIdArea2").html('<h2 style="text-align:center;">아이디를 찾지 못했습니다.</h2>');
		        } else {
		            $("#findIdArea2").html("<h2 style=text-align:center;>회원님의 아이디는 " + rst + "입니다.</h2>");
		        }
			}
		}); 
	});
});

// 직원, 협력업체 로그인 폼 change 이벤트
function toggleForm() {
    const userType = $('input[name="userType"]:checked').val();
    
    if (userType === 'employee') {
        $('#employeeForm').removeClass('d-none');
        $('#partnerForm').addClass('d-none');
    } else {
        $('#employeeForm').addClass('d-none');
        $('#partnerForm').removeClass('d-none');
    }
}

//유효성 검사
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


// 자동 입력 버튼 - 최종 프로젝트를 위한
$("#autoValBtn").on("click", function(){
	$("#ptId").val("PT-12345678901");         
    $("#ptPw").val("1234567890");
});
</script>


<!-- SweetAlert2 모달 스크립트 -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="${pageContext.request.contextPath }/resources/assets/libs/sweetalert2/dist/sweetalert2.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/assets/js/forms/sweet-alert.init.js"></script>
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