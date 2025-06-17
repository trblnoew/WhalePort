<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script src="https://developers.kakao.com/v2/kakaomap.js"></script>
  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e08ba589b52c5c3e16fd367810537e20&libraries=services"></script>
    
<div class="body-wrapper">
        <div class="container-fluid">
          <div class="card bg-info-subtle shadow-none position-relative overflow-hidden mb-4">
            <div class="card-body px-4 py-3">
              <div class="row align-items-center">
                <div class="col-9">
                  <h4 class="fw-semibold mb-8">직원 수정</h4>
                  <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                      <li class="breadcrumb-item">
                        <a class="text-muted text-decoration-none" href="../rtl/index.html">Home</a>
                      </li>
                      <li class="breadcrumb-item" aria-current="page">직원 수정</li>
                    </ol>
                  </nav>
                </div>
                <div class="col-3">
                  <div class="text-center mb-n5">
                    <img src="${pageContext.request.contextPath }/resources/assets/images/breadcrumb/ChatBc.png" alt="modernize-img" class="img-fluid mb-n4" />
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="card">
            <div class="border-bottom title-part-padding">
              <h4 class="card-title mb-0">직원 정보 입력</h4>
            </div>
            <div class="card-body">
              <form action="/management/update?empId=${employeeVO.empId }" method="post" id="empRegisterForm" enctype="multipart/form-data">
                <div class="mb-3 form-group">
                  <label class="form-label">이름
                     
                  </label>
                  <div class="controls">
                    <input type="text" id="empName" name="empName" class="form-control"  
                    value="${employeeVO.empName }" />
                  </div>
                  
                </div>
                <div class="mb-3 form-group">
                  <label class="form-label">사번  
                  </label>
                  <div class="controls">
                    <input type="text" name="empId" id="empId" class="form-control" placeholder="자동 생성" value="${employeeVO.empId }" disabled/>
                  </div>
                   <div class="form-control-feedback">
                    <small>필수 <code>유효성검사</code> 를 위해 필드에 필수 속성을 추가합니다.</small>
                  </div>
                </div>
                <div class="mb-3 form-group col-12">
                  <label class="form-label">프로필 사진
                     
                  </label>
                  
                  <div class="card-body p-4 col-3">
                          <p class="card-subtitle mb-4" style="text-align: center !important;">프로필 사진 미리보기</p>
                          <div class="text-center">
                            <img src="${employeeVO.empImage }" alt="modernize-img" class="img-fluid rounded-circle" width="120" height="120" id="profileImg">
                            <div class="d-flex align-items-center justify-content-center my-4 gap-6">
                              <!-- <button class="btn btn-primary">Upload</button> -->
                              
                            </div>
                            <p class="mb-0">Allowed JPG, GIF or PNG. Max size of 800K</p>
                          </div>
                        </div>
                  
                  <div class="controls">
                    <input type="file" name="imgFile" id="imgFile" class="form-control" value="${employeeVO.imgFile }"/>
                  </div>
                  
                </div>
                
                <div class="mb-3 form-group">
                  <label class="form-label">Email
                     
                  </label>
                  <div class="controls">
                    <input type="email" id="empEmail" name="empEmail" class="form-control" value="${employeeVO.empEmail }"/>
                  </div>
                </div>
                  
                <div class="mb-3 form-group">
                  <label class="form-label">부서  
                  </label>
                 <div class="controls">
                  <select name="empDept" id="empDept" required class="form-select form-control" >
                      <option value="인사부" <c:if test="${employeeVO.empDept eq '인사부' }">selected</c:if> >인사부</option>
                      <option value="전산부" <c:if test="${employeeVO.empDept eq '전산부' }">selected</c:if> >전산부</option>
                      <option value="인사부" <c:if test="${employeeVO.empDept eq '협력업체 관리부' }">selected</c:if> >협력업체 관리부</option>
                      <option value="공항서비스 관리부" <c:if test="${employeeVO.empDept eq '공항서비스 관리부' }">selected</c:if> >공항서비스 관리부</option>
                    </select> 
                  </div>
                </div>
                <div class="mb-3 form-group">
                  <label class="form-label">직위  
                  </label>
                 <div class="controls">
                    <select name="empPosition" id="empPosition" class="form-select form-control">
                      <option value="사원" <c:if test="${employeeVO.empPosition eq '사원' }">selected</c:if>>사원</option>
                      <option value="주임" <c:if test="${employeeVO.empPosition eq '주임' }">selected</c:if>>주임</option>
                      <option value="대리" <c:if test="${employeeVO.empPosition eq '대리' }">selected</c:if>>대리</option>
                      <option value="과장" <c:if test="${employeeVO.empPosition eq '과장' }">selected</c:if>>과장</option>
                      <option value="차장" <c:if test="${employeeVO.empPosition eq '차장' }">selected</c:if>>차장</option>
                      <option value="부장" <c:if test="${employeeVO.empPosition eq '부장' }">selected</c:if>>부장</option>
                      <option value="이사" <c:if test="${employeeVO.empPosition eq '이사' }">selected</c:if>>이사</option>
                      <option value="상무" <c:if test="${employeeVO.empPosition eq '상무' }">selected</c:if>>상무</option>
                      <option value="전무" <c:if test="${employeeVO.empPosition eq '전무' }">selected</c:if>>전무</option>
                      <option value="부사장" <c:if test="${employeeVO.empPosition eq '부사장' }">selected</c:if>>부사장</option>
                      <option value="사장" <c:if test="${employeeVO.empPosition eq '사장' }">selected</c:if>>사장</option>
                    </select>
                  </div>
                </div>
                
                <div class="mb-3">
                  <label for="inputEmail3" class="form-label">생년월일 
                  </label>
                  <div class="input-group">
                    <span class="input-group-text" id="basic-addon1">
                      <i class="ti ti-calendar fs-4"></i>
                    </span>
                    <input type="date" class="form-control" id="empBirth" name="empBirth" aria-label="Username" aria-describedby="basic-addon1"
                    value="${employeeVO.empBirth }">
                  </div>
                </div>
                
                 <div class="mb-3 form-group">
                  <label class="form-label">우편번호
                  </label>
                 <div class="controls d-flex">
				    <input type="text" id="empPostcode" name="empPostcode" class="form-control" style="width: 93%;" value="${employeeVO.empPostcode }" />
				    <button type="button" id="searchAdd" class="btn btn-primary ms-2" onclick="DaumPostcode()">검색</button>
				</div>
                </div>
                <div class="mb-3 form-group">
                  <label class="form-label">주소
                     
                  </label>
                  <div class="controls">
                    <input type="text" id="empAddr" name="empAddr" class="form-control" 
                    value="${employeeVO.empAddr }"/>
                  </div>
                </div>
                <div class="mb-3 form-group">
                  <label class="form-label">상세 주소
                     
                  </label>
                  <div class="controls">
                    <input type="text" id="empAddr2" name="empAddr2" class="form-control" 
                    value="${employeeVO.empAddr2 }"/>
                  </div>
                </div>
                
                <div class="mb-3 form-group">
                  <label class="form-label">휴대전화
                     
                  </label>
                  <div class="controls">
                    <input type="text" id="empTel" name="empTel" class="form-control" 
                    value="${employeeVO.empTel }"/>
                  </div>
                </div>
                
                <div class="d-flex flex-wrap gap-6 justify-content-end">
                  <button type="button" id="udtBtn" class="btn btn-primary">
                    수정
                  </button>
                  <button type="reset" id="resetBtn" class="btn btn-outline-primary" onclick="location.href='/management/empDetail?empId=${employeeVO.empId }'">
                    이전
                  </button>
                </div>
                 <sec:csrfInput/>
              </form>
            </div>
          </div>
        </div>
      </div>
      

 <!-- SweetAlert2 -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="../assets/libs/sweetalert2/dist/sweetalert2.min.js"></script>
<script src="../assets/js/forms/sweet-alert.init.js"></script>   
      
<script type="text/javascript">
$(function(){
	var udtBtn = $("#udtBtn");
	var empRegisterForm = $("#empRegisterForm");
	var imgFile = $("#imgFile");
	var empBirth = $("#empBirth");
	
				
	
	// 프로필 이미지를 선택했을 때
	imgFile.on("change", function(){
		var file = event.target.files[0]; // Open파일로 선택한 이미지 파일
		
		if(isImageFile(file)){ // 이미지 라면
			var reader = new FileReader();
			reader.onload = function(e){
				$("#profileImg").attr("src", e.target.result);
			}
			reader.readAsDataURL(file);
		}else{				   // 이미지 파일이 아닐 때
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

        empBirth = new Date(strArr[0], strArr[1]-1, strArr[2]); 
        
    }); 
	// 등록 버튼 이벤트
	udtBtn.on("click", function(){
		
		var formData = new FormData(empRegisterForm[0]);
		
		$.ajax({
            url: '/management/update', 
            method: 'POST',
            data: formData,
            contentType: false, // jQuery에서 content-type을 자동으로 설정하지 않도록
            processData: false, // jQuery에서 데이터 처리를 하지 않도록
            success: function(response) {
                // 성공적으로 승인되었을 때
                Swal.fire(
                    '수정 완료!',
                    '수정 처리가 완료되었습니다.',
                    'success'
                ).then(() => {
                    // SweetAlert2의 성공 메시지 후에 Form을 제출
                	empRegisterForm.submit();
                });
            },
            error: function(xhr, status, error) {
                // 오류가 발생했을 때
                Swal.fire(
                    '오류!',
                    '수정 처리에 실패했습니다.',
                    'error'
                );
            }
        });
	});
	
});

function isImageFile(file){
	var ext = file.name.split(".").pop().toLowerCase();	// 파일명에서 확장자를 추출
	return ($.inArray(ext, ["jpg","jpeg","png","gif"]) === -1 ) ? false : true;
};

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