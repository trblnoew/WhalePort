<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<style>
.table th {
   text-align: center;
}

.table td {
   text-align: center;
}

.hoverEffect {
    cursor: pointer; /* 커서가 포인터로 변경됩니다. */
}
.form-check-input {
	width: 20px; /* 체크박스 너비 */
	height: 20px; /* 체크박스 높이 */
	border: 2px solid #d3d3d3; /* 체크박스 테두리 색상 (연한 회색) */
	border-radius: 4px; /* 체크박스 모서리 둥글게 */
	background-color: #f8f9fa; /* 체크박스 기본 배경색 */
	transition: background-color 0.3s, border-color 0.3s; /* 부드러운 전환 효과 */
}
.disabled {
    pointer-events: none; /* 클릭 이벤트 비활성화 */
    opacity: 0.5; /* 비활성화된 상태를 시각적으로 표현 */
}
</style>


<div class="body-wrapper">
   <div class="container-fluid">
      <div class="card bg-info-subtle shadow-none position-relative overflow-hidden mb-4">
         <div class="card-body px-4 py-3">
           <div class="row align-items-center" style="margin-top:20px;">
             <div class="col-9">
               <h4 class="fw-semibold mb-8">QnA / FAQ</h4>
               <nav aria-label="breadcrumb">
                 <ol class="breadcrumb">
                   <li class="breadcrumb-item">
                     <a class="text-muted text-decoration-none" href="../main/index.html">DashBoard</a>
                   </li>
                   <li class="breadcrumb-item" aria-current="page">QnA / FAQ</li>
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
		    <div class="card-body text-center">
		        <span class="hoverEffect"  id="ptQna" style="color: black; text-decoration: underline; font-weight: bold; text-underline-offset: 5px; margin-right: 15px;">QnA</span>
		        <span class="serviceCenterBar " style="margin-right: 15px;"> | </span>
		        <span class="hoverEffect" id="ptFaq">FAQ</span>
		    </div>
		</div>

      
        <div class="card w-100 position-relative overflow-hidden">
            <div class="card-body p-4">
                <!-- 셀렉트 및 검색창 시작 -->
                <div class="row mb-4 align-items-center">
                    <div class="col-md-3">
                        <form id="filter-form" action="/management/partner/qna/qnaList" method="get">
							<input type="hidden" name="page" id="page"/>
                            <select class="form-select form-control" id="status-select" name="selectedItem" onchange="document.getElementById('filter-form').submit();" style="width:120px;">
                                <option value="">상태 선택</option>
                                <option value="Y" ${selectedItem == 'Y' ? 'selected' : ''}>답변 완료</option>
                                <option value="N" ${selectedItem == 'N' ? 'selected' : ''}>답변 대기</option>
                            </select>
                        </form>
                    </div>
               <div class="col-md-9 d-flex justify-content-end align-items-center">
                   <form id="searchForm" action="/management/partner/qna/qnaList" method="get" class="position-relative me-2">
                   		<input type="hidden" name="page" id="page"/>
                   		<input type="hidden" name="selectedItem" value="${pagingVO.selectedItem }">
                       <input type="text" class="form-control product-search ps-5 pe-5" id="input-search" name="searchWord" placeholder="제목 또는 내용" value="${searchWord}" style="width:280px;" />
                       <i class="ti ti-search position-absolute top-50 start-0 translate-middle-y fs-6 text-dark ms-3"></i>
                   </form>
                   <button type="button" class="btn btn-primary" onclick="document.getElementById('search-form').submit();">검색</button>
               </div>
                </div>
                <!-- 셀렉트 및 검색창 끝 -->
            <div class="table-responsive mb-4 border rounded-1 mt-3">
                <table class="table table-hover text-nowrap mb-0 align-middle" style="table-layout: fixed;">
                    <colgroup>
                        <col style="width: 6%;">
                        <col style="width: 6%;">
                        <col style="width: 12%;">
                        <col style="width: 36%;">
                        <col style="width: 10%;">
                        <col style="width: 10%;">
                        <col style="width: 10%;">
                        <col style="width: 10%;">
                    </colgroup>
                    <thead class="text-dark fs-4">
                        <tr>
							<th></th>
							<th></th>
							<th><h6 class="fs-4 fw-semibold mb-0">업체 구분</h6></th>
							<th><h6 class="fs-4 fw-semibold mb-0">제목</h6></th>
							<th><h6 class="fs-4 fw-semibold mb-0">작성자</h6></th>
							<th><h6 class="fs-4 fw-semibold mb-0">등록일</h6></th>
							<th><h6 class="fs-4 fw-semibold mb-0">첨부파일</h6></th>
							<th><h6 class="fs-4 fw-semibold mb-0">상태</h6></th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:choose>
                            <c:when test="${empty pagingVO.dataList}">
                                <tr>
                                    <td colspan="8">등록된 문의사항 내역이 존재하지 않습니다.</td>
                                </tr>
                            </c:when>
<c:otherwise>
    <c:forEach items="${pagingVO.dataList}" var="qna" varStatus="status">
        <c:if test="${qna.qnaState == selectedItem or empty selectedItem}">
            <tr onclick="location.href='/management/partner/qna/qnaDetail?qnaNo=${qna.qnaNo}';"  style="cursor: pointer;" 
                <c:if test="${qna.qnaDelyn == 'Y'}">class="disabled"</c:if>>
                <td onclick="event.stopPropagation();">
                    <input class="form-check-input contact-chkbox primary" type="checkbox" name="selectedQnaNos" id="checkbox-${qna.qnaNo}" value="${qna.qnaNo}">
                </td>  
                <td><p class="mb-0 fw-normal fs-4">${qna.qnaNo}</p></td>
                <td><p class="mb-0 fw-normal fs-4">${qna.comdName}</p></td>
                <td class="text-start"><p class="mb-0 fw-normal fs-4" style="margin-left:20px;">${qna.qnaTitle}</p></td>
                <td><p class="mb-0 fw-normal fs-4">${qna.ptName}</p></td>
                <td><p class="mb-0 fw-normal fs-4">${qna.qnaDate}</p></td>
                <td class="text-center">
                    <c:if test="${qna.queFilecode eq 03}">
                        <a class="d-flex align-items-center justify-content-center gap-6 list-group-item-action text-dark px-3 py-0 mb-0 rounded-1" href="javascript:void(0)">
                            <i class="ti ti-file-text fs-5"></i>
                        </a>
                    </c:if>
                </td>
                <td>
                    <c:choose>
                        <c:when test="${qna.qnaDelyn == 'Y'}">
                            <span class="badge text-bg-light" style="color: gray !important; margin-left:10px;">블라인드</span>
                        </c:when>
                        <c:when test="${qna.qnaDelyn == 'N' && qna.qnaState == 'Y'}">
                            <span class="badge bg-primary-subtle text-primary" style="margin-left:10px">답변 완료</span>
                        </c:when>
                        <c:when test="${qna.qnaDelyn == 'N' && qna.qnaState == 'N'}">
                            <span class="badge bg-success-subtle text-success" style="margin-left:10px">답변 대기</span>
                        </c:when>
                    </c:choose>
                </td>
            </tr>
        </c:if>
    </c:forEach>
</c:otherwise>


                        </c:choose>
                    </tbody>
                </table>
            </div>

                <div class="text-end mb-3">
				    <c:choose>
				        <c:when test="${not empty searchWord}">
				            <a href="/management/partner/qna/qnaList" class="btn btn-outline-primary">목록</a>
				        </c:when>
				        <c:otherwise>
				            <a href="javascript:void(0)" class="btn btn-primary" onclick="handleBlindProcessing()">블라인드 처리</a>
				        </c:otherwise>
				    </c:choose>
				</div>


				<!-- Pagination 시작 -->
				<div class="d-flex justify-content-center" style="margin-top: 20px;" id="pagingArea">
				    <nav aria-label="...">
				        ${pagingVO.pagingHTML }
				    </nav>
				</div>
				<!-- Pagination 끝 -->
            </div>
        </div>
   </div>
</div>

<!-- 반려 사유 작성 알림 모달 -->
<div class="modal fade" id="blindCkModal" tabindex="-1" aria-labelledby="vertical-center-modal" aria-hidden="true">
    <div class="modal-dialog modal-sm">
        <div class="modal-content modal-filled bg-warning-subtle">
            <div class="modal-body p-4">
                <div class="text-center text-warning">
                    <i class="ti ti-alert-octagon fs-7"></i>
                    <h4 class="mt-2">알림</h4>
                    <p class="mt-3">블라인드 처리할 항목을 선택해주세요!</p>
                    <button type="button" class="btn btn-light my-2" data-bs-dismiss="modal">닫기</button>
                </div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
function handleBlindProcessing() {
    // 체크된 체크박스 수집
    const selectedQnaNos = Array.from(document.querySelectorAll('input[name="selectedQnaNos"]:checked'))
        .map(checkbox => checkbox.value);

    if (selectedQnaNos.length === 0) {
        $('#blindCkModal').modal('show'); // 모달 표시
        return; // 선택된 항목이 없으면 중단
    }

    // 선택된 항목을 폼에 추가
    const form = document.createElement('form');
    form.method = 'POST';
    form.action = '/management/partner/qna/blind'; // 블라인드 처리할 URL로 변경

    // 선택된 항목을 폼에 추가
    selectedQnaNos.forEach(qnaNo => {
        const input = document.createElement('input');
        input.type = 'hidden';
        input.name = 'qnaNos';
        input.value = qnaNo;
        form.appendChild(input);
    });
    
    // SweetAlert2로 확인 메시지 표시
    Swal.fire({
        title: '블라인드 처리',
        text: '해당 문의사항을 블라인드 처리하시겠습니까?',
        icon: 'info',
        showCancelButton: true,
        confirmButtonText: '확인',
        cancelButtonText: '취소',
        customClass: {
            cancelButton: 'btn btn-outline-primary',
            confirmButton: 'btn btn-primary me-2'
        },
        buttonsStyling: false
    }).then((result) => {
        if (result.isConfirmed) {
            document.body.appendChild(form);
            form.submit(); // 폼 제출
        }
    });
}

$(function(){
	var qna = $("#ptQna");
	var faq = $("#ptFaq");
	
	
	qna.on("click", function(){
		location.href="/management/partner/qna/qnaList"
	});
	
	faq.on("click", function(){
		location.href="/management/partner/faq/faqList";
	});
});

function selectFilter(value) {
    document.getElementById('selectedItem').value = value; // 전체 선택일 경우 값이 없게 설정
    document.getElementById('filter-form').submit();
}

$(function(){
	$("#pagingArea").on("click", "a", function(e){
		e.preventDefault();
		var pageNo = $(this).data("page");
		$("#searchForm").find("#page").val(pageNo);
		$("#searchForm").submit();
	});
});
</script>

