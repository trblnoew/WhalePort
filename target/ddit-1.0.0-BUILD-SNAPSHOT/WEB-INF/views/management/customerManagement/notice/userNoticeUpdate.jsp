<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/libs/quill/dist/quill.snow.css">
<script src="${pageContext.request.contextPath}/resources/assets/libs/quill/dist/quill.js"></script>

<style>
.hidden {
    display: none;
}
#editor {
    height: 300px; /* 에디터 높이 설정 */
}
</style>

<div class="body-wrapper">
    <div class="container-fluid">
        <div class="card bg-info-subtle shadow-none position-relative overflow-hidden mb-4">
            <div class="card-body px-4 py-3">
                <div class="row align-items-center">
                    <div class="col-9">
                        <h4 class="fw-semibold mb-0">문의사항</h4>
                    </div>
                </div>
                <div class="row justify-content-end">
					<div class="col-md-4 col-xl-3">
						<form action="/partner/qna/list" method="get"
							class="position-relative w-100">
							<input type="text" class="form-control product-search ps-5 pe-5"
								id="input-search" name="searchWord"
								placeholder="Search Contacts..." value="${searchWord}" /> <i
								class="ti ti-search position-absolute top-50 start-0 translate-middle-y fs-6 text-dark ms-3"></i>
							<button type="submit"
								class="btn btn-primary position-absolute top-50 end-0 translate-middle-y"
								style="padding: 0.25rem 0.5rem; margin-right: 0.5rem;">검색</button>
							<input type="hidden" name="searchType" value="${searchType}" />
						</form>
					</div>
				</div>
            </div>
        </div>
        <div class="card">
            <div class="border-bottom title-part-padding">
                <h4 class="card-title mb-0">공지사항 수정</h4>
            </div>
            <div class="card-body">
                <form action="/management/userNotice/update" class="mt-0" method="post" id="noticeForm" enctype="multipart/form-data">
                  <input type="hidden" name="noNo" value="${userNoticeVO.noNo }" />
                    <input type="text" class="form-control" id="noTitle" name="noTitle" value="${userNoticeVO.noTitle }"><br/>
                    <div id="editor"></div>
                    <input class="hidden" id="noContent" name="noContent" >
                    <br/>
                    <input class="form-control" type="file" id="noFile" name="noFile" multiple="multiple"    >
                    
						<div class="card-footer bg-white">
							<c:if test="${not empty userNoticeVO.noticeFileList }">
								<ul class="mailbox-attachments d-flex align-items-stretch clearfix">
									<c:forEach items="${userNoticeVO.noticeFileList }" var="noticeFile" >
										<li>
											<span class="mailbox-attachment-icon">
												<i class="far fa-file-pdf"></i>
											</span>
				
											<div class="mailbox-attachment-info">
												<a href="#" class="mailbox-attachment-name">
													<i class="fas fa-paperclip"></i>${noticeFile.fileRealname }
												</a> 
												<span class="mailbox-attachment-size clearfix mt-1">
													<span>${noticeFile.fileFancysize }</span>
													<span class="btn btn-default btn-sm float-right attachmentFileDel" id="span_${noticeFile.fileNo }" >
														<i class="fas fa-times"></i>
													</span>
												</span>
											</div>
										</li>
									</c:forEach>
								</ul>
							</c:if>
						</div>
                    <sec:csrfInput/>
                </form>
                <br/>
                <div class="d-flex justify-content-end">
                    <button type="button" class="btn btn-primary" onclick="submitForm()">저장</button>
                    <a href="/management/userNotice/detail?noNo=${userNoticeVO.noNo }" class="btn btn-outline-primary me-3" style="margin-left: 13px;">이전</a>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Quill 에디터 초기화 -->
<script>
let quill; // Quill 인스턴스를 전역 변수로 선언

document.addEventListener('DOMContentLoaded', function() {
    // Quill 인스턴스 생성
    quill = new Quill('#editor', {
        placeholder: '내용을 입력하세요.', // 플레이스홀더 설정
        theme: 'snow' // 또는 'bubble'
    });

    // Quill 에디터에 기존 내용 설정
    quill.root.innerHTML = "${userNoticeVO.noContent}"; // 기존 내용을 에디터에 삽입

    // 폼 제출 함수 정의
    window.submitForm = function() {
        // Quill 에디터의 내용을 hidden input에 저장 
        var content = quill.root.innerHTML; // HTML 포함한 내용 가져오기
        document.getElementById('noContent').value = content;

        // 폼 제출
        document.getElementById('noticeForm').submit();
    }
});

$(function(){
	var attachmentFileDel = $(".attachmentFileDel");	// 파일 1개당 'X' 버튼 element
	
	// 'x' 버튼 클릭 이벤트
	attachmentFileDel.on("click", function(){
		var id = $(this).prop("id");
		var idx = id.indexOf("_");	// span_fileNo에서 "_"의 현재 idx 위치를 가져온다.
		var noticeFileNo = id.substring(idx+1);
		var ptrn = "<input type='hidden' name='delNoticeNo' value='%v' />";
		$("#noticeForm").append(ptrn.replace("%v", noticeFileNo));
		$(this).parents("li:first").hide();
	});
	

});
</script>
