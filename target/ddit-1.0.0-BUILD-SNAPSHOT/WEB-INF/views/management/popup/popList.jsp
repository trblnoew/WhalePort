<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<style>
    .table th {
        text-align: center;
    }
    .table td {
        text-align: center;
    }
</style>
<div class="body-wrapper">
    <div class="container-fluid">
    <div class="card bg-info-subtle shadow-none position-relative overflow-hidden mb-4">
            <div class="card-body px-4 py-3">
              <div class="row align-items-center">
                <div class="col-9">
                  <h4 class="fw-semibold mb-8">이벤트 관리</h4>
                  <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                      <li class="breadcrumb-item">
                        <a class="text-muted text-decoration-none" href="/common/home">DashBoard</a>
                      </li>
                      <li class="breadcrumb-item" aria-current="page">이벤트 관리</li>
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
        <div class="card w-100 position-relative overflow-hidden">
            <div class="card-body p-4">
                <!-- 검색창 시작 -->
				<div class="row justify-content-start">
				    <div class="col-md-6 d-flex justify-content-end align-items-center ms-auto">
				        <form action="/management/popup/list" method="get" class="w-90 d-flex" id="searchForm">
				            <select class="form-select me-2" name="searchType" style="width: 160px;">    
				                <option>검색 유형 선택</option>
				                <option value="title" <c:if test="${searchType eq 'title' }">selected</c:if> >제목</option>
				                <option value="content" <c:if test="${searchType eq 'content' }">selected</c:if> >내용</option>
				            </select>
					         <div class="input-group position-relative">
				                <input type="text" class="form-control product-search ps-5 pe-5" id="input-search" name="searchWord" placeholder="Search Contacts..." value="${searchWord}" />
				                <i class="ti ti-search position-absolute top-50 start-0 translate-middle-y fs-6 text-dark ms-3"></i>
				                <input type="hidden" name="page" id="page"/>
				                <button type="submit" class="btn btn-primary" style="padding: 0.25rem 0.5rem;">검색</button>
				            </div>
				        </form>
				    </div>
				</div>
                <!-- 검색창 끝 -->
                
                <div class="table-responsive mb-4 border rounded-1 mt-3">
                <table class="table table-hover text-nowrap mb-0 align-middle" style="table-layout: fixed;">
<!--                     <table class="table text-nowrap mb-0 align-middle" style="table-layout: fixed;"> -->
                        <thead class="text-dark fs-4">
                            <tr>
<!--                                 <th width="10%"><h6 class="fs-4 fw-semibold mb-0">게시글번호</h6></th> -->
                                <th width="40%"><h6 class="fs-4 fw-semibold mb-0">제목</h6></th>
                                <th width="30%"><h6 class="fs-4 fw-semibold mb-0">게시기간</h6></th>
                                <th width="15%"><h6 class="fs-4 fw-semibold mb-0">게시구분</h6></th>
                                <th width="15%"><h6 class="fs-4 fw-semibold mb-0">게시목적</h6></th>
                                <th width="15%"><h6 class="fs-4 fw-semibold mb-0">게시상태</h6></th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:choose>
                                <c:when test="${empty pagingVO.dataList}">
                                    <tr>
                                        <td colspan="6">조회하신 게시글이 존재하지 않습니다.</td>
                                    </tr>
                                </c:when>
                                <c:otherwise>
                                    <c:forEach items="${pagingVO.dataList}" var="event" begin="0" step="1" end="9" varStatus="i">
									<tr onclick="location.href='/management/popup/detail?popNo=${event.popNo}';" style="cursor: pointer;">                                            
<%-- 											<td><p class="mb-0 fw-normal fs-4">${totalCnt  - (i.index + ((pagingVO.currentPage - 1 )* 10)) }</p></td> --%>
                                            <td class="text-start"><p class="mb-0 fw-normal fs-4" style="margin-left:50px;">${event.popTitle}</p></td>
                                            <td><p class="mb-0 fw-normal fs-4">${fn:split(event.popStartdate, ' ')[0]}~${fn:split(event.popEnddate, ' ')[0] }</p></td>
                                            
                                          <td><p class="mb-0 fw-normal fs-4">
                                          
	                                            <c:choose>
	                                    		<c:when test="${event.ptNo eq 0 }">
												 공항         		
	                                    		</c:when>
	                                    		<c:otherwise>
	                                    		입접업체
	                                    		</c:otherwise>
	                                    		</c:choose>
                                            </p></td>
                                            
                                            
                                            <td><p class="mb-0 fw-normal fs-4">${event.popGoal}</p></td>
                                            
                                            <c:choose>
	                                            <c:when test="${event.popApproval eq '게시중'}">
		                                            <td><span class="badge bg-primary-subtle text-primary">${event.popApproval}</span></td>
                                            	</c:when>
	                                            <c:when test="${event.popApproval eq '게시종료'}">
		                                            <td><span class="badge bg-warning-subtle text-warning">${event.popApproval}</span></td>
                                            	</c:when>
	                                            <c:when test="${event.popApproval eq '반려'}">
		                                            <td><span class="badge bg-danger-subtle text-danger">${event.popApproval}</span></td>
                                            	</c:when>
												<c:otherwise>
		                                            <td><span class="badge bg-success-subtle text-success">${event.popApproval}</span></td>
												</c:otherwise>	                                            
                                            </c:choose>
                                        </tr>
                                    </c:forEach>
                                </c:otherwise>
                            </c:choose>	
                        </tbody>
                    </table>
                </div>

				<div class="text-end mb-3">
				    <a href="/management/popup/register" class="btn btn-primary me-2">팝업 등록</a>
				    <c:if test="${not empty searchWord}">
				        <a href="/management/popup/list" class="btn btn-outline-primary">목록</a>
				    </c:if>
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

<script type="text/javascript">
$(function(){
	$("#pagingArea").on("click", "a", function(e){
		e.preventDefault();
		console.log("여기");
		console.log(this);
		var pageNo = $(this).data("page");
		$("#searchForm").find("#page").val(pageNo);
		$("#searchForm").submit();
	});
});
</script>

