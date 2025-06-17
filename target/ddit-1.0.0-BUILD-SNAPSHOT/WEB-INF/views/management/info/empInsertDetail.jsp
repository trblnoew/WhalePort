<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<div class="body-wrapper">
        <div class="container-fluid">
          <div class="card bg-info-subtle shadow-none position-relative overflow-hidden mb-4">
            <div class="card-body px-4 py-3">
              <div class="row align-items-center">
                <div class="col-9">
                  <h4 class="fw-semibold mb-8">직원 등록 상세보기</h4>
                  <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                      <li class="breadcrumb-item">
                        <a class="text-muted text-decoration-none" href="../main/index.html">DashBoard</a>
                      </li>
                      <li class="breadcrumb-item" aria-current="page">직원 등록 상세보기</li>
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
          <!-- start Form with view only -->
          
          <div class="card">
            <div class="card-header text-bg-primary">
              <h5 class="mb-0 text-white">직원 등록 상세 정보</h5>
            </div>
            <form action="/info/deptUpdate" method="post" id="deptUdt" class="form-horizontal">
            <input type="hidden" name="empId" value="${employeeVO.empId }"/>
                
                <div class="card-body">
                  <h5 class="card-title mb-0">${employeeVO.empName } ${employeeVO.empPosition }
                  <span id="approvalStatus" style="margin-left:10px">
                  <c:choose>
				    <c:when test="${employeeVO.empApproval == 'Y'}">
				        <span class="badge bg-primary-subtle text-primary" data-emplNo="승인여부">승인</span>
<!-- 				        <button type="button" class="btn btn-primary btn-sm" id="btnqr" value="출입증 발급" style="margin-left: 10px;" onclick="location.href='/info/qrqr'">출입증 발급</button> -->
				    </c:when>
				    <c:when test="${employeeVO.empApproval == 'R'}">
				        <span class="badge bg-danger-subtle text-danger" data-emplNo="승인여부">반려</span>
				    </c:when>
				    <c:when test="${employeeVO.empApproval == 'N'}">
				        <span class="badge bg-success-subtle text-success" data-emplNo="승인여부">승인대기</span>
				    </c:when>
				    <c:when test="${employeeVO.empDel == 'Y' }">
				        <span class="badge text-bg-light" style="color: gray !important;" data-emplNo="승인여부">퇴사</span>
				    </c:when>
				  </c:choose>
                  </span>
                  </h5>
                </div>
                
                <hr class="m-0">
             
                <div class="card-body">
                
                  <div class="row">
                   <div class="col-lg-3 d-flex align-items-stretch">
                     <div class="card w-100 border position-relative overflow-hidden">
                       <div class="card-body p-4">
                       <hr>
                       <div class="d-flex justify-content-center" style="margin-top: 20px;">
                       <img src="${pageContext.request.contextPath}/resources/assets/images/profile/user-3.jpg" alt="user4" width="130" height="130" class="rounded-circle">
                    </div>
	                    <div class="d-flex justify-content-center" style="margin-top: 40px;"> <!-- 부모 div에 height 설정 -->
						        <h5 class="fs-4 mb-0" style="margin-right:10px;">${employeeVO.empName }</h5><p class="mb-0">${employeeVO.empPosition }</p>
						</div>
	                    <div class="d-flex justify-content-center" style="margin-top: 20px;"> <!-- 부모 div에 height 설정 -->
						        <h6 class="mb-0" style="color: black;">Department.</h6>
						</div>
	                    <div class="d-flex justify-content-center" style="margin-top: 3px;"> <!-- 부모 div에 height 설정 -->
						        <p class="fs-3 mb-0">${employeeVO.empDept }</p>
						</div>
						 <hr>

                       </div>
                     </div>
                   </div>
                   <div class="col-lg-9 d-flex align-items-stretch">
                     <div class="card w-100 border position-relative overflow-hidden">
                       <div class="card-body p-4">
                       
	                       <c:choose>
					    <c:when test="${employeeVO.empApproval == 'Y'}">
					        <p class="card-subtitle mb-4">승인 처리된 직원의 상세정보 입니다.</p>
					    </c:when>
					    <c:when test="${employeeVO.empApproval == 'R'}">
					        <p class="card-subtitle mb-4">반려 처리된 직원의 상세정보 입니다.</p>
					    </c:when>
					    <c:when test="${employeeVO.empApproval == 'N'}">
					        <p class="card-subtitle mb-4">승인 대기중인 직원의 상세정보 입니다.</p>
					    </c:when>
					    <c:when test="${employeeVO.empDel == 'Y' }">
					        <p class="card-subtitle mb-4">퇴사 처리된 직원의 상세정보 입니다.</p>
					    </c:when>
					  	  </c:choose>
				  
                         <div class="row">
                         <div class="col-6">
                           <div class="mb-3 d-flex">
						     <label class="form-label col-3 me-2">사번 (직원 ID)</label>
						     <p class="mb-0" style="margin-left: 40px;">${employeeVO.empId }</p>
						   </div>
                           <div class="mb-3 d-flex">
                             <label class="form-label col-3 me-2">Email</label>
                             <p class="mb-0" style="margin-left: 40px;">${employeeVO.empEmail }</p>
                           </div>
                           <div class="mb-3 d-flex">
                             <label class="form-label col-3 me-2">휴대전화</label>
                             <p class="mb-0" style="margin-left: 40px;">${employeeVO.empTel }</p>
                           </div>
                           <div class="mb-3 d-flex">
                             <label class="form-label col-3 me-2">생년월일</label>
                             <p class="mb-0" style="margin-left: 40px;">${fn:split(employeeVO.empBirth, ' ')[0]}</p>
                           </div>
                           <div class="mb-3 d-flex">
                             <label class="form-label col-3 me-2">차량 정보</label>
                             <p class="mb-0" style="margin-left: 40px;">${employeeVO.empCarmodel }/${employeeVO.empCarnum }</p>
                           </div>
                          </div>
                         <div class="col-6">
                           <div class="mb-3 d-flex">
                             <label class="form-label col-3 me-2">입사일</label>
                             <p class="mb-0" style="margin-left: 40px;">${fn:split(employeeVO.empStartdate, ' ')[0]}</p>
                           </div>
                           <div class="mb-3 d-flex">
                             <label class="form-label col-3 me-2">주소</label>
                             <p class="mb-0" style="margin-left: 40px;">${employeeVO.empAddr }</p>
                           </div>
                           <div class="mb-3 d-flex">
                             <label class="form-label col-3 me-2">상세주소</label>
                             <p class="mb-0" style="margin-left: 40px;">${employeeVO.empAddr2 }</p>
                           </div>
                           <div class="mb-3 d-flex">
                             <label class="form-label col-3 me-2">우편번호</label>
                             <p class="mb-0" style="margin-left: 40px;">${employeeVO.empPostcode }</p>
                           </div>
                           <div class="mb-3 d-flex">
	                           <c:if test="${employeeVO.empApproval == 'R' }">
	                             <label class="form-label col-3 me-2">반려 사유</label>
	                             <p class="mb-0" style="margin-left: 40px;">${employeeVO.empReject }</p>
	                           </c:if>
                           </div>
                          </div>
                          </div>
                       </div>
                     </div>
                   </div>
                 </div>
                <div class="form-actions border-top">
                  <div class="card-body" >
                    <div class="row">
                      <div class="col-md-12">
                        <div class="row">
                          <div class="text-end">
                            <button type="button" id="listBtn" name="listBtn" class="btn btn-outline-primary">
                              이전
                            </button>
                          </div>
                        </div>
                      </div>
                      <div class="col-md-6"></div>
                    </div>
                  </div>
                </div>
            	</form>
              </div>
          </div>
          <!-- start Form with view only -->
        </div>
        
<script type="text/javascript">
$(function(){
	var btnqr = $("#btnqr");
	var listBtn = $("#listBtn");
	var udtBtn = $("#udtBtn");
	var deptUpdate = $("#deptUpdate");
	var deptUdt = $("#deptUdt");
	var deptUpdateModal = $("#deptUpdateModal");

	
	// qr
	 btnqr.on("click", function() {
		 btnqr.submit();
		// location.href="/management/qrCode/employeeQRCode";  
       // alert("출입증이 발급되었습니다.");
    });
// 	btn.on("click", function() {
// 		var data = {
// 			empId : $("#empId").val(),
// // 			memPw : $("#memPw").val(),
// // 			memName : $("#memName").val(),
// 		}
// 		$.ajax({
// 			url : "/management/qrCode/createQRCode",
// 			method : "post",
// 			data : JSON.stringify(data),
// 			contentType : "application/json; charset=UTF-8",
// 			success : function(result) {
// 				location.href="/management/qrCode/employeeQRCode";  
// 			}
// 		});
// 	});
	
	listBtn.on("click", function(){
		location.href = "/info/empInsertList";
	});
	
	udtBtn.on("click", function(){
		 var addModal = new bootstrap.Modal($("#deptUpdateModal")[0]);
        addModal.show();
        // 변경 버튼 눌렀을 때 
        $("#btn-add").on("click", function(){
		 	// 선택된 부서 값 가져오기
	       	var selectedDept = $('#empDept').val();
			console.log("선택된 부서 : " + selectedDept);
			addModal.hide();
			var finModal = new bootstrap.Modal($("#finModal")[0]);
	    	finModal.show();
	    	
	    	 $("#finModal .btn-primary").off('click').on("click", function() {
			       deptUdt.submit();
		   	        location.reload();
	    	    });
			});
        	
    });
	
});
</script>
