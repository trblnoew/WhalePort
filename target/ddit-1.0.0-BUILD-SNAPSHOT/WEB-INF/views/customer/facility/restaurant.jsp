<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
.custom-height {
	height: 250px; 
	display: flex;
	align-items: center; 
	justify-content: center; 
}
.shop-detail {
    width: 1000px; /* 최대 너비 설정 (필요에 따라 조절) */
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
				<p class="text-primary fs-4 fw-bolder">restaurant</p>
				<h1 class="fw-bolder fs-12">식당</h1>
			</div>
		</div>
	</section>
</div>



<div class="shop-detail">

	<div class="related-products pt-7">
<h3 class="title"><strong>서비스 선택</strong></h3>
<input type="button" class="btn btn-outline-info" value="전체" />
<input type="button" class="btn btn-outline-info" value="한식" />
<input type="button" class="btn btn-outline-info" value="양식" />
<input type="button" class="btn btn-outline-info" value="아시안" />
<input type="button" class="btn btn-outline-info" value="푸드코트" />
<input type="button" class="btn btn-outline-info" value="패스트푸드" />
<input type="button" class="btn btn-outline-info" value="카페/디저트" />
		<hr>
		<c:choose>
			<c:when test="${empty restaurantList}">
				<tr>
					<td colspan="6">조회하신 게시글이 존재하지 않습니다.</td>
				</tr>
			</c:when>
			<c:otherwise>
				<div class="row">
					<c:forEach items="${restaurantList}" var="restaurant">
						<c:if test="${restaurant.ptCategory2 eq '한식' }">		
						<div class="korean col-sm-6 col-md-4 col-lg-4">
							<div  class="card hover-img overflow-hidden">
								<div class="position-relative">
										<img src="${restaurant.ptImage }"
											class="card-img-top" alt="modernize-img">
								</div>
								<div class="card-body pt-3 p-4">
									<input type="hidden" value="${restaurant.ptCategory2}"  />
									<h6 class="fs-4">${restaurant.ptName}</h6>
									<div class="d-flex flex-column align-items-start">
									    <h6 class="fs-4 mb-0">연락처 <span class="formatted-cost">${restaurant.ptMgrtel}</span><span class="ms-2 fw-normal text-muted fs-3"></span></h6>
									    <h6 class="fs-4 mb-0 mt-1">운영시간 <span class="formatted-cost">${restaurant.ptTime1} ~ ${restaurant.ptTime2}</span><span class="ms-2 fw-normal text-muted fs-3"></span></h6>
									</div><br>
									<h6 class="fs-4 mb-0">
										<a href="/customer/map/coordinate?xCoor=${restaurant.ptXpos }&yCoor=${restaurant.ptYpos}" >위치 보기</a>
										<span class="ms-2 fw-normal text-muted fs-3"></span>
									
									</h6>
								</div>
							</div>
						</div>
						</c:if>	
						</c:forEach>
						
						<c:forEach items="${restaurantList}" var="restaurant">
						<c:if  test="${restaurant.ptCategory2 eq '양식' }">		
						<div class="western col-sm-6 col-md-4 col-lg-4">
							<div class="card hover-img overflow-hidden">
								<div class="position-relative">
										<img src="${restaurant.ptImage }"
											class="card-img-top" alt="modernize-img">
								</div>
								<div class="card-body pt-3 p-4">
									<input type="hidden" value="${restaurant.ptCategory2}"  />
									<h6 class="fs-4">${restaurant.ptName}</h6>
									<div class="d-flex align-items-center justify-content-between">
										<h6 class="fs-4 mb-0">운영시간 <span class="formatted-cost">${restaurant.ptTime1} ~ ${restaurant.ptTime2}</span><span class="ms-2 fw-normal text-muted fs-3"></span></h6>
									</div><br>
									<h6 class="fs-4 mb-0">
										<a href="/customer/map/coordinate?xCoor=${restaurant.ptXpos }&yCoor=${restaurant.ptYpos}" >위치 보기</a>
										<span class="ms-2 fw-normal text-muted fs-3"></span>
									
									</h6>
								</div>
							</div>
						</div>
						</c:if>	
						</c:forEach>
						
						<c:forEach items="${restaurantList}" var="restaurant">
						<c:if  test="${restaurant.ptCategory2 eq '아시안' }">		
						<div class="asian col-sm-6 col-md-4 col-lg-4">
							<div class="card hover-img overflow-hidden">
								<div class="position-relative">
										<img src="${restaurant.ptImage }"
											class="card-img-top" alt="modernize-img">
								</div>
								<div class="card-body pt-3 p-4">
									<input type="hidden" value="${restaurant.ptCategory2}"  />
									<h6 class="fs-4">${restaurant.ptName}</h6>
									<div class="d-flex align-items-center justify-content-between">
										<h6 class="fs-4 mb-0">운영시간 <span class="formatted-cost">${restaurant.ptTime1} ~ ${restaurant.ptTime2}</span><span class="ms-2 fw-normal text-muted fs-3"></span></h6>
									</div><br>
									<h6 class="fs-4 mb-0">
										<a href="/customer/map/coordinate?xCoor=${restaurant.ptXpos }&yCoor=${restaurant.ptYpos}" >위치 보기</a>
										<span class="ms-2 fw-normal text-muted fs-3"></span>
									
									</h6>
								</div>
							</div>
						</div>
						</c:if>	
						</c:forEach>
						
						<c:forEach items="${restaurantList}" var="restaurant">
						<c:if  test="${restaurant.ptCategory2 eq '푸드코트' }">		
						<div class="food col-sm-6 col-md-4 col-lg-4">
							<div class="card hover-img overflow-hidden">
								<div class="position-relative">
										<img src="${restaurant.ptImage }"
											class="card-img-top" alt="modernize-img">
								</div>
								<div class="card-body pt-3 p-4">
									<input type="hidden" value="${restaurant.ptCategory2}"  />
									<h6 class="fs-4">${restaurant.ptName}</h6>
									<div class="d-flex flex-column align-items-start">
									    <h6 class="fs-4 mb-0">연락처 : <span class="formatted-cost">${restaurant.ptMgrtel}</span><span class="ms-2 fw-normal text-muted fs-3"></span></h6>
									    <h6 class="fs-4 mb-0 mt-1">운영시간  : <span class="formatted-cost">${restaurant.ptTime1} ~ ${restaurant.ptTime2}</span><span class="ms-2 fw-normal text-muted fs-3"></span></h6>
									</div><br>
									<h6 class="fs-4 mb-0">
										<a href="/customer/map/coordinate?xCoor=${restaurant.ptXpos }&yCoor=${restaurant.ptYpos}" >위치 보기</a>
										<span class="ms-2 fw-normal text-muted fs-3"></span>
									
									</h6>
								</div>
							</div>
						</div>
						</c:if>	
						</c:forEach>
						
						<c:forEach items="${restaurantList}" var="restaurant">
						<c:if  test="${restaurant.ptCategory2 eq '패스트푸드' }">		
						<div class="fast col-sm-6 col-md-4 col-lg-4">
							<div class="card hover-img overflow-hidden">
								<div class="position-relative">
										<img src="${restaurant.ptImage }"
											class="card-img-top" alt="modernize-img">
								</div>
								<div class="card-body pt-3 p-4">
									<input type="hidden" value="${restaurant.ptCategory2}"  />
									<h6 class="fs-4">${restaurant.ptName}</h6>
									<div class="d-flex align-items-center justify-content-between">
										<h6 class="fs-4 mb-0">운영시간 <span class="formatted-cost">${restaurant.ptTime1} ~ ${restaurant.ptTime2}</span><span class="ms-2 fw-normal text-muted fs-3"></span></h6>
									</div><br>
									<h6 class="fs-4 mb-0">
										<a href="/customer/map/coordinate?xCoor=${restaurant.ptXpos }&yCoor=${restaurant.ptYpos}" >위치 보기</a>
										<span class="ms-2 fw-normal text-muted fs-3"></span>
									
									</h6>
								</div>
							</div>
						</div>
						</c:if>	
						</c:forEach>
						
						<c:forEach items="${restaurantList}" var="restaurant">
						<c:if  test="${restaurant.ptCategory2 eq '카페/디저트' }">		
						<div class="cafe col-sm-6 col-md-4 col-lg-4">
							<div class="card hover-img overflow-hidden">
								<div class="position-relative">
										<img src="${restaurant.ptImage }"
											class="card-img-top" alt="modernize-img">
								</div>
								<div class="card-body pt-3 p-4">
									<input type="hidden" value="${restaurant.ptCategory2}"  />
									<h6 class="fs-4">${restaurant.ptName}</h6>
									<div class="d-flex align-items-center justify-content-between">
										<h6 class="fs-4 mb-0">운영시간 <span class="formatted-cost">${restaurant.ptTime1} ~ ${restaurant.ptTime2}</span><span class="ms-2 fw-normal text-muted fs-3"></span></h6>
									</div><br>
									<h6 class="fs-4 mb-0">
										<a href="/customer/map/coordinate?xCoor=${restaurant.ptXpos }&yCoor=${restaurant.ptYpos}" >위치 보기</a>
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
		if($(this).val() == "한식"){
			$(this).siblings().removeClass('active').end().addClass('active');
			$(".korean").show();
			$(".western").hide();
			$(".asian").hide();
			$(".food").hide();
			$(".fast").hide();
			$(".cafe").hide();
		}else if($(this).val() == "양식"){
			$(this).siblings().removeClass('active').end().addClass('active');
			$(".korean").hide();
			$(".western").show();
			$(".asian").hide();
			$(".food").hide();
			$(".fast").hide();
			$(".cafe").hide();
		}else if($(this).val() == "아시안"){
			$(this).siblings().removeClass('active').end().addClass('active');
			$(".korean").hide();
			$(".western").hide();
			$(".asian").show();
			$(".food").hide();
			$(".fast").hide();
			$(".cafe").hide();
		}else if($(this).val() == "푸드코트"){
			$(this).siblings().removeClass('active').end().addClass('active');
			$(".korean").hide();
			$(".western").hide();
			$(".asian").hide();
			$(".food").show();
			$(".fast").hide();
			$(".cafe").hide();
		}else if($(this).val() == "패스트푸드"){
			$(this).siblings().removeClass('active').end().addClass('active');
			$(".korean").hide();
			$(".western").hide();
			$(".asian").hide();
			$(".food").hide();
			$(".fast").show();
			$(".cafe").hide();
		}else if($(this).val() == "카페/디저트"){
			$(this).siblings().removeClass('active').end().addClass('active');
			$(".korean").hide();
			$(".western").hide();
			$(".asian").hide();
			$(".food").hide();
			$(".fast").hide();
			$(".cafe").show();
		}else if($(this).val() == "전체"){
			$(this).siblings().removeClass('active').end().addClass('active');
			$(".korean").show();
			$(".western").show();
			$(".asian").show();
			$(".food").show();
			$(".fast").show();
			$(".cafe").show();
		}else{
			
		}
	})
	
	
	
	
});



</script>