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
        <div class="card">
            <div class="card-header text-bg-primary">
                <h5 class="mb-0 text-white">문의글 수정</h5>
            </div>
            <div class="card-body">
                <form action="/partner/qna/update" class="mt-0" method="post" id="qnaForm" enctype="multipart/form-data">
                    <input type="text" class="form-control" id="qnaTitle" name="qnaTitle" placeholder="${partnerQnaVO.qnaTitle}" value="${partnerQnaVO.qnaTitle}">
                    <input type="hidden" name="qnaNo" value="${partnerQnaVO.qnaNo }" />
                    <br/>
                    <div id="editor"></div>
                    <input class="hidden" id="qnaContent" name="qnaContent">
                    <br/>
                    <input class="form-control mb-2" type="file" id="qnaFile" name="qnaFile" multiple="multiple">
                    <!-- 첨부파일 부분 시작 -->
                    <div class="card shadow-none border" style="height: 62px;"> <!-- 원하는 높이 설정 -->
						<c:if test="${not empty partnerQnaVO.qnaFileList }">
							<ul class="mailbox-attachments d-flex flex-wrap clearfix ms-4 md-0 mt-3">
								<c:forEach items="${partnerQnaVO.qnaFileList }" var="qnaFile" >
									<li class="col-md-2 mb-0 ">
									  <div class="d-flex align-items-center">
										<i class="fas fa-paperclip ms-2 me-2"></i>
										<a href="#" class="mailbox-attachment-name me-2">${qnaFile.fileRealname}</a>
										<p class="mb-0 me-2">${qnaFile.fileFancysize}</p>
										<span class="btn btn-default btn-sm float-right attachmentFileDel" id="span_${qnaFile.fileNo }" >
											<i class="fas fa-times"></i>
										</span>
									  </div>	
									</li>
								</c:forEach>
							</ul>
						</c:if>
                    </div>
					<!-- 첨부파일 부분 끝 -->
                    <div class="d-flex justify-content-end">
                        <button type="button" class="btn btn-primary me-3" onclick="submitForm()">저장</button>
                        <a href="/partner/qna/detail?qnaNo=${partnerQnaVO.qnaNo}" class="btn btn-outline-primary">이전</a>
                    </div>
                    <sec:csrfInput/>
                </form>
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
    quill.root.innerHTML = "${partnerQnaVO.qnaContent}"; // 기존 내용을 에디터에 삽입

    // 폼 제출 함수 정의
    window.submitForm = function() {
        // Quill 에디터의 내용을 hidden input에 저장 
        var content = quill.root.innerHTML; // HTML 포함한 내용 가져오기
        document.getElementById('qnaContent').value = content;

        // 폼 제출
        document.getElementById('qnaForm').submit();
    }
});

$(function(){
	var attachmentFileDel = $(".attachmentFileDel");	// 파일 1개당 'X' 버튼 element
	
	// 'x' 버튼 클릭 이벤트
	attachmentFileDel.on("click", function(){
		var id = $(this).prop("id");
		var idx = id.indexOf("_");	// span_fileNo에서 "_"의 현재 idx 위치를 가져온다.
		var qnaFileNo = id.substring(idx+1);
		var ptrn = "<input type='hidden' name='delQnaNo' value='%v' />";
		$("#qnaForm").append(ptrn.replace("%v", qnaFileNo));
		$(this).parents("li:first").hide();
	});
	

});
</script>
