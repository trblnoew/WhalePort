<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<div class="body-wrapper">
    <div class="container-fluid">
    
    
	  <div class="card bg-info-subtle shadow-none position-relative overflow-hidden mb-4">
            <div class="card-body px-4 py-3">
              <div class="row align-items-center">
                <div class="col-9">
                  <h4 class="fw-semibold mb-8">이벤트</h4>
                  <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                      <li class="breadcrumb-item">
                        <a class="text-muted text-decoration-none" href="/partner/home">DashBoard</a>
                      </li>
                      <li class="breadcrumb-item" aria-current="page">Event</li>
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
                <h5 class="mb-0 text-white">이벤트 상세</h5>
            </div>
            <form class="form-horizontal">
                <div class="form-body">
                    <div class="card-body">
                        <h5 class="card-title mb-0">${eventVO.popTitle}</h5>
                    </div>
                    <hr class="m-0" />
                    <div class="card-body py-3">
                        <div class="row">
                            <div class="col-md-2">
                                <div class="d-flex align-items-center">
                                    <label class="form-label mb-0 me-2">제목</label>
                                    <p class="mb-0">${eventVO.popTitle}</p>
                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="d-flex align-items-center">
                                    <label class="form-label mb-0 me-2">게시기간</label>
                                    <p class="mb-0">${fn:split(eventVO.popStartdate, ' ')[0]}~${fn:split(eventVO.popEnddate, ' ')[0] }</p>
                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="d-flex align-items-center">
                                    <label class="form-label mb-0 me-2">게시목적</label>
                                    <p class="mb-0">${eventVO.popGoal}</p>
                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="d-flex align-items-center">
                                    <label class="form-label mb-0 me-2">게시상태</label>
                                   		<c:choose>
                                           	<c:when test="${eventVO.popApproval eq '게시중'}">
	                                            <p class="badge bg-primary-subtle text-primary mb-0">${eventVO.popApproval}</p>
                                           	</c:when>
                                           	<c:when test="${eventVO.popApproval eq '게시종료'}">
	                                            <p class="badge bg-warning-subtle text-warning mb-0">${eventVO.popApproval}</p>
                                           	</c:when>
                                           	<c:when test="${eventVO.popApproval eq '반려'}">
	                                            <p class="badge bg-danger-subtle text-danger mb-0">${eventVO.popApproval}</p>
                                           	</c:when>
											<c:otherwise>
	                                            <p class="badge bg-success-subtle text-success mb-0">${eventVO.popApproval}</p>
											</c:otherwise>	                                            
                                        </c:choose>
                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="d-flex align-items-center">
                                    <label class="form-label mb-0 me-2">내용</label>
                                    <p class="mb-0">${eventVO.popContent}</p>
                                </div>
                            </div>
							<c:if test="${ not empty eventVO.popReject }">
	                            <div class="col-md-12">
	                                <div class="d-flex align-items-center">
	                                    <label class="form-label mb-0 me-2">반려 사유</label>
	                                    <p class="mb-0">${eventVO.popReject}</p>
	                                </div>
	                            </div>
							</c:if>
                        </div>
                            <div class="col-md-2">
                                <div class="d-flex align-items-center">
                                    <img alt="팝업이미지" src="${eventVO.popImg}">
                                </div>
                            </div>
                    </div>
                </div>
            	</form>
                <div class="card-body">
                   <div class="d-flex justify-content-end">
                       <a href="/partner/event/list" class="btn btn-outline-primary me-3">이전</a>
                       <c:if test="${eventVO.popApproval eq '신청' || eventVO.popApproval eq '반려' }">
                       <a href="/partner/event/update?popNo=${eventVO.popNo}" class="btn btn-primary me-3">수정</a>
                       <form action="/partner/event/delete" method="post" class="me-3" id="delForm">
                           <input type="hidden" name="popNo" value="${eventVO.popNo}">
                           <button type="button" class="btn btn-danger" id="delBtn">삭제</button>
                           <sec:csrfInput/>
                       </form>
                       </c:if>
                   </div>
               </div>
      		 </div>
        <!-- start Form with view only -->
    </div>
</div>


<script>
    // 모달 표시
    $(function(){
        
        // 삭제 버튼 클릭 시 삭제 확인 모달 표시
        $('#delBtn').click(function() {
	    	Swal.fire({
	    		   title: '삭제 처리',
	    		   text: '삭제를 진행하시겠습니까?',
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
	 		   
	 			   $('#delForm').submit(); // 폼 제출
	 		   }
	 		});
        });

    });
</script>