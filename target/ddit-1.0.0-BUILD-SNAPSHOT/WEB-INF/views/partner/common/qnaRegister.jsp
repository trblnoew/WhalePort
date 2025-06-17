<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
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
                 <ol class="breadcru4mb">
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
                <h5 class="mb-0 text-white">문의글 작성</h5>
            </div>
            <div class="card-body">
                <form action="/partner/qna/register" class="mt-0" method="post" id="qnaForm" enctype="multipart/form-data">
                    <input class="hidden" id="ptNo" name="ptNo" value="${partnerVO.ptNo}">
                    <input type="text" class="form-control" id="qnaTitle" name="qnaTitle" placeholder="제목을 입력하세요." value="${partnerQnaVO.qnaTitle}">
                    <br/>
                    <div id="editor"></div>
                    <input class="hidden" id="qnaContent" name="qnaContent">
                    <br/>
                    <input class="form-control" type="file" id="qnaFile" name="qnaFile" multiple>
                    <sec:csrfInput/>
                </form>
                <br/>
                <div class="d-flex justify-content-end">
                    <button type="button" class="btn btn-primary me-3" onclick="submitForm()">등록</button>
                    <a href="/partner/qna/list" class="btn btn-outline-primary">이전</a>
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

    // 폼 제출 함수 정의
    window.submitForm = function() {
        // Quill 에디터의 내용을 hidden input에 저장 
        var content = quill.root.innerText; // HTML 포함한 내용 가져오기
        document.getElementById('qnaContent').value = content;

        // 폼 제출
        document.getElementById('qnaForm').submit();
    }
});
</script>
