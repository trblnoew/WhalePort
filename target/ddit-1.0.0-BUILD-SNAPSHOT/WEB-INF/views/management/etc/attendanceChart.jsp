<%@page import="kr.or.ddit.management.human.etc.vo.EtcManagementVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<head>
  <!-- Required meta tags -->
  <meta charset="UTF-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />

  <!-- Favicon icon-->
  <link rel="shortcut icon" type="image/png" href="${pageContext.request.contextPath }/resources/assets/images/logos/favicon.png" />

  <!-- Core Css -->
  <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/css/styles.css" />

</head>

<%
    List<EtcManagementVO> totalInfoWorkHours = (List<EtcManagementVO>) request.getAttribute("totalInfoWorkHours");
%>


<div class="body-wrapper">
        <div class="container-fluid">
        <div class="container-fluid">
          <div class="card bg-info-subtle shadow-none position-relative overflow-hidden mb-4">
            <div class="card-body px-4 py-3">
              <div class="row align-items-center">
                <div class="col-9">
                  <h4 class="fw-semibold mb-8">근태 현황</h4>
                  <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                      <li class="breadcrumb-item">
                        <a class="text-muted text-decoration-none" href="../main/index.html">DashBoard</a>
                      </li>
<!--                       <li class="breadcrumb-item" aria-current="page">부서별 근태 현황 조회</li> -->
                      <li class="breadcrumb-item" aria-current="page">근태 현황</li>
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
        
        
            <%-- <div class="col-lg-8 d-flex align-items-stretch">
              <div class="card w-100 bg-primary-subtle overflow-hidden shadow-none">
                <div class="card-body position-relative">
                  <div class="row">
                    <div class="col-sm-7">
                      <div class="d-flex align-items-center mb-7">
                        <div class="rounded-circle overflow-hidden me-6">
                          <img src="${pageContext.request.contextPath }/resources/assets/images/profile/user-1.jpg" alt="modernize-img" width="40" height="40">
                        </div>
                        <h5 class="fw-semibold mb-0 fs-5">Welcome back Mathew Anderson!</h5>
                      </div>
                      <div class="d-flex align-items-center">
                        <div class="border-end pe-4 border-muted border-opacity-10">
                          <h3 class="mb-1 fw-semibold fs-8 d-flex align-content-center">$2,340<i class="ti ti-arrow-up-right fs-5 lh-base text-success"></i>
                          </h3>
                          <p class="mb-0 text-dark">Today’s Sales</p>
                        </div>
                        <div class="ps-4">
                          <h3 class="mb-1 fw-semibold fs-8 d-flex align-content-center">35%<i class="ti ti-arrow-up-right fs-5 lh-base text-success"></i>
                          </h3>
                          <p class="mb-0 text-dark">Overall Performance</p>
                        </div>
                      </div>
                    </div>
                    <div class="col-sm-5">
                      <div class="welcome-bg-img mb-n7 text-end">
                        <img src="${pageContext.request.contextPath }/resources/assets/images/logos/symbol-01.png" alt="modernize-img" class="img-fluid" style="width: 120px; height: auto;">
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div> --%>
              
              
      <!-- 라인그래프 시작 -->
       <div class="card">
                <div class="card-body">
                  <div class="row pb-4">
                    <div class="col-lg-4 d-flex align-items-stretch">
                      <div class="d-flex flex-column align-items-start w-100">
                        <div class="text-start">
                          <h3 class="ttt fw-semibold">근무시간 통계</h3>
                          <span>2024/01 - 2024/11</span>
                        </div>
                        <div class="mt-lg-auto mt-4 mb-4">
                          <span class="text-dark">월 평균 총 근무시간 <span class="text-success">+ 8h</span>
                          </span>
                          <h2 class="mt-2 fw-bold">151 시간</h2>
                          <span>지난 달 기준</span>
                        </div>
                      </div>
                    </div>
                    <div class="col-lg-8 d-flex align-items-stretch">
                      <div class="w-100">
                        <div class="d-md-flex align-items-start gap-3">
                          <div>
                            <div class="d-flex align-items-center gap-3">
                              <h3 class="mt-2 fw-bold">부서별 월별 근무시간</h3>
                              <span class="badge text-bg-primary  px-2 py-1 d-flex align-items-center">
                                <i class="ti ti-chevron-down fs-4"></i>평균 근무시간의 증감율
                              </span>
                            </div>
                          </div>
                          <div class="ms-auto">
                            <select class="form-select">
                              <option value="1">2024 / 10</option>
                              <option value="2">2024 / 9</option>
                              <option value="3">2024 / 8</option>
                              <option value="4">2024 / 7</option>
                            </select>
                          </div>
                        </div>
                        <div class="mt-4">
                          <div id="totalWorkingHours" class="mx-n8"></div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="border-top">
                  <div class="row gx-0">
                    <div class="col-md-3 border-end">
                      <div class="p-4 py-3 py-md-4">
                        <p class="fs-4 text-danger mb-0">
                          <span class="humanTotalWorking">
                            <span class="round-8 rounded-circle d-inline-block me-1" style="background-color: #4c44cf;"></span>
                          </span><span style="color: #4c44cf;">인사부서</span>
                        </p>
                       <%--  <c:set var="ValueOne" value="${totalInfoWorkHours[0].totalInfoWorkHours}" />
					<c:set var="ValueTwo1" value="${totalInfoWorkHours[1].totalInfoWorkHours}" />
					<c:set var="ValueTwo2" value="${totalInfoWorkHours[2].totalInfoWorkHours}" />
					<c:set var="ValueTwo3" value="${totalInfoWorkHours[3].totalInfoWorkHours}" />
					<c:set var="ValueTwo4" value="${totalInfoWorkHours[4].totalInfoWorkHours}" />
					<c:set var="ValueTwo5" value="${totalInfoWorkHours[5].totalInfoWorkHours}" />
					<c:set var="ValueTwo6" value="${totalInfoWorkHours[6].totalInfoWorkHours}" />
					<c:set var="ValueTwo7" value="${totalInfoWorkHours[7].totalInfoWorkHours}" />
					<c:set var="ValueTwo8" value="${totalInfoWorkHours[8].totalInfoWorkHours}" />
					<c:set var="ValueTwo9" value="${totalInfoWorkHours[9].totalInfoWorkHours}" />
					<c:set var="ValueTwo10" value="${totalInfoWorkHours[10].totalInfoWorkHours}" />
					<c:set var="sum" value="${ValueOne + ValueTwo1 +ValueTwo2+ValueTwo3+ValueTwo4+ValueTwo5+
					ValueTwo6+ValueTwo7+ValueTwo8+ValueTwo10}" /> --%>
                        <%-- <h3 class=" mt-2 mb-0"><c:out value="${sum}" /> 시간</h3> --%>
                        <h3 class=" mt-2 mb-0">144 시간</h3>
                      </div>
                    </div>
                    <div class="col-md-3 border-end">
                      <div class="p-4 py-3 py-md-4">
                        <p class="fs-4 text-primary mb-0">
                          <span class="infoTotalWorking">
                            <span class="round-8 rounded-circle d-inline-block me-1" style="background-color: #e953da;"></span>
                          </span><span style="color: #e953da;">전산부서</span>
                        </p>
                        <h3 class=" mt-2 mb-0">150 시간</h3>
                      </div>
                    </div>
                    <div class="col-md-3 border-end">
                      <div class="p-4 py-3 py-md-4">
                        <p class="fs-4 text-info mb-0">
                          <span class="partnerTotalWorking">
                            <span class="round-8 rounded-circle d-inline-block me-1" style="background-color: #01d3fc;"></span>
                          </span><span style="color: #01d3fc;">협력업체관리 부서</span>
                        </p>
                        <h3 class=" mt-2 mb-0">146 시간</h3>
                      </div>
                    </div>
                    <div class="col-md-3">
                      <div class="p-4 py-3 py-md-4">
                        <p class="fs-4 text-info mb-0">
                          <span class="serviceTotalWorking">
                            <span class="round-8 rounded-circle d-inline-block me-1" style="background-color: #FC8B2A;"></span>
                          </span><span style="color: #FC8B2A;">공항서비스관리 부서</span>
                        </p>
                        <h3 class=" mt-2 mb-0">163 시간</h3>
                      </div>
                    </div>
                  </div>
                </div>
              </div>     
      <!-- 라인그래프 끝 -->        
              
    <div class="row">
    <!-- 인사부서 출결관리 파이그래프 시작 -->
    <div class="col-3">
        <div class="card">
            <div class="card-body">
                <h4 class="card-title fw-semibold"><span class="round-8 rounded-circle d-inline-block me-1" style="background-color: #4c44cf;"></span>인사부서 출결현황</h4>
                <p class="card-subtitle mb-2">This Month</p>
                <div id="human" class="mb-4"></div>
                <div class="d-flex align-items-center justify-content-between">
                    <div class="d-flex align-items-center">
                        <div class="bg-primary-subtle text-primary rounded-2 me-8 p-8 d-flex align-items-center justify-content-center">
                            <i class="ti ti-grid-dots fs-6"></i>
                        </div>
                        <div>
                            <h6 class="fw-semibold text-dark fs-4 mb-0">10 %</h6>
                            <p class="fs-3 mb-0 fw-normal">지각</p>
                        </div>
                    </div>
                    <div class="d-flex align-items-center">
                        <div class="bg-secondary-subtle text-secondary rounded-2 me-8 p-8 d-flex align-items-center justify-content-center">
                            <i class="ti ti-grid-dots fs-6"></i>
                        </div>
                        <div>
                            <h6 class="fw-semibold text-dark fs-4 mb-0">5 %</h6>
                            <p class="fs-3 mb-0 fw-normal">결근</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- 인사부서 출결관리 파이그래프 끝 -->

    <!-- 전산부서 출결관리 파이그래프 시작 -->
    <div class="col-3">
        <div class="card">
            <div class="card-body">
                <h4 class="card-title fw-semibold"><span class="round-8 rounded-circle d-inline-block me-1" style="background-color: #e953da;"></span>전산부서 출결현황</h4>
                <p class="card-subtitle mb-2">This Month</p>
                <div id="info" class="mb-4"></div>
                <div class="d-flex align-items-center justify-content-between">
                    <div class="d-flex align-items-center">
                        <div class="bg-primary-subtle text-primary rounded-2 me-8 p-8 d-flex align-items-center justify-content-center">
                            <i class="ti ti-grid-dots fs-6"></i>
                        </div>
                         <div>
                            <h6 class="fw-semibold text-dark fs-4 mb-0">8 %</h6>
                            <p class="fs-3 mb-0 fw-normal">지각</p>
                        </div>
                    </div>
                    <div class="d-flex align-items-center">
                        <div class="bg-secondary-subtle text-secondary rounded-2 me-8 p-8 d-flex align-items-center justify-content-center">
                            <i class="ti ti-grid-dots fs-6"></i>
                        </div>
                        <div>
                            <h6 class="fw-semibold text-dark fs-4 mb-0">2 %</h6>
                            <p class="fs-3 mb-0 fw-normal">결근</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- 전산부서 출결관리 파이그래프 끝 -->

    <!-- 협력업체 부서 출결관리 파이그래프 시작 -->
    <div class="col-3">
        <div class="card">
            <div class="card-body">
                <h4 class="card-title fw-semibold"><span class="round-8 rounded-circle d-inline-block me-1" style="background-color: #01d3fc;"></span>협력업체 부서 출결현황</h4>
                <p class="card-subtitle mb-2">This Month</p>
                <div id="partner" class="mb-4"></div>
                <div class="d-flex align-items-center justify-content-between">
                    <div class="d-flex align-items-center">
                        <div class="bg-primary-subtle text-primary rounded-2 me-8 p-8 d-flex align-items-center justify-content-center">
                            <i class="ti ti-grid-dots fs-6"></i>
                        </div>
                         <div>
                            <h6 class="fw-semibold text-dark fs-4 mb-0">2 %</h6>
                            <p class="fs-3 mb-0 fw-normal">지각</p>
                        </div>
                    </div>
                    <div class="d-flex align-items-center">
                        <div class="bg-secondary-subtle text-secondary rounded-2 me-8 p-8 d-flex align-items-center justify-content-center">
                            <i class="ti ti-grid-dots fs-6"></i>
                        </div>
                        <div>
                            <h6 class="fw-semibold text-dark fs-4 mb-0">4 %</h6>
                            <p class="fs-3 mb-0 fw-normal">결근</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- 협력업체 부서 출결관리 파이그래프 끝 -->

    <!-- 서비스관리 부서 출결관리 파이그래프 시작 -->
    <div class="col-3">
        <div class="card">
            <div class="card-body">
                <h4 class="card-title fw-semibold"><span class="round-8 rounded-circle d-inline-block me-1" style="background-color: #FC8B2A;"></span>공항서비스관리 부서 출결현황</h4>
                <p class="card-subtitle mb-2">This Month</p>
                <div id="service" class="mb-4"></div>
                <div class="d-flex align-items-center justify-content-between">
                    <div class="d-flex align-items-center">
                        <div class="bg-primary-subtle text-primary rounded-2 me-8 p-8 d-flex align-items-center justify-content-center">
                            <i class="ti ti-grid-dots fs-6"></i>
                        </div>
                        <div>
                            <h6 class="fw-semibold text-dark fs-4 mb-0">2 %</h6>
                            <p class="fs-3 mb-0 fw-normal">지각</p>
                        </div>
                    </div>
                    <div class="d-flex align-items-center">
                        <div class="bg-secondary-subtle text-secondary rounded-2 me-8 p-8 d-flex align-items-center justify-content-center">
                            <i class="ti ti-grid-dots fs-6"></i>
                        </div>
                        <div>
                            <h6 class="fw-semibold text-dark fs-4 mb-0">3 %</h6>
                            <p class="fs-3 mb-0 fw-normal">결근</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- 서비스관리 부서 출결관리 파이그래프 끝 -->
</div>

   
            <!-- <div class="col-md-6 col-lg-4 d-flex align-items-stretch">
              
            </div> -->
            
            <!-- 막대 그래프 -->
            <!-- <div class="col-md-6 col-lg-4 d-flex align-items-stretch">
              <div class="card w-100">
                <div class="card-body">
                  <div>
                    <h4 class="card-title fw-semibold">Yearly Sales</h4>
                    <p class="card-subtitle">Every month</p>
                    <div id="salary" class="mb-7 pb-8 mx-n4"></div>
                    <div class="d-flex align-items-center justify-content-between">
                      <div class="d-flex align-items-center">
                        <div class="bg-primary-subtle text-primary rounded-2 me-8 p-8 d-flex align-items-center justify-content-center">
                          <i class="ti ti-grid-dots fs-6"></i>
                        </div>
                        <div>
                          <p class="fs-3 mb-0 fw-normal">Total Sales</p>
                          <h6 class="fw-semibold text-dark fs-4 mb-0">$36,358</h6>
                        </div>
                      </div>
                      <div class="d-flex align-items-center">
                        <div class="bg-light-subtle text-muted rounded-2 me-8 p-8 d-flex align-items-center justify-content-center">
                          <i class="ti ti-grid-dots fs-6"></i>
                        </div>
                        <div>
                          <p class="fs-3 mb-0 fw-normal">Expenses</p>
                          <h6 class="fw-semibold text-dark fs-4 mb-0">$5,296</h6>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div> -->
            <!-- 막대그래프 끝 -->
            
            
            
            <div class="col-md-6 col-lg-4 d-flex align-items-stretch">
              
            </div>
            
        </div>
      </div>
      </div>
   
   <script src="../assets/js/vendor.min.js"></script>
   
   <script src="../assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
  <script src="../assets/libs/simplebar/dist/simplebar.min.js"></script>
  <script src="../assets/js/theme/app.init.js"></script>
  <script src="../assets/js/theme/theme.js"></script>
  <script src="../assets/js/theme/app.min.js"></script>
  <script src="../assets/js/theme/sidebarmenu.js"></script>
  <!-- solar icons -->
  <script src="https://cdn.jsdelivr.net/npm/iconify-icon@1.0.8/dist/iconify-icon.min.js"></script>
  <script src="${pageContext.request.contextPath }/resources/assets/libs/apexcharts/dist/apexcharts.min.js"></script>
  <script src="${pageContext.request.contextPath }/resources/assets/js/dashboards/dashboard2.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/iconify-icon@1.0.8/dist/iconify-icon.min.js"></script>
  <script src="../assets/libs/apexcharts/dist/apexcharts.min.js"></script>
  <script src="../assets/js/dashboards/dashboard5.js"></script>
  
<script type="text/javascript">
$(function(){
	
	// 라인 그래프 (부서별 월별 평균 근무시간)
		// 인사부서의 데이터만 받는 경우
	  /*   var chart = {
	        series: [
	            {
	                name: "인사",
	                data: [
	                	${totalInfoWorkHours[0].totalInfoWorkHours},
	                	${totalInfoWorkHours[1].totalInfoWorkHours},
	                	${totalInfoWorkHours[2].totalInfoWorkHours},
	                	${totalInfoWorkHours[3].totalInfoWorkHours},
	                	${totalInfoWorkHours[4].totalInfoWorkHours},
	                	${totalInfoWorkHours[5].totalInfoWorkHours},
	                	${totalInfoWorkHours[6].totalInfoWorkHours},
	                	${totalInfoWorkHours[7].totalInfoWorkHours},
	                	${totalInfoWorkHours[8].totalInfoWorkHours},
	                	${totalInfoWorkHours[9].totalInfoWorkHours},
	                	${totalInfoWorkHours[10].totalInfoWorkHours}
	                	],
	            },
	            {
	                name: "전산",
	                data: [50, 100, 65, 140, 32, 60, 80, 100, 70, 120, 90],
	            },
	            {
	                name: "협력업체관리",
	                data: [100, 50, 130, 70, 135, 80, 70, 100, 80, 75, 95],
	            },
	            {
	                name: "공항서비스관리",
	                data: [90, 60, 80, 110, 120, 100, 80, 115, 120, 96, 72],
	            },
	        ],
	        chart: {
	            toolbar: {
	                show: false,
	            },
	            type: "line",
	            fontFamily: "inherit",
	            foreColor: "#adb0bb",
	            height: 200,
	        },
	        colors: ["#4C44CF", "#e953da", "#01d3fc", "#FC8B2A"],
	        dataLabels: {
	            enabled: false,
	        },
	        legend: {
	            show: false,
	        },
	        stroke: {
	            curve: "smooth",
	            width: 3,
	        },
	        grid: {
	            borderColor: "rgba(0,0,0,0.1)",
	            strokeDashArray: 3,
	            xaxis: {
	                lines: {
	                    show: false,
	                },
	            },
	            padding: {
	                top: 0,
	                right: 0,
	                bottom: 0,
	                left: 0,
	            },
	        },
	        xaxis: {
	            categories: [
	                "1월",
	                "2월",
	                "3월",
	                "4월",
	                "5월",
	                "6월",
	                "7월",
	                "8월",
	                "9월",
	                "10월",
	                "11월",
	            ],
	        },
	        yaxis: {
	            tickAmount: 4,
	        },
	        tooltip: {
	            theme: "dark",
	        },
	    };

	    var chart = new ApexCharts(document.querySelector("#totalWorkingHours"), chart);
	    chart.render();
	     */
	    
	    // 하드코딩
	    var chart = {
	        series: [
	            {
	                name: "인사",
	                data: [144, 135, 151, 141, 148, 160, 156, 140, 137, 142, 132],
	            },
	            {
	                name: "전산",
	                data: [147, 149, 159, 162, 144, 139, 152, 164, 140, 143, 153],
	            },
	            {
	                name: "협력업체관리",
	                data: [152, 144, 130, 148, 137, 155, 162, 166, 145, 135, 133],
	            },
	            {
	                name: "공항서비스관리",
	                data: [167, 159, 164, 145, 163, 174, 154, 148, 166, 173, 182],
	            },
	        ],
	        chart: {
	            toolbar: {
	                show: false,
	            },
	            type: "line",
	            fontFamily: "inherit",
	            foreColor: "#adb0bb",
	            height: 200,
	        },
	        colors: ["#4C44CF", "#e953da", "#01d3fc", "#FC8B2A"],
	        dataLabels: {
	            enabled: false,
	        },
	        legend: {
	            show: false,
	        },
	        stroke: {
	            curve: "smooth",
	            width: 3,
	        },
	        grid: {
	            borderColor: "rgba(0,0,0,0.1)",
	            strokeDashArray: 3,
	            xaxis: {
	                lines: {
	                    show: false,
	                },
	            },
	            padding: {
	                top: 0,
	                right: 0,
	                bottom: 0,
	                left: 0,
	            },
	        },
	        xaxis: {
	            categories: [
	                "1월",
	                "2월",
	                "3월",
	                "4월",
	                "5월",
	                "6월",
	                "7월",
	                "8월",
	                "9월",
	                "10월",
	                "11월",
	            ],
	        },
	        yaxis: {
	            tickAmount: 4,
	        },
	        tooltip: {
	            theme: "dark",
	        },
	    };

	    var chart = new ApexCharts(document.querySelector("#totalWorkingHours"), chart);
	    chart.render();
	
	
	
// 인사부서의 출결관리
var options = {
	    color: "#adb5bd",
	    series: [70, 10, 5, 15],
	    labels: ["정상출근", "지각", "결근", "조기퇴근"],
	    chart: {
	      type: "donut",
	      fontFamily: "inherit",
	      foreColor: "#adb0bb",
	    },
	    plotOptions: {
	      pie: {
	        donut: {
	          size: "89%",
	          background: "transparent",
	          labels: {
	            show: true,
	            name: {
	              show: true,
	              offsetY: 7,
	            },
	            value: {
	              show: false,
	            },
	            total: {
	              show: true,
	              color: "#5A6A85",
	              fontSize: "20px",
	              fontWeight: "600",
	              label: "정상출근 70%",
	            },
	          },
	        },
	      },
	    },

	    dataLabels: {
	      enabled: false,
	    },
	    stroke: {
	      show: false,
	    },
	    legend: {
	      show: false,
	    },
	    colors: ["var(--bs-primary)", "var(--bs-warning)", "#EAEFF4", "var(--bs-secondary)"],

	    tooltip: {
	      theme: "dark",
	      fillSeriesColor: false,
	    },
	  };


var chart = new ApexCharts(
	    document.querySelector("#human"),
	    options
	  );
	  chart.render();
	  
	  
	  
// 전산부서의 출결관리
var options = {
	    color: "#adb5bd",
	    series: [82, 8, 2, 8],
	    labels: ["정상출근", "지각", "결근", "조기퇴근"],
	    chart: {
	      type: "donut",
	      fontFamily: "inherit",
	      foreColor: "#adb0bb",
	    },
	    plotOptions: {
	      pie: {
	        donut: {
	          size: "89%",
	          background: "transparent",
	          labels: {
	            show: true,
	            name: {
	              show: true,
	              offsetY: 7,
	            },
	            value: {
	              show: false,
	            },
	            total: {
	              show: true,
	              color: "#5A6A85",
	              fontSize: "20px",
	              fontWeight: "600",
	              label: "정상출근 82%",
	            },
	          },
	        },
	      },
	    },

	    dataLabels: {
	      enabled: false,
	    },
	    stroke: {
	      show: false,
	    },
	    legend: {
	      show: false,
	    },
	    colors: ["var(--bs-primary)", "var(--bs-warning)", "#EAEFF4", "var(--bs-secondary)"],

	    tooltip: {
	      theme: "dark",
	      fillSeriesColor: false,
	    },
	  };


var chart = new ApexCharts(
	    document.querySelector("#info"),
	    options
	  );
	  chart.render();
	  
	  
	  
// 협력업체관리 부서의 출결관리
var options = {
	    color: "#adb5bd",
	    series: [76, 2, 4, 18],
	    labels: ["정상출근", "지각", "결근", "조기퇴근"],
	    chart: {
	      type: "donut",
	      fontFamily: "inherit",
	      foreColor: "#adb0bb",
	    },
	    plotOptions: {
	      pie: {
	        donut: {
	          size: "89%",
	          background: "transparent",
	          labels: {
	            show: true,
	            name: {
	              show: true,
	              offsetY: 7,
	            },
	            value: {
	              show: false,
	            },
	            total: {
	              show: true,
	              color: "#5A6A85",
	              fontSize: "20px",
	              fontWeight: "600",
	              label: "정상출근 76%",
	            },
	          },
	        },
	      },
	    },

	    dataLabels: {
	      enabled: false,
	    },
	    stroke: {
	      show: false,
	    },
	    legend: {
	      show: false,
	    },
	    colors: ["var(--bs-primary)", "var(--bs-warning)", "#EAEFF4", "var(--bs-secondary)"],

	    tooltip: {
	      theme: "dark",
	      fillSeriesColor: false,
	    },
	  };


var chart = new ApexCharts(
	    document.querySelector("#partner"),
	    options
	  );
	  chart.render();
	  
	  
// 공항서비스관리 부서의 출결관리
var options = {
	    color: "#adb5bd",
	    series: [89, 7, 3, 1],
	    labels: ["정상출근", "지각", "결근", "조기퇴근"],
	    chart: {
	      type: "donut",
	      fontFamily: "inherit",
	      foreColor: "#adb0bb",
	    },
	    plotOptions: {
	      pie: {
	        donut: {
	          size: "89%",
	          background: "transparent",
	          labels: {
	            show: true,
	            name: {
	              show: true,
	              offsetY: 7,
	            },
	            value: {
	              show: false,
	            },
	            total: {
	              show: true,
	              color: "#5A6A85",
	              fontSize: "20px",
	              fontWeight: "600",
	              label: "정상출근 89%",
	            },
	          },
	        },
	      },
	    },

	    dataLabels: {
	      enabled: false,
	    },
	    stroke: {
	      show: false,
	    },
	    legend: {
	      show: false,
	    },
	    colors: ["var(--bs-primary)", "var(--bs-warning)", "#EAEFF4", "var(--bs-secondary)"],

	    tooltip: {
	      theme: "dark",
	      fillSeriesColor: false,
	    },
	  };


var chart = new ApexCharts(
	    document.querySelector("#service"),
	    options
	  );
	  chart.render();
	  
	  
	  

});

</script> 