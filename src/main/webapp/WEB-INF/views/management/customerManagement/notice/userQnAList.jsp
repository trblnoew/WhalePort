<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/libs/quill/dist/quill.snow.css">
<script src="${pageContext.request.contextPath}/resources/assets/libs/quill/dist/quill.js"></script>
<style>
.selNoticeqnaNo{
	cursor: pointer;
}
</style>

        <!-- qna 영역 시작 -->
<div class="body-wrapper">
    <div class="container-fluid">
    	<!-- 상단 카드 시작-->
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
        <!-- 상단 카드 끝 -->
           
    <div class="row justify-content-end">
		<div class="col-md-4 col-xl-3">
			<form action="/management/userNotice/list" method="get" class="position-relative w-100">
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
	<br>
        <div id="UNqnaArea">
        	<div class="table-responsive mb-4 border rounded-1">
                <table class="table table-hover text-nowrap mb-0 align-middle" style="table-layout: fixed; width: 100%">
                  <thead class="text-dark fs-4">
                    <tr align="center">
                      <th style="width: 15%">
                        <h6 class="fs-4 fw-semibold mb-0">번호</h6>
                      </th>
                      <th style="width: 40%">
                        <h6 class="fs-4 fw-semibold mb-0">제목</h6>
                      </th>
                      <th style="width: 15%">
                        <h6 class="fs-4 fw-semibold mb-0">첨부파일</h6>
                      </th>
                      <th style="width: 15%">
                        <h6 class="fs-4 fw-semibold mb-0">답변여부</h6>
                      </th>
                      <th style="width: 15%">
                        <h6 class="fs-4 fw-semibold mb-0">등록일</h6>
                      </th>
                      <th style="width: 15%">
                        <h6 class="fs-4 fw-semibold mb-0">조회수</h6>
                      </th>
                    </tr>
                  </thead>
                  <tbody>
                    <c:choose>
                    	<c:when test="${empty pagingVO.dataList }">
                    	 <tr>
                    	 	<td colspan="5">문의사항이 없습니다.</td>
                    	 </tr>
                    	</c:when>
                    	<c:otherwise>
                    		<c:forEach items="${pagingVO.dataList }" var="qna">
			                    <tr class="selNoticeqnaNo" onclick="location.href='/management/userQnA/detail?qnaNo=${qna.qnaNo}'" align="center">
			                      <td>
			                        <p class="mb-0 fw-normal fs-4">${qna.qnaNo }</p>
			                      </td>
			                      <td>
			                        <p class="mb-0 fw-normal fs-4" align="left" class="qnaTitle" style="margin-left:30px;">${qna.qnaTitle }</p>
			                      </td>
			                      <td>
			                      	<c:if test="${qna.qnaFilecode eq 04}">
				                        <a class="d-flex align-items-center justify-content-center gap-6 list-group-item-action text-dark px-3 py-0 mb-0 rounded-1" href="javascript:void(0)">
										    <i class="ti ti-file-text fs-5"></i>
										</a>
			                      	</c:if>
			                      </td>
			                      <td>
			                      	<c:choose>
			                      		<c:when test="${qna.qnaAns eq null }">
					                        <span class="badge bg-warning-subtle text-warning">답변대기</span>
			                      		</c:when>
			                      		<c:otherwise>
			                      			<span class="badge bg-primary-subtle text-primary">답변완료</span>
			                      		</c:otherwise>
			                      	</c:choose>
			                      </td>
			                      <td>
			                        <h6 class="fs-4 fw-semibold mb-0">${qna.qnaDate }</h6>
			                      </td>
			                      <td>
					                    <h6 class="fs-4 fw-semibold mb-0">${qna.qnaCount }</h6>
					                </td>
			                    </tr>
                    		</c:forEach>
                    	</c:otherwise>
                    </c:choose>
                  </tbody>
                </table>
              </div>
        </div>
        <!-- Paging -->
        <div class="d-flex justify-content-center" style="margin-top: 20px;">
					<nav aria-label="...">
						<ul class="pagination">
							<li
								class="page-item <c:if test='${pagingVO.currentPage == 1}'>disabled</c:if>">
								<a class="page-link" href="?page=${pagingVO.currentPage - 1}"
								tabindex="-1" aria-disabled="true">Prev</a>
							</li>
							<c:forEach begin="1" end="${pagingVO.totalPage}" var="pageNum">
								<li
									class="page-item <c:if test='${pagingVO.currentPage == pageNum}'>active</c:if>">
									<a class="page-link" href="?page=${pageNum}">${pageNum}</a>
								</li>
							</c:forEach>
							<li
								class="page-item <c:if test='${pagingVO.currentPage == pagingVO.totalPage}'>disabled</c:if>">
								<a class="page-link" href="?page=${pagingVO.currentPage + 1}">Next</a>
							</li>
						</ul>
					</nav>
				</div>
        <!-- qna 영역 끝 -->
        </div>
</div>
<script type="text/javascript">

</script>