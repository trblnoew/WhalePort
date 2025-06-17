<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
    /* 풀캘린더 사이즈 조정 */
    #calendar {
        width: 1000px; /* 원하는 너비로 설정 */
        height: 500px;    /* 원하는 높이로 설정 */
        margin: 0 auto;   /* 중앙 정렬 */
    }
    
</style>
<div class="body-wrapper" style="background-color:#eef3ff;">
	<div class="container-fluid">
		<div class="row">
			<div class="col-12">
				<div class="d-flex align-items-center gap-4 mb-4">
					<div class="position-relative">
						<img src="${partnerVO.ptImage}" class="rounded-circle m-1" alt="user1" width="60" />
					</div>
					<div>
						<h3 class="fw-semibold">
							<span>${partnerVO.ptName}</span>
						</h3>
						<span>${partnerVO.ptAdd}</span>
					</div>
				</div>

				<!-- 풀캘린더 하드코딩 START -->
				<div class="card">
					<div class="card-body" style="box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);">
						<div class="card">
	            			<div id="calendar"></div>
	        			</div>
					</div>
				</div>
				<!-- 풀캘린더 하드코딩 END -->
				<div class="d-flex align-items-stretch gap-3 mb-4">
					<!-- QNA START -->
					<div class="col-8 d-flex align-items-stretch">
						<div class="card w-100">
							<div class="card-body" style="box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);">
								<div class="d-md-flex align-items-center mb-9">
									<div>
										<h4 class="card-title fw-semibold">QNA</h4>
										<p class="card-subtitle">전체 ${pagingVO.totalRecord}건</p>
									</div>
									<div class="ms-auto mt-4 mt-md-0">
										<ul class="nav nav-tabs" role="tablist">
											<li class="nav-item">
												<a class="nav-link rounded active" href="/partner/qna/list">
													<span>더보기</span>
												</a>
											</li>
										</ul>
									</div>
								</div>
								<div class="tab-content mt-3">
									<div class="tab-pane active" id="home" role="tabpanel">
										<div class="table-responsive">
											<table class="table align-middle mb-0 text-nowrap">
												<thead>
													<tr style="text-align: center">
														<th>업체구분</th>
														<th>제목</th>
														<th>작성자</th>
														<th>등록일</th>
														<th>답변여부</th>
													</tr>
												</thead>
												<tbody>
													<c:set value="${pagingVO.dataList}" var="qnaList" />
													<c:choose>
														<c:when test="${empty qnaList}">
															<tr>
																<td colspan="4">조회하신 게시글이 존재하지 않습니다.</td>
															</tr>
														</c:when>
														<c:otherwise>
															<c:forEach items="${qnaList}" var="qna">
																<tr onclick="location.href='/partner/qna/detail?qnaNo=${qna.qnaNo}';" style="cursor: pointer;">
																	<td style="text-align: center">${qna.comdName}</td>
																	<td style="text-align: left; width: 300px; padding-left: 80px;">${qna.qnaTitle}</td>
																	<td style="text-align: center">${qna.ptName}</td>
																	<td style="text-align: center">${qna.qnaDate}</td>
																	<td>
																		<c:choose>
																			<c:when test="${qna.qnaState == 'N'}">
																				<span class="badge bg-success-subtle text-success" style="margin-left: 10px">답변 대기</span>
																			</c:when>
																			<c:when test="${qna.qnaState == 'Y'}">
																				<span class="badge bg-primary-subtle text-primary" style="margin-left: 10px">답변 완료</span>
																			</c:when>
																		</c:choose>
																	</td>
																</tr>
															</c:forEach>
														</c:otherwise>
													</c:choose>
												</tbody>
											</table>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- QNA END -->
					<!-- Whaleport News START -->
					<div class="col-4">
	<!-- 				<div data-item="item-pending" class="task-list-container" data-action="sorting"> -->
						<div class="connect-sorting connect-sorting-pending" style="width: 500px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);">
							<div class="task-container-header">
								<h6 class="item-head mb-0 fs-4 fw-semibold" data-item-title="Pending">Whale News</h6>
								<div class="hstack gap-2">
									<div class="dropdown">
										<a class="dropdown-toggle" href="javascript:void(0)" role="button" id="dropdownMenuLink-1" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
											<i class="ti ti-dots-vertical text-dark"></i>
										</a>
										<div class="dropdown-menu dropdown-menu-end" aria-labelledby="dropdownMenuLink-1">
											<a class="dropdown-item list-edit" href="javascript:void(0);">Edit</a>
											<a class="dropdown-item list-delete" href="javascript:void(0);">Delete</a>
											<a class="dropdown-item list-clear-all" href="javascript:void(0);">Clear All</a>
										</div>
									</div>
								</div>
							</div>
							<div class="connect-sorting-content" data-sortable="true">
								<div data-draggable="true" class="card img-task">
									<div class="card-body">
										<div class="task-header">
											<div>
												<h5 data-item-title="Persona development">Whaleport, 겨울철 안전 점검 강화</h5>
											</div>
<!-- 											<div class="dropdown"> -->
<!-- 												<a class="dropdown-toggle" href="javascript:void(0)" role="button" id="dropdownMenuLink-1" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="true"> -->
<!-- 													<i class="ti ti-dots-vertical text-dark"></i> -->
<!-- 												</a> -->
<!-- 												<div class="dropdown-menu dropdown-menu-end" aria-labelledby="dropdownMenuLink-1"> -->
<!-- 													<a class="dropdown-item kanban-item-edit cursor-pointer d-flex align-items-center gap-1" href="javascript:void(0);">  -->
<!-- 														<i class="ti ti-pencil fs-5"></i>Edit -->
<!-- 													</a>  -->
<!-- 													<a class="dropdown-item kanban-item-delete cursor-pointer d-flex align-items-center gap-1" href="javascript:void(0);"> -->
<!-- 														<i class="ti ti-trash fs-5"></i>Delete -->
<!-- 													</a> -->
<!-- 												</div> -->
<!-- 											</div> -->
										</div>
										<div class="task-content" style="margin-top:20px;">
										<img src="${pageContext.request.contextPath }/resources/assets/images/backgrounds/news.jpg" alt="news" style="width:100%; height:auto;">
											<p class="mb-0" data-item-text="Create user personas based on the research data to represent different user groups and their characteristics, gols, and behaviors.." style="margin-top:20px;">
												다가오는 겨울철을 대비하여 안전 점검을 강화<br/>겨울철 눈과 얼음으로 인한 활주로
												결빙 사고를 방지하기 위해 공항 관계자들은 제설 차량 및 장비 점검을 완료하였다.<br/>기상 악화 시 즉각 대응할
												수 있는 매뉴얼을 재정비했다. <br/>
											</p><br/>
										</div>
										<div class="task-body">
											<div class="task-bottom">
												<div class="tb-section-1">
													<span class="hstack gap-2 fs-2" data-item-date="24 July">
														<i class="ti ti-calendar fs-5"></i>24 NOV
													</span>
												</div>
												<div class="tb-section-2">
													<span class="badge text-bg-warning fs-1">new</span>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- Whaleport News END -->
				</div>
			</div>
		</div>
	</div>
</div>
<link href="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/5.10.1/main.min.css" rel="stylesheet" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/5.10.1/main.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
document.addEventListener('DOMContentLoaded', function() {
	var calendarEl = document.getElementById('calendar');
	var calendar = new FullCalendar.Calendar(calendarEl, {
		locale: 'ko',
		initalView : 'dayGridMonth',
		events: [
		    {
		    	id : '1',
		      title:'물류창고 대청소',
		      start:'2024-11-11',
		      end:'2024-11-13',
		      color:'#f4bab9'
		    },
		    {
		    	id : '2',
		      title:'서울-도쿄(하네다) 할인  팝업',
		      start:'2024-11-04',
		      end:'2024-11-09',
		      color:'#d5f1d8'
		    },
		    {
		    	id : '3',
		      title:'구찌 실적 보고서 제출',
		      start:'2024-11-20',
		      color:'#bcbbf9'
		    },
		    {
		    	id : '4',
		      title:'Whaleport 공항 대청소',
		      start:'2024-11-25',
		      end:'2024-11-25',
		      color:'#bcbbf9'
		    },
		    {
		    	id : '5',
		      title:'빽다방 팝업 회의',
		      start:'2024-11-25',
		      end:'2024-11-29',
		      color:'#d5f1d8'
		    }
		  ]
	});
	calendar.render();
});
</script>