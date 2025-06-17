<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<script src="https://cdn.jsdelivr.net/npm/iconify-icon@1.0.8/dist/iconify-icon.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e08ba589b52c5c3e16fd367810537e20&libraries=services"></script>

<style>
    .form-group p {
        max-width: 250px; /* 원하는 길이로 조정 */
        white-space: nowrap; /* 한 줄로 유지 */
    }
    .form-label {
        width: 150px; /* 원하는 라벨 너비로 조정 */
    }
    .custom-width {
        width: 300px; /* 원하는 너비로 조정 */
    }
    .form-control {
        text-align: center; /* 모든 입력 필드 가운데 정렬 */
    }
    .form-group.row {
    margin-bottom: 20px; /* 원하는 마진 값으로 조정 */
    }
</style>

<div class="body-wrapper">
    <div class="container-fluid">
        <div class="card bg-info-subtle shadow-none position-relative overflow-hidden mb-4">
           <div class="card-body px-4 py-3">
             <div class="row align-items-center" style="margin-top:20px;">
               <div class="col-9">
                 <h4 class="fw-semibold mb-8">협력업체 관리</h4>
                 <nav aria-label="breadcrumb">
                   <ol class="breadcrumb">
                     <li class="breadcrumb-item">
                       <a class="text-muted text-decoration-none" href="../main/index.html">DashBoard</a>
                     </li>
                     <li class="breadcrumb-item" aria-current="page">협력업체 관리</li>
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
        <!-- 업체 상세 정보 시작 -->
        <div class="card">
            <div class="card-header text-bg-primary">
                <h5 class="mb-0 text-white">업체 상세 정보</h5>
            </div>
            <div class="card-body">
			<h5 class="card-title mb-0">
			    ${partnerVO.ptName} 
			    <span id="approvalStatus">
			        <c:choose>
			            <c:when test="${partnerVO.ptApproval == 'N'}">
			                <span class="badge bg-warning-subtle text-warning" style="margin-left:10px">반려</span>
			            </c:when>
			            <c:when test="${partnerVO.ptApproval == 'Y'}">
			                <span class="badge bg-primary-subtle text-primary" style="margin-left:10px">승인</span>
			            </c:when>
			            <c:when test="${partnerVO.ptApproval == 'H'}">
			                <span class="badge bg-success-subtle text-success" style="margin-left:10px">승인대기</span>
			            </c:when>
			        </c:choose>
			    </span>
			</h5>
            </div>
            <hr class="m-0">
			<div class="card-body">
              <br>
              <form action="/management/partner/account/accountUpdate" class="mt-0" method="post" id="accountForm" enctype="multipart/form-data">
              <input type="hidden" name="ptNo" value="${partnerVO.ptNo}">
			  <div class="row">
                   <div class="col-lg-4 d-flex align-items-stretch">
                     <div class="card w-100 border position-relative overflow-hidden">
                       <div class="card-body p-4">
		                 <div class="d-flex justify-content-center h-50" style="margin-top: 10px;">
					        <img id="profileImg" src="${partnerVO.ptImage}" alt="modernize-img" class="rounded-circle" alt="user4" width="130" height="130">
					        <input type="file" id="imgFile" name="imgFile" style="display: none;"/>
					     </div>
					     <div class="d-flex justify-content-center me-5" style="margin-top: 20px;">
                            <label class="form-label text-end col-md-0 me-4">업체명</label>
                            <input type="text" class="form-control custom-width" id="ptName" name="ptName" style="width: 230px;" value="${partnerVO.ptName}" >
                         </div>
					     <div class="d-flex justify-content-center me-5" style="margin-top: 5px;">
                            <label class="form-label text-end col-md-0 me-4">사업자등록번호</label>
                            <input type="text" class="form-control custom-width" id="ptBusnum" name="ptBusnum" style="width: 230px;" value="${partnerVO.ptBusnum}" >
                         </div>
					     <div class="d-flex justify-content-center me-5" style="margin-top: 5px;">
                            <label class="form-label text-end col-md-0 me-4">대표자</label>
                            <input type="text" class="form-control custom-width" id="ptCeo" name="ptCeo" style="width: 230px;" value="${partnerVO.ptCeo}" >
                         </div>
                       </div>
                     </div>
                   </div>
                   <div class="col-lg-8 d-flex align-items-stretch">
                     <div class="card w-100 border position-relative overflow-hidden">
					   <div class="card-body">
                         <div class="row">
                         <div class="col-6 pt-3">
	                           <div class="mb-4 d-flex align-items-stretch">
	                             <label class="form-label">업체 구분</label>
					             <select class="select2 form-control" name="ptCode" style="width: 300px; text-align: center;">
					                <option value="PRM01" <c:if test="${partnerVO.comdName eq '항공사' }">selected</c:if>>항공사</option>
					                <option value="PRM02" <c:if test="${partnerVO.comdName eq '보안업체' }">selected</c:if>>보안업체</option>
					                <option value="PRM03" <c:if test="${partnerVO.comdName eq '시설업체' }">selected</c:if>>시설업체</option>
					                <option value="PRM04" <c:if test="${partnerVO.comdName eq '입점업체' }">selected</c:if>>입점업체</option>
					             </select>
	                           </div>
	                           <div class="mb-4 d-flex align-items-stretch">
	                             <label class="form-label">계약기간</label>
					             <input type="date" class="form-control" id="ptStartdate" name="ptStartdate" style="width: 145px; text-align: center; margin-right: 9px;" value="${partnerVO.formattedPtStartdate}">
							     <input type="date" class="form-control" id="ptEnddate" name="ptEnddate" style="width: 145px; text-align: center;" value="${partnerVO.formattedPtEnddate}">
	                           </div>
	                           <div class="mb-4 d-flex align-items-stretch">
	                             <label class="form-label">우편번호</label>
					             <input type="text" class="form-control custom-width" id="ptPostcode" name="ptPostcode" style="width: 230px;" value="${partnerVO.ptPostcode}">
					             <button type="button" id="searchAdd" class="btn btn-primary ms-2" onclick="DaumPostcode()">검색</button>
	                           </div>
	                           <div class="mb-4 d-flex align-items-stretch">
	                             <label class="form-label">주소</label>
					             <input type="text" class="form-control custom-width" id="ptAdd" name="ptAdd" value="${partnerVO.ptAdd}">
	                           </div>
	                           <div class="mb-0 d-flex align-items-stretch">
	                             <label class="form-label">상세주소</label>
					             <input type="text" class="form-control custom-width" id="ptAdd2" name="ptAdd2" value="${partnerVO.ptAdd2}" >
	                           </div>
                         </div>
                         <div class="col-6 pt-3 ps-5">
	                           <div class="mb-4 d-flex align-items-stretch">
	                             <label class="form-label">개업연월일</label>
	                             <input type="date" class="form-control custom-width" id="ptOpendate" name="ptOpendate" value="${partnerVO.formattedPtOpendate}">
	                           </div>
	                           <div class="mb-4 d-flex align-items-stretch">
	                             <label class="form-label">계약금액</label>
					             <input type="text" class="form-control custom-width" id="ptMoney" name="ptMoney" value="${partnerVO.ptMoney}" >
	                           </div>
	                           <div class="mb-4 d-flex align-items-stretch">
	                             <label class="form-label">담당자</label>
					             <input type="text" class="form-control custom-width" id="ptMgrname" name="ptMgrname" value="${partnerVO.ptMgrname}" >
	                           </div>
	                           <div class="mb-4 d-flex align-items-stretch">
	                             <label class="form-label">담당자 이메일</label>
					             <input type="text" class="form-control custom-width" id="ptMgremail" name="ptMgremail" value="${partnerVO.ptMgremail}" >
	                           </div>
	                           <div class="mb-0 d-flex align-items-stretch">
	                             <label class="form-label">담당자 연락처</label>
					             <input type="text" class="form-control custom-width" id="ptMgrtel" name="ptMgrtel" value="${partnerVO.ptMgrtel}" >
	                           </div>
                          </div>
	                      <!-- 첨부파일 부분 시작 -->
	                      <div class="col-12 mt-4">
						  <input class="form-control mb-2" type="file" id="ptFile" name="ptFile" multiple="multiple">
	                      <div class="card shadow-none border" style="overflow: auto;"> <!-- 기본 높이 조정 -->
							<c:if test="${not empty partnerVO.ptFileList }">
								<ul class="mailbox-attachments d-flex flex-wrap align-items-center justify-content-start clearfix ms-4 md-0 mb-0" style="margin-top: 20px;">	
									<c:forEach items="${partnerVO.ptFileList }" var="ptFile" >
										<li class="col-md-4 mb-3"> <!-- 넓이를 조정 -->
										  <div class="d-flex align-items-center">
											<i class="fas fa-paperclip ms-2 me-2"></i>
											<a href="#" class="mailbox-attachment-name me-2">${ptFile.fileRealname}</a>
											<p class="mb-0 me-2">${ptFile.fileFancysize}</p>
											<span class="btn btn-default btn-sm float-right attachmentFileDel" id="span_${ptFile.fileNo }" >
												<i class="fas fa-times"></i>
											</span>
										  </div>	
										</li>
									</c:forEach>
								</ul>
							</c:if>
	                      </div>
	                      </div>
						  <!-- 첨부파일 부분 끝 -->
                          </div>
                       </div>
                     </div>
                   </div>
                 </div>
                 </form>
			</div>
            <hr class="m-0">
			<div class="card-body">
			    <div class="d-flex justify-content-end" id="actionButtons">
			        <button type="button" class="btn btn-primary me-3" id="btn2" onclick="submitForm()">저장</button>
			        <a href="/management/partner/account/accountDetail?ptNo=${partnerVO.ptNo}" class="btn btn-outline-primary me-3" id="btn1">이전</a>
			    </div>
			</div>
        </div>
    </div>
</div>

<script type="text/javascript">
	$(function(){
	var profileImg = $("#profileImg");		// 프로필 이미지
	var imgFile = $("#imgFile");			// 프로필 이미지 업로드

    
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
	
	
});
	
	//이미지 파일인지 확인
	function isImageFile(file){
		var ext = file.name.split(".").pop().toLowerCase();	// 파일명에서 확장자를 추출
		return ($.inArray(ext, ["jpg", "jpeg", "png", "gif"]) === -1) ? false : true;
	}
	
	function submitForm() {
        document.getElementById('accountForm').submit();
    }

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
	        }
	    }).open();
	}
	
	$(function(){
		var attachmentFileDel = $(".attachmentFileDel");	// 파일 1개당 'X' 버튼 element
		
		// 'x' 버튼 클릭 이벤트
		attachmentFileDel.on("click", function(){
			var id = $(this).prop("id");
			var idx = id.indexOf("_");	// span_fileNo에서 "_"의 현재 idx 위치를 가져온다.
			var ptFileNo = id.substring(idx+1);
			var ptrn = "<input type='hidden' name='delPtNo' value='%v' />";
			$("#accountForm").append(ptrn.replace("%v", ptFileNo));
			$(this).parents("li:first").hide();
		});
		

	});
</script>

