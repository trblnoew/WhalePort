<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!-- table-basic.html 사용 -->

<style>
    .table th {
        text-align: center;
    }
    .table td {
        text-align: center;
    }
     .btn2 {
    cursor: pointer;
}
.card-hover {
    cursor: pointer;
}
</style>

<div class="body-wrapper">
    <div class="container-fluid">
        <div class="card bg-info-subtle shadow-none position-relative overflow-hidden mb-4">
           <div class="card-body px-4 py-3">
             <div class="row align-items-center" style="margin-top:20px;">
               <div class="col-9">
                 <h4 class="fw-semibold mb-8">주차장</h4>
                 <nav aria-label="breadcrumb">
                   <ol class="breadcrumb">
                     <li class="breadcrumb-item">
                       <a class="text-muted text-decoration-none" href="/common/home">DashBoard</a>
                     </li>
                     <li class="breadcrumb-item" aria-current="page">주차장</li>
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
            <div class="card-header text-bg-primary">
                <h5 class="mb-0 text-white">예약 목록</h5>
            </div>
            <div class="card-body p-4">
            <!-- 상태별 카운트 위젯 시작 -->
			<div class="row d-flex align-items-center justify-content-center g-4">
			    <div class="col-lg-2 col-md-4 col-sm-6" onclick="showAllReservations();">
			        <div class="card border-bottom border-info card-hover">
			            <div class="card-body">
			                <div class="d-flex align-items-center">
			                    <div>
			                        <h4 class="card-title fs-5">${countVO.totalCount}</h4>
			                        <p class="card-subtitle text-info">예약 전체</p>
			                    </div>
			                    <div class="ms-auto">
			                        <span class="text-info display-6">
			                            <i class="ti ti-users"></i>
			                        </span>
			                    </div>
			                </div>
			            </div>
			        </div>
			    </div>
				<div class="col-lg-2 col-md-4 col-sm-6" onclick="setStatus('Y');">
			    <div class="card border-bottom border-primary card-hover">
			        <div class="card-body">
			            <div class="d-flex align-items-center">
			                <div>
			                    <h4 class="card-title fs-5">${countVO.countY}</h4>
			                    <p class="card-subtitle text-info">예약 완료</p>
			                </div>
			                <div class="ms-auto">
			                    <span class="text-primary display-6">
			                        <span class="badge bg-primary-subtle text-primary" style="font-size: 1rem; padding: 0.5rem 0.5rem;">완료</span>
			                    </span>
			                </div>
			            </div>
			        </div>
			    </div>
			</div>
			<div class="col-lg-2 col-md-4 col-sm-6" onclick="setStatus('N');">
			    <div class="card border-bottom border-danger card-hover">
			        <div class="card-body">
			            <div class="d-flex align-items-center">
			                <div>
			                    <h4 class="card-title fs-5">${countVO.countN}</h4>
			                    <p class="card-subtitle text-danger">예약 취소</p>
			                </div>
			                <div class="ms-auto">
			                    <span class="text-danger display-6">
			                        <span class="badge bg-danger-subtle text-danger" style="font-size: 1rem; padding: 0.5rem 0.5rem;">취소</span>
			                    </span>
			                </div>
			            </div>
			        </div>
			    </div>
			</div>
			    <div class="col-lg-2 col-md-4 col-sm-6">
			        <div class="card border-bottom border-dark">
			            <div class="card-body">
			                <div class="d-flex align-items-center">
			                    <div>
			                        <h4 class="card-title fs-5">
    									<fmt:formatNumber value="${countVO.totalCost}" type="number" pattern="#,##0" /></h4>
			                        <p class="card-subtitle text-gray">총 매출</p> 
			                    </div>
			                    <div class="ms-auto">
			                        <span class="text-warning display-6">
			                            <span class="badge text-bg-light" style="color: gray !important; font-size: 1rem; padding: 0.5rem 0.5rem;">매출</span>
			                        </span>
			                    </div>
			                </div>
			            </div>
			        </div>
			    </div>
			</div>
			<br/>
			<!-- 상태별 카운트 위젯 끝 -->
                <!-- 셀렉트 및 검색창 시작 -->
                <div class="row mb-4 align-items-center">
                    <div class="col-md-3">
                        <form id="filter-form" action="/management/reserve/parkingList" method="get">
                            <select class="form-select form-control" id="status-select" name="selectedItem" onchange="document.getElementById('filter-form').submit();" style="width:120px;">
                                <option value="">상태 선택</option>
                                <option value="Y" ${selectedItem == 'Y' ? 'selected' : ''}>예약완료</option>
                                <option value="N" ${selectedItem == 'N' ? 'selected' : ''}>예약취소</option>
                            </select>
                        </form>
                    </div>
               <div class="col-md-9 d-flex justify-content-end align-items-center" >
                   <form action="/management/reserve/parkingList" method="get" class="position-relative me-2" id="search-form">
                       <input type="text" class="form-control product-search ps-5 pe-5" id="input-search" name="searchWord" placeholder="예약번호 또는 예약자명" value="${searchWord}" style="width:280px;" />
                       <i class="ti ti-search position-absolute top-50 start-0 translate-middle-y fs-6 text-dark ms-3"></i>
                   </form>
                   <button type="button" class="btn btn-primary" onclick="document.getElementById('search-form').submit();">검색</button>
               </div>
                </div>
                <!-- 셀렉트 및 검색창 끝 -->
                
         <form action="/management/reserve/excelParkingDown" method="post" id="excelDownForm">
            <div class="table-responsive mb-4 border rounded-1 mt-3">
                <table class="table text-nowrap mb-0 align-middle" style="table-layout: fixed;">
                    <colgroup>
                        <col style="width: 10%;">
                        <col style="width: 15%;">
                        <col style="width: 15%;">
                        <col style="width: 15%;">
                        <col style="width: 15%;">
                        <col style="width: 15%;">
                        <col style="width: 15%;">
                        <col style="width: 15%;">
                        <col style="width: 15%;">
<%--                         <col style="width: 15%;"> --%>
                    </colgroup>
                    <thead class="text-dark fs-4">
                        <tr>
                            <th><h6 class="fs-4 fw-semibold mb-0">예약번호</h6></th>
                            <th><h6 class="fs-4 fw-semibold mb-0">유형</h6></th>
                            <th><h6 class="fs-4 fw-semibold mb-0">예약자명</h6></th>
                            <th><h6 class="fs-4 fw-semibold mb-0">휴대번호</h6></th>
                            <th><h6 class="fs-4 fw-semibold mb-0">차량번호</h6></th>
                            <th><h6 class="fs-4 fw-semibold mb-0">입차일</h6></th>
                            <th><h6 class="fs-4 fw-semibold mb-0">출차일</h6></th>
                            <th><h6 class="fs-4 fw-semibold mb-0">결제금액</h6></th>
                            <th><h6 class="fs-4 fw-semibold mb-0">상태</h6></th>
<!--                             <th><h6 class="fs-4 fw-semibold mb-0">상세보기</h6></th> -->
                        </tr>
                    </thead>
                    <tbody>
                        <c:choose>
                            <c:when test="${empty pagingVO.dataList}">
                                <tr>
                                    <td colspan="7">주차장 예약 내역이 존재하지 않습니다.</td>
                                </tr>
                            </c:when>
                            <c:otherwise>
                                <c:forEach items="${pagingVO.dataList}" var="pr" varStatus="status">
                                    <c:if test="${pr.prStatus == selectedItem or empty selectedItem}">
                                        <tr>
                                            <td><p class="mb-0 fw-normal fs-4">${pr.prNo}</p></td>
                                            <td><p class="mb-0 fw-normal fs-4">${pr.plName}</p></td>
											<td><p class="mb-0 fw-normal fs-4">${pr.prName}</p></td>
											<td><p class="mb-0 fw-normal fs-4">${pr.prTel}</p></td>
											<td><p class="mb-0 fw-normal fs-4">${pr.prCarno}</p></td>
											<td><p class="mb-0 fw-normal fs-4">${fn:split(pr.prEntry, " ")[0]}</p></td>
											<td><p class="mb-0 fw-normal fs-4">${fn:split(pr.prExit, " ")[0]}</p></td>
											<td><p class="mb-0 fw-normal fs-4"> <fmt:formatNumber value="${pr.prCost}" type="number" pattern="#,##0" /></p></td> 
                                            <td>
                                                <c:choose>
                                                    <c:when test="${pr.prStatus == 'N'}">
                                                        <span class="badge bg-danger-subtle text-danger" style="margin-left:10px">예약취소</span>
                                                    </c:when>
                                                    <c:when test="${pr.prStatus == 'Y'}">
                                                        <span class="badge bg-primary-subtle text-primary btn2" style="margin-left:10px" data-action="approve" data-prno="${pr.prNo }">예약완료</span>
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
            <input type="submit" class="btn btn-primary" value="엑셀 다운로드" id="excelDownBtn" />
            </form>

                <div class="text-end mb-3">
                    <c:if test="${not empty searchWord}">
                        <a href="/management/reserve/parkingList" class="btn btn-outline-primary me-3">목록</a>
                    </c:if>
                </div>

                <!-- Pagination 시작 -->
				<div class="d-flex justify-content-center" style="margin-top: 20px;">
				    <nav aria-label="...">
				        <ul class="pagination">
				            <li class="page-item <c:if test='${pagingVO.currentPage == 1}'>disabled</c:if>">
				                <!-- Previous 버튼에 필터링 정보 추가 -->
				                <a class="page-link" href="?page=${pagingVO.currentPage - 1}&searchType=${searchType}&searchWord=${searchWord}&selectedItem=${selectedItem}" tabindex="-1" aria-disabled="true">Prev</a>
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
				<form method="post" action="/management/reserve/parkingStatus" id="parkingStatus">
            </form>
            </div>
        </div>
    </div>
</div>

<script>
    function setStatus(status) {
        document.getElementById('status-select').value = status;
        document.getElementById('filter-form').submit();
    }
    function showAllReservations() {
        document.getElementById('status-select').value = ''; // 필터 초기화
        document.getElementById('filter-form').submit(); // 폼 제출
    }
 // 승인 모달
    $('.btn2').on('click', function() {
    	var prN = $(this).data('prno');
        Swal.fire({
            title: '예약 취소',
            text: '취소하시겠습니까?',
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
            	var prHtml = "<input type='text' name='prNo' value='" + prN + "' />";
            	$('#parkingStatus').append(prHtml);
            	$('#parkingStatus').submit();
 
            }
        });
    });
</script>