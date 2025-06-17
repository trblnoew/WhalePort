<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<%
    int currentYear = java.util.Calendar.getInstance().get(java.util.Calendar.YEAR);
%>

<style>
    .table th {
        text-align: center;
    }
    .table td {
        text-align: center;
    }
	#filter-form .card-body {
	    cursor: pointer; /* 커서가 포인터로 변경됩니다. */
	}
</style>

<div class="body-wrapper">
    <div class="container-fluid">
        	<!-- 상단 카드 시작-->
	        <div class="card bg-info-subtle shadow-none position-relative overflow-hidden mb-4">
	           <div class="card-body px-4 py-3">
	             <div class="row align-items-center" style="margin-top:20px;">
	               <div class="col-9">
	                 <h4 class="fw-semibold mb-8">보고서 관리</h4>
	                 <nav aria-label="breadcrumb">
	                   <ol class="breadcrumb">
	                     <li class="breadcrumb-item">
	                       <a class="text-muted text-decoration-none" href="../main/index.html">DashBoard</a>
	                     </li>
	                     <li class="breadcrumb-item" aria-current="page">보고서 관리</li>
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
            <!-- 셀렉트 및 검색창 시작 -->
            <div class="row mb-4 align-items-center">
	            <div class="col-md-12 d-flex justify-content-end align-items-center">
	                <form action="/management/facility/reportList" method="get" class="position-relative me-2" id="searchForm">
	                	<input type="hidden" name="page" id="page"/>
	                    <input type="text" class="form-control product-search ps-5 pe-5" id="input-search" name="searchWord" placeholder="제목 또는 내용" value="${searchWord}" style="width:280px;" />
	                    <i class="ti ti-search position-absolute top-50 start-0 translate-middle-y fs-6 text-dark ms-3"></i>
	                </form>
	                <button type="button" class="btn btn-primary" id="searchBtn">검색</button>
	            </div>
            </div>
            <!-- 셀렉트 및 검색창 끝 -->
            <div class="table-responsive mb-4 border rounded-1 mt-3">
                <table class="table table-hover text-nowrap mb-0 align-middle" style="table-layout: fixed;">
                    <colgroup>
                        <col style="width: 5%;">
                        <col style="width: 20%;">
                        <col style="width: 30%;">
                        <col style="width: 25%;">
                        <col style="width: 20%;">
                    </colgroup>
                    <thead class="text-dark fs-4">
                        <tr>
                            <th><h6 class="fs-4 fw-semibold mb-0"></h6></th>
                            <th><h6 class="fs-4 fw-semibold mb-0">요청구분</h6></th>
                            <th><h6 class="fs-4 fw-semibold mb-0">제목</h6></th>
                            <th><h6 class="fs-4 fw-semibold mb-0">점검위치</h6></th>
                            <th><h6 class="fs-4 fw-semibold mb-0">작성일자</h6></th>
                        </tr>
                    </thead>
					<tbody>
					    <c:choose>
					        <c:when test="${empty pagingVO.dataList}">
					            <tr>
					                <td colspan="5">보고서 내역이 존재하지 않습니다.</td>
					            </tr>
					        </c:when>
					        <c:otherwise>
					            <c:set var="totalCount" value="${pagingVO.totalRecord}" />
					            <c:set var="pageSize" value="10" /> <!-- 페이지당 게시글 수 -->
					            <c:set var="startIndex" value="${(pagingVO.currentPage - 1) * pageSize}" />
					            <c:set var="currentCount" value="${totalCount - startIndex}" />
					            <c:forEach items="${pagingVO.dataList}" var="report" varStatus="status">
					                <tr onclick="location.href='/management/facility/reportDetail?inNo=${report.inNo}';" style="cursor: pointer;">
					                    <td><p class="mb-0 fw-normal fs-4">${currentCount - status.index}</p></td> <!-- 1을 빼줌 -->
					                    <td><p class="mb-0 fw-normal fs-4">${report.inGoal}</p></td>
					                     <td class="text-start"><p class="mb-0 fw-normal fs-4" style="margin-left:50px;">${report.inTitle}</p></td>
					                    <td><p class="mb-0 fw-normal fs-4">${report.inPlace}</p></td>
					                    <td><p class="mb-0 fw-normal fs-4">${fn:split(report.reportDate, " ")[0]}</p></td>
					                </tr>
					            </c:forEach>
					        </c:otherwise>
					    </c:choose>
					</tbody>
                </table>
            </div>
            
            <div class="text-end mb-3">
			    <c:choose>
			        <c:when test="${not empty searchWord}">
			            <a href="/management/facility/reportList" class="btn btn-outline-primary">목록</a>
			        </c:when>
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

<script type="text/javascript">
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