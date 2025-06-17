<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<div class="body-wrapper">
        <div class="container-fluid">
          <div class="card bg-info-subtle shadow-none position-relative overflow-hidden mb-4">
            <div class="card-body px-4 py-3">
              <div class="row align-items-center">
                <div class="col-9">
                  <h4 class="fw-semibold mb-8">직원 정보 상세보기</h4>
                  <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                      <li class="breadcrumb-item">
                        <a class="text-muted text-decoration-none" href="../main/index.html">DashBoard</a>
                      </li>
                      <li class="breadcrumb-item" aria-current="page">직원 정보 상세보기</li>
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
              <h5 class="mb-0 text-white">직원 상세 정보</h5>
            </div>
            <form action="/management/delete" method="post" id="delForm" class="form-horizontal">
            <input type="hidden" name="empId" value="${employeeVO.empId }"/>
            <input type="hidden" name="empNo" value="${employeeVO.empNo }"/></form>
                <hr class="m-0">
                <div class="card-body">
                
                 <h5 class="card-title mb-0">${employeeVO.empName } ${employeeVO.empPosition }
                  <span id="approvalStatus" style="margin-left:10px">
                  <c:choose>
				    <c:when test="${employeeVO.empApproval == 'Y'}">
				        <span class="badge bg-primary-subtle text-primary" data-emplNo="승인여부">승인</span>
				        <a class="btn btn-primary btn-sm" href="/pass/accessCardDetail?empId=${employeeVO.empId }" style="margin-left: 10px;">출입증 상세보기
                          		</a>
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
                       <img src="${employeeVO.empImage }" alt="user4" width="130" height="130" class="rounded-circle">
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
                  <div class="card-body my-4 p-0" >
                    <div class="row">
                      <div class="col-md-12">
                        <div class="row">
                          <div class="text-end">
                            <button type="button" id="udtBtn" name="udtBtn" class="btn btn-primary me-2" >수정</button>
                            <c:choose>
                            	<c:when test="${employeeVO.empApproval == 'Y'}">
                            <button type="button" id="delBtn" name="delBtn" class="btn btn-danger me-2">퇴사처리</button>
                            	</c:when>
                            </c:choose>
                            <button type="button" id="listBtn" name="listBtn" class="btn btn-outline-primary">이전</button>
                          </div>
                        </div>
                      </div>
                      <div class="col-md-6"></div>
                    </div>
                  </div>
                </div>
				</div>
                </div>
          </div>
          
          <!-- start Form with view only -->
        
       
         
        
        <!-- Modal -->
            <div class="modal fade" id="addContactModal" tabindex="-1" aria-labelledby="vertical-center-modal" aria-hidden="true">
                      <div class="modal-dialog modal-sm">
                        <div class="modal-content modal-filled bg-info-subtle">
                          <div class="modal-body p-4">
                            <div class="text-center text-info">
                              <i class="ti ti-info-circle fs-7"></i>
                              <h4 class="mt-2" id="modalTitle">등록</h4>
                              <p class="mt-3" id="modalContent">
                               직원 정보를 등록하시겠습니까?
                              </p>
                              <button id="btn-add" class="btn btn-primary my-2"  style="margin-right:10px;">확인</button>
		                      <button class="btn btn-light my-2" data-bs-dismiss="modal"> 취소 </button>
                            </div>
                          </div>
                        </div>
                        <!-- /.modal-content -->
                      </div>
                    </div>
                    
            <!-- 완료 Modal -->
            <div class="modal fade" id="finModal" tabindex="-1" aria-labelledby="vertical-center-modal" aria-hidden="true">
                      <div class="modal-dialog modal-sm">
                        <div class="modal-content modal-filled bg-info-subtle">
                          <div class="modal-body p-4">
                            <div class="text-center text-info">
                              <i class="ti ti-info-circle fs-7"></i>
                              <h4 class="mt-2" id="finModalTitle">등록 완료</h4>
                              <p class="mt-3" id="finModalContent">
                               직원의 등록이 완료되었습니다.
                              </p>
		                      <button class="btn btn-primary my-2" id="btn-close" data-bs-dismiss="modal"> 확인 </button>
                            </div>
                          </div>
                        </div>
                        <!-- /.modal-content -->
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
    var listBtn = $("#listBtn");
    var delBtn = $("#delBtn");
    var delForm = $("#delForm");
    var empId = "${employeeVO.empId}"; 

    delBtn.on("click", function(){
        // SweetAlert2를 사용하여 경고창 표시
        Swal.fire({
            title: '퇴사 처리', // 제목 변경
            text: '해당 직원의 퇴사를 진행하시겠습니까?', // 내용 변경
            icon: 'warning', // 아이콘 설정
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
                $.ajax({
                    url: '/management/delete', // 삭제 API 엔드포인트
                    method: 'POST',
                    data: {
                        empId: empId // 삭제할 데이터의 ID
                    },
                    success: function(response) {
                        // 성공적으로 삭제되었을 때
                        Swal.fire(
                            '퇴사 처리 완료!',
                            '해당 직원의 퇴사 처리가 완료되었습니다.',
                            'success'
                        ).then(() => {
                            // SweetAlert2의 성공 메시지 후에 delForm을 제출
                            delForm.submit(); // 폼 제출
                        });
                    },
                    error: function(xhr, status, error) {
                        // 오류가 발생했을 때
                        Swal.fire(
                            '오류!',
                            '퇴사 처리에 실패했습니다.',
                            'error'
                        );
                    }
                });
            }
        });
    });

    listBtn.on("click", function(){
        location.href = "/management/list";
    });

    $("#udtBtn").on("click", function(){
        delForm.attr("action", "/management/updateForm");
        delForm.attr("method", "get");
        delForm.submit();    
    }); 
    
    /* delBtn.on("click", function(){
	 $("#modalTitle").text("퇴사 처리");
	 $("#modalContent").text("해당 직원을 퇴사처리 하시겠습니까? 이 작업은 돌이킬 수 없습니다.");
	 
	 var addModal = new bootstrap.Modal($("#addContactModal")[0]);
       addModal.show();
       // 확인 버튼 눌렀을 때 
       $("#btn-add").on("click", function(){
			addModal.hide();
			var finModal = new bootstrap.Modal($("#finModal")[0]);
			$("#finModalTitle").text("퇴사 처리 완료");
			$("#finModalContent").text("해당 직원의 퇴사처리를 완료하였습니다.");
	    	finModal.show();
	    	
	    	 $("#finModal .btn-primary").off('click').on("click", function() {
	    		 delForm.submit();	
	    	    });
			});
       	
   }); */
});
</script>

	