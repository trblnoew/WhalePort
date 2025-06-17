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
	                 <h4 class="fw-semibold mb-8">점검 관리</h4>
	                 <nav aria-label="breadcrumb">
	                   <ol class="breadcrumb">
	                     <li class="breadcrumb-item">
	                       <a class="text-muted text-decoration-none" href="../main/index.html">DashBoard</a>
	                     </li>
	                     <li class="breadcrumb-item" aria-current="page">점검 관리</li>
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
			<!-- 상태 카드 시작 -->
			<form id="filter-form" action="/management/facility/scheduleList" method="get">
			<div class="row justify-content-center my-5 align-items-center">
				<div class="col-sm-2 col-xl-2 text-center" onclick="selectFilter('N')" class="filter-card"> <!-- 카드 사이 간격 조정 및 가운데 정렬 -->
				    <div class="card bg-warning-subtle shadow-none card-hover" style="width: 220px; margin: auto;">
				        <div class="card-body p-4">
				            <div class="d-flex align-items-center">
				                <div class="round rounded text-bg-warning d-flex align-items-center justify-content-center">
				                    <i class="ti ti-grid-dots fs-6"></i>
				                </div>
				                <div class="ms-auto text-info d-flex align-items-center">
				                    <span class="fw-bold text-warning" style="font-size: 1.1rem; margin-right:10px;">점검 요청</span>
				                </div>
				                <h4 class="card-title mb-0">${countVO.countN}</h4>
				            </div>
				        </div>
				    </div>
				</div>
				<div class="col-sm-1 d-flex justify-content-center align-items-center" style="font-size: 3rem;">
				    <iconify-icon icon="solar:alt-arrow-right-line-duotone"></iconify-icon>
				</div>
				<div class="col-sm-2 col-xl-2 text-center" onclick="selectFilter('H')" class="filter-card" > <!-- 카드 사이 간격 조정 및 가운데 정렬 -->
				    <div class="card bg-success-subtle shadow-none card-hover" style="width: 220px; margin: auto;">
				        <div class="card-body p-4">
				            <div class="d-flex align-items-center">
				                <div class="round rounded text-bg-success d-flex align-items-center justify-content-center">
				                    <i class="ti ti-grid-dots fs-6"></i>
				                </div>
				                <div class="ms-auto text-info d-flex align-items-center">
				                    <span class="fw-bold text-success" style="font-size: 1.1rem; margin-right:10px;">점검 중</span>
				                </div>
				                <h4 class="card-title mb-0">${countVO.countH}</h4>
				            </div>
				        </div>
				    </div>
				</div>
				<div class="col-sm-1 d-flex justify-content-center align-items-center" style="font-size: 3rem;">
				    <iconify-icon icon="solar:alt-arrow-right-line-duotone"></iconify-icon>
				</div>
				<div class="col-sm-2 col-xl-2 text-center" onclick="selectFilter('Y')" class="filter-card"> <!-- 카드 사이 간격 조정 및 가운데 정렬 -->
				    <div class="card bg-primary-subtle shadow-none card-hover" style="width: 220px; margin: auto;">
				        <div class="card-body p-4">
				            <div class="d-flex align-items-center">
				                <div class="round rounded text-bg-primary d-flex align-items-center justify-content-center">
				                    <i class="ti ti-grid-dots fs-6"></i>
				                </div>
				                <div class="ms-auto text-info d-flex align-items-center">
				                    <span class="fw-bold text-primary" style="font-size: 1.1rem; margin-right:10px;">점검 완료</span>
				                </div>
				                <h4 class="card-title mb-0">${countVO.countY}</h4>
				            </div>
				        </div>
				    </div>
				</div>
			</div>
			<input type="hidden" name="selectedItem" id="selectedItem" value="">
			<input type="hidden" name="page" id="page"/>
			</form>
			<!-- 상태 카드 끝 -->

            <!-- 셀렉트 및 검색창 시작 -->
            <div class="row mb-4 align-items-center">
	            <div class="col-md-12 d-flex justify-content-end align-items-center">
	                <form action="/management/facility/scheduleList" method="get" class="position-relative me-2" id="searchForm">
	                	<input type="hidden" name="page" id="page"/>
	                	<input type="hidden" name="selectedItem" value="${pagingVO.selectedItem }">
	                    <input type="text" class="form-control product-search ps-5 pe-5" id="input-search" name="searchWord" placeholder="접수내용 검색" value="${searchWord}" style="width:280px;" />
	                    <i class="ti ti-search position-absolute top-50 start-0 translate-middle-y fs-6 text-dark ms-3"></i>
	                </form>
	                <button type="button" class="btn btn-primary" id="searchBtn">검색</button>
	            </div>
            </div>
            <!-- 셀렉트 및 검색창 끝 -->
            <div class="table-responsive mb-4 border rounded-1 mt-3">
                <table class="table table-hover text-nowrap mb-0 align-middle" style="table-layout: fixed;">
                    <colgroup>
                        <col style="width: 20%;">
                        <col style="width: 20%;">
                        <col style="width: 30%;">
                        <col style="width: 20%;">
                        <col style="width: 20%;">
                    </colgroup>
                    <thead class="text-dark fs-4">
                        <tr>
                            <th><h6 class="fs-4 fw-semibold mb-0">요청구분</h6></th>
                            <th><h6 class="fs-4 fw-semibold mb-0">요청업체</h6></th>
                            <th><h6 class="fs-4 fw-semibold mb-0">접수내용</h6></th>
                            <th><h6 class="fs-4 fw-semibold mb-0">점검위치</h6></th>
                            <th><h6 class="fs-4 fw-semibold mb-0">상태</h6></th>
                        </tr>
                    </thead>
					<tbody>
					    <c:choose>
					        <c:when test="${empty pagingVO.dataList}">
					            <tr>
					                <td colspan="5">점검 내역이 존재하지 않습니다.</td>
					            </tr>
					        </c:when>
					        <c:otherwise>
					            <c:forEach items="${pagingVO.dataList}" var="schedule" varStatus="status">
					              <c:if test="${schedule.inState == selectedItem or empty selectedItem}">
					                <tr>
					                    <td><p class="mb-0 fw-normal fs-4">${schedule.inGoal}</p></td>
					                    <td><p class="mb-0 fw-normal fs-4">${schedule.ptName}</p></td>
					                    <td class="text-start"><p class="mb-0 fw-normal fs-4" style="margin-left:40px;">${schedule.inReception}</p></td>
					                    <td><p class="mb-0 fw-normal fs-4">${schedule.inPlace}</p></td>
                                        <td>
											<c:choose>
											    <c:when test="${schedule.inState == 'Y'}">
											        <span class="badge bg-primary-subtle text-primary" style="margin-left:10px">점검 완료</span>
											    </c:when>
											    <c:when test="${schedule.inState == 'H'}">
											        <span class="badge bg-success-subtle text-success" style="margin-left:10px">점검 중</span>
											    </c:when>
											    <c:when test="${schedule.inState == 'N'}">
											        <span class="badge bg-warning-subtle text-warning" style="margin-left:10px">점검 요청</span>
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
			            <a href="/management/facility/scheduleList" class="btn btn-outline-primary">목록</a>
			        </c:when>
			        <c:when test="${not empty selectedItem}">
				        <a href="/partner/facilities/scheduleList" class="btn btn-outline-primary">목록</a>
				    </c:when>
			        <c:otherwise>
			        	<a class="btn btn-primary" href="javascript:void(0);" data-bs-target="#scheduleRegister" data-bs-toggle="modal" onclick="return false;">점검 등록</a>

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



<!-- 점검 등록 모달창 START -->
<div id="scheduleRegister" class="modal fade" tabindex="-1" aria-hidden="true"">
	<div class="modal-dialog modal-dialog-scrollable modal-lg">
		<div class="modal-content">
			<div class="modal-body">
				<div class="text-center mt-2 mb-4">
					<a href="https://example.com" class="text-success">
						<span>
							<img src="${pageContext.request.contextPath }/resources/assets/images/logos/whale-favi.png" class="me-3 img-fluid" alt="modernize-img" style="width: 50px; height: auto;" />
						</span>
					</a>
				</div>
				<form action="/management/facility/scheduleRegister" method="post" class="ps-3 pr-3">
				    <div class="mb-3">
				        <label for="inGoal">요청구분</label>
				        <select class="form-select" id="inGoal" name="inGoal">
				            <option value="">구분을 선택하세요.</option>
				            <option value="정기점검">정기점검</option>
				            <option value="점검요청">점검요청</option>
				            <option value="보수요청">보수요청</option>
				            <option value="청소요청">청소요청</option>
				            <option value="설치요청">설치요청</option>
				            <option value="개선요청">개선요청</option>
				        </select>
				    </div>
				    <div class="mb-3">
				        <label for="ptNo">요청업체</label>
				        <select class="form-select" id="ptNo" name="ptNo">
				            <option value="">요청하실 업체를 선택하세요.</option>
				            <c:forEach var="partner" items="${partnerVO2}">
				                <option value="${partner.ptNo}">${partner.ptName}</option>
				            </c:forEach>
				        </select>
				    </div>
				    <div class="mb-3">
				        <label for="cusTel">접수내용</label>
				        <input class="form-control" type="text" id="inReception" name="inReception" placeholder="접수 내용을 입력하세요." data-validation="N" data-name="접수 내용">
				    </div>
				    <div class="mb-3">
				        <label for="inGoal">점검위치</label>
					 	<select class="form-select" id="inPlace" name="inPlace">
					        <option value="">점검 위치</option>
					        <option value="탑승구">탑승구</option>
					        <option value="체크인 구역">체크인 구역</option>
					        <option value="보안 검색대">보안 검색대</option>
					        <option value="출국 심사 구역">출국 심사 구역</option>
					        <option value="도착 구역">도착 구역</option>
					        <option value="수하물 찾는 곳">수하물 찾는 곳</option>
					        <option value="상업 구역">상업 구역</option>
					        <option value="라운지">라운지</option>
					        <option value="주차장">주차장</option>
					        <option value="공항 서비스 센터">공항 서비스 센터</option>
					    </select>
				    </div>
				    <div class="mb-3 text-center">
				        <button class="btn btn-rounded bg-info-subtle text-info" type="submit">등록</button>
				    </div>
				</form>
			</div>
		</div>
	</div>
</div>
<!-- 점검 등록 모달창  END -->


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
