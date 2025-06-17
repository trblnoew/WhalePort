<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<style>
.hidden {
    display: none;
}
.custom-height {
	height: 250px; 
	display: flex;
	align-items: center; 
	justify-content: center; 
}
</style>

<% 
// list.jsp에서 알림을 표시하기 위한 조건
String msg = (String) request.getAttribute("msg");
%>

<!-- Modal for alert -->
<!-- <div class="modal fade" id="al-info-alert" tabindex="-1" aria-labelledby="vertical-center-modal" aria-hidden="true"> -->
<!--     <div class="modal-dialog modal-sm"> -->
<!--         <div class="modal-content modal-filled bg-info-subtle"> -->
<!--             <div class="modal-body p-4"> -->
<!--                 <div class="text-center text-info"> -->
<!--                     <h4 class="mt-2">수정 완료</h4> -->
<!--                     <p class="mt-3"> -->
<%--                         <c:if test="${not empty msg}"> --%>
<%--                             ${msg} --%>
<%--                         </c:if> --%>
<!--                     </p> -->
<!--                     <button type="button" class="btn btn-light my-2" data-bs-dismiss="modal">닫기</button> -->
<!--                 </div> -->
<!--             </div> -->
<!--         </div> -->
<!--         /.modal-content -->
<!--     </div> -->
<!-- </div> -->

<div class="main-wrapper overflow-hidden">
	<!-- ------------------------------------- -->
	<!-- banner Start -->
	<!-- ------------------------------------- -->
	<section class="bg-primary-subtle custom-height">
		<div class="container-fluid">
			<div class="text-center">
				<p class="text-primary fs-4 fw-bolder">service center</p>
				<h1 class="fw-bolder fs-12">고객 센터</h1>
			</div>
		</div>
	</section>
</div>

<div class="body-wrapper">
    <div class="container-fluid" style="width: 80%;">
        <!-- start Form with view only -->
        <div class="card">
            <div class="card-header text-bg-primary">
                <h5 class="mb-0 text-white">공지사항 상세</h5>
            </div>
            <form class="form-horizontal">
                <div class="form-body">
                    <div class="card-body">
                        <h5 class="card-title mb-0">${userNoticeVO.noTitle}</h5>
                    </div>
                    <hr class="m-0" />
                    <div class="card-body py-3">
                        <div class="row">
                            <div class="col-md-1">
                                <div class="d-flex align-items-center">
                                    <label class="form-label mb-0 me-2">번호</label>
                                    <p class="mb-0">${userNoticeVO.noNo}</p>
                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="d-flex align-items-center">
                                    <label class="form-label mb-0 me-2">작성자</label>
                                    <p class="mb-0">${userNoticeVO.empNo}</p>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="d-flex align-items-center">
                                    <label class="form-label mb-0 me-2">작성일자</label>
                                    <p class="mb-0">${userNoticeVO.noDate}</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <hr class="m-0" />
                    <div class="card-body">
                        <div class="d-flex align-items-start">
                            <div class="flex-grow-1">${userNoticeVO.noContent}</div>
                        </div>
                    </div>
                <hr class="m-0" />
                </div>
                <c:if test="${not empty userNoticeVO.noticeFileList }">
								<ul class="mailbox-attachments d-flex align-items-stretch clearfix">
									<c:forEach items="${userNoticeVO.noticeFileList }" var="noticeFile" >
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
            	</form>
                <div class="card-body">
                   <div class="d-flex justify-content-end">
                       <a href="/customer/notice/list" class="btn btn-outline-primary me-3">목록</a>
                   </div>
                </div>
      		 </div>
        <!-- start Form with view only -->
    </div>
</div>

<div id="info-header-modal" class="modal fade" tabindex="-1" aria-labelledby="info-header-modalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-scrollable modal-sm"> <!-- modal-sm 추가 -->
        <div class="modal-content">
            <div class="modal-header modal-colored-header bg-info text-white">
                <h4 class="modal-title text-white" id="info-header-modalLabel">삭제 확인</h4>
                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <h5 class="mt-0">정말 삭제하시겠습니까?</h5>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-light" data-bs-dismiss="modal">취소</button>
                <button type="button" class="btn bg-info-subtle text-info" id="UNDelete">삭제</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>


<script>
    // 모달 표시
    $(document).ready(function() {
        <% if (msg != null) { %>
            $('#al-info-alert').modal('show');
        <% } %>
        
        // 삭제 버튼 클릭 시 삭제 확인 모달 표시
        $('#UNdelBtn').click(function() {
            $('#info-header-modal').modal('show'); // 삭제 확인 모달 표시
        });

        // 확인 버튼 클릭 시 폼 제출
        $('#UNDelete').click(function() {
            $('#UNdelForm').submit(); // 폼 제출
        });
    });
</script>
