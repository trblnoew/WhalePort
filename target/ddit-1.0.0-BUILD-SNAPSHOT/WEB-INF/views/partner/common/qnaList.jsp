<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
                        <form id="filter-form" action="/partner/qna/list" method="get">
                            <select class="form-select form-control" id="status-select" name="selectedItem" onchange="document.getElementById('filter-form').submit();" style="width:120px;">
                                <option value="">상태 선택</option>
                                <option value="Y" ${selectedItem == 'Y' ? 'selected' : ''}>답변 완료</option>
                                <option value="N" ${selectedItem == 'N' ? 'selected' : ''}>답변 대기</option>
                            </select>
                        </form>
                    </div>
               <div class="col-md-9 d-flex justify-content-end align-items-center">
                   <form action="/partner/qna/list" method="get" class="position-relative me-2">
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
                        <col style="width: 8%;">
                        <col style="width: 13%;">
                        <col style="width: 31%;">
                        <col style="width: 12%;">
                        <col style="width: 12%;">
                        <col style="width: 12%;">
                        <col style="width: 12%;">
                    </colgroup>
                    <thead class="text-dark fs-4">
                        <tr>
							<th></th>
							<th><h6 class="fs-4 fw-semibold mb-0">업체 구분</h6></th>
							<th><h6 class="fs-4 fw-semibold mb-0">제목</h6></th>
							<th><h6 class="fs-4 fw-semibold mb-0">작성자</h6></th>
							<th><h6 class="fs-4 fw-semibold mb-0">등록일</h6></th>
							<th><h6 class="fs-4 fw-semibold mb-0">첨부파일</h6></th>
							<th><h6 class="fs-4 fw-semibold mb-0">답변여부</h6></th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:choose>
                            <c:when test="${empty pagingVO.dataList}">
                                <tr>
                                    <td colspan="7">등록된 문의사항 내역이 존재하지 않습니다.</td>
                                </tr>
                            </c:when>
                            <c:otherwise>
                                <c:forEach items="${pagingVO.dataList}" var="qna" varStatus="status">
                                    <c:if test="${qna.qnaState == selectedItem or empty selectedItem}">
							            <tr onclick="location.href='/partner/qna/detail?qnaNo=${qna.qnaNo}';" style="cursor: pointer;">
							            <tr onclick="location.href='/partner/qna/detail?qnaNo=${qna.qnaNo}&ptNo=${ptNo}';" style="cursor: pointer;">
							                <td><p class="mb-0 fw-normal fs-4">${qna.qnaNo}</p></td>
							                <td><p class="mb-0 fw-normal fs-4">${qna.comdName}</p></td>
							                <td class="text-start"><p class="mb-0 fw-normal fs-4" style="margin-left:30px;">${qna.qnaTitle}</p></td>
							                <td><p class="mb-0 fw-normal fs-4">${qna.ptName}</p></td>
							                <td><p class="mb-0 fw-normal fs-4">${qna.qnaDate}</p></td>
											<td class="text-center">
											    <c:if test="${qna.queFilecode eq 03}">
											        <a class="d-flex align-items-center justify-content-center gap-6 list-group-item-action text-dark px-3 py-8 mb-1 rounded-1" href="javascript:void(0)">
											            <i class="ti ti-file-text fs-5"></i>
											        </a>
											    </c:if>
											</td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${qna.qnaState == 'N'}">
                                                        <span class="badge bg-success-subtle text-success" style="margin-left:10px">답변 대기</span>
                                                    </c:when>
                                                    <c:when test="${qna.qnaState == 'Y'}">
                                                        <span class="badge bg-primary-subtle text-primary" style="margin-left:10px">답변 완료</span>
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
                    <a href="/partner/qna/register" class="btn btn-primary me-3" onclick="showSuccessAlert()">문의글 작성</a>
                    <c:if test="${not empty searchWord}">
                        <a href="/partner/qna/list" class="btn btn-outline-primary">목록</a>
                    </c:if>
                </div>

				<!-- Pagination 시작 -->
				<div class="d-flex justify-content-center" style="margin-top: 20px;">
				    <nav aria-label="...">
				        <ul class="pagination">
				            <li class="page-item <c:if test='${pagingVO.currentPage == 1}'>disabled</c:if>">
				                <!-- Previous 버튼에 필터링 정보 추가 -->
				                <a class="page-link" href="?page=${pagingVO.currentPage - 1}&searchType=${searchType}&searchWord=${searchWord}&selectedItem=${selectedItem}" tabindex="-1" aria-disabled="true">Previous</a>
				            </li>
				            <c:forEach begin="1" end="${pagingVO.totalPage}" var="pageNum">
				                <li class="page-item <c:if test='${pagingVO.currentPage == pageNum}'>active</c:if>">
				                    <!-- 페이지 번호 링크에 필터링 정보 추가 -->
				                    <a class="page-link" href="?page=${pageNum}&searchType=${searchType}&searchWord=${searchWord}&selectedItem=${selectedItem}">${pageNum}</a>
				                </li>
				            </c:forEach>
				            <li class="page-item <c:if test='${pagingVO.currentPage == pagingVO.totalPage}'>disabled</c:if>">
				                <!-- Next 버튼에 필터링 정보 추가 -->
				                <a class="page-link" href="?page=${pagingVO.currentPage + 1}&searchType=${searchType}&searchWord=${searchWord}&selectedItem=${selectedItem}">Next</a>
				            </li>
				        </ul>
				    </nav>
				</div>
				<!-- Pagination 끝 -->
            </div>
        </div>
   </div>
</div>

<script>
$(function(){
	var qna = $("#ptQna");
	var faq = $("#ptFaq");
	
	
	qna.on("click", function(){
		location.href="/partner/qna/list"
	});
	
	faq.on("click", function(){
		location.href="/partner/qna/faqList";
	});
});
</script>
