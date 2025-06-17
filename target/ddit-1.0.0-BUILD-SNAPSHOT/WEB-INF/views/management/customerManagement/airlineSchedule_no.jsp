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
                 <h4 class="fw-semibold mb-8">항공편 예약 관리</h4>
                 <nav aria-label="breadcrumb">
                   <ol class="breadcrumb">
                     <li class="breadcrumb-item">
                       <a class="text-muted text-decoration-none" href="/common/home">DashBoard</a>
                     </li>
                     <li class="breadcrumb-item" aria-current="page">항공권 예약 관리</li>
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
        
        <!-- Start Line Chart With Data Label -->
           <div class="card">
            <div class="card-body">
              <h4 class="card-title">전/이번달 예약자 수</h4>
              <div id="preThisMonth" class="mx-n3"></div>
            </div>
          </div>
         <!-- End Line Chart With Data Label -->
          
          <!-- Start Simple Pie Chart -->
          <div class="row align-items-stretch">
            <div class="col-lg-6">
              <div class="card">
                <div class="card-body">
                  <h4 class="card-title">국가별 이용객 수</h4>
                  <div id="favoritCountry"></div>
                </div>
              </div>
            </div>
          <!-- End Simple Pie Chart -->
        
        
        
        
        
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
			                        <h4 class="card-title fs-5">${totalCount}</h4>
			                        <p class="card-subtitle text-info">전체 예약</p>
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
			                    <h4 class="card-title fs-5">${todayCount}</h4>
			                    <p class="card-subtitle text-info">오늘 예약</p>
			                </div>
			                <div class="ms-auto">
			                    <span class="text-primary display-6">
			                            <i class="ti ti-users"></i>
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
			                    <h4 class="card-title fs-5">${newCount}</h4>
			                    <p class="card-subtitle text-danger">새로운 예약</p>
			                </div>
			                <div class="ms-auto">
			                    <span class="text-danger display-6">
			                            <i class="ti ti-users"></i>
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
    									<fmt:formatNumber value="${cancelCount}"/></h4>
			                        <p class="card-subtitle text-gray">취소된 예약</p> 
			                    </div>
			                    <div class="ms-auto">
			                        <span class="text-gray display-6">
			                            <i class="ti ti-users"></i>
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
                        <form id="filter-form" action="/management/reserve/airlineSchedule" method="get">
                            <select class="form-select form-control" id="status-select" name="selectedItem" onchange="document.getElementById('filter-form').submit();" style="width:120px; visibility: hidden;">
                                <option value="">상태 선택</option>
                                <option value="Y" ${selectedItem == 'Y' ? 'selected' : ''}>예약완료</option>
                                <option value="N" ${selectedItem == 'N' ? 'selected' : ''}>예약취소</option>
                            </select>
                        </form>
                    </div>
               <div class="col-md-9 d-flex justify-content-end align-items-center" >
                   <form action="/management/reserve/airlineSchedule" method="get" class="position-relative me-2" id="search-form">
                       <input type="text" class="form-control product-search ps-5 pe-5" id="input-search" name="searchWord" placeholder="예약번호 또는 예약자명" value="${searchWord}" style="width:280px;" />
                       <i class="ti ti-search position-absolute top-50 start-0 translate-middle-y fs-6 text-dark ms-3"></i>
                   </form>
                   <button type="button" class="btn btn-primary" onclick="document.getElementById('search-form').submit();">검색</button>
               </div>
                </div>
                <!-- 셀렉트 및 검색창 끝 -->
         <form action="/management/reserve/excelRoungeDown" method="post" id="excelDownForm">
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
                    </colgroup>
                    <thead class="text-dark fs-4">
                        <tr>
                            <th><h6 class="fs-4 fw-semibold mb-0">예약번호</h6></th>
                            <th><h6 class="fs-4 fw-semibold mb-0">예약자명</h6></th>
                            <th><h6 class="fs-4 fw-semibold mb-0">결제금액</h6></th>
                            <th><h6 class="fs-4 fw-semibold mb-0">출잘날짜</h6></th>
                            <th><h6 class="fs-4 fw-semibold mb-0">도착날짜</h6></th>
                            <th><h6 class="fs-4 fw-semibold mb-0">결제일시</h6></th>
                            <th><h6 class="fs-4 fw-semibold mb-0">상태</h6></th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:choose>
                            <c:when test="${empty pagingVO.dataList}">
                                <tr>
                                    <td colspan="7">라운지 예약 내역이 존재하지 않습니다.</td>
                                </tr>
                            </c:when>
                            <c:otherwise>
                                <c:forEach items="${pagingVO.dataList}" var="tickeingVO" varStatus="status">
<%--                                     <c:if test="${rr.rrStatus == selectedItem or empty selectedItem}"> --%>
                                        <tr>
                                            <td><p class="mb-0 fw-normal fs-4">${tickeingVO.tkNo}</p></td>
											<td><p class="mb-0 fw-normal fs-4">${tickeingVO.cusName}</p></td>
											<td><p class="mb-0 fw-normal fs-4">${tickeingVO.tkPrice}</p></td> 
											<td><p class="mb-0 fw-normal fs-4">${fn:split(tickeingVO.tkDepartdate," ")[0] }</p></td> 
											<td><p class="mb-0 fw-normal fs-4">${fn:split(tickeingVO.tkArridate," ")[0] }</p></td> 
											<td><p class="mb-0 fw-normal fs-4">${fn:split(tickeingVO.tkDate," ")[0] }</p></td> 
											<td><p class="mb-0 fw-normal fs-4">${tickeingVO.tkDel eq 'N' ? '예약완료':'예약취소'}</p></td> 
<%-- 											<td><p class="mb-0 fw-normal fs-4"> <fmt:formatNumber value="${rr.rrCost}" type="number" pattern="#,##0" /></p></td>  --%>
<%-- 											<td><p class="mb-0 fw-normal fs-4"><fmt:formatDate value="${rr.rrDate}" pattern="yyyy-MM-dd" /></p></td> --%>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${rr.rrStatus == 'N'}">
                                                        <span class="badge bg-warning-subtle text-warning" style="margin-left:10px">예약취소</span>
                                                    </c:when>
                                                    <c:when test="${rr.rrStatus == 'Y'}">
                                                        <span class="badge bg-primary-subtle text-primary btn2" style="margin-left:10px" data-action="approve" data-rrno="${rr.rrNo }">예약완료</span>
                                                    </c:when>
                                                </c:choose>
                                            </td>
                                        </tr>
<%--                                     </c:if> --%>
                                </c:forEach>
                            </c:otherwise>
                        </c:choose>
                    </tbody>
                </table>
            </div>
<!--            <input type="submit" class="btn btn-primary" value="엑셀 다운로드" id="excelDownBtn" /> -->
          </form>

                <div class="text-end mb-3">
                    <c:if test="${not empty searchWord}">
                        <a href="/management/reserve/airlineSchedule" class="btn btn-outline-primary me-3">목록</a>
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
				<form method="post" action="/management/reserve/roungeStatus" id="roungeStatus">
            </form>
            </div>
        </div>
    </div>
</div>

<script>
$(function(){
	// 전/이번달 예약자 수(선 그래프)
	var options = {
		    series: [
		      {
		        name: "previous month",
		        data: ${preReserNum}
		      },
		      {
		        name: "this month",
		        data: ${thisReserNum}
		      },
		    ],
		    chart: {
		      fontFamily: "inherit",
		      height: 350,
		      type: "line",
		      dropShadow: {
		        enabled: true,
		        color: "#000",
		        top: 18,
		        left: 7,
		        blur: 10,
		        opacity: 0.2,
		      },
		      toolbar: {
		        show: false,
		      },
		    },
		    colors: ["var(--bs-primary)", "var(--bs-secondary)"],
		    dataLabels: {
		      enabled: true,
		    },
		    stroke: {
		      curve: "smooth",
		    },
		    grid: {
		      borderColor: "transparent",
		      row: {
		        colors: ["transparent"], // takes an array which will be repeated on columns
		        opacity: 0.5,
		      },
		    },
		    markers: {
		      size: 1,
		    },
		    xaxis: {
		      categories: ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10",
					       "11", "12", "13", "14", "15", "16", "17", "18", "19", "20",
					       "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31"
		    	  ],
		      labels: {
		        style: {
		          colors: [
		            "#a1aab2",
		            "#a1aab2",
		            "#a1aab2",
		            "#a1aab2",
		            "#a1aab2",
		            "#a1aab2",
		            "#a1aab2",
		            "#a1aab2"
		          ],
		        },
		      },
		    },
		    yaxis: {
		      min: 5,
		      max: 40,
		      labels: {
		        style: {
		          colors: [
		            "#a1aab2",
		            "#a1aab2",
		            "#a1aab2",
		            "#a1aab2",
		            "#a1aab2",
		            "#a1aab2",
		            "#a1aab2",
		            "#a1aab2",
		            "#a1aab2",
		            "#a1aab2",
		            "#a1aab2",
		            "#a1aab2",
		          ],
		        },
		      },
		    },
		    tooltip: {
		      theme: "dark",
		    },
		    legend: {
		      position: "top",
		      horizontalAlign: "right",
		      floating: true,
		      offsetY: -25,
		      offsetX: -5,
		    },
		  };


	  var chart_line_data = new ApexCharts(
			    document.querySelector("#preThisMonth"),
			    options
			  );
	  chart_line_data.render();
	  
	  
	  // 국가별 원 그래프
	  var options_simple = {
			    series: [44, 55, 13, 43],
			    chart: {
			      fontFamily: "inherit",
			      width: 380,
			      type: "pie",
			    },
			    colors: [
			      "var(--bs-primary)",
			      "var(--bs-secondary)",
			      "#ffae1f",
			      "#fa896b",
			    ],
			    labels: ["미국", "프랑스", "일본", "이탈리아"],
			    responsive: [
			      {
			        breakpoint: 480,
			        options: {
			          chart: {
			            width: 200,
			          },
			          legend: {
			            position: "bottom",
			          },
			        },
			      },
			    ],
			    legend: {
			      labels: {
			        colors: ["#a1aab2"],
			      },
			    },
			  };
	  
	  var chart_pie_simple = new ApexCharts(
			    document.querySelector("#favoritCountry"),
			    options_simple
			  );
			  chart_pie_simple.render();
	
	
	
})






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
    	var rrN = $(this).data('rrno');
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
            	var rrHtml = "<input type='text' name='rrNo' value='" + rrN + "' />";
            	$('#roungeStatus').append(rrHtml);
            	$('#roungeStatus').submit();
 
            }
        });
    });
</script>
