<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<style>
	.table th {
		text-align: center;
	}
	
	.table td {
		text-align: center;
	}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<div class="body-wrapper">
	<div class="container-fluid">
		<div class="card bg-info-subtle shadow-none position-relative overflow-hidden mb-4">
			<div class="card-body px-4 py-3">
				<div class="row align-items-center">
					<div class="col-9">
						<h4 class="fw-semibold mb-8">회원 관리</h4>
						<nav aria-label="breadcrumb">
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a
									class="text-muted text-decoration-none" href="/common/home">DashBoard</a>
								</li>
								<li class="breadcrumb-item" aria-current="page">회원 관리</li>
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
		<!-- Chart START -->
		<div class="container">
			<div class="row">
				<!-- CHART START -->
				<div class="col-md-8">
					<div class="card">
						<div class="card-body">
							<h4 class="card-title">2024년 월별 회원가입 수</h4>
							<div id="chart-line-basic" class="mx-n3"></div>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="card">
						<div class="card-body">
							<h4 class="card-title">년도별 회원가입 수</h4>
							<div id="chart-bar-basic"></div>
						</div>
					</div>
				</div>
				
				<!-- CHART END -->
			</div>
		</div>
		<!-- Chart END -->

		<div class="card w-100 position-relative overflow-hidden">
			<div class="card-body p-4">
				<!-- 상태별 카운트 위젯 시작 -->
			<form id="filterForm" action="/management/customer/list" method="get">
				<div class="row d-flex align-items-center justify-content-center g-4">
			        <div style="width: 17%" onclick="selectFilter('now')" class="filter-card">
			            <div class="card border-bottom border-info card-hover">
			                <div class="card-body p-4" style="height: 125px">
								<div class="d-flex align-items-center">
									<div>
										<h4 class="card-title fs-6">${customerVO.currentCount }</h4>
										<p class="card-subtitle text-info">현재 고객 수</p>
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
			        <div style="width: 17%" onclick="selectFilter('M')" class="filter-card">
			            <div class="card border-bottom border-primary card-hover">
			                <div class="card-body p-4" style="height: 125px">
								<div class="d-flex align-items-center">
									<div>
										<h4 class="card-title fs-5">${customerVO.maleCount }</h4>
										<p class="card-subtitle text-primary">남성 고객수</p>
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
			        <div style="width: 17%" onclick="selectFilter('F')" class="filter-card">
			            <div class="card border-bottom border-danger card-hover">
			                <div class="card-body p-4" style="height: 125px">
								<div class="d-flex align-items-center">
									<div>
										<h4 class="card-title fs-5">${customerVO.femaleCount }</h4>
										<p class="card-subtitle text-danger">여성 고객 수</p>
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
			        <div style="width: 17%" onclick="selectFilter('J')" class="filter-card">
			            <div class="card border-bottom border-success card-hover">
			                <div class="card-body p-4" style="height: 125px">
								<div class="d-flex align-items-center">
									<div>
										<h4 class="card-title fs-5">${customerVO.totalCount }</h4>
										<p class="card-subtitle text-success">회원가입한 고객수</p>
									</div>
									<div class="ms-auto">
										<span class="text-primary display-6">
											<span class="badge bg-primary-subtle text-success" style="font-size: 1rem; padding: 0.5rem 0.5rem;">회원가입</span>
										</span>
									</div>
								</div>
							</div>
						</div>
					</div>
			        <div style="width: 17%" onclick="selectFilter('Q')" class="filter-card">
			            <div class="card border-bottom border-dark card-hover">
			                <div class="card-body p-4" style="height: 125px">
								<div class="d-flex align-items-center">
									<div>
										<h4 class="card-title fs-5">${customerVO.quitCount }</h4>
										<p class="card-subtitle text-gray">탈퇴한 고객수</p>
									</div>
									<div class="ms-auto">
										<span class="text-warning display-6"> 
											<span class="badge text-bg-light" style="color: gray !important; font-size: 1rem; padding: 0.5rem 0.5rem;">탈퇴</span>
										</span>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<input type="hidden" name="selectedItem" id="selectedItem" value="">
				</form>
				<br />
				<!-- 상태별 카운트 위젯 끝 -->
				<!-- 검색창 시작 -->
				<div class="row justify-content-end">
					<div class="col-md-4 col-xl-6 d-flex justify-content-end align-items-center" >
						<form action="/management/customer/list" method="get" class="w-90 d-flex" id="searchForm">
							<input type="hidden" name="page" id="page" value=""/>
		                	<input type="hidden" name="selectedItem" value="${pagingVO.selectedItem }">
							<select class="form-select me-2" name="searchType" id="searchType" style="width: 160px;">
								<option>검색 유형 선택</option>
								<option value="id"
									<c:if test="${searchType eq 'id' }">selected</c:if>>아이디
								</option>
								<option value="name"
									<c:if test="${searchType eq 'name' }">selected</c:if>>이름
								</option>
							</select>
		            	<div class="input-group position-relative">
			                <input type="text" class="form-control product-search ps-5 pe-5" id="searchWord" name="searchWord" placeholder="Search Contacts..." value="${searchWord}" />
			                <i class="ti ti-search position-absolute top-50 start-0 translate-middle-y fs-6 text-dark ms-3"></i>
			                <button type="submit" class="btn btn-primary" style="padding: 0.25rem 0.5rem;">검색</button>
			            </div>
						</form>
					</div>
				</div>
				<!-- 검색창 끝 -->
				<form action="/management/customer/excelDown" method="post" id="excelDownForm">
					<input type="hidden" name="searchType" value="" id="searchType2" />
					<input type="hidden" name="searchWord" value="" id="searchWord2" />
					<div class="table-responsive mb-4 border rounded-1 mt-3">
						<table class="table text-nowrap mb-0 align-middle" style="table-layout: fixed;">
							<thead class="text-dark fs-4">
								<tr>
									<th width="10%"><h6 class="fs-4 fw-semibold mb-0">번호</h6></th>
									<th width="15%"><h6 class="fs-4 fw-semibold mb-0">아이디</h6></th>
									<th width="15%"><h6 class="fs-4 fw-semibold mb-0">이름</h6></th>
									<th width="15%"><h6 class="fs-4 fw-semibold mb-0">성별</h6></th>
									<th width="15%"><h6 class="fs-4 fw-semibold mb-0">마케팅 수신여부</h6></th>
									<th width="15%"><h6 class="fs-4 fw-semibold mb-0">구분</h6></th>
									<th width="15%"><h6 class="fs-4 fw-semibold mb-0">상세보기</h6></th>
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
										<c:forEach items="${pagingVO.dataList}" var="customer" begin="0" step="1" end="9" varStatus="i">
											<tr onclick="location.href='/management/customer/detail?cusNo=${customer.cusNo}';" style="cursor: pointer;">
												<td><p class="mb-0 fw-normal fs-4">${totalCount - (i.index + ((pagingVO.currentPage - 1 )* 10)) } </p></td>
												<td><a class="mb-0 fw-normal fs-4">${customer.cusId}</a></td>
												<td><p class="mb-0 fw-normal fs-4">${customer.cusName}</p></td>
												<td><p class="mb-0 fw-normal fs-4">${customer.cusGender eq 'M' ? '남자':'여자'}</p></td>
												<td><p class="mb-0 fw-normal fs-4">${customer.cusSend eq 'Y'? '동의':'비동의'}</p></td>
												<td>
													<c:choose>
														<c:when test="${customer.cusDelyn eq 'Y' }">
															<span class="badge text-bg-light"
																style="color: gray !important;">탈퇴</span>
														</c:when>
														<c:otherwise>
															<span class="badge bg-primary-subtle text-primary">회원</span>
														</c:otherwise>
													</c:choose>
												</td>
												<td>
													<a href="/management/customer/detail?cusNo=${customer.cusNo}" class="text-primary edit">
														<i class="ti ti-eye fs-5"></i>
													</a>
												</td>
											</tr>
										</c:forEach>
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>
					</div>
					<input type="button" class="btn btn-primary" value="엑셀 다운로드" id="excelDownBtn"/>
				</form>
				<div class="text-end mb-3">
					<c:if test="${not empty searchWord}">
						<a href="/management/customer/list" class="btn btn-outline-primary me-3">이전</a>
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
$(function() {
	var excelDownBtn = $("#excelDownBtn"); //엑셀 다운 버튼
	var excelDownForm = $("#excelDownForm"); // 엑셀 보내는 form
	
	$("#pagingArea").on("click", "a", function(e){
		e.preventDefault();
		console.log("여기");
		console.log(this);
		var pageNo = $(this).data("page");
		$("#searchForm").find("#page").val(pageNo);
		$("#searchForm").submit();
	});
	

	excelDownBtn.on("click", function() {
		$("#searchType2").val($("#searchType").val());
		$("#searchWord2").val($("#searchWord").val());

		excelDownForm.submit();
	});
	
	// 라인 차트 START
	var options_line = {
		series : [ {
			name : "2024년",
			data : ${lineChart},
		}, ],
		chart : {
			height : 350,
			type : "line",
			fontFamily : "inherit",
			zoom : {
				enabled : false,
			},
			toolbar : {
				show : false,
			},
		},
		dataLabels : {
			enabled : false,
		},
		colors : [ "var(--bs-primary)" ],
		stroke : {
			curve : "straight",
		},
		grid : {
			row : {
				colors : [ "transparent" ],
				opacity : 0.5,
			},
			borderColor : "transparent",
		},
		xaxis : {
			categories : [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월"],
			labels : {
				style : {
					colors : [ "#a1aab2", "#a1aab2", "#a1aab2", "#a1aab2", "#a1aab2", "#a1aab2", "#a1aab2", "#a1aab2", "#a1aab2", ],
				},
			},
		},
		yaxis : {
			labels : {
				style : {
					colors : [ "#a1aab2", "#a1aab2", "#a1aab2", "#a1aab2", "#a1aab2", "#a1aab2", ],
				},
			},
		},
		tooltip : {
			theme : "dark",
		},
	};
	var chart_line_basic = new ApexCharts(document.querySelector("#chart-line-basic"), options_line);
	chart_line_basic.render();
	// 라인 차트 END
	
	//바 차트
	var optionsBar = {
	    chart: {
	        type: 'bar',
	        width: 250,
	        height: 350
	    },
	    series: [{
	        name: '회원가입 수',
	        data: ${barChart}
	    }],
	    xaxis: {
	    	categories: ['2021', '2022', '2023', '2024']
	    },
	    
	    colors: ['#007BFF'], // 바 색상 설정 (올해: 파란색, 작년: 연한 회색)
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
});

function selectFilter(value) {
	console.log("selectFilter->value : " + value);	
	
    document.getElementById('selectedItem').value = value; // 전체 선택일 경우 값이 없게 설정
    document.getElementById('filterForm').submit();
}


</script>