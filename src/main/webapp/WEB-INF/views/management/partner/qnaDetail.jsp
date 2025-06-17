<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>


<style>
.hidden {
    display: none;
}
</style>

<div class="body-wrapper">
    <div class="container-fluid">
      <div class="card bg-info-subtle shadow-none position-relative overflow-hidden mb-4">
         <div class="card-body px-4 py-3">
           <div class="row align-items-center" style="margin-top:20px;">
             <div class="col-9">
               <h4 class="fw-semibold mb-8">문의사항</h4>
               <nav aria-label="breadcrumb">
                 <ol class="breadcrumb">
                   <li class="breadcrumb-item">
                     <a class="text-muted text-decoration-none" href="../main/index.html">DashBoard</a>
                   </li>
                   <li class="breadcrumb-item" aria-current="page">문의사항</li>
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
                <h5 class="mb-0 text-white">문의글 상세</h5>
            </div>
            <form class="form-horizontal">
                <div class="form-body">
                    <div class="card-body">
                        <h5 class="card-title mb-0"><strong>${partnerQnaVO.qnaTitle}</strong></h5>
                    </div>
                    <hr class="m-0" />
                    <div class="card-body py-3">
                        <div class="row">
                            <div class="col-md-2">
                                <div class="d-flex align-items-center">
                                    <label class="form-label mb-0 me-2">업체구분</label>
                                    <p class="mb-0">${partnerQnaVO.comdName}</p>
                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="d-flex align-items-center">
                                    <label class="form-label mb-0 me-2">작성자</label>
                                    <p class="mb-0">${partnerQnaVO.ptName}</p>
                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="d-flex align-items-center">
                                    <label class="form-label mb-0 me-2">등록일</label>
                                    <p class="mb-0">${partnerQnaVO.qnaDate}</p>
                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="d-flex align-items-center">
                                    <label class="form-label mb-0 me-2">조회수</label>
                                    <p class="mb-0">${partnerQnaVO.qnaCount}</p>
                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="d-flex align-items-center">
                                    <label class="form-label mb-0 me-2">상태</label>
									<c:choose>
									    <c:when test="${partnerQnaVO.qnaDelyn == 'Y'}">
									        <span class="badge text-bg-light" style="color: gray !important; margin-left:10px;">블라인드 처리</span>
									    </c:when>
									    <c:when test="${partnerQnaVO.qnaDelyn == 'N' && partnerQnaVO.qnaState == 'Y'}">
									        <span class="badge bg-primary-subtle text-primary" style="margin-left:10px">답변 완료</span>
									    </c:when>
									    <c:when test="${partnerQnaVO.qnaDelyn == 'N' && partnerQnaVO.qnaState == 'N'}">
									        <span class="badge bg-success-subtle text-success" style="margin-left:10px">답변 대기</span>
									    </c:when>
									</c:choose>
                                </div>
                            </div>
                        </div>
                    </div>
                    <hr class="m-0" />
					<div class="card-body" style="height: 200px; overflow-y: auto;"> <!-- 원하는 높이로 설정 -->
					    <div class="d-flex align-items-start">
					        <div class="flex-grow-1">${partnerQnaVO.qnaContent}</div>
					    </div>
					</div>
                    <hr class="m-0" />
                    <div class="card-body py-3">
                        <div class="row">
                            <div class="col-md-2">
                                <div class="d-flex align-items-center">
                                    <label class="form-label mb-0 me-2">첨부파일</label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- 첨부파일 부분 시작 -->
					<c:if test="${not empty partnerQnaVO.qnaFileList}">
					    <ul class="mailbox-attachments d-flex flex-wrap clearfix ms-4 md-0">
					        <c:forEach items="${partnerQnaVO.qnaFileList}" var="qnaFile">
					            <li class="col-md-2 mb-0 ">
					                <div class="d-flex align-items-center"> <!-- 수평으로 배치 -->
					                    <i class="fas fa-paperclip ms-2 me-2"></i>
					                    <a href="#" class="mailbox-attachment-name me-2">${qnaFile.fileRealname}</a>
					                    <p class="mb-0 me-2">${qnaFile.fileFancysize}</p>
					                    <c:url value="/partner/qna/download" var="downloadUrl">
					                        <c:param name="fileNo" value="${qnaFile.fileNo}"/>
					                    </c:url>
					                    <a href="${downloadUrl}">
					                    	<sec:csrfInput/>
					                        <button type="button" class="btn btn-primary btn-sm" style="padding: 0.2rem 0.4rem;">
					                            <i class="ti ti-download fs-6" style="font-size: 0.8rem;"></i>
					                        </button>
					                    </a>
					                </div>
					            </li>
					        </c:forEach>
					    </ul>
					</c:if>
					<!-- 첨부파일 부분 끝 -->
                <hr class="m-0" />
                </div>
            </form>
			<div class="card-body">
			    <form action="/management/partner/qna/qnaAnswer" method="post" id="qnaForm">
			        <div class="col-md-12 mb-4">
			            <label class="form-label mb-0 me-2">답변</label><br><br>
			            <textarea class="form-control" rows="3" id="qnaAns" name="qnaAns" style="width: 100%; background-color: #f9f9f9;" readonly>${partnerQnaVO.qnaAns}</textarea>
			            <input type="hidden" name="qnaNo" value="${partnerQnaVO.qnaNo}">
			        </div>
			        <div class="d-flex justify-content-end">
			            <button type="button" id="toggleButton" class="btn btn-primary me-3">답변</button>
			            <a href="/management/partner/qna/qnaList" class="btn btn-outline-primary me-3">이전</a>
			        </div>
			    </form>
			</div>
     	</div>
        <!-- start Form with view only -->
    </div>
</div>

<script>
    document.getElementById('toggleButton').addEventListener('click', function() {
        const textarea = document.getElementById('qnaAns');
        const button = document.getElementById('toggleButton');

        if (textarea.readOnly) {
            textarea.readOnly = false; // 답변 입력 가능
            textarea.style.backgroundColor = ''; // 배경색 초기화
            button.textContent = '저장'; // 버튼 텍스트 변경
        } else {
            document.getElementById('qnaForm').submit(); // 폼 제출
        }
    });
</script>
