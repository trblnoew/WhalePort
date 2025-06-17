<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!DOCTYPE html>
<html lang="en" dir="ltr" data-bs-theme="light" data-color-theme="Blue_Theme" data-layout="vertical">
<head>
  <!-- Required meta tags -->
  <meta charset="UTF-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="https://developers.kakao.com/v2/kakaomap.js"></script>
  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e08ba589b52c5c3e16fd367810537e20&libraries=services"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  
 
  <!-- Core Css -->
  <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/css/styles.css" />

  <title>Modernize Bootstrap Admin</title>
</head>

<body>
  <div id="main-wrapper" class="auth-customizer-none">
    <div class="position-relative overflow-hidden radial-gradient min-vh-100 w-100 d-flex align-items-center justify-content-center">
      <div class="d-flex align-items-center justify-content-center w-100">
        <div class="row justify-content-center w-100">
          <div class="col-md-8 col-lg-6 col-xxl-3 auth-card" style="max-width: 500px;">
            <div class="card mb-0" style="width: 100%;">
              <div class="card-body" style="width: 100%;">
	           <a href="/common/login" class="text-nowrap logo-img text-center d-block mb-5 w-100">
	             <img src="${pageContext.request.contextPath }/resources/assets/images/logos/headertype-01.png" class="dark-logo" alt="Logo-Dark" style="width: 180px; height: auto;" />
	           </a>
	           <div class="position-relative text-center my-4">
	             <p class="mb-0 fs-4 px-3 d-inline-block bg-white z-index-5 position-relative text-black"><strong>협력업체 계정 신청</strong></p>
	             <span class="border-top w-100 position-absolute top-50 start-50 translate-middle"></span>
	           </div>
	           <form action="/partner/account/register" method="post" id="accountForm" enctype="multipart/form-data" novalidate>
				 <button type="button" class="btn btn-outline-primary me-3 mb-3" id="autoValBtn">자동입력</button>
	             <div class="mb-3 form-group">
	               <label class="form-label">업체 구분<span class="text-danger">*</span></label>
	               <div class="controls">
	                 <select class="form-select form-control" name="ptCode" id="ptCode" required data-validation-required-message="필수입력 사항입니다.">
	                   <option value="">업체구분 선택</option>
	                   <option value="PRM01">항공사</option>
	                   <option value="PRM02">보안업체</option>
	                   <option value="PRM03">시설업체</option>
	                   <option value="PRM04">입점업체</option>
	                 </select>
	               </div>
	             </div>
				 <div class="mb-3 form-group">
				     <label class="form-label">사업자등록번호<span class="text-danger">*</span></label>
				     <div class="controls" style="display: flex; align-items: center;">
				         <input type="text" class="form-control" id="ptBusnum" name="ptBusnum" style="width: 83%;" placeholder="'-' 없이 숫자만 입력" value="" required data-validation-required-message="필수입력 사항입니다.">
				         <input value="조회" type="button" id="btn" class="btn btn-primary ms-auto" />
				     </div>
				     <div class="text-success" id="result" style="display: none; margin-top: 5px;"></div>
				 </div>
	             <div class="mb-3 form-group">
	               <label class="form-label">업체명<span class="text-danger">*</span></label>
	               <div class="controls">
	                 <input type="text" class="form-control" id="ptName" name="ptName" value="" required data-validation-required-message="필수입력 사항입니다.">
	               </div>
	             </div>
	             <div class="mb-3 form-group">
	               <label class="form-label">대표자<span class="text-danger">*</span></label>
	               <div class="controls">
	                 <input type="text" class="form-control" id="ptCeo" name="ptCeo" value="" required data-validation-required-message="필수입력 사항입니다.">
	               </div>
	             </div>
	             <div class="mb-3 form-group">
	               <label class="form-label">개업연월일<span class="text-danger">*</span></label>
	               <div class="controls">
	                 <input type="date" class="form-control" id="ptOpendate" name="ptOpendate" value="" required data-validation-required-message="필수입력 사항입니다.">
	               </div>
	             </div>
	             <div class="mb-3 form-group">
	               <label class="form-label">사업장 소재지<span class="text-danger">*</span></label>
	               <div class="controls" style="display: flex; align-items: center;">
	                   <input type="text" class="form-control" id="ptPostcode" name="ptPostcode" placeholder="우편번호 검색" style="width: 83%;" value="" required data-validation-required-message="필수입력 사항입니다.">
	                   <button type="button" id="searchAdd" class="btn btn-primary ms-auto" onclick="DaumPostcode()">검색</button>
	               </div>
	             </div>
	             <div class="mb-3 form-group">
	               <div class="controls">
	                 <input type="text" class="form-control" id="ptAdd" name="ptAdd" placeholder="주소 입력" value="" required data-validation-required-message="필수입력 사항입니다.">
	               </div>
	             </div>
	             <div class="mb-3 form-group">
	               <div class="controls">
	                 <input type="text" class="form-control" id="ptAdd2" name="ptAdd2" placeholder="상세주소 입력" value="" required data-validation-required-message="필수입력 사항입니다.">
	               </div>
	             </div>
	             <div class="mb-3 form-group">
	               <label class="form-label">담당자명<span class="text-danger">*</span></label>
	               <div class="controls">
	                 <input type="text" class="form-control" id="ptMgrname" name="ptMgrname" value="" required data-validation-required-message="필수입력 사항입니다.">
	               </div>
	             </div>
	             <div class="mb-3 form-group">
	               <label class="form-label">담당자 이메일<span class="text-danger">*</span></label>
	               <div class="controls">
	                 <input type="text" class="form-control" id="ptMgremail" name="ptMgremail" value="" required data-validation-required-message="필수입력 사항입니다.">
	               </div>
	             </div>
	             <div class="mb-3 form-group">
	               <label class="form-label">담당자 연락처<span class="text-danger">*</span></label>
	               <div class="controls">
	                 <input type="text" class="form-control" id="ptMgrtel" name="ptMgrtel" value="" required data-validation-required-message="필수입력 사항입니다.">
	               </div>
	             </div>
	             <div class="mb-3 form-group">
	               <label class="form-label">업체 로고 이미지<span class="text-danger">*</span></label>
	                   <div class="card-body p-4 col-12">
	                     <p class="card-subtitle mb-4" style="text-align: center !important;">업체 로고 이미지 미리보기</p>
                          <div class="text-center">
                            <img src="${pageContext.request.contextPath }/resources/assets/images/profile/user-1.jpg" alt="modernize-img" class="img-fluid rounded-circle" width="120" height="120" id="profileImg">
                            <div class="d-flex align-items-center justify-content-center my-4 gap-6"></div>
                          </div>
	                   </div>
	               <div class="controls">
	                <input type="file" name="imgFile" id="imgFile" class="form-control" required data-validation-required-message="필수입력 사항 입니다."/>
	               </div>
	             </div>
	             <div class="mb-3 form-group">
	               <label class="form-label">파일 첨부<span class="text-danger">*</span></label>
	               <div class="controls">
	                 <input type="file" class="form-control" id="ptFile" name="ptFile" value="" required data-validation-required-message="필수입력 사항입니다." multiple>
                 	 <sec:csrfInput/>
	               </div>
	             </div>
	             <br>
                 <div class="d-flex justify-content-center mb-4">
                   <a href="/partner/login" class="btn btn-outline-primary w-25 py-8 me-3 rounded-2">이전</a>
				   <button type="button" class="btn btn-primary w-25 py-8 rounded-2" id="submitBtn">신청</button>
                 </div>
	            </form>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    
    
                 
	
<script> 
	// 자동 입력 버튼 (시연용)
	$(function(){
	    var autoValBtn = $("#autoValBtn"); // 자동입력 버튼
	
	    autoValBtn.on("click", function(){
	        $("#ptCode").val("PRM04");         
	        $("#ptName").val("아더에러");           
	        $("#ptCeo").val("김철수");    
	        $("#ptOpendate").val("1989-05-03"); // YYYY-MM-DD 형식으로 변경
	        $("#ptPostcode").val("34908");   
	        $("#ptAdd").val("대전 중구 계룡로 846"); 
	        $("#ptAdd2").val("대덕건물 3층 아더에러");     
	        $("#ptMgrname").val("김담당");       
	        $("#ptMgremail").val("kdd@ddit.com"); 
	        $("#ptMgrtel").val("042-222-8202");
	    });
	});

	 // 사업자등록번호 조회 API
	 $(function () {
	   $("#btn").on("click", function () {
	     console.log("click btn");
	     var Brno = $("#ptBusnum").val(); // 입력된 사업자등록번호 가져오기
	     var data = {
	       "b_no": [Brno]
	     };
	     $.ajax({
	       url: "https://api.odcloud.kr/api/nts-businessman/v1/status?serviceKey=kETXrRP6jZruj2J1%2B0nWugzuJGpDzSq5FNVTcpdJpiiU9jFH5QHD1TwqeLf0SphP87wSCTX%2B0%2FZ4bb2Nb9jY0Q%3D%3D",
	       type: "POST",
	       data: JSON.stringify(data),
	       dataType: "JSON",
	       traditional: true,
	       contentType: "application/json; charset:UTF-8",
	       accept: "application/json",
	       success: function (result) {
	         console.log(result);
	         $("#result").show(); // 결과를 표시하기 전에 span을 보이게 함
	         if (result.match_cnt == "1") {
	           console.log("success");
	           $("#result").text("등록된 사업자입니다."); // 성공 메시지 표시
	         } else {
	           $("#result").text("국세청에 등록되지 않은 사업자등록번호입니다."); // 실패 메시지 표시
	         }
	       },
	       error: function (result) {
	         console.log("error");
	         $("#result").show(); // 오류 발생 시에도 span을 보이게 함
	         $("#result").text("조회 중 오류가 발생했습니다."); // 오류 메시지 표시
	       }
	     });
	   });
	 });
  
    // 카카오 주소 API
	function DaumPostcode() {
	    new daum.Postcode({
	        oncomplete: function(data) {
	            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
	            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	            var addr = ''; // 주소 변수
	            var extraAddr = ''; // 참고항목 변수
	
	            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                addr = data.roadAddress;
	            } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                addr = data.jibunAddress;
	            }
	
	            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	            if(data.userSelectedType === 'R'){
	                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                    extraAddr += data.bname;
	                }
	                // 건물명이 있고, 공동주택일 경우 추가한다.
	                if(data.buildingName !== '' && data.apartment === 'Y'){
	                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                }
	            } 
	
	            // 우편번호와 주소 정보를 해당 필드에 넣는다.
	            document.getElementById('ptPostcode').value = data.zonecode;
	            document.getElementById("ptAdd").value = addr;
	            // 커서를 상세주소 필드로 이동한다.
	            document.getElementById("ptAdd2").focus();
	            
	            // input 이벤트 강제로 발생
	            $('#ptPostcode').trigger('input'); // 우편번호 필드
	            $('#ptAdd').trigger('input');       // 주소 필드
	        }
	    }).open();
	}
    
    
	$(function() {
	    var submitBtn = $("#submitBtn");
	    var accountForm = $("#accountForm");
	    var imgFile = $("#imgFile");

	    // 프로필 이미지를 선택했을 때
	    imgFile.on("change", function(event) { // event 매개변수 추가
	        var file = event.target.files[0]; // Open파일로 선택한 이미지 파일

	        if (isImageFile(file)) { // 이미지 라면
	            var reader = new FileReader();
	            reader.onload = function(e) {
	                $("#profileImg").attr("src", e.target.result);
	            }
	            reader.readAsDataURL(file);
	        } else { // 이미지 파일이 아닐 때
	            alert("이미지 파일을 선택해주세요!");
	        }
	    });
	    
	    // 신청 버튼 클릭 시
	    submitBtn.on("click", function(e) {
	        e.preventDefault(); // 기본 폼 제출 방지
	        
	        // 유효성 검사
	        var isValid = true; // 유효성 플래그
	        var requiredFields = [
	            "#ptCode", "#ptBusnum", "#ptName", "#ptCeo",
	            "#ptOpendate", "#ptPostcode", "#ptAdd", "#ptAdd2", 
	            "#ptMgrname", "#ptMgremail", "#ptMgrtel", "#ptFile", "#imgFile"
	        ];

	        // 필수 입력 필드 검사
	        requiredFields.forEach(function(selector) {
	            var $field = $(selector);
	            if ($field.val().trim() == "") {
	                isValid = false;
	                $field.addClass("is-invalid"); // Bootstrap의 invalid 클래스를 추가
	                // 기존 메시지가 없으면 새로운 메시지 표시
	                if ($field.next('.invalid-feedback').length === 0) {
	                    $field.after('<div class="invalid-feedback">' + $field.data("validation-required-message") + '</div>');
		            } else {
		                $field.removeClass("is-invalid"); // 유효한 경우 invalid 클래스 제거
		                $field.next('.invalid-feedback').remove(); // 성공 시 메시지 제거
		            }
		       }
	        });

	        if (!isValid) {
	            return; // 유효성 검사를 통과하지 못하면 함수 종료
	        }

	        // 모든 필드가 유효하면 신청 확인 모달 표시
	        
			Swal.fire({
		 		   title: '신청 확인',
		 		   html: '신청을 진행하시겠습니까?<br>정보를 다시 한 번 확인해주세요.',
		 		   icon: 'info',
		 		   showCancelButton: true, // cancel버튼 보이기. 기본은 원래 없음
		 		   confirmButtonText: '확인', // 확인 버튼 텍스트 변경
		 		   cancelButtonText: '취소', // 취소 버튼 텍스트 변경
		 		   customClass: {
		                cancelButton: 'btn btn-outline-primary', // 취소 버튼에 Bootstrap 클래스 추가
		                confirmButton: 'btn btn-primary me-2' // 확인 버튼에 Bootstrap 기본 클래스 추가
		            },
		            buttonsStyling: false // SweetAlert2의 기본 버튼 스타일 비활성화
				}).then(result => {
				   if (result.isConfirmed) {
					   $('#accountForm').submit(); // 폼 제출
				   }
				});
			});

	    // 각 입력 필드에 입력 이벤트 추가
	    var requiredFields = [
	        "#ptCode", "#ptBusnum", "#ptName", "#ptCeo",
	        "#ptOpendate", "#ptPostcode", "#ptAdd", "#ptAdd2", 
	        "#ptMgrname", "#ptMgremail", "#ptMgrtel", "#ptFile", "#imgFile"
	    ];

	    requiredFields.forEach(function(selector) {
	        $(selector).on('input', function() {
	            var $field = $(this);
	            if ($field.val().trim() !== "") {
	                $field.removeClass("is-invalid"); // 유효한 경우 invalid 클래스 제거
	                $field.next('.invalid-feedback').remove(); // 메시지 제거
	            }
	        });
	    });
	});
	
	function isImageFile(file) {
	    var ext = file.name.split(".").pop().toLowerCase(); // 파일명에서 확장자를 추출
	    return ($.inArray(ext, ["jpg", "jpeg", "png", "gif"]) === -1) ? false : true;
	}

   </script> 


    <button class="btn btn-primary p-3 rounded-circle d-flex align-items-center justify-content-center customizer-btn" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasExample" aria-controls="offcanvasExample">
      <i class="icon ti ti-settings fs-7"></i>
    </button>

    <div class="offcanvas customizer offcanvas-end" tabindex="-1" id="offcanvasExample" aria-labelledby="offcanvasExampleLabel">
      <div class="d-flex align-items-center justify-content-between p-3 border-bottom">
        <h4 class="offcanvas-title fw-semibold" id="offcanvasExampleLabel">
          Settings
        </h4>
        <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
      </div>
      <div class="offcanvas-body h-n80" data-simplebar>
        <h6 class="fw-semibold fs-4 mb-2">Theme</h6>

        <div class="d-flex flex-row gap-3 customizer-box" role="group">
          <input type="radio" class="btn-check light-layout" name="theme-layout" id="light-layout" autocomplete="off" />
          <label class="btn p-9 btn-outline-primary rounded-2" for="light-layout">
            <i class="icon ti ti-brightness-up fs-7 me-2"></i>Light
          </label>

          <input type="radio" class="btn-check dark-layout" name="theme-layout" id="dark-layout" autocomplete="off" />
          <label class="btn p-9 btn-outline-primary rounded-2" for="dark-layout">
            <i class="icon ti ti-moon fs-7 me-2"></i>Dark
          </label>
        </div>

        <h6 class="mt-5 fw-semibold fs-4 mb-2">Theme Direction</h6>
        <div class="d-flex flex-row gap-3 customizer-box" role="group">
          <input type="radio" class="btn-check" name="direction-l" id="ltr-layout" autocomplete="off" />
          <label class="btn p-9 btn-outline-primary" for="ltr-layout">
            <i class="icon ti ti-text-direction-ltr fs-7 me-2"></i>LTR
          </label>

          <input type="radio" class="btn-check" name="direction-l" id="rtl-layout" autocomplete="off" />
          <label class="btn p-9 btn-outline-primary" for="rtl-layout">
            <i class="icon ti ti-text-direction-rtl fs-7 me-2"></i>RTL
          </label>
        </div>

        <h6 class="mt-5 fw-semibold fs-4 mb-2">Theme Colors</h6>

        <div class="d-flex flex-row flex-wrap gap-3 customizer-box color-pallete" role="group">
          <input type="radio" class="btn-check" name="color-theme-layout" id="Blue_Theme" autocomplete="off" />
          <label class="btn p-9 btn-outline-primary d-flex align-items-center justify-content-center" onclick="handleColorTheme('Blue_Theme')" for="Blue_Theme" data-bs-toggle="tooltip" data-bs-placement="top" data-bs-title="BLUE_THEME">
            <div class="color-box rounded-circle d-flex align-items-center justify-content-center skin-1">
              <i class="ti ti-check text-white d-flex icon fs-5"></i>
            </div>
          </label>

          <input type="radio" class="btn-check" name="color-theme-layout" id="Aqua_Theme" autocomplete="off" />
          <label class="btn p-9 btn-outline-primary d-flex align-items-center justify-content-center" onclick="handleColorTheme('Aqua_Theme')" for="Aqua_Theme" data-bs-toggle="tooltip" data-bs-placement="top" data-bs-title="AQUA_THEME">
            <div class="color-box rounded-circle d-flex align-items-center justify-content-center skin-2">
              <i class="ti ti-check text-white d-flex icon fs-5"></i>
            </div>
          </label>

          <input type="radio" class="btn-check" name="color-theme-layout" id="Purple_Theme" autocomplete="off" />
          <label class="btn p-9 btn-outline-primary d-flex align-items-center justify-content-center" onclick="handleColorTheme('Purple_Theme')" for="Purple_Theme" data-bs-toggle="tooltip" data-bs-placement="top" data-bs-title="PURPLE_THEME">
            <div class="color-box rounded-circle d-flex align-items-center justify-content-center skin-3">
              <i class="ti ti-check text-white d-flex icon fs-5"></i>
            </div>
          </label>

          <input type="radio" class="btn-check" name="color-theme-layout" id="green-theme-layout" autocomplete="off" />
          <label class="btn p-9 btn-outline-primary d-flex align-items-center justify-content-center" onclick="handleColorTheme('Green_Theme')" for="green-theme-layout" data-bs-toggle="tooltip" data-bs-placement="top" data-bs-title="GREEN_THEME">
            <div class="color-box rounded-circle d-flex align-items-center justify-content-center skin-4">
              <i class="ti ti-check text-white d-flex icon fs-5"></i>
            </div>
          </label>

          <input type="radio" class="btn-check" name="color-theme-layout" id="cyan-theme-layout" autocomplete="off" />
          <label class="btn p-9 btn-outline-primary d-flex align-items-center justify-content-center" onclick="handleColorTheme('Cyan_Theme')" for="cyan-theme-layout" data-bs-toggle="tooltip" data-bs-placement="top" data-bs-title="CYAN_THEME">
            <div class="color-box rounded-circle d-flex align-items-center justify-content-center skin-5">
              <i class="ti ti-check text-white d-flex icon fs-5"></i>
            </div>
          </label>

          <input type="radio" class="btn-check" name="color-theme-layout" id="orange-theme-layout" autocomplete="off" />
          <label class="btn p-9 btn-outline-primary d-flex align-items-center justify-content-center" onclick="handleColorTheme('Orange_Theme')" for="orange-theme-layout" data-bs-toggle="tooltip" data-bs-placement="top" data-bs-title="ORANGE_THEME">
            <div class="color-box rounded-circle d-flex align-items-center justify-content-center skin-6">
              <i class="ti ti-check text-white d-flex icon fs-5"></i>
            </div>
          </label>
        </div>

        <h6 class="mt-5 fw-semibold fs-4 mb-2">Layout Type</h6>
        <div class="d-flex flex-row gap-3 customizer-box" role="group">
          <div>
            <input type="radio" class="btn-check" name="page-layout" id="vertical-layout" autocomplete="off" />
            <label class="btn p-9 btn-outline-primary" for="vertical-layout">
              <i class="icon ti ti-layout-sidebar-right fs-7 me-2"></i>Vertical
            </label>
          </div>
          <div>
            <input type="radio" class="btn-check" name="page-layout" id="horizontal-layout" autocomplete="off" />
            <label class="btn p-9 btn-outline-primary" for="horizontal-layout">
              <i class="icon ti ti-layout-navbar fs-7 me-2"></i>Horizontal
            </label>
          </div>
        </div>

        <h6 class="mt-5 fw-semibold fs-4 mb-2">Container Option</h6>

        <div class="d-flex flex-row gap-3 customizer-box" role="group">
          <input type="radio" class="btn-check" name="layout" id="boxed-layout" autocomplete="off" />
          <label class="btn p-9 btn-outline-primary" for="boxed-layout">
            <i class="icon ti ti-layout-distribute-vertical fs-7 me-2"></i>Boxed
          </label>

          <input type="radio" class="btn-check" name="layout" id="full-layout" autocomplete="off" />
          <label class="btn p-9 btn-outline-primary" for="full-layout">
            <i class="icon ti ti-layout-distribute-horizontal fs-7 me-2"></i>Full
          </label>
        </div>

        <h6 class="fw-semibold fs-4 mb-2 mt-5">Sidebar Type</h6>
        <div class="d-flex flex-row gap-3 customizer-box" role="group">
          <a href="javascript:void(0)" class="fullsidebar">
            <input type="radio" class="btn-check" name="sidebar-type" id="full-sidebar" autocomplete="off" />
            <label class="btn p-9 btn-outline-primary" for="full-sidebar">
              <i class="icon ti ti-layout-sidebar-right fs-7 me-2"></i>Full
            </label>
          </a>
          <div>
            <input type="radio" class="btn-check " name="sidebar-type" id="mini-sidebar" autocomplete="off" />
            <label class="btn p-9 btn-outline-primary" for="mini-sidebar">
              <i class="icon ti ti-layout-sidebar fs-7 me-2"></i>Collapse
            </label>
          </div>
        </div>

        <h6 class="mt-5 fw-semibold fs-4 mb-2">Card With</h6>

        <div class="d-flex flex-row gap-3 customizer-box" role="group">
          <input type="radio" class="btn-check" name="card-layout" id="card-with-border" autocomplete="off" />
          <label class="btn p-9 btn-outline-primary" for="card-with-border">
            <i class="icon ti ti-border-outer fs-7 me-2"></i>Border
          </label>

          <input type="radio" class="btn-check" name="card-layout" id="card-without-border" autocomplete="off" />
          <label class="btn p-9 btn-outline-primary" for="card-without-border">
            <i class="icon ti ti-border-none fs-7 me-2"></i>Shadow
          </label>
        </div>
      </div>
    </div>
  </div>
  <div class="dark-transparent sidebartoggler"></div>
  <!-- Import Js Files -->
  <script src="${pageContext.request.contextPath }/resources/assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
  <script src="${pageContext.request.contextPath }/resources/assets/libs/simplebar/dist/simplebar.min.js"></script>
  <script src="${pageContext.request.contextPath }/resources/assets/js/theme/app.init.js"></script>
  <script src="${pageContext.request.contextPath }/resources/assets/js/theme/theme.js"></script>
  <script src="${pageContext.request.contextPath }/resources/assets/js/theme/app.min.js"></script>

  <!-- solar icons -->
  <script src="https://cdn.jsdelivr.net/npm/iconify-icon@1.0.8/dist/iconify-icon.min.js"></script>
  
  <!-- validation -->
  <script src="${pageContext.request.contextPath }/resources/assets/js/extra-libs/jqbootstrapvalidation/validation.js"></script>
  <script src="${pageContext.request.contextPath }/resources/assets/js/forms/custom-validation-init.js"></script>
  
   <!-- SweetAlert2 -->
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
  <script src="${pageContext.request.contextPath }/resources/assets/libs/sweetalert2/dist/sweetalert2.min.js"></script>
  <script src="${pageContext.request.contextPath }/resources/assets/js/forms/sweet-alert.init.js"></script>
</body>

</html>