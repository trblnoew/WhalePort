<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

  <script src="https://developers.kakao.com/v2/kakaomap.js"></script>
  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e08ba589b52c5c3e16fd367810537e20&libraries=services"></script>    
    
    
<div class="body-wrapper">
        <div class="container-fluid">
          <div class="card bg-info-subtle shadow-none position-relative overflow-hidden mb-4">
            <div class="card-body px-4 py-3">
              <div class="row align-items-center">
                <div class="col-9">
                  <h4 class="fw-semibold mb-8">직원 등록</h4>
                  <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                      <li class="breadcrumb-item">
                        <a class="text-muted text-decoration-none" href="../main/index.html">DashBoard</a>
                      </li>
                      <li class="breadcrumb-item" aria-current="page">직원 등록</li>
                    </ol>
                  </nav>
                </div>
                <div class="col-3">
                 <div class="text-center mb-n4">
                    <img src="${pageContext.request.contextPath }/resources/assets/images/logos/symbol-01.png" alt="modernize-img" class="img-fluid" style="width: 120px; height: auto;">
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="card">
            <div class="border-bottom title-part-padding">
              <h4 class="card-title mb-0">직원 정보 입력</h4>
            </div>
            <div class="mb-3" style="text-align: left; margin-left: 35px; margin-top: 20px;">
				<button type="button" class="btn btn-outline-primary" id="autoValBtn">자동입력</button>
			</div>
            <div class="card-body">
              <form action="/management/register" method="post" id="empRegisterForm" enctype="multipart/form-data" novalidate>
                <div class="mb-3 form-group">
                  <label class="form-label">이름
                    <span class="text-danger">*</span>
                  </label>
                  <div class="controls">
                    <input type="text" id="empName" name="empName" class="form-control" required data-validation-required-message="필수입력 사항 입니다." />
                  </div>
                  
                </div>
                <div class="mb-3 form-group">
                  <label class="form-label">비밀번호
                    <span class="text-danger">*</span>
                  </label>
                  <div class="controls">
                    <input type="text" class="form-control" placeholder="직원 등록시 생년월일로 자동생성 됩니다." disabled/> 
                  </div>
                </div>
                <div class="mb-3 form-group col-12">
                  <label class="form-label">프로필 사진
                    <span class="text-danger">*</span>
                  </label>
                  
                  <div class="card-body p-4 col-3">
                          <p class="card-subtitle mb-4" style="text-align: center !important;">프로필 사진 미리보기</p>
                          <div class="text-center">
                            <img src="${pageContext.request.contextPath }/resources/assets/images/profile/user-1.jpg" alt="modernize-img" class="img-fluid rounded-circle" width="120" height="120" id="profileImg">
                            <div class="d-flex align-items-center justify-content-center my-4 gap-6">
                              <!-- <button class="btn btn-primary">Upload</button> -->
                              
                            </div>
                            <p class="mb-0">Allowed JPG, GIF or PNG. Max size of 800K</p>
                          </div>
                        </div>
                  
                  <div class="controls">
                    <input type="file" name="imgFile" id="imgFile" class="form-control" required data-validation-required-message="필수입력 사항 입니다."/>
                  </div>
                  
                </div>
                
                <div class="mb-3 form-group">
                  <label class="form-label">Email
                    <span class="text-danger">*</span>
                  </label>
                  <div class="controls">
                    <input type="email" id="empEmail" name="empEmail" class="form-control" required data-validation-required-message="필수입력 사항 입니다." />
                  </div>
                </div>
                  
                <div class="mb-3 form-group">
                  <label class="form-label">부서 <span class="text-danger">*</span>
                  </label>
                 <div class="controls">
                    <select name="empDept" id="empDept" required data-validation-required-message="필수입력 사항 입니다." class="form-select form-control">
                      <option value="">부서 선택</option>
                      <option value="인사부">인사부</option>
                      <option value="전산부">전산부</option>
                      <option value="협력업체 관리부">협력업체 관리부</option>
                      <option value="공항서비스 관리부">공항서비스 관리부</option>
                    </select>
                  </div>
                </div>
                <div class="mb-3 form-group">
                  <label class="form-label">직위 <span class="text-danger">*</span>
                  </label>
                 <div class="controls">
                    <select name="empPosition" id="empPosition" required data-validation-required-message="필수입력 사항 입니다." class="form-select form-control">
                      <option value="">직위 선택</option>
                      <option value="사원">사원</option>
                      <option value="주임">주임</option>
                      <option value="대리">대리</option>
                      <option value="과장">과장</option>
                      <option value="차장">차장</option>
                      <option value="부장">부장</option>
                      <option value="이사">이사</option>
                      <option value="상무">상무</option>
                      <option value="전무">전무</option>
                      <option value="부사장">부사장</option>
                      <option value="사장">사장</option>
                    </select>
                  </div>
                </div>
                
                
                <div class="mb-3">
                  <label for="inputEmail3" class="form-label">생년월일<span class="text-danger">*</span>
                  </label>
                  <div class="input-group">
                    <span class="input-group-text" id="basic-addon1">
                      <i class="ti ti-calendar fs-4"></i>
                    </span>
<!--                     <input type="date" class="form-control" id="empBirth" name="empBirth" aria-label="Username" max="9999-12-31" aria-describedby="basic-addon1" required data-validation-required-message="필수입력 사항 입니다."> -->
                    <input type="text" class="form-control" id="empBirth" name="empBirth" aria-label="Username" max="9999-12-31" aria-describedby="basic-addon1" required data-validation-required-message="필수입력 사항 입니다.">
                  </div>
                </div>
                
                
                <div class="mb-3 form-group">
                  <label class="form-label">우편번호
                    <span class="text-danger">*</span>
                  </label>
                 <div class="controls d-flex">
				    <input type="text" id="empPostcode" name="empPostcode" class="form-control" style="width: 93%;" value="" required data-validation-required-message="필수입력 사항 입니다."/>
				    <button type="button" id="searchAdd" class="btn btn-primary ms-2" onclick="DaumPostcode()">검색</button>
				</div>
                </div>
                <div class="mb-3 form-group">
                  <label class="form-label">주소
                    <span class="text-danger">*</span>
                  </label>
                  <div class="controls">
                    <input type="text" id="empAddr" name="empAddr" class="form-control" value="" required data-validation-required-message="필수입력 사항 입니다."/>
                  </div>
                </div>
                <div class="mb-3 form-group">
                  <label class="form-label">상세주소
                    <span class="text-danger">*</span>
                  </label>
                  <div class="controls">
                    <input type="text" id="empAddr2" name="empAddr2" class="form-control" required data-validation-required-message="필수입력 사항 입니다."/>
                  </div>
                </div>
                
                <div class="mb-3 form-group">
                  <label class="form-label">휴대전화
                    <span class="text-danger">*</span>
                  </label>
                  <div class="controls">
                    <input type="text" id="empTel" name="empTel" class="form-control" required data-validation-required-message="필수입력 사항 입니다."/>
                  </div>
                </div>
                
                <div class="d-flex flex-wrap gap-6 justify-content-end">
				    <button type="button" id="addBtn" class="btn btn-primary">
				        등록
				    </button>
				    <button type="reset" onclick="location.href='/management/list';" id="resetBtn" class="btn btn-outline-primary">
				        이전
				    </button>
				</div>

                 <sec:csrfInput/>
                 <input type="hidden" id="empDepw" name="empDepw"/>
              </form>
            </div>
          </div>
        </div>
      </div>
      
     
     
<script type="text/javascript">
$(function() {
    var addBtn = $("#addBtn");
    var empRegisterForm = $("#empRegisterForm");
    var imgFile = $("#imgFile");
    var empBirth = $("#empBirth");
    var empName = $("#empName");
    var empEmail = $("#empEmail");
    var empPw = $("#empPw");
    var empDept = $("#empDept");
    var empPosition = $("#empPosition");
    var empPostcode = $("#empPostcode");
    var empAddr = $("#empAddr");
    var empAddr2 = $("#empAddr2");
    var empTel = $("#empTel");
    
 	// 자동 입력 버튼 - 최종 프로젝트를 위한
	$("#autoValBtn").on("click", function(){
		$("#empName").val("김수영");         
        $("#empEmail").val("qwe@qwe.com");           
        $("#empDept").val("인사부").prop("selected", true); 
        $("#empPosition").val("사원").prop("selected", true); 
        $("#empBirth").val("1994-03-22"); 
		$("#empPostcode").val("13529");         
		$("#empAddr").val("경기 성남시 분당구 백현동 532");         
		$("#empAddr2").val("123");         
		$("#empTel").val("010-1234-5678");         


	});
    
	

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

    empBirth.on('focusout', function() {
        // 날짜 입력 요소 선택
        var selectedDate = $(this).val();

        // 날짜 형식 변경: 2024-10-10 -> 2024/10/10
        empBirth = selectedDate.replace(/-/g, '/');

        // 선택한 날짜 출력
        console.log('선택한 생년월일:', empBirth);

        var strArr = empBirth.split('/');
        empBirth = new Date(strArr[0], strArr[1] - 1, strArr[2]);
        console.log(strArr);
        
        var empPwValue = strArr.join(''); // ['2024', '10', '10'] -> '20241010'
       console.log(empPwValue);
        $('#empDepw').val(empPwValue); // hidden input에 값 설정
    });

    // 등록 버튼 이벤트
    addBtn.on("click", function() {
    	
    	// 유효성 검사
        var isValid = true; // 유효성 플래그
        var requiredFields = [
            "#empName", "#imgFile", "#empBirth", "#empAddr",
            "#empAddr2", "#empPostcode", "#empTel", "#empEmail", 
            "#empDept", "#empPosition"
        ];
    	
        // 필수 입력 필드 검사
        requiredFields.forEach(function(selector) {
            var $field = $(selector);
            if ($field.val().trim() === "") {
                isValid = false;
                $field.addClass("is-invalid"); // Bootstrap의 invalid 클래스를 추가
                // 기존 메시지가 없으면 새로운 메시지 표시
                if ($field.next('.invalid-feedback').length === 0) {
                    $field.after('<div class="invalid-feedback">' + $field.data("validation-required-message") + '</div>');
                }
            } else {
                $field.removeClass("is-invalid"); // 유효한 경우 invalid 클래스 제거
                $field.next('.invalid-feedback').remove(); // 성공 시 메시지 제거
            }
        });

        if (!isValid) {
            return; // 유효성 검사를 통과하지 못하면 함수 종료
        }
        
        var formData = new FormData(empRegisterForm[0]); // FormData 생성

        Swal.fire({
            title: '직원 등록', // 제목 변경
            text: '해당 직원의 등록을 진행하시겠습니까?', // 내용 변경
            icon: 'info', // 아이콘 설정
            showCancelButton: true, // 취소 버튼 표시
            confirmButtonText: '확인', // 확인 버튼 텍스트 변경
            cancelButtonText: '취소', // 취소 버튼 텍스트 변경
            customClass: {
                cancelButton: 'btn btn-outline-primary', // 취소 버튼에 Bootstrap 클래스 추가
                confirmButton: 'btn btn-primary me-2' // 확인 버튼에 Bootstrap 기본 클래스 추가 (선택 사항)
            },
            buttonsStyling: false // SweetAlert2의 기본 버튼 스타일 비활성화
        }).then((result) => {
            if (result.isConfirmed) {
                // 사용자가 "확인" 버튼을 클릭했을 경우
                 empRegisterForm.submit();
               /*  $.ajax({
                    url: '/management/register',
                    method: 'POST',
                    data: formData,
                    contentType: false, // jQuery에서 content-type을 자동으로 설정하지 않도록
                    processData: false, // jQuery에서 데이터 처리를 하지 않도록
                    success: function(response) {
                        // 성공적으로 승인되었을 때
                       
                    },
                    error: function(xhr, status, error) {
                        // 오류가 발생했을 때
                        Swal.fire('오류!', '등록 처리에 실패했습니다.', 'error');
                    }
                }); */
            }
        });
    });
	//각 입력 필드에 입력 이벤트 추가
	var requiredFields = [
		"#empName", "#imgFile", "#empBirth", "#empAddr",
        "#empAddr2", "#empPostcode", "#empTel", "#empEmail", 
        "#empDept", "#empPosition"
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

//카카오 주소 API
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
            document.getElementById('empPostcode').value = data.zonecode;
            document.getElementById("empAddr").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("empAddr2").focus();
            
            // input 이벤트 강제로 발생
            $('#empPostcode').trigger('input'); // 우편번호 필드
            $('#empAddr').trigger('input');       // 주소 필드
        }
    }).open();
}
</script>