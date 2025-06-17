<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<style>
    .table th {
        text-align: center;
    }
    .table td {
        text-align: center;
    }
    
    #preThisRes {
    width: 100%;
    height: 300px; /* 원하는 높이 설정 */
	}
	
	.custom-align {
    text-align: right;
	}

    
</style>



<div class="body-wrapper">
    <div class="container-fluid">
        <div class="card bg-info-subtle shadow-none position-relative overflow-hidden mb-4">
            <div class="card-body px-4 py-3">
              <div class="row align-items-center" style="margin-top:20px;">
                <div class="col-9">
                  <h4 class="fw-semibold mb-8">항공편 예약 관리</h4>
                  <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                      <li class="breadcrumb-item">
                        <a class="text-muted text-decoration-none" href="/common/home">DashBoard</a>
                      </li>
                      <li class="breadcrumb-item" aria-current="page">항공편 예약 관리</li>
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
        
        
       <div class="container">
    	<div class="row">
    <!-- 전/이번달 예약건수(메인)차트 -->
    <div class="col-md-8"> <!-- 열 크기를 6으로 설정하여 두 개의 차트를 나란히 배치 -->
        <div class="card">
            <div class="card-body">
                <h4 class="card-title">전달 대비 이번달 예약 건수</h4>
                <div id="preThisRes" class="mx-n3"></div>
            </div>
        </div>
    </div>
    
    <!-- Start Basic Bar Chart -->
    <div class="col-md-4"> <!-- 열 크기를 6으로 설정하여 두 개의 차트를 나란히 배치 -->
        <div class="card">
            <div class="card-body">
                <h4 class="card-title">2024년 매출</h4>
                <div id="income"></div>
            </div>
        </div>
    </div>
    <!-- End Basic Bar Chart -->
</div>
</div>

        
        
        <!-- 상태별 카운트 위젯 시작 -->
       <div class="row">
	    <form id="filterForm" action="/management/customer/airlineReserveList" method="get">
         <div class="row d-flex align-items-center justify-content-center g-4">
            
            <div class="col-sm-6 col-xl-3">
              <div class="card card-hover bg-info-subtle shadow-none" onclick="selectFilter('T')" class="filter-card"  >
                <div class="card-body p-4">
                  <div class="d-flex align-items-center">
                    <div class="round rounded text-bg-info d-flex align-items-center justify-content-center">
                      <i class="ti ti-alarm" style="font-size: 2rem;"></i>
                    </div>
                    <h6 class="mb-0 ms-3">오늘 예약</h6>
                    <div class="ms-auto text-info d-flex align-items-center">
                      <i class="ti ti-trending-up text-info fs-6 me-1"></i>
                      <span class="fs-2 fw-bold">전날 대비 + 3</span>
                    </div>
                  </div>
                  <div class="d-flex align-items-center justify-content-between mt-4">
                    <h3 class="mb-0 fw-semibold fs-7">${todayCount}<span class="fs-5 ms-2" style="color: gray;">건</span>
                    </h3>
                    <span class="fw-bold">₩ 1,015.00</span>
                  </div>
                </div>
              </div>
            </div>
            
            <div class="col-sm-6 col-xl-3">
              <div class="card card-hover bg-success-subtle shadow-none" onclick="selectFilter('new')" class="filter-card" >
                <div class="card-body p-4">
                  <div class="d-flex align-items-center">
                    <div class="round rounded text-bg-success d-flex align-items-center justify-content-center">
                     <i class="ti ti-brand-netflix" style="font-size: 2rem;"></i>
                    </div>
                    <h6 class="mb-0 ms-3">새로운 예약</h6>
                    <div class="ms-auto text-success d-flex align-items-center">
                      <i class="ti ti-trending-up text-success fs-6 me-1"></i>
                      <span class="fs-2 fw-bold">전날 대비 + 12</span>
                    </div>
                  </div>
                  <div class="d-flex align-items-center justify-content-between mt-4">
                    <h3 class="mb-0 fw-semibold fs-7">${newCount} <span class="fs-5 ms-2" style="color: gray;">건</span>
                    </h3>
                    <span class="fw-bold">₩ 2,110.00</span>
                  </div>
                </div>
              </div>
            </div>
            
            <div class="col-sm-6 col-xl-3">
              <div class="card card-hover bg-danger-subtle shadow-none" onclick="selectFilter('N')" class="filter-card" >
                <div class="card-body p-4">
                  <div class="d-flex align-items-center">
                    <div class="round rounded text-bg-danger d-flex align-items-center justify-content-center">
                      <i class="ti ti-square-letter-x" style="font-size: 2rem;"></i>
                    </div>
                    <h6 class="mb-0 ms-3">취소된 예약</h6>
                    <div class="ms-auto text-danger d-flex align-items-center">
                      <i class="ti ti-trending-down text-danger fs-6 me-1"></i>
                      <span class="fs-2 fw-bold text-danger">전달 대비 - 20</span>
                    </div>
                  </div>
                  <div class="d-flex align-items-center justify-content-between mt-4">
                    <h3 class="mb-0 fw-semibold fs-7">${cancelCount}<span class="fs-5 ms-2" style="color: gray;">건</span>
                    </h3>
                    <span class="fw-bold">₩1,100.00</span>
                  </div>
                </div>
              </div>
            </div>
            
            <div class="col-sm-6 col-xl-3">
              <div class="card card-hover bg-warning-subtle shadow-none" onclick="selectFilter('')" class="filter-card" >
                <div class="card-body p-4">
                  <div class="d-flex align-items-center">
                    <div class="round rounded text-bg-warning d-flex align-items-center justify-content-center">
                      <i class="ti ti-list" style="font-size: 2rem;"></i>
                    </div>
                    <h6 class="mb-0 ms-3">전체 예약</h6>
                    <div class="ms-auto text-warning d-flex align-items-center">
                      <i class="ti ti-trending-down text-warning fs-6 me-1"></i>
                      <span class="fs-2 fw-bold text-warning">전달 대비 - 22</span>
                    </div>
                  </div>
                  <div class="d-flex align-items-center justify-content-between mt-4">
                    <h3 class="mb-0 fw-semibold fs-7">${totalCount}<span class="fs-5 ms-2" style="color: gray;">건</span>
                    </h3>
                    <span class="fw-bold">₩2,150.00</span>
                  </div>
                </div>
              </div>
            </div>
          </div>
   			 <input type="hidden" name="selectedItem" id="selectedItem" value="">
   			 <sec:csrfInput />
        </form>  
            
     <div class="container">
    <div class="row">
            <div class="row">
                <div class="col-3">
				<!--  Start Simple Pie Chart -->
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title">방문 많은 여행지</h4>
                            <div id="favoritCountry" style="height: 100%;"></div>
                        </div>
                    </div>
				<!-- End Simple Pie Chart -->
                </div>
                <div class="col-9">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title fw-semibold">오늘 예약</h4>
					        <div class="col-12 d-flex justify-content-end align-items-end custom-align">
							    <form action="/management/customer/airlineReserveList" method="get" class="position-relative me-2" id="searchForm" >
							        <input type="hidden" name="page" id="page" value=""/>
							        <input type="hidden" name="selectedItem" value="${pagingVO.selectedItem}">
							        <i class="ti ti-search position-absolute top-50 start-0 translate-middle-y fs-6 text-dark ms-3"></i>
							        <input type="text" class="form-control product-search ps-5 pe-5" id="input-search" name="searchWord" placeholder="고객 이름 또는 예약자 이름" value="${searchWord}" style="width:280px;">
							    </form>
							    <button type="button" class="btn btn-primary" onclick="document.getElementById('searchForm').submit();">검색</button>
							</div>                             
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
				                    </colgroup>
				                    <thead class="text-dark fs-4">
				                        <tr>
				                            <th><h6 class="fs-4 fw-semibold mb-0">예약번호</h6></th>
				                            <th><h6 class="fs-4 fw-semibold mb-0">예약자명</h6></th>
				                            <th><h6 class="fs-4 fw-semibold mb-0">결제금액</h6></th>
				                            <th><h6 class="fs-4 fw-semibold mb-0">출발날짜</h6></th>
				                            <th><h6 class="fs-4 fw-semibold mb-0">도착날짜</h6></th>
				                            <th><h6 class="fs-4 fw-semibold mb-0">결제일시</h6></th>
				                            <th><h6 class="fs-4 fw-semibold mb-0">상태</h6></th>
				                        </tr>
				                    </thead>
				                    <tbody>
				                        <c:choose>
				                            <c:when test="${empty pagingVO.dataList}">
				                                <tr>
				                                    <td colspan="7">항공권 예약 내역이 존재하지 않습니다.</td>
				                                </tr>
				                            </c:when>
				                            <c:otherwise>
				                                <c:forEach items="${pagingVO.dataList}" var="tickeingVO" varStatus="status">
				                        				<tr onclick="location.href='/management/customer/airlineReserveDetail?tkNo=${tickeingVO.tkNo}';" style="cursor: pointer;">                                            
				                                            <td><p class="mb-0 fw-normal fs-4">${fn:toUpperCase(tickeingVO.tkGroup)}</p></td>
															<td><p class="mb-0 fw-normal fs-4">${tickeingVO.tkKrname}</p></td>
															<td><p class="mb-0 fw-normal fs-4"> <fmt:formatNumber value="${tickeingVO.tkPrice}" pattern="#,###"   /></p></td> 
															<td><p class="mb-0 fw-normal fs-4">${fn:split(tickeingVO.tkDepartdate," ")[0] }</p></td> 
															<td><p class="mb-0 fw-normal fs-4">${fn:split(tickeingVO.tkArridate," ")[0] }</p></td> 
															<td><p class="mb-0 fw-normal fs-4">${fn:split(tickeingVO.tkDate," ")[0] }</p></td> 
															<td>
				                                                <c:choose>
				                                                    <c:when test="${tickeingVO.tkDel eq 'N'}">
				                                                        <span class="badge bg-primary-subtle text-primary btn2" style="margin-left:10px" >예약완료</span>
				                                                    </c:when>
				                                                    <c:otherwise>
				                                                        <span class="badge bg-warning-subtle text-warning" style="margin-left:10px">예약취소</span>
				                                                    </c:otherwise>
				                                                </c:choose>
				                                            </td>
				                                        </tr>
				                                </c:forEach>
				                            </c:otherwise>
				                        </c:choose>
				                    </tbody>
				                </table>
				                <div class="text-end mb-3">
				                    <c:if test="${not empty searchWord}">
				                        <a href="/management/customer/airlineReserveList" class="btn btn-outline-primary me-3">목록</a>
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
	        </div>
	    </div>
	</div>
  </div>
</div>
        
        
<script>
$(function(){
	
	$("#pagingArea").on("click", "a", function(e){
		e.preventDefault();
		console.log("여기");
		console.log(this);
		var pageNo = $(this).data("page");
		$("#searchForm").find("#page").val(pageNo);
		$("#searchForm").submit();
	});
	
	
	 // 라인 차트 생성
    var options = {
        chart: {
            type: 'line',
            height: 350
        },
        series: [
            {
                name: '저번 달',
//                 data: ${preReserNum}
            	data: [28, 29, 33, 36, 32, 32, 33, 28, 29, 33, 36, 32, 32, 33,28, 12, 11, 14, 18, 17, 13, 13,18, 29, 33, 36, 32, 32, 33, 30,40],
            },
            {
                name: '이번 달',
//                 data: ${thisReserNum}
                data: [33, 28, 29, 33, 36, 32, 35, 40,45,37,38, 33, 35, 32,36,38,36,35 ]

            }
        ],
        colors: ['#808080' , '#007BFF'], // 첫 번째 라인은 파란색, 두 번째 라인은 회색
        xaxis: {
            categories: ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10",
			       "11", "12", "13", "14", "15", "16", "17", "18", "19", "20",
			       "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31"
    			  ]
        },
        dataLabels: {
            enabled: true, // 데이터 레이블 활성화
            offsetY: -10, // 레이블의 Y축 오프셋 조정
            style: {
                fontSize: '12px',
                colors: ['#808080', '#007BFF'] // 첫 번째는 파란색, 두 번째는 회색으로 설정
            }
        }
    };

    var chart = new ApexCharts(document.querySelector("#preThisRes"), options);
    chart.render();

    // 바 차트 생성
    var optionsBar = {
        chart: {
            type: 'bar',
            height: 350
        },
        series: [{
            name: 'Sales',
            data: [30, 40, 35, 50, 49, 60, 70, 60, 75, 70, 15]
        }],
        xaxis: {
            categories: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월']
        },
        
        colors: ['#007BFF'], // 바 색상 설정
        dataLabels: {
            enabled: true // 데이터 레이블 활성화
        },
        plotOptions: {
            bar: {
                borderRadius: 5 // 바의 모서리 라운드 설정
            }
        }
    };

    var chartBar = new ApexCharts(document.querySelector("#income"), optionsBar);
    chartBar.render();

 // Simple Pie Chart 데이터 및 설정
    var options = {
        chart: {
            type: 'pie',
            height: 350
        },
        series: [13, 20, 48, 9, 10], // 데이터 시리즈
        labels: ['미국', '프랑스', '일본', '이탈리아', '영국'], // 레이블
//         series: [ "${countryList[0].icCount}", "${countryList[1].icCount}","${countryList[2].icCount}","${countryList[3].icCount}","${countryList[4].icCount}"],
//         labels: [ "${countryList[0].icCountry}", "${countryList[1].icCountry}","${countryList[2].icCountry}","${countryList[3].icCountry}","${countryList[4].icCountry}"],
        title: {
//             text: '방문 많은 여행지'
        },
        colors: ['#007BFF', '#00A3E0', '#87CEEB', '#B0E0E6', '#E0FFFF'],
        legend: {
            position: 'bottom', // 범례를 아래로 설정
            horizontalAlign: 'center' // 범례를 가운데 정렬
        },
    };

    var chart = new ApexCharts(document.querySelector("#favoritCountry"), options);
    chart.render();

});

function selectFilter(value) {
	console.log("selectFilter->value : " + value);	
	
    document.getElementById('selectedItem').value = value; // 전체 선택일 경우 값이 없게 설정
    document.getElementById('filterForm').submit();
}


</script>