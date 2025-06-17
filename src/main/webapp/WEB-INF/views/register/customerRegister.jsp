<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="shortcut icon" type="image/png" href="${pageContext.request.contextPath }/resources/assets/images/logos/whale-favi.png" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/css/styles.css" />
<title>고객 회원가입 페이지</title>
</head>
<body>
<%
	String msg = (String) request.getAttribute("msg");
	String message = (String) request.getAttribute("message");
%>
<div class="preloader">
	<img src="${pageContext.request.contextPath }/resources/assets/images/logos/favicon.png" alt="loader" class="lds-ripple img-fluid" />
</div>
<div id="main-wrapper" class="auth-customizer-none">
	<div class="position-relative overflow-hidden radial-gradient min-vh-100 w-100">
		<div class="position-relative z-index-5">
			<div class="row">
				<div class="col-xl-7 col-xxl-8">
					<a href="/customer/main" class="text-nowrap logo-img d-block px-4 py-9 w-100">
						<img src="${pageContext.request.contextPath }/resources/assets/images/logos/headertype-01.png" class="dark-logo" alt="Logo-Dark" style="width:190px; margin-left: -20px;"/>
					</a>
					<a href="/customer/main" class="text-nowrap logo-img d-block px-4 py-9 w-100">
						<div class="d-none d-xl-flex align-items-center justify-content-center h-n80">
							<img src="${pageContext.request.contextPath }/resources/assets/images/logos/logo_symboltype.png" alt="modernize-img" class="img-fluid" width="280">
						</div>
					</a>
				</div>
				<div class="col-xl-5 col-xxl-4">
					<div class="authentication-login min-vh-100 bg-body row justify-content-center align-items-center p-4">
						<div class="auth-max-width col-sm-8 col-md-6 col-xl-7 px-4">
							<h2 class="mb-1 fs-7 fw-bolder" style="text-align: center">회원가입</h2><br>
							<p class="mb-7" style="text-align: center">WhalePort 홈페이지의 회원이 되시면,<br> 예약 및 조회 서비스를 편리하게 이용하실 수 있습니다.</p>
							<div class="position-relative text-center my-4">
								<p class="mb-0 fs-4 px-3 d-inline-block bg-body text-dark z-index-5 position-relative">회원정보입력</p>
								<span class="border-top w-100 position-absolute top-50 start-50 translate-middle"></span>
							</div>
							<form action="/customer/signup" method="post" id="signupForm">
								<div class="mb-3" style="text-align: center;">
									<button type="button" class="btn btn-outline-primary" id="autoValBtn">자동입력</button>
								</div>
								<div class="mb-3">
									<label class="form-label">아이디<span class="text-danger">*</span></label>
									<div class="input-group">
										<input type="text" class="form-control idRegex" id="cusId" name="cusId" data-validation = "Y" data-name="아이디">
										<button type="button" class="btn btn-primary" id="idChkBtn">아이디 중복체크</button>
									</div>
									<p>영문, 숫자의 조합으로 8자 이상 12자 이하의<br>아이디를 작성 해주세요.</p>
									<p class="idRegexResult" style="display: block;"></p>
									<p class="error" style="display: block;"></p>
								</div>
								<div class="mb-3">
									<label class="form-label">성명<span class="text-danger">*</span></label>
									<input type="text" class="form-control" id="cusName" name="cusName" data-validation = "Y" data-name="이름">
								</div>
								<div class="mb-3">
									<label class="form-label">비밀번호<span class="text-danger">*</span></label>
									<input type="password" class="form-control passwordChk" id="cusDepw" name="cusDepw" data-validation = "Y" data-name="비밀번호">
									<p>영문, 숫자, 특수문자의 조합으로 8자 이상 12자 이하의<br>비밀번호를 작성 해주세요.</p>
								</div>
								<div class="mb-3">
									<label class="form-label">비밀번호 확인<span class="text-danger">*</span></label>
									<input type="password" class="form-control passwordChk" id="cusDepw2" name="cusDepw2" data-validation = "Y" data-name="비밀번호 확인">
									<p id="pwChk"></p>
								</div>
								<div class="mb-3">
									<label class="form-label">휴대전화<span class="text-danger">*</span></label>
									<input type="text" class="form-control" placeholder="'-'를 포함한 핸드폰 번호를 입력해주세요." id="cusTel" name="cusTel" data-validation = "Y" data-name="핸드폰 번호">
								</div>
								<div class="mb-3">
									<label class="form-label">이메일<span class="text-danger">*</span></label>
									<input type="text" class="form-control" id="cusEmail" name="cusEmail" data-validation = "Y" data-name="이메일">
								</div>
								<div class="mb-3">
									<label class="form-label">생년월일<span class="text-danger">*</span></label>
									<input type="date" class="form-control" id="cusBirth" name="cusBirth" max="9999-12-31" data-validation = "Y" data-name="생년월일">
								</div>
								<div class="mb-3">
									<label class="form-label">우편번호<span class="text-danger">*</span></label>
									<div class="input-group">
										<input type="text" class="form-control" name="cusPostcode" id="cusPostcode" data-validation = "Y" data-name="우편번호">
										<button type="button" class="btn btn-primary" onclick="DaumPostcode()">검색</button>
									</div>
								</div>
								<div class="mb-3">
									<label class="form-label">주소<span class="text-danger">*</span></label>
									<input type="text" class="form-control" name="cusAdd" id="cusAdd" data-validation = "Y" data-name="주소">
								</div>
								<div class="mb-3">
									<label class="form-label">상세주소<span class="text-danger">*</span></label>
									<input type="text" class="form-control" name="cusAdd2" id="cusAdd2" data-validation = "Y" data-name="상세주소">
								</div>
								<div class="mb-3 btn-group">
								    <label class="btn bg-primary-subtle text-primary">
								        <div class="form-check">
								            <input type="radio" class="form-check-input" id="genderM" name="cusGender" value="M" />
								            <label class="form-check-label" for="genderMale">
								                <span class="d-none d-md-block">남성</span>
								            </label>
								        </div>
								    </label>
								    <label class="btn bg-primary-subtle text-primary">
								        <div class="form-check">
								            <input type="radio" class="form-check-input" id="genderF" name="cusGender" value="F" />
								            <label class="form-check-label" for="genderFemale">
								                <span class="d-none d-md-block">여성</span>
								            </label>
								        </div>
								    </label>
								</div>
								<label class="mb-3 btn bg-primary-subtle text-primary ">
									<div class="form-check">
										<input type="checkbox" class="form-check-input" id="cusSend" name="cusSend" validataion="Y" data-name="개인정보동의 체크" value="Y"/>
										<label class="form-check-label" for="checkbox1">
											<span class="d-none d-md-block">개인정보처리방침, 약관 및 마케팅 수신 동의</span>
										</label>
									</div>
								</label>
								<div class="mb-3">
									<a href="/customer/login" class="btn btn-outline-primary w-100 py-8 me-2 rounded-2">이전</a>
								</div>
								<div class="mb-3">
									<button type="button" class="btn btn-primary w-100 py-8 rounded-2" id="signupBtn">가입</button>
								</div>
<!-- 								<div class="mb-3"> -->
<!-- 									<button type="button" class="btn btn-primary w-100 py-8 rounded-2" id="autoValBtn">자동입력</button> -->
<!-- 								</div> -->
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

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
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	var idChkBtn = $("#idChkBtn");				// 아이디 중복체크 버튼
	var signupBtn = $("#signupBtn");			// 로그인 신청 버튼
	var autoValBtn = $("#autoValBtn");			// 자동 입력 버튼
	var signupForm = $("#signupForm");			// 로그인 폼
	var passwordChk = $(".passwordChk");		// 로그인 폼
	var idRegexResult = $(".idRegexResult");	// 아이디 정규화 결과
	var idRegex = $(".idRegex");				// 아이디 정규화
	var idRegexFlag = false;					// 아이디 정규화 Flag
	var pwFlag = false;							// 패스워드 일치 Flag
	var pwRegexFlag = false;					// 패스워드 정규화 Flag
	var idCheckFlag = false;					// 중복 확인 Flag
	
	// 로그인 버튼 이벤트
	signupBtn.on("click", function(){
		console.log("로그인 버튼 누름");
		
		var cusId = $("#cusId").val;
		var cusName = $("#cusName").val;
		var cusDepw = $("#cusDepw").val;
		var cusDepw2 = $("#cusDepw").val;
		var cusTel = $("#cusTel").val;
		var cusEmail = $("#cusEmail").val;
		var cusBirth = $("#cusBirth").val;
		var cusPostcode = $("#cusPostcode").val;
		var cusAdd = $("#cusAdd").val;
		var cusAdd2 = $("#cusAdd2").val;
		var cusGender = $("#cusGender").val();
		var cusSend = $("#cusSend").val();

	    // 조건문 확인 로그
	    console.log("Final check - pwRegexFlag:", pwRegexFlag, "pwFlag:", pwFlag);
	    
	    // 아이디 정규화
	    if(idRegexFlag == false){
	    	$('#al-warning-alert').find('p.mt-3').text('아이디를 확인해주세요.');
	        $('#al-warning-alert').modal('show');
	        return false;
	    }
	    
		// 비밀번호 정규화&일치 확인 이벤트
		if(pwRegexFlag == false && pwFlag == false){
			$('#al-warning-alert').find('p.mt-3').text('비밀번호를 확인해주세요.');
	        $('#al-warning-alert').modal('show');
	        return false;
		}
		
		if (!validation()) {
	        return false;
	    }else{
	    	signupForm.submit();
	    }
	});
	
	// 아이디 정규화 이벤트
	idRegex.on("keyup", function(){
		var cusId = $("#cusId").val();
		var regex = /^(?=.*[a-zA-Z])(?=.*\d)[A-Za-z\d]{8,12}$/;
		
		// 아이디 정규화 검사
	    if (!regex.test(cusId)) {
	        $(".idRegexResult").html("아이디는 영문, 숫자의 조합으로 8자 이상 12자 이하이어야 합니다.").css("color", "red");
	        return false;
	    }else{
	    	$(".idRegexResult").html("").css("color", "green");
	    	idRegexFlag = true;
	    }
	});
	
	
	// 아이디 중복체크 이벤트
	idChkBtn.on("click", function() {
		var cusId = $("#cusId").val();
		
		if (cusId === "" || cusId == null) {
			$('#al-warning-alert').find('p.mt-3').text("아이디를 입력해주세요.");
	        $('#al-warning-alert').modal('show');
	        return false;
	    }
		var data = {
			cusId : cusId
		}

		$.ajax({
			url : "/customer/idCheck",
			type : "post",
			contentType : "application/json;charset=utf-8",
			data : JSON.stringify(data),
			success : function(res) {
				var err = $(".error")[0];
				if (res == "NOTEXIST") {
					$(err).html("사용 가능한 아이디입니다.").css("color", "green");
					idCheckFlag = true;
				} else {
					$(err).html("이미 사용중인 아이디입니다.").css("color", "red");
					idCheckFlag = false;
				}
			}
		});
	});
	
	// 비밀번호 일치 확인 이벤트
	passwordChk.on("keyup", function(){
		var cusDepw = $("#cusDepw").val();
	    var cusDepw2 = $("#cusDepw2").val();
	    var cusDepwRegex = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d!@#$%^&*]{8,12}$/;

	    // 비밀번호 정규화 검사
	    if (!cusDepwRegex.test(cusDepw)) {
	        $("#pwChk").html("비밀번호는 영문, 숫자, 특수문자의 조합으로 8자 이상 12자 이하이어야 합니다.").css("color", "red");
	        return false;
	    }else{
	    	pwRegexFlag = true;
	    	console.log("pwRegexFlag : " + pwRegexFlag);
	    }
	    // 비밀번호 일치 여부 검사
	    if (cusDepw !== cusDepw2) {
	        $("#pwChk").html("비밀번호가 서로 일치하지 않습니다.").css("color", "red");
	    } else {
	        $("#pwChk").html("비밀번호가 서로 일치합니다.").css("color", "green");
	        pwFlag = true;
	        console.log("pwFlag : " + pwFlag);
	    }
	});
	
	// 자동 입력 버튼 - 최종 프로젝트를 위한
	autoValBtn.on("click", function(){
        $("#cusName").val("김예지");           
        $("#cusTel").val("010-8362-4769");   
        $("#cusEmail").val("jejexx@naver.com"); 
        $("#cusBirth").val("1999-02-04");     
        $("#cusPostcode").val("35401");       
        $("#cusAdd").val("대전광역시 서구 도산로 11"); 
        $("#cusAdd2").val("효성타운 아파트 000동 0000호");
        $("#genderF").prop("checked", true);  
        $("#cusSend").prop("checked", true);
        
        // 비밀번호 일치 확인 이벤트 호출
        passwordChk.trigger("keyup");
	});
});

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

//카카오 주소 API
function DaumPostcode() {
	new daum.Postcode({
		oncomplete : function(data) {
			var addr = '';
			var extraAddr = '';

			if (data.userSelectedType === 'R') {
				addr = data.roadAddress;
			} else {
				addr = data.jibunAddress;
			}

			if (data.userSelectedType === 'R') {
				if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
					extraAddr += data.bname;
				}
				if (data.buildingName !== '' && data.apartment === 'Y') {
					extraAddr += (extraAddr !== '' ? ', '
							+ data.buildingName : data.buildingName);
				}
			}
			document.getElementById('cusPostcode').value = data.zonecode;
			document.getElementById("cusAdd").value = addr;
			document.getElementById("cusAdd2").focus();
		}
	}).open();
}
</script>
</body>
</html>