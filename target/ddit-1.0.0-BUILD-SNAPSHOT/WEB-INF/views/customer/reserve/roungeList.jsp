<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
.custom-height {
	height: 250px; 
	display: flex;
	align-items: center; 
	justify-content: center; 
}
.shop-detail {
    max-width: 1200px; /* 최대 너비 설정 (필요에 따라 조절) */
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
<%
	// list.jsp에서 알림을 표시하기 위한 조건
String msg = (String) request.getAttribute("msg");
String message = (String) request.getAttribute("message");
%>

<div class="main-wrapper overflow-hidden">
	<!-- ------------------------------------- -->
	<!-- banner Start -->
	<!-- ------------------------------------- -->
	<section class="bg-primary-subtle custom-height">
		<div class="container-fluid">
			<div class="text-center">
				<p class="text-primary fs-4 fw-bolder">rounge</p>
				<h1 class="fw-bolder fs-12">라운지</h1>
			</div>
		</div>
	</section>
</div>

<div class="shop-detail">

	<div class="related-products pt-7">
<h3 class="title"><strong>라운지 이용권</strong></h3>
		<hr>
		<c:choose>
			<c:when test="${empty roungeList}">
				<tr>
					<td colspan="6">조회하신 게시글이 존재하지 않습니다.</td>
				</tr>
			</c:when>
			<c:otherwise>
				<div class="row">
					<c:forEach items="${roungeList}" var="rounge">
						<div class="col-sm-6 col-md-4 col-lg-4">
							<div class="card hover-img overflow-hidden">
								<div class="position-relative">
									<a href="/customer/reserve/rounge/detail?rgNo=${rounge.rgNo }" >
										<img src="${pageContext.request.contextPath}/resources/assets/images/rounge/${rounge.rgPhoto}"
											class="card-img-top" alt="modernize-img">
									</a>
								</div>
								<div class="card-body pt-3 p-4">
									<h6 class="fs-4">라운지 명 : ${rounge.rgName}</h6>
									<div class="d-flex align-items-center justify-content-between">
										<h6 class="fs-4 mb-0">가격 : <span class="formatted-cost">${rounge.rgCost}</span>원<span class="ms-2 fw-normal text-muted fs-3"></span></h6>

										<h6 class="fs-4 mb-0">이용시간 : ${rounge.rgUsetime}시간<span
												class="ms-2 fw-normal text-muted fs-3"></span>
										</h6>
									</div><br>
									<h6 class="fs-4 mb-0">위치 : ${rounge.rgLoc}<span
											class="ms-2 fw-normal text-muted fs-3"></span>
									</h6>
									<ul class="list-unstyled d-flex align-items-center mb-0">
										<li><a class="me-1" href="javascript:void(0)"><i
												class="ti ti-star text-warning"></i></a></li>
										<li><a class="me-1" href="javascript:void(0)"><i
												class="ti ti-star text-warning"></i></a></li>
										<li><a class="me-1" href="javascript:void(0)"><i
												class="ti ti-star text-warning"></i></a></li>
										<li><a class="me-1" href="javascript:void(0)"><i
												class="ti ti-star text-warning"></i></a></li>
										<li><a href="javascript:void(0)"><i
												class="ti ti-star text-warning"></i></a></li>
									</ul>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</c:otherwise>
		</c:choose>
	</div>
</div>

<script>
$(function() {
	<% if (msg != null) { %>
	Swal.fire({
		title: '${msg} 완료',
		text: '${message}',
		icon: 'success',
		confirmButtonText: '확인'
	});
<% } %>

//가격 포맷팅
$('.formatted-cost').each(function() {
	var cost = parseInt($(this).text(), 10); // 가격을 정수로 변환
	$(this).text(cost.toLocaleString()); // 천 단위로 포맷팅
});

// Enter 키를 눌렀을 때 모달 닫기
$(document).on('keypress', function(e) {
	if (e.which === 13) { // Enter 키 코드
		$('.swal2-modal').hide(); // SweetAlert 모달 닫기
	}
});
});
</script>