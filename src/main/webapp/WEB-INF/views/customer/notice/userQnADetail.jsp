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
                <h5 class="mb-0 text-white">문의사항 상세</h5>
            </div>
            <form class="form-horizontal">
                <div class="form-body">
                    <div class="card-body">
                        <h5 class="card-title mb-0">${userqnaVO.qnaTitle}</h5>
                    </div>
                    <hr class="m-0" />
                    <div class="card-body py-3">
                        <div class="row">
                            <div class="col-md-1">
                                <div class="d-flex align-items-center">
                                    <label class="form-label mb-0 me-2">번호</label>
                                    <p class="mb-0">${userqnaVO.qnaNo}</p>
                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="d-flex align-items-center">
                                    <label class="form-label mb-0 me-2">작성자</label>
                                    <p class="mb-0">${userqnaVO.cusId}</p>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="d-flex align-items-center">
                                    <label class="form-label mb-0 me-2">작성일자</label>
                                    <p class="mb-0">${userqnaVO.qnaDate}</p>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="d-flex align-items-center">
                                	<c:if test="${userqnaVO.qnaFilecode eq 04 }">
	                                    <label class="form-label mb-0 me-2">첨부파일</label>
	                                    <a href="${fileVO.fileSavepath}/${fileVO.fileSavename}" download="${fileVO.fileRealname }">${fileVO.fileRealname }</a>
                                	</c:if>
                                </div>
                            </div>
                        </div>
                    </div>
                    <hr class="m-0" />
                    <div class="card-body">
                        <div>
                        <label class="form-label">내용</label>
                        <br/>
                            <div class="flex-grow-1">${userqnaVO.qnaContent}</div>
                        </div>
                    </div>
                <hr class="m-0" />
                <div class="card-body">
                       	<label class="form-label">답변</label>
                       	<br/>
                       	<c:choose>
                       		<c:when test="${userqnaVO.qnaAns eq null }">
                       			답변 대기중입니다.
                       		</c:when>
                       		<c:otherwise>
						        <textarea class="form-control" rows="3" disabled="disabled">${userqnaVO.qnaAns}</textarea>
                       		</c:otherwise>
                       	</c:choose>
                    </div>
                <hr class="m-0" />
                </div>
            	</form>
                <div class="card-body">
                   <div class="d-flex justify-content-end">
                       <a href="/customer/qna/update?qnaNo=${userqnaVO.qnaNo}" class="btn btn-primary me-3">수정</a>
                       <form action="/customer/qna/delete" method="post" class="me-3" id="UNdelForm">
                           <input type="hidden" id="inputQnaNo" name="qnaNo" value="${userqnaVO.qnaNo}">
                           <sec:csrfInput/>
                           <button type="button" class="btn btn-danger" id="UNdelBtn">삭제</button>
                       </form>
                       <button class="btn btn-outline-primary" onclick="history.back()">이전</button>
                   </div>
                </div>
      		 </div>
        <!-- start Form with view only -->
    </div>
</div>

<script>
$(function(){
	
	$(document).on('click', '#UNdelBtn', function(e){
		e.preventDefault();
		var qnaNo = $("#inputQnaNo").val();  // 클릭된 버튼에서 faqNo 가져오기

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
		   
			   $.ajax({
		            url: '/customer/qna/delete',
		            method: 'POST',
		            data: {
		            	qnaNo: qnaNo
		            },
		            success: function(response) {
		            	Swal.fire(
		                    '삭제 처리!',
		                    '삭제가 완료되었습니다.',
		                    'success'
		                ).then(() => {
		                	location.href = "/customer/qna/list";
		                });
		            },
		            error: function(xhr, status, error) {
		            	Swal.fire(
		                        '오류!',
		                        '삭제 처리에 실패했습니다.',
		                        'error'
		                );
		            }
		        });
		   }
		});
	});
	
});
</script>
