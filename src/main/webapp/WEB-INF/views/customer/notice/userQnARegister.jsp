<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/libs/quill/dist/quill.snow.css">
<script src="${pageContext.request.contextPath}/resources/assets/libs/quill/dist/quill.js"></script>

<style>
.hidden {
    display: none;
}
#userQnAeditor {
    height: 300px; /* 에디터 높이 설정 */
}
.container-fluid{
	width: 80%;
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
            </div>
        </div>
        <div class="card">
            <div class="border-bottom title-part-padding">
                <h4 class="card-title mb-0">문의사항 작성</h4>
            </div>
            <div class="card-body">
                <form action="/customer/qna/register" class="mt-0" method="post" id="userQnAForm" enctype="multipart/form-data">
                    <input type="text" class="form-control" id="qnaTitle" name="qnaTitle" placeholder="제목을 입력하세요.">
                    <br/>
                    <div id="userQnAeditor"></div>
                    <input class="hidden" id="QnAContent" name="qnaContent">
                    <br/>
                    <input class="form-control" type="file" id="qnanoFile" name="qnaFile" multiple="multiple">
                    <sec:csrfInput/>
                </form>
                <br/>
                <div class="d-flex justify-content-end">
                    <a href="/customer/qna/list" class="btn btn-outline-primary me-3">이전</a>
                    <button type="button" class="btn btn-primary" onclick="submitForm()">등록</button>
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
    quill = new Quill('#userQnAeditor', {
        placeholder: '내용을 입력하세요.', // 플레이스홀더 설정
        theme: 'snow' // 또는 'bubble'
    });

    // 폼 제출 함수 정의
    window.submitForm = function() {
        // Quill 에디터의 내용을 hidden input에 저장 
        var content = quill.root.innerText.trim(); // HTML 포함한 내용 가져오기, 앞뒤 공백 제거
        document.getElementById('QnAContent').value = content;

        var title = document.getElementById('qnaTitle').value.trim(); // 제목의 앞뒤 공백 제거

        // 유효성 검사 - alert로 오류 메시지 표시
        if (title === '') {
            alert('제목을 작성해 주세요.');
            return; // 폼 제출 중단
        }

        if (content === '') {
            alert('내용을 작성해 주세요.');
            return; // 폼 제출 중단
        }

        // 유효성 검사 통과 시 폼 제출
        document.getElementById('userQnAForm').submit();
    }
});
</script>
