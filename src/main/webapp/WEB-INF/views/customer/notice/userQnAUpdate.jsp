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
.custom-height {
	height: 250px; 
	display: flex;
	align-items: center; 
	justify-content: center; 
}
</style>

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
    <div class="container-fluid" style="width: 80%">
        <div class="card">
            <div class="border-bottom title-part-padding">
                <h4 class="card-title mb-0">문의사항 수정</h4>
            </div>
            <div class="card-body">
                <form action="/customer/qna/update?qnaNo=${userqnaVO.qnaNo }" class="mt-0" method="post" id="UQnARegisterForm" enctype="multipart/form-data">
                    <input type="text" class="form-control" id="UQnaTitle" name="qnaTitle" value="${userqnaVO.qnaTitle}">
                    <br/>
                    <div id="editor"></div>
                    <input class="hidden" id="UQnAContent" name="qnaContent">
                    <br/>
                    <input class="form-control" type="file" id="formFile">
                    <sec:csrfInput/>
                </form>
                <br/>
                <div class="d-flex justify-content-end">
                    <a href="/customer/qna/detail?qnaNo=${userqnaVO.qnaNo }" class="btn btn-outline-primary me-3">이전</a>
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
    quill = new Quill('#editor', {
        placeholder: '내용을 입력하세요.', // 플레이스홀더 설정
        theme: 'snow' // 또는 'bubble'
    });

    // Quill 에디터에 기존 내용 설정
    quill.root.innerHTML = "${userqnaVO.qnaContent}"; // 기존 내용을 에디터에 삽입

    // 폼 제출 함수 정의
    window.submitForm = function() {
        // Quill 에디터의 내용을 hidden input에 저장 
        var content = quill.root.innerHTML; // HTML 포함한 내용 가져오기
        document.getElementById('UQnAContent').value = content;

        // 폼 제출
        document.getElementById('UQnARegisterForm').submit();
        
    }
});
</script>
