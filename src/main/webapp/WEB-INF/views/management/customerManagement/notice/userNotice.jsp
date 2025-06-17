<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/libs/quill/dist/quill.snow.css">
<script src="${pageContext.request.contextPath}/resources/assets/libs/quill/dist/quill.js"></script>

<style>
.selNoticenoNo{
	cursor: pointer;
}
</style>

<div class="body-wrapper">
    <div class="container-fluid">
    	<!-- 상단 카드 시작-->
        <div class="card bg-info-subtle shadow-none position-relative overflow-hidden mb-4">
           <div class="card-body px-4 py-3">
             <div class="row align-items-center" style="margin-top:20px;">
               <div class="col-9">
                 <h4 class="fw-semibold mb-8">공지사항</h4>
                 <nav aria-label="breadcrumb">
                   <ol class="breadcrumb">
                     <li class="breadcrumb-item">
                       <a class="text-muted text-decoration-none" href="../main/index.html">DashBoard</a>
                     </li>
                     <li class="breadcrumb-item" aria-current="page">공지사항</li>
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
	<div id="UNnoticeArea">
        	<div class="table-responsive mb-4 border rounded-1">
                <table class="table table-hover text-nowrap mb-0 align-middle" style="table-layout: fixed; width: 100%">
                  <thead class="text-dark fs-4">
                    <tr align="center">
                      <th style="width: 15%">
                        <h6 class="fs-4 fw-semibold mb-0">번호</h6>
                      </th>
                      <th style="width: 25%">
                        <h6 class="fs-4 fw-semibold mb-0">제목</h6>
                      </th>
                      <th style="width: 15%">
                        <h6 class="fs-4 fw-semibold mb-0">첨부파일</h6>
                      </th>
                      <th style="width: 15%">
                        <h6 class="fs-4 fw-semibold mb-0">작성자</h6>
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
					    <c:when test="${empty pagingVO.dataList}">
					        <tr>
					            <td colspan="5">공지사항이 없습니다.</td>
					        </tr>
					    </c:when>
					    <c:otherwise>
					        <c:forEach items="${pagingVO.dataList}" var="notice">
					            <tr class="selNoticenoNo" onclick="location.href='/management/userNotice/detail?noNo=${notice.noNo }'" align="center">
					            <td>
					                    <p class="mb-0 fw-normal fs-4">${notice.noNo }</p>
					                </td>
					                <td align="left">
					                	<p class="mb-0 fw-normal fs-4" align="left" class="noTitle">${notice.noTitle }</p>
					                </td>
					                <td>
					                	<c:if test="${notice.noFilecode eq 02}">
					                        <a class="d-flex align-items-center justify-content-center gap-6 list-group-item-action text-dark px-3 py-0 mb-0 rounded-1" href="javascript:void(0)">
											    <i class="ti ti-file-text fs-5"></i>
											</a>
					                	</c:if>
					                </td>
					                <td>
					                    <p class="mb-0 fw-normal fs-4">${notice.empDept }</p>
					                </td>
					                <td>
					                    <h6 class="fs-4 fw-semibold mb-0">${notice.noDate }</h6>
					                </td>
					                <td>
					                    <h6 class="fs-4 fw-semibold mb-0">${notice.noCount }</h6>
					                </td>
					            </tr>
					        </c:forEach>
					    </c:otherwise>
					</c:choose>
                  </tbody>
                </table>
              </div>
              <div align="right">
	              <a href="/management/userNotice/register" class="btn btn-primary">공지사항 작성</a>
              </div>
              <!-- Pagination 시작 -->
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
				<!-- Pagination 끝 -->
        </div>
  </div>
</div>


<script type="text/javascript">

</script>
