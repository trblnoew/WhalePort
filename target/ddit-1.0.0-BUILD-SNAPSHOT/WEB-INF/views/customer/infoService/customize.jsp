<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
.custom-height {
	height: 250px; 
	display: flex;
	align-items: center; 
	justify-content: center; 
}
.image-container {
    display: flex; /* Flexbox 사용 */
    justify-content: center; /* 중앙 정렬 */
    align-items: center; /* 수직 정렬 */
}

.image-wrapper {
    margin: 10px; /* 이미지 간격 조정 */
}
.image-wrapper img {
    transition: transform 0.3s ease, opacity 0.3s ease; /* 부드러운 전환 효과 */

}

.image-wrapper img:hover {
    transform: scale(1.05); /* 이미지 크기 확대 */

}
</style>

<div class="main-wrapper overflow-hidden">
	<!-- ------------------------------------- -->
	<!-- banner Start -->
	<!-- ------------------------------------- -->
	<section class="bg-primary-subtle custom-height">
		<div class="container-fluid">
			<div class="text-center">
				<p class="text-primary fs-4 fw-bolder">customized services</p>
				<h1 class="fw-bolder fs-12">맞춤형 서비스</h1>
			</div>
		</div>
	</section>
</div>

<h4 class="card-title p-4 mb-0" style="font-size: small; text-align: center; margin-top:50px;">
  <i class="ti ti-alert-circle"></i>임산부,어린이,교통약자,반려동물 동반시 공항에서 이용할 수 있는 편의 서비스 및 절차를 안내합니다.</h4>
<div class="image-container" style="margin-top:10px;">
    <div class="image-wrapper">
        <a href="https://www.airport.kr/ap_lp/ko/svc/cusserv/servacc/servacc.do">
            <img src="${pageContext.request.contextPath}/resources/assets/images/site/child.png" alt="child" id="child"/>
        </a>
    </div>
    <div class="image-wrapper">
        <a href="https://www.airport.kr/ap_lp/ko/svc/cusserv/servtra/servtra.do">
            <img src="${pageContext.request.contextPath}/resources/assets/images/site/grand.png" alt="grand" id="grand"/>
        </a>
    </div>
    <div class="image-wrapper">
        <a href="https://www.airport.kr/ap_lp/ko/svc/cusserv/servpet/servpet.do">
            <img src="${pageContext.request.contextPath}/resources/assets/images/site/pet.png" alt="pet" id="pet" />
        </a>
    </div>
</div>
<div style="display: flex; justify-content: center; align-items: center; height: 500px;">
    <img src="${pageContext.request.contextPath}/resources/assets/images/site/qna.png" alt="map1"/>
</div>