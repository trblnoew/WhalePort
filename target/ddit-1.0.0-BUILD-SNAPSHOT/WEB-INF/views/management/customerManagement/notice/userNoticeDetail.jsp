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
                  <h4 class="fw-semibold mb-8">공지사항 상세</h4>
                  <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                      <li class="breadcrumb-item">
                        <a class="text-muted text-decoration-none" href="/common/home">DashBoard</a>
                      </li>
                      <li class="breadcrumb-item" aria-current="page">Notice</li>
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
                <h5 class="mb-0 text-white">공지사항 상세 보기 </h5>
            </div>
            <form class="form-horizontal">
                <div class="form-body">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-2">
                                <div class="d-flex align-items-center">
                                    <label class="form-label mb-0 me-2">제목</label>
                                    <p class="mb-0">${noticeVO.noTitle}</p>
                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="d-flex align-items-center">
                                    <label class="form-label mb-0 me-2">작성자</label>
                                    <p class="mb-0">${noticeVO.empNo}</p>
                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="d-flex align-items-center">
                                    <label class="form-label mb-0 me-2">조회수</label>
                                    <p class="mb-0">${noticeVO.noCount}</p>
                                </div>
                            </div>
                        </div>
                     </div>
                    <hr class="m-0" />
                    <div class="card-body py-3">
                      <p class="mb-0">${noticeVO.noContent }</p>
                           
                    </div>
                    
					<c:if test="${not empty noticeVO.noticeFileList }">
								<ul class="mailbox-attachments d-flex align-items-stretch clearfix">
									<c:forEach items="${noticeVO.noticeFileList }" var="noticeFile" >
										<li>
											<span class="mailbox-attachment-icon"> 
												<i class="far fa-file-pdf"></i>
											</span>
											<div class="mailbox-attachment-info">
												<a href="#" class="mailbox-attachment-name">
													<i class="fas fa-paperclip"></i> ${noticeFile.fileRealname }
												</a> 
												<span class="mailbox-attachment-size clearfix mt-1">
													<span>${noticeFile.fileFancysize }</span>
													<c:url value="/management/userNotice/download" var="downloadUrl" >
														<c:param name="fileNo" value="${noticeFile.fileNo }"/>
													</c:url> 
													<a href="${downloadUrl }  ">
														<span class="btn btn-default btn-sm float-right">
															<i class="fas fa-download"></i>
														</span>
													</a>
												</span>
											</div>
										</li>
									</c:forEach>
								</ul>
							</c:if>
							
							
							
							
                </div>
                <sec:csrfInput/>
            	</form>
							
                <div class="card-body">
                   <div class="d-flex justify-content-end">
                       <a href="/management/userNotice/update?noNo=${noticeVO.noNo}" class="btn btn-primary me-3">수정</a>
                       <form action="/management/userNotice/delete" method="post" class="me-3" id="delForm">
                           <input type="hidden" name="noNo" value="${noticeVO.noNo}">
                           <button type="button" class="btn btn-danger" id="delBtn">삭제</button>
                           <sec:csrfInput/>
                       </form>
                       <a href="/management/userNotice/list" class="btn btn-outline-primary me-3">이전</a>
                   </div>
               </div>

      		 </div>
        <!-- start Form with view only -->
    </div>
</div>
<script type="text/javascript">
$(function(){
	// 삭제버튼
	$("#delBtn").on("click", function(){
		Swal.fire({
 		   title: '삭제',
 		   text: '정말 삭제를 진행하시겠습니까?',
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
})



</script>





