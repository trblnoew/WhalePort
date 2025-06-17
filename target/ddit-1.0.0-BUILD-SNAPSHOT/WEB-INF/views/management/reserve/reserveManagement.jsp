<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
	.card-body1 {
		height : 235px;
	}
</style>
<div class="body-wrapper">
	<div class="container-fluid">
		<div class="card bg-info-subtle shadow-none position-relative overflow-hidden mb-4">
			<div class="card-body px-4 py-3">
				<div class="row align-items-center" style="margin-top: 20px;">
					<div class="col-9">
						<h4 class="fw-semibold mb-8">시설 전체 현황</h4>
						<nav aria-label="breadcrumb">
							<ol class="breadcrumb">
								<li class="breadcrumb-item">
									<a class="text-muted text-decoration-none" href="/common/home">DashBoard</a>
								</li>
								<li class="breadcrumb-item" aria-current="page">시설 전체 현황</li>
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
				<h5 class="mb-0 text-white">전체 시설 현황</h5>
			</div>
			<div class="container-fluid">
				<!-- Bar Chart Start -->
				<div class="row justify-content-center" style="margin-top: 20px;">
					<div class="col-md-10">
						<div class="card">
							<div class="card-body">
								<h4 class="card-title">
									<strong>전체 시설 사용 인원 수</strong>
								</h4>
								<div id="chart-bar-stacked"></div>
								<p>단위 : 백 </p>
							</div>
						</div>
					</div>
				</div>
				<!-- Bar Chart End -->
			</div>
			<div class="row justify-content-center" style="margin-top: 20px;">
				<div class="col-md-7">
					<!-- 차트가 들어가는 열 -->
					<div class="card">
						<div class="card-body">
							<h4 class="card-title">2024년 시설별 매출과 총 매출</h4>
							<div id="chart-radial-multiple"></div>
						</div>
					</div>
					<!-- <div class="card"> -->
<!-- 						<div class="card-body"> -->
<!-- 							<h4 class="card-title"> -->
<!-- 								<strong>올해 총 매출</strong> -->
<!-- 							</h4> -->
<!-- 							<div id="chart-line-with-data-label" class="mx-n3"></div> -->
<!-- 						</div> -->
<!-- 					</div> -->
				</div>

				<div class="col-md-4">
					<!-- 카드가 들어가는 열 -->
					<div class="row g-4">
						<div class="col-6">
							<div class="card card-hover bg-info-subtle shadow-none"
								onclick="selectFilter('T')" class="filter-card">
								<div class="card-body1 p-5">
									<div class="d-flex align-items-center">
										<div
											class="round rounded text-bg-info d-flex align-items-center justify-content-center">
											<i class="ti ti-alarm" style="font-size: 2rem;"></i>
										</div>
										<h6 class="mb-0 ms-3">오늘<br>예약</h6>
										<div class="ms-auto text-info d-flex align-items-center">
											<i class="ti ti-trending-up text-info fs-6 me-1"></i> <span
												class="fs-2 fw-bold">전날 대비 + 3</span>
										</div>
									</div>
									<div
										class="d-flex align-items-center justify-content-between mt-4">
										<h3 class="mb-0 fw-semibold fs-7">${todayCount}<span
												class="fs-5 ms-2" style="color: gray;">30건</span>
										</h3>
										<span class="fw-bold">₩ 1,015.00</span>
									</div>
								</div>
							</div>
						</div>
						<div class="col-6">
							<div class="card card-hover bg-success-subtle shadow-none"
								onclick="selectFilter('new')" class="filter-card">
								<div class="card-body1 p-5">
									<div class="d-flex align-items-center">
										<div
											class="round rounded text-bg-success d-flex align-items-center justify-content-center">
											<i class="ti ti-brand-netflix" style="font-size: 2rem;"></i>
										</div>
										<h6 class="mb-0 ms-3">새로운 예약</h6>
										<div class="ms-auto text-success d-flex align-items-center">
											<i class="ti ti-trending-up text-success fs-6 me-1"></i> <span
												class="fs-2 fw-bold">전날 대비 + 12</span>
										</div>
									</div>
									<div
										class="d-flex align-items-center justify-content-between mt-4">
										<h3 class="mb-0 fw-semibold fs-7">${newCount}<span
												class="fs-5 ms-2" style="color: gray;">18건</span>
										</h3>
										<span class="fw-bold">₩ 2,110.00</span>
									</div>
								</div>
							</div>
						</div>

						<div class="col-6">
							<div class="card card-hover bg-danger-subtle shadow-none"
								onclick="selectFilter('N')" class="filter-card">
								<div class="card-body1 p-5">
									<div class="d-flex align-items-center">
										<div
											class="round rounded text-bg-danger d-flex align-items-center justify-content-center">
											<i class="ti ti-square-letter-x" style="font-size: 2rem;"></i>
										</div>
										<h6 class="mb-0 ms-3">취소된 예약</h6>
										<div class="ms-auto text-danger d-flex align-items-center">
											<i class="ti ti-trending-down text-danger fs-6 me-1"></i> <span
												class="fs-2 fw-bold text-danger">전달 대비 - 20</span>
										</div>
									</div>
									<div
										class="d-flex align-items-center justify-content-between mt-4">
										<h3 class="mb-0 fw-semibold fs-7">${cancelCount}<span
												class="fs-5 ms-2" style="color: gray;">15건</span>
										</h3>
										<span class="fw-bold">₩1,100.00</span>
									</div>
								</div>
							</div>
						</div>

						<div class="col-6">
							<div class="card card-hover bg-warning-subtle shadow-none"
								onclick="selectFilter('')" class="filter-card">
								<div class="card-body1 p-5">
									<div class="d-flex align-items-center">
										<div
											class="round rounded text-bg-warning d-flex align-items-center justify-content-center">
											<i class="ti ti-list" style="font-size: 2rem;"></i>
										</div>
										<h6 class="mb-0 ms-2">전체<br>예약</h6>
										<div class="ms-auto text-warning d-flex align-items-center">
											<i class="ti ti-trending-down text-warning fs-6 me-1"></i> <span
												class="fs-2 fw-bold text-warning">전달 대비<br>- 22</span>
										</div>
									</div>
									<div
										class="d-flex align-items-center justify-content-between mt-4">
										<h3 class="mb-0 fw-semibold fs-7">${totalCount}<span
												class="fs-5 ms-2" style="color: gray;">2건</span>
										</h3>
										<span class="fw-bold">₩2,150.00</span>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>
</div>
<script
	src="${pageContext.request.contextPath }/resources/assets/libs/apexcharts/dist/apexcharts.min.js"></script>
<%--   <script src="${pageContext.request.contextPath }/resources/assets/js/apex-chart/apex.bar.init.js"></script> --%>
<!-- <script src="${pageContext.request.contextPath }/resources/assets/js/apex-chart/apex.line.init.js"></script> -->

<script>
	//Stacked Bar Chart -------> BAR CHART
	var options_stacked = {
		series : [ {
			name : "주차장",
			data : [ 44, 55, 41, 20 ],
		}, {
			name : "캡슐호텔",
			data : [ 53, 32, 33, 15 ],
		}, {
			name : "라운지",
			data : [ 12, 17, 11, 9 ],
		}, {
			name : "회의실",
			data : [ 9, 7, 5, 8 ],
		},

		],
		chart : {
			fontFamily : "inherit",
			type : "bar",
			height : 350,
			stacked : true,
			toolbar : {
				show : false,
			},
		},
		grid : {
			borderColor : "transparent",
		},
		colors : [ "var(--bs-primary)", "var(--bs-secondary)", "#ffae1f",
				"#fa896b",

		],
		plotOptions : {
			bar : {
				horizontal : true,
				barHeight : '40%',
			},
		},
		stroke : {
			width : 1,
			colors : [ "#fff" ],
		},
		xaxis : {
			categories : [ 8, 9, 10, 11 ],
			labels : {
				formatter : function(val) {
					return val + "명";
				},
				style : {
					colors : [ "#a1aab2", "#a1aab2", "#a1aab2", "#a1aab2",
							"#a1aab2", "#a1aab2", "#a1aab2", ],
				},
			},
		},
		yaxis : {
			title : {
				text : undefined,
			},
			labels : {
				formatter : function(val) {
					return val + "월";
				},
				style : {
					colors : [ "#a1aab2", "#a1aab2", "#a1aab2", "#a1aab2",
							"#a1aab2", "#a1aab2", "#a1aab2", ],
				},
			},
		},
		tooltip : {
			y : {
				formatter : function(val) {
					return val + "명";
				},
			},
			theme : "dark",
		},
		fill : {
			opacity : 1,
		},
		legend : {
			position : "top",
			horizontalAlign : "left",
			offsetX : 40,
			labels : {
				colors : [ "#a1aab2" ],
			},
		},
	};

	var chart_bar_stacked = new ApexCharts(document
			.querySelector("#chart-bar-stacked"), options_stacked);
	chart_bar_stacked.render();
	
	// 2024년 총 매출
	var options_multiple = {
	  series: [${radialCapsuleHotel.hrCost}, ${radialRounge.rrCost}, ${radialParking.prCost}, ${radialMeeting.mrrCost}],
	  chart: {
		fontFamily: "inherit",
	    height: 450,
	    type: "radialBar",
	  },
	  colors: ["#615dff", "#3dd9eb", "#ffae1f", "#fa896b"],
	  plotOptions: {
	    radialBar: {
	      dataLabels: {
	        name: {
	          fontSize: "22px",
	        },
	        value: {
	          fontSize: "16px",
	          color: "#a1aab2",
	          formatter: function (val) { 
	              return Number(val).toLocaleString() + "원";
	          }
	        },
	        total: {
	            show: true,
	            label: "합계",
	            formatter: function (w) {
	              const totalCost = ${radialCapsuleHotel.hrCost} + ${radialRounge.rrCost} + ${radialParking.prCost} + ${radialMeeting.mrrCost};
	              return totalCost.toLocaleString() + "원";
	            },
	          },
	        },
	        // 세그먼트의 너비를 늘리기 위한 설정
	        hollow: {
                size: '30%', // 중앙의 빈 공간 크기 조정
            },
            track: {
                background: '#e0e0e0', // 트랙의 배경색
                strokeWidth: '100%', // 트랙의 두께 조정
            },
	      },
	    },
	  labels: ["주차장", "캡슐호텔", "라운지","회의실"],
	};
	var chart_radial_multiple = new ApexCharts(document.querySelector("#chart-radial-multiple"), options_multiple);
	chart_radial_multiple.render();
</script>
