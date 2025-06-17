<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
.custom-height {
	height: 250px; 
	display: flex;
	align-items: center; 
	justify-content: center; 
}
.shop-detail {
    max-width: 1000px; /* 최대 너비 설정 (필요에 따라 조절) */
    margin: 0 auto; /* 자동으로 양쪽 여백을 동일하게 설정하여 가운데 정렬 */
    padding: 0 15px; /* 좌우 여백 추가 (필요에 따라 조절) */
}

.card {
    height: 350px; /* 원하는 높이로 설정 */
    display: flex;
    flex-direction: column; /* 내용이 세로로 쌓이도록 설정 */
    
}
.card img {
    height: 200px; /* 이미지의 높이를 설정 */
    object-fit: cover; /* 이미지 비율 유지하면서 카드에 맞게 잘림 */
}
.card-body {
    flex-grow: 1; /* 카드 본문이 남은 공간을 모두 차지하도록 설정 */
}


</style>

<div class="main-wrapper overflow-hidden">
	<!-- ------------------------------------- -->
	<!-- banner Start -->
	<!-- ------------------------------------- -->
	<section class="bg-primary-subtle custom-height">
		<div class="container-fluid">
			<div class="text-center">
				<p class="text-primary fs-4 fw-bolder">info·amenities</p>
				<h1 class="fw-bolder fs-12">안내·편의시설</h1>
			</div>
		</div>
	</section>
</div>

<div class="shop-detail">

	<div class="related-products pt-7">
<h3 class="title"><strong>서비스 선택</strong></h3>
<input type="button" class="btn btn-outline-info" value="전체" />
<input type="button" class="btn btn-outline-info" value="금융/보험" />
<input type="button" class="btn btn-outline-info" value="통신/인터넷" />
<input type="button" class="btn btn-outline-info" value="택배/우편" />
<input type="button" class="btn btn-outline-info" value="안내데스크" />
<input type="button" class="btn btn-outline-info" value="민원행정 서비스" />
<input type="button" class="btn btn-outline-info" value="라운지" />
<input type="button" class="btn btn-outline-info" value="회의실" />
<input type="button" class="btn btn-outline-info" value="의료/유아" />
<input type="button" class="btn btn-outline-info" value="기타편의" />
		<hr>
		<c:choose>
			<c:when test="${empty guideList}">
				<tr>
					<td colspan="6">조회하신 게시글이 존재하지 않습니다.</td>
				</tr>
			</c:when>
			<c:otherwise>
				<div class="row">
				
					<c:forEach items="${guideList}" var="guide">
						<c:if test="${guide.ptCategory2 eq '금융/보험' }">		
						<div class="fund col-sm-6 col-md-4 col-lg-4">
							<div  class="card hover-img overflow-hidden">
								<div class="position-relative">
										<img src="${guide.ptImage }" 
											class="card-img-top" alt="modernize-img">
								</div>
								<div class="card-body pt-3 p-4">
									<input type="hidden" value="${guide.ptCategory2}"  />
									<h6 class="fs-4">${guide.ptName}</h6>
										<h6 class="fs-4 mb-0">연락처 <span class="formatted-cost">${guide.ptMgrtel}</span><span class="ms-2 fw-normal text-muted fs-3"></span></h6>
<!-- 									<div class="d-flex align-items-center justify-content-between"> -->
										<h6 class="fs-4 mb-0 mt-1">운영시간 <span class="formatted-cost">${guide.ptTime1} ~ ${guide.ptTime2}</span><span class="ms-2 fw-normal text-muted fs-3"></span></h6>
<!-- 									</div> -->
									</br>
									<h6 class="fs-4 mb-0">
										<a href="/customer/map/coordinate?xCoor=${guide.ptXpos }&yCoor=${guide.ptYpos}" >위치 보기</a>
										<span class="ms-2 fw-normal text-muted fs-3"></span>
									
									</h6>
								</div>
							</div>
						</div>
						</c:if>	
						</c:forEach>
						
						<c:forEach items="${guideList}" var="guide">
						<c:if  test="${guide.ptCategory2 eq '통신/인터넷' }">		
						<div class="internet col-sm-6 col-md-4 col-lg-4">
							<div class="card hover-img overflow-hidden">
								<div class="position-relative">
										<img src="${guide.ptImage }"
											class="card-img-top" alt="modernize-img">
								</div>
								<div class="card-body pt-3 p-4">
									<input type="hidden" value="${guide.ptCategory2}"  />
									<h6 class="fs-4">${guide.ptName}</h6>
									<div class="d-flex align-items-center justify-content-between">
										<h6 class="fs-4 mb-0">운영시간 <span class="formatted-cost">${guide.ptTime1} ~ ${guide.ptTime2}</span><span class="ms-2 fw-normal text-muted fs-3"></span></h6>
									</div><br>
									<h6 class="fs-4 mb-0">
										<a href="/customer/map/coordinate?xCoor=${guide.ptXpos }&yCoor=${guide.ptYpos}" >위치 보기</a>
										<span class="ms-2 fw-normal text-muted fs-3"></span>
									
									</h6>
								</div>
							</div>
						</div>
						</c:if>	
						</c:forEach>
						
						<c:forEach items="${guideList}" var="guide">
						<c:if  test="${guide.ptCategory2 eq '택배/우편' }">		
						<div class="post col-sm-6 col-md-4 col-lg-4">
							<div class="card hover-img overflow-hidden">
								<div class="position-relative">
										<img src="${guide.ptImage }"
											class="card-img-top" alt="modernize-img">
								</div>
								<div class="card-body pt-3 p-4">
									<input type="hidden" value="${guide.ptCategory2}"  />
									<h6 class="fs-4">${guide.ptName}</h6>
									<div class="d-flex align-items-center justify-content-between">
										<h6 class="fs-4 mb-0">운영시간 <span class="formatted-cost">${guide.ptTime1} ~ ${guide.ptTime2}</span><span class="ms-2 fw-normal text-muted fs-3"></span></h6>
									</div><br>
									<h6 class="fs-4 mb-0">
										<a href="/customer/map/coordinate?xCoor=${guide.ptXpos }&yCoor=${guide.ptYpos}" >위치 보기</a>
										<span class="ms-2 fw-normal text-muted fs-3"></span>
									
									</h6>
								</div>
							</div>
						</div>
						</c:if>	
						</c:forEach>
						
						<c:forEach items="${guideList}" var="guide">
						<c:if  test="${guide.ptCategory2 eq '안내데스크' }">		
						<div class="info col-sm-6 col-md-4 col-lg-4">
							<div class="card hover-img overflow-hidden">
								<div class="position-relative">
										<img src="${guide.ptImage }"
											class="card-img-top" alt="modernize-img">
								</div>
								<div class="card-body pt-3 p-4">
									<input type="hidden" value="${guide.ptCategory2}"  />
									<h6 class="fs-4">${guide.ptName}</h6>
									<div class="d-flex align-items-center justify-content-between">
										<h6 class="fs-4 mb-0">운영시간 <span class="formatted-cost">${guide.ptTime1} ~ ${guide.ptTime2}</span><span class="ms-2 fw-normal text-muted fs-3"></span></h6>
									</div><br>
									<h6 class="fs-4 mb-0">
										<a href="/customer/map/coordinate?xCoor=${guide.ptXpos }&yCoor=${guide.ptYpos}" >위치 보기</a>
										<span class="ms-2 fw-normal text-muted fs-3"></span>
									
									</h6>
								</div>
							</div>
						</div>
						</c:if>	
						</c:forEach>
						
						<c:forEach items="${guideList}" var="guide">
						<c:if  test="${guide.ptCategory2 eq '민원행정 서비스' }">		
						<div class="service col-sm-6 col-md-4 col-lg-4">
							<div class="card hover-img overflow-hidden" >
								<div class="position-relative">
										<img src="${guide.ptImage }"
											class="card-img-top" alt="modernize-img">
								</div>
								<div class="card-body pt-3 p-4">
									<input type="hidden" value="${guide.ptCategory2}"  />
									<h6 class="fs-4">${guide.ptName}</h6>
									<div class="d-flex align-items-center justify-content-between">
										<h6 class="fs-4 mb-0">운영시간 <span class="formatted-cost">${guide.ptTime1} ~ ${guide.ptTime2}</span><span class="ms-2 fw-normal text-muted fs-3"></span></h6>
									</div><br>
									<h6 class="fs-4 mb-0">
										<a href="/customer/map/coordinate?xCoor=${guide.ptXpos }&yCoor=${guide.ptYpos}" >위치 보기</a>
										<span class="ms-2 fw-normal text-muted fs-3"></span>
									
									</h6>
								</div>
							</div>
						</div>
						</c:if>	
						</c:forEach>
						
						<c:forEach items="${guideList}" var="guide">
						<c:if  test="${guide.ptCategory2 eq '라운지' }">		
						<div class="rounge col-sm-6 col-md-4 col-lg-4">
							<div class="card hover-img overflow-hidden">
								<div class="position-relative">
										<img src="${guide.ptImage }"
											class="card-img-top" alt="modernize-img">
								</div>
								<div class="card-body pt-3 p-4">
									<input type="hidden" value="${guide.ptCategory2}"  />
									<h6 class="fs-4">${guide.ptName}</h6>
									<div class="d-flex align-items-center justify-content-between">
										<h6 class="fs-4 mb-0">운영시간 <span class="formatted-cost">${guide.ptTime1} ~ ${guide.ptTime2}</span><span class="ms-2 fw-normal text-muted fs-3"></span></h6>
									</div><br>
									<h6 class="fs-4 mb-0">
										<a href="/customer/map/coordinate?xCoor=${guide.ptXpos }&yCoor=${guide.ptYpos}" >위치 보기</a>
										<span class="ms-2 fw-normal text-muted fs-3"></span>
									
									</h6>
								</div>
							</div>
						</div>
						</c:if>	
						</c:forEach>
						
						<c:forEach items="${guideList}" var="guide">
						<c:if  test="${guide.ptCategory2 eq '회의실' }">		
						<div class="meeting col-sm-6 col-md-4 col-lg-4">
							<div class="card hover-img overflow-hidden">
								<div class="position-relative">
										<img src="${guide.ptImage }"
											class="card-img-top" alt="modernize-img">
								</div>
								<div class="card-body pt-3 p-4">
									<input type="hidden" value="${guide.ptCategory2}"  />
									<h6 class="fs-4">${guide.ptName}</h6>
									<div class="d-flex align-items-center justify-content-between">
										<h6 class="fs-4 mb-0">운영시간 <span class="formatted-cost">${guide.ptTime1} ~ ${guide.ptTime2}</span><span class="ms-2 fw-normal text-muted fs-3"></span></h6>
									</div><br>
									<h6 class="fs-4 mb-0">
										<a href="/customer/map/coordinate?xCoor=${guide.ptXpos }&yCoor=${guide.ptYpos}" >위치 보기</a>
										<span class="ms-2 fw-normal text-muted fs-3"></span>
									
									</h6>
								</div>
							</div>
						</div>
						</c:if>	
						</c:forEach>
						
						<c:forEach items="${guideList}" var="guide">
						<c:if  test="${guide.ptCategory2 eq '의료/유아' }">		
						<div class="child col-sm-6 col-md-4 col-lg-4">
							<div class="card hover-img overflow-hidden">
								<div class="position-relative">
										<img src="${guide.ptImage }"
											class="card-img-top" alt="modernize-img">
								</div>
								<div class="card-body pt-3 p-4">
									<input type="hidden" value="${guide.ptCategory2}"  />
									<h6 class="fs-4">${guide.ptName}</h6>
									<div class="d-flex align-items-center justify-content-between">
										<h6 class="fs-4 mb-0">운영시간 <span class="formatted-cost">${guide.ptTime1} ~ ${guide.ptTime2}</span><span class="ms-2 fw-normal text-muted fs-3"></span></h6>
									</div><br>
									<h6 class="fs-4 mb-0">
										<a href="/customer/map/coordinate?xCoor=${guide.ptXpos }&yCoor=${guide.ptYpos}" >위치 보기</a>
										<span class="ms-2 fw-normal text-muted fs-3"></span>
									
									</h6>
								</div>
							</div>
						</div>
						</c:if>	
						</c:forEach>
						
						<c:forEach items="${guideList}" var="guide">
						<c:if test="${guide.ptCategory2 eq '기타편의' }">		
						<div class="etc col-sm-6 col-md-4 col-lg-4">
							<div class="card hover-img overflow-hidden">
								<div class="position-relative">
										<img src="${guide.ptImage }"
											class="card-img-top" alt="modernize-img">
								</div>
								<div class="card-body pt-3 p-4">
									<input type="hidden" value="${guide.ptCategory2}"  />
									<h6 class="fs-4">${guide.ptName}</h6>
									<div class="d-flex align-items-center justify-content-between">
										<h6 class="fs-4 mb-0">운영시간 <span class="formatted-cost">${guide.ptTime1} ~ ${guide.ptTime2}</span><span class="ms-2 fw-normal text-muted fs-3"></span></h6>
									</div><br>
									<h6 class="fs-4 mb-0">
										<a href="/customer/map/coordinate?xCoor=${guide.ptXpos }&yCoor=${guide.ptYpos}" >위치 보기</a>
										<span class="ms-2 fw-normal text-muted fs-3"></span>
									
									</h6>
								</div>
							</div>
						</div>
						</c:if>	
						</c:forEach>
					</div>
			</c:otherwise>
		</c:choose>
	</div>
</div>

<script type="text/javascript">
$(function(){
	$(".btn").on("click", function(){
		if($(this).val() == "금융/보험"){
			$(this).siblings().removeClass('active').end().addClass('active');
			
			$(".fund").show();
			$(".internet").hide();
			$(".post").hide();
			$(".info").hide();
			$(".service").hide();
			$(".rounge").hide();
			$(".meeting").hide();
			$(".child").hide();
			$(".etc").hide();
		}else if($(this).val() == "통신/인터넷"){
			$(this).siblings().removeClass('active').end().addClass('active');
			$(".fund").hide();
			$(".internet").show();
			$(".post").hide();
			$(".info").hide();
			$(".service").hide();
			$(".rounge").hide();
			$(".meeting").hide();
			$(".child").hide();
			$(".etc").hide();
		}else if($(this).val() == "택배/우편"){
			$(this).siblings().removeClass('active').end().addClass('active');
			$(".fund").hide();
			$(".internet").hide();
			$(".post").show();
			$(".info").hide();
			$(".service").hide();
			$(".rounge").hide();
			$(".meeting").hide();
			$(".child").hide();
			$(".etc").hide();
		}else if($(this).val() == "안내데스크"){
			$(this).siblings().removeClass('active').end().addClass('active');
			$(".fund").hide();
			$(".internet").hide();
			$(".post").hide();
			$(".info").show();
			$(".service").hide();
			$(".rounge").hide();
			$(".meeting").hide();
			$(".child").hide();
			$(".etc").hide();
		}else if($(this).val() == "민원행정 서비스"){
			$(this).siblings().removeClass('active').end().addClass('active');
			$(".fund").hide();
			$(".internet").hide();
			$(".post").hide();
			$(".info").hide();
			$(".service").show();
			$(".rounge").hide();
			$(".meeting").hide();
			$(".child").hide();
			$(".etc").hide();
		}else if($(this).val() == "라운지"){
			$(this).siblings().removeClass('active').end().addClass('active');
			$(".fund").hide();
			$(".internet").hide();
			$(".post").hide();
			$(".info").hide();
			$(".service").hide();
			$(".rounge").show();
			$(".meeting").hide();
			$(".child").hide();
			$(".etc").hide();
		}else if($(this).val() == "회의실"){
			$(this).siblings().removeClass('active').end().addClass('active');
			$(".fund").hide();
			$(".internet").hide();
			$(".post").hide();
			$(".info").hide();
			$(".service").hide();
			$(".rounge").hide();
			$(".meeting").show();
			$(".child").hide();
			$(".etc").hide();
		}else if($(this).val() == "의료/유아"){
			$(this).siblings().removeClass('active').end().addClass('active');
			$(".fund").hide();
			$(".internet").hide();
			$(".post").hide();
			$(".info").hide();
			$(".service").hide();
			$(".rounge").hide();
			$(".meeting").hide();
			$(".child").show();
			$(".etc").hide();
		}else if($(this).val() == "기타편의"){
			$(this).siblings().removeClass('active').end().addClass('active');
			$(".fund").hide();
			$(".internet").hide();
			$(".post").hide();
			$(".info").hide();
			$(".service").hide();
			$(".rounge").hide();
			$(".meeting").hide();
			$(".child").hide();
			$(".etc").show();
		}else if($(this).val() == "전체"){
			$(this).siblings().removeClass('active').end().addClass('active');
			$(".fund").show();
			$(".internet").show();
			$(".post").show();
			$(".info").show();
			$(".service").show();
			$(".rounge").show();
			$(".meeting").show();
			$(".child").show();
			$(".etc").show();
		}else{
			
		}
	})
	
	
	
	
});



</script>