<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<style>
.input-icon {
    position: relative;
}

.input-icon i {
    position: absolute;
    top: 50%;
    right: 10px;
    transform: translateY(-50%);
    cursor: pointer;
    color: gray;
}

.input-icon input {
    padding-right: 30px;
}
</style>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://code.jquery.com/jquery-3.x.x.min.js"></script>
<div class="body-wrapper">
	<div class="container-fluid">
	
	  <div class="card bg-info-subtle shadow-none position-relative overflow-hidden mb-4">
            <div class="card-body px-4 py-3">
              <div class="row align-items-center">
                <div class="col-9">
                  <h4 class="fw-semibold mb-8">고객 상세</h4>
                  <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                      <li class="breadcrumb-item">
                        <a class="text-muted text-decoration-none" href="/common/home">DashBoard</a>
                      </li>
                      <li class="breadcrumb-item" aria-current="page">Customer</li>
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
		<form action="/management/customer/upate" method="post" id="upateForm">
			<input type="hidden" name="cusNo" value="${cusVO.cusNo }" />
			<div class="tab-content" id="pills-tabContent">
				<div class="tab-pane fade show active" id="pills-profile" role="tabpanel" aria-labelledby="pills-profile-tab" tabindex="0">
					<div class="row">
						<div class="col-lg-6">
							<div class="mb-3">
							
								<label class="form-label">아이디</label> 
								<input type="text" class="form-control rd" name="cusId" value="${cusVO.cusId}" id="cusId" readonly/>
							</div>
							<div class="mb-3">
								<label class="form-label">이름</label> 
								<input type="text" class="form-control rd" name="cusName" value="${cusVO.cusName}" />
							</div>
							<div class="mb-3">
								<label class="form-label">이메일</label>
								    <input type="email" class="form-control rd" name="cusEmail" value="${cusVO.cusEmail}" id="cusEmail" />
							</div>

							<div class="mb-3">
								<label class="form-label">성별</label>
								<select name="cusGender" id="cusGender" class="form-select form-control">
									<option value="" >선택</option>
									<option value="M" <c:if test="${cusVO.cusGender eq 'M'}">selected</c:if> >남자</option>
									<option value="F" <c:if test="${cusVO.cusGender eq 'F'}">selected</c:if> >여자</option>
								</select>
							</div>

						</div>
						<div class="col-lg-6">
							<div class="mb-3">
								<label for="form-label" class="form-label">비밀번호</label>
								<input type="password" class="form-control rd" name="cusDepw" value="${cusVO.cusDepw }" id="cusDepw" disabled />
							</div>
							<div class="mb-3">
								<label for="form-label" class="form-label">휴대전화번호</label>
								<input type="text" class="form-control" name="cusTel" value="${cusVO.cusTel}" id="cusTel" >
							</div>
							<div class="mb-3">
								<label class="form-label">생년월일</label> 
								<input type="text" class="form-control rd" name="cusBirth" value="${fn:split(cusVO.cusBirth, ' ')[0] }" id="cusBirth"/>
									
							</div>
							<div class="mb-3">
								<label for="form-label">마케팅 수신여부</label>
								<select name="cusSend" id="cusSend" class="form-select form-control">
									<option value="" >선택</option>
									<option value="Y" <c:if test="${cusVO.cusSend eq 'Y'}">selected</c:if> >동의</option>
									<option value="N" <c:if test="${cusVO.cusSend eq 'N'}">selected</c:if> >비동의</option>
								</select>
							</div>
						</div>
						<div class="col-12">
							<div class="mb-3 col-6">
							    <label class="form-label">우편번호</label>
							    <div class="input-group">
							        <input type="text" class="form-control rd" name="cusPostcode" value="${cusVO.cusPostcode}" id="cusPostcode">
							        <button type="button" class="btn btn-primary" onclick="DaumPostcode()">검색</button>
							    </div>
							</div>
							<div class="mb-3">
								<label class="form-label">주소</label>
								<input type="text" class="form-control rd" name="cusAdd" value="${cusVO.cusAdd}" id="cusAdd">
							</div>
							<div class="mb-3">
								<label class="form-label">상세주소</label>
								<input type="text" class="form-control rd" name="cusAdd2" value="${cusVO.cusAdd2}" id="cusAdd2">
							</div>
						</div>
						<div class="col-12">
							<div class="d-flex align-items-center justify-content-end mt-4 gap-6">
                       			<c:if test="${cusVO.cusDelyn eq 'N'}">
									<button type="button" class="btn btn-primary" id="updtBtn">수정</button>
									<button type="button" class="btn btn-danger" id="cancelBtn">탈퇴</button>
                       			</c:if>
                       			<a href="/management/customer/list" class="btn btn-outline-primary me-3">이전</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<sec:csrfInput/>
		</form>
	</div>
</div>






<script type="text/javascript">



$(function(){
	

	
	
	// 수정버튼
	$("#updtBtn").on("click", function(){
		Swal.fire({
 		   title: '정보 수정',
 		   text: '수정을 진행하시겠습니까?',
 		   icon: 'info',
 		   
 		   showCancelButton: true, // cancel버튼 보이기. 기본은 원래 없음
 		   confirmButtonText: '확인', // 확인 버튼 텍스트 변경
 		   cancelButtonText: '취소', // 취소 버튼 텍스트 변경
 		   customClass: {
                cancelButton: 'btn btn-outline-primary', // 취소 버튼에 Bootstrap 클래스 추가
                confirmButton: 'btn btn-primary me-2' // 확인 버튼에 Bootstrap 기본 클래스 추가 (선택 사항)
            },
            buttonsStyling: false // SweetAlert2의 기본 버튼 스타일 비활성화
 		   
		}).then(result => {
		   // 만약 Promise리턴을 받으면,
		   if (result.isConfirmed) { // 만약 모달창에서 confirm 버튼을 눌렀다면
			   
		   
			   $('#upateForm').submit(); // 폼 제출
		   }
		});
	});
	
	// 삭제버튼
	$("#cancelBtn").on("click", function(){
		Swal.fire({
 		   title: '고객 탈퇴',
 		   text: '정말 탈퇴를 진행하시겠습니까?',
 		   icon: 'warning',
 		   
 		   showCancelButton: true, // cancel버튼 보이기. 기본은 원래 없음
 		   confirmButtonText: '확인', // 확인 버튼 텍스트 변경
 		   cancelButtonText: '취소', // 취소 버튼 텍스트 변경
 		   customClass: {
                cancelButton: 'btn btn-outline-primary', // 취소 버튼에 Bootstrap 클래스 추가
                confirmButton: 'btn btn-primary me-2' // 확인 버튼에 Bootstrap 기본 클래스 추가 (선택 사항)
            },
            buttonsStyling: false // SweetAlert2의 기본 버튼 스타일 비활성화
 		   
		}).then(result => {
		   // 만약 Promise리턴을 받으면,
		   if (result.isConfirmed) { // 만약 모달창에서 confirm 버튼을 눌렀다면
		   
			   $('#upateForm').attr("action","/management/customer/delete"); // 삭제로 경로 변경
			   $('#upateForm').submit(); // 폼 제출
		   }
		});
	});
	
	


});
//카카오 주소 API
function DaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            var addr = '';
            var extraAddr = '';

            if (data.userSelectedType === 'R') {
                addr = data.roadAddress;
            } else {
                addr = data.jibunAddress;
            }

            if(data.userSelectedType === 'R'){
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
            } 
            document.getElementById("cusPostcode").value = data.zonecode;
            document.getElementById("cusAdd").value = addr;
            document.getElementById("cusAdd2").focus();
        }
    }).open();
};
</script>
<script type="text/javascript">
// $(document).ready(function() {
//     // DOM을 관찰하여 customerManage 요소를 감지
//     const targetNode = document.body;  // body 또는 다른 상위 요소를 감지
//     const config = { childList: true, subtree: true };

//     const callback = function(mutationsList, observer) {
//         for(const mutation of mutationsList) {
//             if (mutation.type === 'childList') {
//                 const customerManage = document.getElementById('customerManage');
//                 if (customerManage) {
//                     customerManage.classList.add('sidebar-link', 'active');
//                     console.log("클래스가 추가되었습니다 (MutationObserver)");
//                     observer.disconnect();  // DOM 변화 감시 종료
//                 }
//             }
//         }
//     };

//     const observer = new MutationObserver(callback);
//     observer.observe(targetNode, config);  // DOM 변화를 감지
// });
</script>
</body>
</html>
