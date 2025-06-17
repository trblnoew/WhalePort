][]<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
<script src="${pageContext.request.contextPath}/resources/assets/libs/apexcharts/dist/apexcharts.min.js"></script>


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
                 <h4 class="fw-semibold mb-8">업체 목록</h4>
                 <nav aria-label="breadcrumb">
                   <ol class="breadcrumb">
                     <li class="breadcrumb-item">
                       <a class="text-muted text-decoration-none" href="../main/index.html">DashBoard</a>
                     </li>
                     <li class="breadcrumb-item" aria-current="page">업체 목록</li>
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
            
		<!-- 차트 시작 -->
		 <div class="row d-flex align-items-center justify-content-center g-4 mt-3">
		    <div class="row justify-content-center mb-4"> <!-- 전체 차트를 가운데 정렬 -->
		        <div class="col-md-2"></div>
		        <div class="col-md-3 d-flex flex-column align-items-center" style="margin-left:-50px;"> <!-- 원 차트 영역 -->
		            <h4 class="card-title mb-3" id="year-title"><%= currentYear %>년 협력업체 유형별 현황</h4>
		            <div id="chart-pie-simple" style="width: 100%; height: 330px; display: flex; align-items: center; justify-content: center;"></div> <!-- 크기 조정 -->
		        </div>
		        <div class="col-md-5 d-flex flex-column align-items-center"> <!-- 바 차트 영역 -->
		            <h4 class="card-title mb-3">협력업체 계약 건수 현황</h4>
		            <div id="chart-bar-basic" style="width: 100%; height: 330px; display: flex; align-items: center; justify-content: center;"></div> <!-- 크기 조정 -->
		        </div>
		        <div class="col-md-2"></div>
		    </div>
		</div>
		<!-- 차트 끝 -->
            
            <!-- 상태별 카운트 위젯 시작 -->
			<form id="filter-form" action="/management/partner/account/accountList" method="get">
			    <div class="row d-flex align-items-center justify-content-center g-4">
			        <div style="width: 17%" onclick="selectFilter('')" class="filter-card">
			            <div class="card border-bottom border-info card-hover">
			                <div class="card-body p-4" style="height: 125px">
			                    <div class="d-flex align-items-center">
			                        <div>
			                            <h4 class="card-title fs-6">${countVO.totalCount}</h4>
			                            <p class="card-subtitle text-info">협력업체 전체</p>
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
			        <div style="width: 17%" onclick="selectFilter('Y')" class="filter-card">
			            <div class="card border-bottom border-primary card-hover">
			                <div class="card-body p-4" style="height: 125px">
			                    <div class="d-flex align-items-center">
			                        <div>
			                            <h4 class="card-title fs-6">${countVO.countY}</h4>
			                            <p class="card-subtitle text-info">승인된 협력업체</p>
			                        </div>
			                        <div class="ms-auto">
			                            <span class="text-primary display-6">
			                                <span class="badge bg-primary-subtle text-primary" style="font-size: 1rem; padding: 0.5rem 0.5rem;">승인</span>
			                            </span>
			                        </div>
			                    </div>
			                </div>
			            </div>
			        </div>
			        <div style="width: 17%" onclick="selectFilter('H')" class="filter-card">
			            <div class="card border-bottom border-success card-hover">
			                <div class="card-body p-4" style="height: 125px">
			                    <div class="d-flex align-items-center">
			                        <div>
			                            <h4 class="card-title fs-6">${countVO.countH}</h4>
			                            <p class="card-subtitle text-success">승인 대기 중인 <br>협력업체</p>
			                        </div>
			                        <div class="ms-auto">
			                            <span class="text-success display-6">
			                                <span class="badge bg-success-subtle text-success" style="font-size: 1rem; padding: 0.5rem 0.5rem;">승인대기</span>
			                            </span>
			                        </div>
			                    </div>
			                </div>
			            </div>
			        </div>
			        <div style="width: 17%" onclick="selectFilter('N')" class="filter-card">
			            <div class="card border-bottom border-danger card-hover">
			                <div class="card-body p-4" style="height: 125px">
			                    <div class="d-flex align-items-center">
			                        <div>
			                            <h4 class="card-title fs-6">${countVO.countN}</h4>
			                            <p class="card-subtitle text-danger">반려된 협력업체</p>
			                        </div>
			                        <div class="ms-auto">
			                            <span class="text-danger display-6">
			                                <span class="badge bg-danger-subtle text-danger" style="font-size: 1rem; padding: 0.5rem 0.5rem;">반려</span>
			                            </span>
			                        </div>
			                    </div>
			                </div>
			            </div>
			        </div>
			    </div>
			    <input type="hidden" name="selectedItem" id="selectedItem" value="">
			</form>
			<br/>
			<!-- 상태별 카운트 위젯 끝 -->
            <!-- 셀렉트 및 검색창 시작 -->
            <div class="row mb-4 align-items-center">
                <div class="col-md-3">
                    <form id="filter-form2" action="/management/partner/account/accountList" method="get">
                        <select class="form-select form-control" id="status-select" name="selectedItem" onchange="this.form.submit();" style="width:120px;">
                            <option value="">업체 구분</option>
                            <option value="PRM01" <c:if test="${pagingVO.selectedItem eq 'PRM01'}">selected</c:if>>항공사</option>
                            <option value="PRM02" <c:if test="${pagingVO.selectedItem eq 'PRM02'}">selected</c:if>>보안업체</option>
                            <option value="PRM03" <c:if test="${pagingVO.selectedItem eq 'PRM03'}">selected</c:if>>시설업체</option>
                            <option value="PRM04" <c:if test="${pagingVO.selectedItem eq 'PRM04'}">selected</c:if>>입점업체</option>
                        </select>
                    </form>
                </div>
	            <div class="col-md-9 d-flex justify-content-end align-items-center">
	                <form action="/management/partner/account/accountList" method="get" class="position-relative me-2" id="searchForm">
	                	<input type="hidden" name="page" id="page"/>
	                	<input type="hidden" name="selectedItem" value="${pagingVO.selectedItem }">
	                    <input type="text" class="form-control product-search ps-5 pe-5" id="input-search" name="searchWord" placeholder="업체명 또는 사업자등록번호" value="${searchWord}" style="width:280px;" />
	                    <i class="ti ti-search position-absolute top-50 start-0 translate-middle-y fs-6 text-dark ms-3"></i>
	                </form>
	                <button type="button" class="btn btn-primary" id="searchBtn">검색</button>
	            </div>
            </div>
            <!-- 셀렉트 및 검색창 끝 -->
            <div class="table-responsive mb-4 border rounded-1 mt-3">
                <table class="table table-hover text-nowrap mb-0 align-middle" style="table-layout: fixed;">
                    <colgroup>
                        <col style="width: 14%;">
                        <col style="width: 14%;">
                        <col style="width: 14%;">
                        <col style="width: 14%;">
                        <col style="width: 14%;">
                        <col style="width: 14%;">
                        <col style="width: 8%;">
                        <col style="width: 8%;">
                    </colgroup>
                    <thead class="text-dark fs-4">
                        <tr>
                            <th><h6 class="fs-4 fw-semibold mb-0">업체구분</h6></th>
                            <th><h6 class="fs-4 fw-semibold mb-0">업체명</h6></th>
                            <th><h6 class="fs-4 fw-semibold mb-0">사업자등록번호</h6></th>
                            <th><h6 class="fs-4 fw-semibold mb-0">대표자</h6></th>
                            <th><h6 class="fs-4 fw-semibold mb-0">개업연월일</h6></th>
                            <th><h6 class="fs-4 fw-semibold mb-0">담당자 연락처</h6></th>
                            <th><h6 class="fs-4 fw-semibold mb-0">상태</h6></th>
                            <th><h6 class="fs-4 fw-semibold mb-0">상세보기</h6></th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:choose>
                            <c:when test="${empty pagingVO.dataList}">
                                <tr>
                                    <td colspan="8">협력업체 신청내역이 존재하지 않습니다.</td>
                                </tr>
                            </c:when>
                            <c:otherwise>
                                <c:forEach items="${pagingVO.dataList}" var="pt" varStatus="status">
                                    <c:if test="${pt.ptApproval == selectedItem or pt.ptCode == selectedItem or empty selectedItem}">
                                        <tr onclick="location.href='/management/partner/account/accountDetail?ptNo=${pt.ptNo}';" style="cursor: pointer;">
                                            <td><p class="mb-0 fw-normal fs-4">${pt.comdName}</p></td>
                                            <td><p class="mb-0 fw-normal fs-4">${pt.ptName}</p></td>
                                            <td><p class="mb-0 fw-normal fs-4">${fn:substring(pt.ptBusnum, 0, 3)}-${fn:substring(pt.ptBusnum, 3, 5)}-${fn:substring(pt.ptBusnum, 5, 10)}</p></td>
                                            <td><p class="mb-0 fw-normal fs-4">${pt.ptCeo}</p></td>
                                            <td><p class="mb-0 fw-normal fs-4">${fn:split(pt.ptOpendate, " ")[0]}</p></td>
                                            <td><p class="mb-0 fw-normal fs-4">${pt.ptMgrtel}</p></td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${pt.ptApproval == 'N'}">
                                                        <span class="badge bg-danger-subtle text-danger" style="margin-left:10px">반려</span>
                                                    </c:when>
                                                    <c:when test="${pt.ptApproval == 'Y'}">
                                                        <span class="badge bg-primary-subtle text-primary" style="margin-left:10px">승인</span>
                                                    </c:when>
                                                    <c:when test="${pt.ptApproval == 'H'}">
                                                        <span class="badge bg-success-subtle text-success" style="margin-left:10px">승인대기</span>
                                                    </c:when>
                                                </c:choose>
                                            </td>
                                            <td>
                                             <div class="action-btn" style="display: flex; justify-content: center; align-items: center;">
                                                 <i class="ti ti-eye fs-5"></i>
                                             </div>
                                                <input type="hidden" name="ptNo" value="${pt.ptNo}" />
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
                    <c:if test="${not empty searchWord}">
                        <a href="/management/partner/account/accountList" class="btn btn-outline-primary">목록</a>
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

//원 차트
var optionsPie = {
    chart: {
        type: 'pie',
        width: 330,  // 차트의 너비
        height: 330  // 차트의 높이
    },
    series: [${pieChart.countPrm01}, ${pieChart.countPrm02}, ${pieChart.countPrm03}, ${pieChart.countPrm04}],
    labels: ['항공사', '보안업체', '시설업체', '입점업체'], // 라벨 변경
    colors: ['#0056b3', '#007BFF', '#66B2FF', '#99CCFF'], // 뚜렷한 파란색 계열 색상
    legend: {
        position: 'bottom', // 범례를 아래로 설정
        horizontalAlign: 'center' // 범례를 가운데 정렬
    },
    responsive: [{
        breakpoint: 480,
        options: {
            chart: {
                width: 330,
                height: 330
            },
            legend: {
                position: 'bottom'
            }
        }
    }]
};

var chartPie = new ApexCharts(document.querySelector("#chart-pie-simple"), optionsPie);
chartPie.render();


//바 차트
var optionsBar = {
    chart: {
        type: 'bar',
        width: 650,
        height: 300
    },
    series: [{
        name: '작년 협력업체 수',
        data: ${preBarChart}
    }, {
	    name: '올해 협력업체 수',
	    data: ${thisBarChart}
    }],
    xaxis: {
    	categories: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월']
    },
    
    colors: ['#D3D3D3', '#007BFF'], // 바 색상 설정 (올해: 파란색, 작년: 연한 회색)
    dataLabels: {
        enabled: true // 데이터 레이블 활성화
    },
    plotOptions: {
        bar: {
            borderRadius: 5 // 바의 모서리 라운드 설정
        }
    }
};
var chartBar = new ApexCharts(document.querySelector("#chart-bar-basic"), optionsBar);
chartBar.render();


</script>