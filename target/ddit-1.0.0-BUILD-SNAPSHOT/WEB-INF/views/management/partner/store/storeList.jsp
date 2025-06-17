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
    	<!-- 상단 카드 시작-->
        <div class="card bg-info-subtle shadow-none position-relative overflow-hidden mb-4">
           <div class="card-body px-4 py-3">
             <div class="row align-items-center" style="margin-top:20px;">
               <div class="col-9">
                 <h4 class="fw-semibold mb-8">매장 등록</h4>
                 <nav aria-label="breadcrumb">
                   <ol class="breadcrumb">
                     <li class="breadcrumb-item">
                       <a class="text-muted text-decoration-none" href="/common/home">DashBoard</a>
                     </li>
                     <li class="breadcrumb-item" aria-current="page">매장 등록</li>
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
        <div class="card w-100 position-relative overflow-hidden">
            <div class="card-body p-4">
                <!-- 검색창 시작 -->
				<div class="row justify-content-end">
				    <div class="col-md-4 col-xl-6 d-flex align-items-center justify-content-end">
		       			<form action="/management/partner/store/list" method="get" class="position-relative"  id="searchForm">
							<input type="hidden" name="page" id="page" value=""/>
							<div class="input-group position-relative">
				                <input type="text" class="form-control product-search ps-5 pe-5" id="searchWord" name="searchWord" placeholder="매장명, 브랜드명 입력" value="${searchWord}" />
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
                        <thead class="text-dark fs-4">
                            <tr>
                                <th width="10%"><h6 class="fs-4 fw-semibold mb-0">게시글번호</h6></th>
                                <th width="15%"><h6 class="fs-4 fw-semibold mb-0">대분류</h6></th>
                                <th width="15%"><h6 class="fs-4 fw-semibold mb-0">중분류</h6></th>
                                <th width="15%"><h6 class="fs-4 fw-semibold mb-0">입점업체명</h6></th>
                                <th width="15%"><h6 class="fs-4 fw-semibold mb-0">연락처</h6></th>
                                <th width="15%"><h6 class="fs-4 fw-semibold mb-0">상태</h6></th>
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
                                    <c:forEach items="${pagingVO.dataList}" var="store" begin="0" step="1" end="9" varStatus="i">
									<tr onclick="location.href='/management/partner/store/detail?ptNo=${store.ptNo}';" style="cursor: pointer;">                                            
											<td><p class="mb-0 fw-normal fs-4">${totalCnt  - (i.index + ((pagingVO.currentPage - 1 )* 10)) }</p></td>
											<td><p class="mb-0 fw-normal fs-4">
											<c:choose>
												<c:when test="${store.ptCategory1 eq 'restaurant' }">
													식당
												</c:when>
												<c:when test="${store.ptCategory1 eq 'guide' }">
													안내.편의시설
												</c:when>
												<c:when test="${store.ptCategory1 eq 'shopping' }">
													쇼핑.면세점
												</c:when>
												<c:otherwise>
												
												</c:otherwise>
											</c:choose>
											</p></td>
                                            <td><p class="mb-0 fw-normal fs-4">${store.ptCategory2}</p></td>
                                            <td><p class="mb-0 fw-normal fs-4">${store.ptName}</p></td>
                                            <td><p class="mb-0 fw-normal fs-4">${store.ptMgrtel}</p></td>
                                            <td>
											<c:choose>
												<c:when test="${ empty store.ptCategory1 }">
													<span class="badge bg-success-subtle text-success">미게시</span>
												</c:when>
												<c:otherwise>
													<span class="badge bg-primary-subtle text-primary">게시</span>
												</c:otherwise>
											</c:choose>
											</td>
                                        </tr>
                                    </c:forEach>
                                </c:otherwise>
                            </c:choose>	
                        </tbody>
                    </table>
                </div>

				<div class="text-end mb-3">
				    <c:if test="${not empty searchWord}">
				        <a href="/management/partner/store/list" class="btn btn-outline-primary me-3">목록</a>
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

