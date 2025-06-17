<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
.custom-height {
	height: 250px; 
	display: flex;
	align-items: center; 
	justify-content: center; 
}
.map {
	display: flex;
	justify-content: center;
	align-items: center;
	margin: 0 auto; /* 중앙 정렬을 위해 추가 */
}
</style>

<div class="main-wrapper overflow-hidden">
	<!-- ------------------------------------- -->
	<!-- banner Start -->
	<!-- ------------------------------------- -->
	<section class="bg-primary-subtle custom-height">
		<div class="container-fluid">
			<div class="text-center">
				<p class="text-primary fs-4 fw-bolder">direction</p>
				<h1 class="fw-bolder fs-12">오시는 길</h1>
			</div>
		</div>
	</section>
</div>

<!-- * 카카오맵 - 지도퍼가기 -->
<!-- 1. 지도 노드 -->
<div class="map" style="margin-top:100px;">
<div id="daumRoughmapContainer1730979126347" class="root_daum_roughmap root_daum_roughmap_landing"></div>
</div>
<div style="display: flex; justify-content: center; align-items: center; height: 500px;">
    <img src="${pageContext.request.contextPath}/resources/assets/images/site/map.png" alt="map1"/>
</div>

<!--
	2. 설치 스크립트
	* 지도 퍼가기 서비스를 2개 이상 넣을 경우, 설치 스크립트는 하나만 삽입합니다.
-->
<script charset="UTF-8" class="daum_roughmap_loader_script" src="https://ssl.daumcdn.net/dmaps/map_js_init/roughmapLoader.js"></script>

<!-- 3. 실행 스크립트 -->
<script charset="UTF-8">
	new daum.roughmap.Lander({
		"timestamp" : "1730979126347",
		"key" : "2m6ek",
		"mapWidth" : "1070",
		"mapHeight" : "500"
	}).render();
</script>