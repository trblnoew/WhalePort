<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
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
<%
	// list.jsp에서 알림을 표시하기 위한 조건
String msg = (String) request.getAttribute("msg");
String message = (String) request.getAttribute("message");
%>
<div class="body-wrapper">
	<div class="container-fluid">
		<div class="card bg-info-subtle shadow-none position-relative overflow-hidden mb-4">
			<div class="card-body px-4 py-3">
				<div class="row align-items-center">
					<div class="col-9">
						<h4 class="fw-semibold mb-8">내 정보 수정</h4>
						<nav aria-label="breadcrumb">
							<ol class="breadcrumb">
								<li class="breadcrumb-item">
									<a class="text-muted text-decoration-none" href="/common/home">DashBoard</a>
								</li>
								<li class="breadcrumb-item" aria-current="page">내 정보 수정</li>
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
		<form action="/common/profileUpdate" method="post" id="profileForm" enctype="multipart/form-data">
		<div class="card overflow-hidden">
			<div class="card-body p-0">
				<img src="${pageContext.request.contextPath }/resources/assets/images/logos/profileBg.jpg" class="img-fluid">
				<div class="row align-items-center">
					<div class="col-lg-4 order-lg-1 order-2">
						<div class="d-flex align-items-center justify-content-around m-4">
							<div class="text-center">
								<h4 class="mb-0 lh-1"></h4>
								<p class="mb-0 "></p>
							</div>
							<div class="text-center">
								<h4 class="mb-0 lh-1"></h4>
								<p class="mb-0 "></p>
							</div>
							<div class="text-center">
								<h4 class="mb-0 lh-1"></h4>
								<p class="mb-0 "></p>
							</div>
						</div>
					</div>
					<div class="col-lg-4 mt-n3 order-lg-2 order-1">
						<div class="mt-n5">
							<div class="d-flex align-items-center justify-content-center mb-2">
								<div class="d-flex align-items-center justify-content-center round-110">
									<div class="border border-4 border-white d-flex align-items-center justify-content-center rounded-circle overflow-hidden round-100">
									    <img id="profileImg" src="${loginCommonVO.empImage}" alt="modernize-img" class="w-100 h-100">
									</div>
									<input type="file" id="imgFile" name="imgFile" style="display: none;"/>
								</div>
							</div>
							<div class="text-center">
								<h5 class="mb-0">${loginCommonVO.empName}</h5>
								<p class="mb-0">${loginCommonVO.empDept}</p>
							</div>
						</div>
					</div>
					<div class="col-lg-4 order-last"></div>
				</div>
			</div>
		</div>
		
			<div class="tab-content" id="pills-tabContent">
				<div class="tab-pane fade show active" id="pills-profile" role="tabpanel" aria-labelledby="pills-profile-tab" tabindex="0">
					<div class="row">
						<div class="col-lg-6">
							<div class="mb-3">
								<label class="form-label">이름</label> 
								<input type="text" class="form-control rd" name="empName" value="${loginCommonVO.empName}" id="empName" data-validation = "Y" data-name="이름">
							</div>
							<div class="mb-3">
								<label class="form-label">사번</label> 
								<input type="text" class="form-control rd" name="empId" value="${loginCommonVO.empId}" disabled="disabled">
							</div>
							<div class="mb-3">
								<label class="form-label">비밀번호</label>
								<input type="password" class="form-control rd passwordChk" name="empDepw" id="empDepw" data-validation = "Y" data-name="비밀번호">
<!-- 								<input type="hidden" class="form-control rd passwordChk" name="empPw" id="empPw"> -->
							</div>
							<div class="mb-3">
								<label class="form-label">비밀번호 확인</label>
								<div class="input-group">
							        <input type="password" class="form-control rd passwordChk" name="empDepw2" id="empDepw2" data-validation = "Y" data-name="비밀번호 확인">
							    </div>
						        <div id="pwChkResult"></div>
							</div>
							<div class="mb-3">
								<label for="exampleInputtext1" class="form-label">이메일</label>
								<input type="email" class="form-control rd" name="empEmail" id="empEmail" value="${loginCommonVO.empEmail}" data-validation = "Y" data-name="이메일">
							</div>
								<div class="mb-3">
								<label class="form-label">생년월일</label> 
								<input type="date" class="form-control rd" name="empBirth" value="<fmt:formatDate value='${loginCommonVO.empBirth}' pattern='yyyy-MM-dd' />" data-validation = Y data-name="생년월일">
									
							</div>
						</div>
						<div class="col-lg-6">
							<div class="mb-3">
								<label for="form-label" class="form-label">입사일</label>
								<input type="text" class="form-control rd" name="empStartdate" value="<fmt:formatDate value='${loginCommonVO.empStartdate}' pattern='yyyy-MM-dd' />" disabled="disabled">
							</div>
							<div class="mb-3">
								<label for="form-label" class="form-label">부서</label>
								<input type="text" class="form-control rd" id="empDept" name="empDept" value="${loginCommonVO.empDept}" disabled="disabled">
							</div>
							<div class="mb-3">
								<label for="form-label" class="form-label">직위</label>
								<input type="text" class="form-control rd" id="empPosition" name="empPosition" value="${loginCommonVO.empPosition}" disabled="disabled">
							</div>
							<div class="mb-3">
								<label for="form-label" class="form-label">휴대전화번호</label>
								<input type="text" class="form-control rd" name="empTel" value="${loginCommonVO.empTel}" id="empTel" data-validation = "Y" data-name="휴대전화번호">
							</div>
							<div class="mb-3">
							    <label for="empCarnum" class="form-label">차량번호</label>
							    <input type="text" class="form-control rd" name="empCarnum" value="${loginCommonVO.empCarnum}" id="empCarnum">
							</div>
							<div class="mb-3" id="carType">
							    <label for="empCarmodel" class="form-label">차량종류</label>
								<select class="select2 form-control" name="empCarmodel" id="empCarmodel">
								    <option value="">선택하세요</option>
								    <option value="경차" ${loginCommonVO.empCarmodel == '경차' ? 'selected' : ''}>경차</option>
								    <option value="소형차" ${loginCommonVO.empCarmodel == '소형차' ? 'selected' : ''}>소형차</option>
								    <option value="중형차" ${loginCommonVO.empCarmodel == '중형차' ? 'selected' : ''}>중형차</option>
								    <option value="대형차" ${loginCommonVO.empCarmodel == '대형차' ? 'selected' : ''}>대형차</option>
								</select>
							</div>
							</div>
						</div>
						<div class="col-12">
<!-- 							<div class="mb-3 col-6"> -->
							<div class="mb-3">
							    <label class="form-label">우편번호</label>
							    <div class="input-group">
							        <input type="text" class="form-control rd" name="empPostcode" value="${loginCommonVO.empPostcode}" id="empPostcode" data-validation = "Y" data-name="우편번호">
							        <button type="button" class="btn btn-primary" onclick="DaumPostcode()">검색</button>
							    </div>
							</div>
							<div class="mb-3">
								<label class="form-label">주소</label>
								<input type="text" class="form-control rd" name="empAddr" value="${loginCommonVO.empAddr}" id="empAddr" data-validation = "Y" data-name="주소">
							</div>
							<div class="mb-3">
								<label class="form-label">상세주소</label>
								<input type="text" class="form-control rd" name="empAddr2" value="${loginCommonVO.empAddr2}" id="empAddr2" data-validation = "Y" data-name="상세주소">
							</div>
						</div>
						<div class="col-12">
							<div class="d-flex align-items-center justify-content-end mt-4 gap-6">
								<button type="button" class="btn btn-primary" id="updtBtn">수정</button>
								<button type="button" class="btn btn-outline-primary" id="cancelBtn">이전</button>
							</div>
						</div>
					</div>
				</div>
			<sec:csrfInput/>
		</form>
	</div>
</div>

<!-- 수정 모달 START -->
<div class="modal fade" id="info-header-modal" tabindex="-1" aria-labelledby="vertical-center-modal" aria-hidden="true">
	<div class="modal-dialog modal-sm">
		<div class="modal-content modal-filled bg-info-subtle">
			<div class="modal-body p-4">
				<div class="text-center text-info">
					<i class="ti ti-info-circle fs-7"></i>
					<h4 class="mt-2">수정 확인</h4>
					<p class="mt-3 mb-0">정말 수정하시겠습니까?</p>
					<p class="mt-0">이 작업은 되돌릴 수 없습니다.</p>
					<button type="button" class="btn btn-primary my-2" style="margin-right: 10px;" id="updtBtnModal">수정</button>
					<button type="button" class="btn btn-light my-2" data-bs-dismiss="modal">취소</button>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- 수정 모달 END -->

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

<!--  Search Bar -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-hidden="true">
	<div class="modal-dialog modal-dialog-scrollable modal-lg">
		<div class="modal-content rounded-1">
			<div class="modal-header border-bottom">
				<input type="search" class="form-control fs-3" placeholder="Search here" id="search" />
				<a href="javascript:void(0)" data-bs-dismiss="modal" class="lh-1">
					<i class="ti ti-x fs-5 ms-3"></i>
				</a>
			</div>
			<div class="modal-body message-body" data-simplebar="">
				<h5 class="mb-0 fs-5 p-1">Quick Page Links</h5>
				<ul class="list mb-0 py-2">
					<li class="p-1 mb-1 bg-hover-light-black"><a
						href="javascript:void(0)"> <span class="d-block">Modern</span>
							<span class="text-muted d-block">/dashboards/dashboard1</span>
					</a></li>
					<li class="p-1 mb-1 bg-hover-light-black"><a
						href="javascript:void(0)"> <span class="d-block">Dashboard</span>
							<span class="text-muted d-block">/dashboards/dashboard2</span>
					</a></li>
					<li class="p-1 mb-1 bg-hover-light-black"><a
						href="javascript:void(0)"> <span class="d-block">Contacts</span>
							<span class="text-muted d-block">/apps/contacts</span>
					</a></li>
					<li class="p-1 mb-1 bg-hover-light-black"><a
						href="javascript:void(0)"> <span class="d-block">Posts</span>
							<span class="text-muted d-block">/apps/blog/posts</span>
					</a></li>
					<li class="p-1 mb-1 bg-hover-light-black"><a
						href="javascript:void(0)"> <span class="d-block">Detail</span>
							<span class="text-muted d-block">/apps/blog/detail/streaming-video-way-before-it-was-cool-go-dark-tomorrow</span>
					</a></li>
					<li class="p-1 mb-1 bg-hover-light-black"><a
						href="javascript:void(0)"> <span class="d-block">Shop</span> <span
							class="text-muted d-block">/apps/ecommerce/shop</span>
					</a></li>
					<li class="p-1 mb-1 bg-hover-light-black"><a
						href="javascript:void(0)"> <span class="d-block">Modern</span>
							<span class="text-muted d-block">/dashboards/dashboard1</span>
					</a></li>
					<li class="p-1 mb-1 bg-hover-light-black"><a
						href="javascript:void(0)"> <span class="d-block">Dashboard</span>
							<span class="text-muted d-block">/dashboards/dashboard2</span>
					</a></li>
					<li class="p-1 mb-1 bg-hover-light-black"><a
						href="javascript:void(0)"> <span class="d-block">Contacts</span>
							<span class="text-muted d-block">/apps/contacts</span>
					</a></li>
					<li class="p-1 mb-1 bg-hover-light-black"><a
						href="javascript:void(0)"> <span class="d-block">Posts</span>
							<span class="text-muted d-block">/apps/blog/posts</span>
					</a></li>
					<li class="p-1 mb-1 bg-hover-light-black"><a
						href="javascript:void(0)"> <span class="d-block">Detail</span>
							<span class="text-muted d-block">/apps/blog/detail/streaming-video-way-before-it-was-cool-go-dark-tomorrow</span>
					</a></li>
					<li class="p-1 mb-1 bg-hover-light-black"><a
						href="javascript:void(0)"> <span class="d-block">Shop</span> <span
							class="text-muted d-block">/apps/ecommerce/shop</span>
					</a></li>
				</ul>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
$(function(){
	var updtBtn = $("#updtBtn");			// 수정 버튼
	var cancelBtn = $("#cancelBtn");		// 이전 버튼
	var passwordChk = $(".passwordChk");	// 비밀번호 변경
	var addCarBtn = $("#addCarBtn");		// 차량 등록 버튼
	var updtBtnModal = $("#updtBtnModal");	// 모달 수정 버튼
	var profileForm = $("#profileForm");	// 프로필 폼
	var profileImg = $("#profileImg");		// 프로필 이미지
	var imgFile = $("#imgFile");			// 프로필 이미지 업로드
	var pwFlag = false;
	var pwRegexFlag = false;
	
	// 수정 버튼
	updtBtn.on("click", function(){
        $('#info-header-modal').modal('show'); // 수정 확인 모달 표시
	});
	
	// 이전 버튼
	cancelBtn.on("click", function(){
		location.href = "/common/home";
	});
	
	// 모달 창 수정 버튼
	updtBtnModal.on("click", function(){
	    if(validation()){
	        if(!pwFlag || !pwRegexFlag){
            	$('#al-warning-alert').find('p.mt-3').text('비밀번호를 다시 한 번 확인해주세요');
                $('#al-warning-alert').modal('show');
                return false;
	        }else{
	            profileForm.submit();
	        }
	    } else{
	    	return false;
	    }
	});
	
	// 비밀번호 일치 확인 이벤트
	passwordChk.on("keyup", function(){
		var empDepw = $("#empDepw").val();
	    var empDepw2 = $("#empDepw2").val();
	    var cusDepwRegex = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d!@#$%^&*]{8,12}$/;

	    // 비밀번호 정규화 검사
	    if (!cusDepwRegex.test(empDepw)) {
	        $("#pwChkResult").html("비밀번호는 영문, 숫자, 특수문자의 조합으로 8자 이상 12자 이하이어야 합니다.").css("color", "red");
	        pwRegexFlag = false;
	        return false;
	    }else{
	    	pwRegexFlag = true;
	    	console.log("pwRegexFlag : " + pwRegexFlag);
	    }
	    // 비밀번호 일치 여부 검사
	    if (empDepw !== empDepw2) {
	        $("#pwChkResult").html("비밀번호가 서로 일치하지 않습니다.").css("color", "red");
	        pwFlag = false;
	    } else {
	        $("#pwChkResult").html("비밀번호가 서로 일치합니다.").css("color", "green");
	        pwFlag = true;
	    }
	});

	
	// 프로필 이미지 클릭 이벤트
	profileImg.on("click", function(){
		imgFile.click();
	});
	
	// 프로필 이미지 업로드 
	imgFile.on("change", function(event){
	   var file = event.target.files[0];
	   
	   if(isImageFile(file)){
		   var reader = new FileReader();
	   	   reader.onload = function(e){
	   		   $("#profileImg").attr("src", e.target.result);
	   	   }
	   	   reader.readAsDataURL(file);
	   }else{
		   alert("이미지 파일을 선택해주세요!");
	   }
   });
	
	<% if (msg != null) { %>
	Swal.fire({
		title: '${msg} 완료',
		text: '${message}',
		icon: 'success',
		confirmButtonText: '확인'
	});
<% } %>

	// Enter 키를 눌렀을 때 모달 닫기
	$(document).on('keypress', function(e) {
		if (e.which === 13) {
			$('.swal2-modal').hide();
		}
	});
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

//이미지 파일인지 확인
function isImageFile(file){
	var ext = file.name.split(".").pop().toLowerCase();	// 파일명에서 확장자를 추출
	return ($.inArray(ext, ["jpg", "jpeg", "png", "gif"]) === -1) ? false : true;
}

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
            document.getElementById('empPostcode').value = data.zonecode;
            document.getElementById("empAddr").value = addr;
            document.getElementById("empAddr2").focus();
        }
    }).open();
};
</script>
