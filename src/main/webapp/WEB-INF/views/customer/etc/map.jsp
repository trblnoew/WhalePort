<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- 스타일 정의 -->
<style>
.custom-height {
    height: 250px; 
    display: flex;
    align-items: center; 
    justify-content: center; 
}
#searchingBox {
    width: 43%; /* 원하는 너비 설정 */
    margin-left: 20px; /* 지도와의 간격 */
}
.map-container {
    display: flex; /* Flexbox 레이아웃 적용 */
    align-items: flex-start; /* 상단 정렬 */
    margin-top: 10px; /* 버튼 그룹과 약간의 간격 */
}
#whaleportMap {
    display: block;
    margin: 20px auto;
    border: 1px solid #ccc;
    cursor: grab; /* 드래그 커서 표시 */
}
.controls {
    text-align: center;
    margin-bottom: 10px;
}
.controls button {
    padding: 10px 20px;
    font-size: 16px;
    margin: 0 5px;
    cursor: pointer;
}
.svg {
	margin: 0 auto;
    width: 70%;
    height: 500px;
    border: 1px solid black;
    background-color: rgb(238, 251, 255);
    fill: rgb(238, 251, 255);
}
.gate {
    stroke-width: 1.5;
}
.store{
    fill: rgb(255, 185, 45);
    stroke: gray;
    stroke-width: 0.5;
}
.chair{
    fill: gainsboro;
    stroke: grey;
    stroke-width: 0.5;
}
.line{

}
.exit{

}
.fabric{
    fill: rgb(155, 83, 24);
    stroke: grey;
    stroke-width: 0.5;
}
.info{
    fill: blueviolet;
}
.gateP{
    fill:black;
}

/* 최단거리 경로 표시 */
.path-animation {
    stroke-dasharray: 1000;
    stroke-dashoffset: 1000;
    animation: dash 2s linear forwards;
}

@keyframes dash {
    to {
        stroke-dashoffset: 0;
    }
}
p{
	margin: 0;
	height: 30px;
}
p:hover{
	background: lightgray;
}
</style>


<div class="main-wrapper overflow-hidden">
	    <!-- ------------------------------------- -->
	    <!-- banner Start -->
	    <!-- ------------------------------------- -->
	    <section class="bg-primary-subtle custom-height">
	        <div class="container-fluid">
	            <div class="text-center">
	                <p class="text-primary fs-4 fw-bolder">WhalePort Map</p>
	                <h1 class="fw-bolder fs-12">공항지도</h1>
	            </div>
	        </div>
	    </section>
	
	    <!-- 확대/축소 버튼 -->
	    <br/>
	    <div style="margin-left: 5%; margin-right: 5%">
		    <div class="btn-group mb-2" role="group" aria-label="Basic example" style="margin-top: 5px;">
		        <button type="button" class="btn btn-outline-dark bg-light-subtle text-black" id="zoomInBtn">확대</button>
		        <button type="button" class="btn btn-outline-dark bg-light-subtle text-black"  id="zoomOutBtn">축소</button>
		        <button type="button" class="btn btn-outline-dark bg-light-subtle text-black"  id="resetViewBtn">원래 크기로</button>
		    </div>
		    
		    <div class="map-container">
	    <!-- SVG 이미지 -->
		<c:choose>
			<c:when test="${xCoor ne null and yCoor ne null}">
			    <svg viewBox="${xCoor - 485 } ${yCoor -40 } 1000 250" class="svg" id="whaleportMap" style="margin: 0">
			</c:when>
			<c:otherwise>
			    <svg viewBox="-200 40 1400 500" class="svg" id="whaleportMap" style="margin: 0">
			</c:otherwise>
		</c:choose>
	
		    <!-- 기준점 -->
		    
		    <!-- Outer walls -->
		    <!-- 수평선 -->
		    <line x1="180" y1="490" x2="340" y2="490" stroke="black" stroke-width="1" class="line"/>
		    <line x1="660" y1="490" x2="820" y2="490" stroke="black" stroke-width="1" class="line"/>
		    <line x1="160" y1="390" x2="440" y2="390" stroke="black" stroke-width="1" class="line"/>
		    <line x1="840" y1="390" x2="560" y2="390" stroke="black" stroke-width="1" class="line"/>
		    <line x1="160" y1="330" x2="440" y2="330" stroke="black" stroke-width="1" class="line"/>
		    <line x1="840" y1="330" x2="560" y2="330" stroke="black" stroke-width="1" class="line"/>
		    <line x1="180" y1="230" x2="460" y2="230" stroke="black" stroke-width="1" class="line"/>
		    <line x1="820" y1="230" x2="540" y2="230" stroke="black" stroke-width="1" class="line"/>
		    <line x1="340" y1="520" x2="660" y2="520" stroke="black" stroke-width="1" class="line"/>
		    <!-- 수직선 -->
		    <line x1="160" y1="390" x2="160" y2="470" stroke="black" stroke-width="1" class="line"/>
		    <line x1="840" y1="390" x2="840" y2="470" stroke="black" stroke-width="1" class="line"/>
		    <line x1="440" y1="390" x2="440" y2="330" stroke="black" stroke-width="1" class="line"/>
		    <line x1="560" y1="390" x2="560" y2="330" stroke="black" stroke-width="1" class="line"/>
		    <line x1="160" y1="330" x2="160" y2="250" stroke="black" stroke-width="1" class="line"/>
		    <line x1="840" y1="330" x2="840" y2="250" stroke="black" stroke-width="1" class="line"/>
		    <line x1="160" y1="330" x2="160" y2="250" stroke="black" stroke-width="1" class="line"/>
		    <line x1="460" y1="230" x2="460" y2="100" stroke="black" stroke-width="1" class="line"/>
		    <line x1="540" y1="230" x2="540" y2="100" stroke="black" stroke-width="1" class="line"/>
		    <line x1="340" y1="490" x2="340" y2="520" stroke="black" stroke-width="1" class="line"/>
		    <line x1="660" y1="490" x2="660" y2="520" stroke="black" stroke-width="1" class="line"/>
		    <!-- 반원 -->
		    <path d="M160 250 A 20 20 0 0 1 180 230" stroke="black" fill="transparent" stroke-width="1" class="line"/>
		    <path d="M160 470 A 20 20 0 0 0 180 490" stroke="black" fill="transparent" stroke-width="1" class="line"/>
		    <path d="M840 470 A 20 20 0 0 1 820 490" stroke="black" fill="transparent" stroke-width="1" class="line"/>
		    <path d="M820 230 A 20 20 0 0 1 840 250" stroke="black" fill="transparent" stroke-width="1" class="line"/>
		    <path d="M460 100 A 20 20 0 0 1 540 100" stroke="black" fill="transparent" stroke-width="1" class="line"/>
		    
		    <!-- gate -->
		
		    <!-- 게이트 입구 -->
		    <circle cx="166" cy="305" r="3" class="gateP"/>
		    <circle cx="166" cy="265" r="3" class="gateP"/>
		    <circle cx="205" cy="235" r="3" class="gateP"/>
		    <circle cx="245" cy="235" r="3" class="gateP"/>
		    <circle cx="285" cy="235" r="3" class="gateP"/>
		    <circle cx="325" cy="235" r="3" class="gateP"/>
		    <circle cx="365" cy="235" r="3" class="gateP"/>
		    <circle cx="405" cy="235" r="3" class="gateP"/>
		    <circle cx="595" cy="235" r="3" class="gateP"/>
		    <circle cx="635" cy="235" r="3" class="gateP"/>
		    <circle cx="675" cy="235" r="3" class="gateP"/>
		    <circle cx="715" cy="235" r="3" class="gateP"/>
		    <circle cx="755" cy="235" r="3" class="gateP"/>
		    <circle cx="795" cy="235" r="3" class="gateP"/>
		    <circle cx="835" cy="305" r="3" class="gateP"/>
		    <circle cx="835" cy="265" r="3" class="gateP"/>
		    <circle cx="465" cy="155" r="3" class="gateP"/>
		    <circle cx="465" cy="115" r="3" class="gateP"/>
		    <circle cx="474" cy="79" r="3" class="gateP"/>
		    <circle cx="500" cy="68" r="3" class="gateP"/>
		    <circle cx="524" cy="77" r="3" class="gateP"/>
		    <circle cx="535" cy="155" r="3" class="gateP"/>
		    <circle cx="535" cy="115" r="3" class="gateP"/>
		
		
		    <!-- 1번 게이트 -->
		    <line x1="160" y1="310" x2="130" y2="310" stroke="black" stroke-width="1" class="gate"/>
		    <line x1="160" y1="300" x2="130" y2="300" stroke="black" stroke-width="1" class="gate"/>
		    <path d="M130 310 A 5 5 0 0 1 130 300" stroke="black" fill="transparent" stroke-width="1" class="gate"/>
		    
		    <!-- 2번 게이트 -->
		    <line x1="160" y1="270" x2="130" y2="270" stroke="black" stroke-width="1" class="gate"/>
		    <line x1="160" y1="260" x2="130" y2="260" stroke="black" stroke-width="1" class="gate"/>
		    <path d="M130 270 A 5 5 0 0 1 130 260" stroke="black" fill="transparent" stroke-width="1" class="gate"/>
		    
		    <!-- 3번 게이트 -->
		    <line x1="200" y1="230" x2="200" y2="200" stroke="black" stroke-width="1" class="gate"/>
		    <line x1="210" y1="230" x2="210" y2="200" stroke="black" stroke-width="1" class="gate"/>
		    <path d="M200 200 A 5 5 0 0 1 210 200" stroke="black" fill="transparent" stroke-width="1" class="gate"/>
		    
		    <!-- 4번 게이트 -->
		    <line x1="240" y1="230" x2="240" y2="200" stroke="black" stroke-width="1" class="gate"/>
		    <line x1="250" y1="230" x2="250" y2="200" stroke="black" stroke-width="1" class="gate"/>
		    <path d="M240 200 A 5 5 0 0 1 250 200" stroke="black" fill="transparent" stroke-width="1" class="gate"/>
		    
		    <!-- 5번 게이트 -->
		    <line x1="280" y1="230" x2="280" y2="200" stroke="black" stroke-width="1" class="gate"/>
		    <line x1="290" y1="230" x2="290" y2="200" stroke="black" stroke-width="1" class="gate"/>
		    <path d="M280 200 A 5 5 0 0 1 290 200" stroke="black" fill="transparent" stroke-width="1" class="gate"/>
		    
		    <!-- 6번 게이트 -->
		    <line x1="330" y1="230" x2="330" y2="200" stroke="black" stroke-width="1" class="gate"/>
		    <line x1="320" y1="230" x2="320" y2="200" stroke="black" stroke-width="1" class="gate"/>
		    <path d="M320 200 A 5 5 0 0 1 330 200" stroke="black" fill="transparent" stroke-width="1" class="gate"/>
		    
		    <!-- 7번 게이트 -->
		    <line x1="370" y1="230" x2="370" y2="200" stroke="black" stroke-width="1" class="gate"/>
		    <line x1="360" y1="230" x2="360" y2="200" stroke="black" stroke-width="1" class="gate"/>
		    <path d="M360 200 A 5 5 0 0 1 370 200" stroke="black" fill="transparent" stroke-width="1" class="gate"/>
		    
		    <!-- 8번 게이트 -->
		    <line x1="410" y1="230" x2="410" y2="200" stroke="black" stroke-width="1" class="gate"/>
		    <line x1="400" y1="230" x2="400" y2="200" stroke="black" stroke-width="1" class="gate"/>
		    <path d="M400 200 A 5 5 0 0 1 410 200" stroke="black" fill="transparent" stroke-width="1" class="gate"/>
		    
		    
		    <!-- 9번 게이트 -->
		    <line x1="430" y1="160" x2="460" y2="160" stroke="black" stroke-width="1" class="gate"/>
		    <line x1="430" y1="150" x2="460" y2="150" stroke="black" stroke-width="1" class="gate"/>
		    <path d="M430 160 A 5 5 0 0 1 430 150" stroke="black" fill="transparent" stroke-width="1" class="gate"/>
		    
		    <!-- 10번 게이트 -->
		    <line x1="430" y1="120" x2="460" y2="120" stroke="black" stroke-width="1" class="gate"/>
		    <line x1="430" y1="110" x2="460" y2="110" stroke="black" stroke-width="1" class="gate"/>
		    <path d="M430 120 A 5 5 0 0 1 430 110" stroke="black" fill="transparent" stroke-width="1" class="gate"/>
		    
		    <!-- 11번 게이트 -->
		    <g transform="rotate(40 500 100)">
		        <line x1="430" y1="105" x2="460" y2="105" stroke="black" stroke-width="1" class="gate"/>
		        <line x1="430" y1="95" x2="460" y2="95" stroke="black" stroke-width="1" class="gate"/>
		        <path d="M430 105 A 5 5 0 0 1 430 95" stroke="black" fill="transparent" stroke-width="1" class="gate"/>
		    </g>
		    
		    <!-- 12번 게이트 -->
		    <g transform="rotate(90 500 100)">
		        <line x1="430" y1="105" x2="460" y2="105" stroke="black" stroke-width="1" class="gate"/>
		        <line x1="430" y1="95" x2="460" y2="95" stroke="black" stroke-width="1" class="gate"/>
		        <path d="M430 105 A 5 5 0 0 1 430 95" stroke="black" fill="transparent" stroke-width="1" class="gate"/>
		    </g>
		    
		    <!-- 13번 게이트 -->
		    <g transform="rotate(135 500 100)">
		        <line x1="430" y1="105" x2="460" y2="105" stroke="black" stroke-width="1" class="gate"/>
		        <line x1="430" y1="95" x2="460" y2="95" stroke="black" stroke-width="1" class="gate"/>
		        <path d="M430 105 A 5 5 0 0 1 430 95" stroke="black" fill="transparent" stroke-width="1" class="gate"/>
		    </g>
		    
		    <!-- 14번 게이트 -->
		    <line x1="570" y1="120" x2="540" y2="120" stroke="black" stroke-width="1" class="gate"/>
		    <line x1="570" y1="110" x2="540" y2="110" stroke="black" stroke-width="1" class="gate"/>
		    <path d="M570 110 A 5 5 0 0 1 570 120" stroke="black" fill="transparent" stroke-width="1" class="gate"/>
		    
		    <!-- 15번 게이트 -->
		    <line x1="570" y1="160" x2="540" y2="160" stroke="black" stroke-width="1" class="gate"/>
		    <line x1="570" y1="150" x2="540" y2="150" stroke="black" stroke-width="1" class="gate"/>
		    <path d="M570 150 A 5 5 0 0 1 570 160" stroke="black" fill="transparent" stroke-width="1" class="gate"/>
		    
		    <!-- 16번 게이트 -->
		    <line x1="590" y1="230" x2="590" y2="200" stroke="black" stroke-width="1" class="gate"/>
		    <line x1="600" y1="230" x2="600" y2="200" stroke="black" stroke-width="1" class="gate"/>
		    <path d="M590 200 A 5 5 0 0 1 600 200" stroke="black" fill="transparent" stroke-width="1" class="gate"/>
		    
		    <!-- 17번 게이트 -->
		    <line x1="630" y1="230" x2="630" y2="200" stroke="black" stroke-width="1" class="gate"/>
		    <line x1="640" y1="230" x2="640" y2="200" stroke="black" stroke-width="1" class="gate"/>
		    <path d="M630 200 A 5 5 0 0 1 640 200" stroke="black" fill="transparent" stroke-width="1" class="gate"/>
		    
		    <!-- 18번 게이트 -->
		    <line x1="670" y1="230" x2="670" y2="200" stroke="black" stroke-width="1" class="gate"/>
		    <line x1="680" y1="230" x2="680" y2="200" stroke="black" stroke-width="1" class="gate"/>
		    <path d="M670 200 A 5 5 0 0 1 680 200" stroke="black" fill="transparent" stroke-width="1" class="gate"/>
		    
		    <!-- 19번 게이트 -->
		    <line x1="720" y1="230" x2="720" y2="200" stroke="black" stroke-width="1" class="gate"/>
		    <line x1="710" y1="230" x2="710" y2="200" stroke="black" stroke-width="1" class="gate"/>
		    <path d="M710 200 A 5 5 0 0 1 720 200" stroke="black" fill="transparent" stroke-width="1" class="gate"/>
		    
		    <!-- 20번 게이트 -->
		    <line x1="760" y1="230" x2="760" y2="200" stroke="black" stroke-width="1" class="gate"/>
		    <line x1="750" y1="230" x2="750" y2="200" stroke="black" stroke-width="1" class="gate"/>
		    <path d="M750 200 A 5 5 0 0 1 760 200" stroke="black" fill="transparent" stroke-width="1" class="gate"/>
		    
		    <!-- 21번 게이트 -->
		    <line x1="800" y1="230" x2="800" y2="200" stroke="black" stroke-width="1" class="gate"/>
		    <line x1="790" y1="230" x2="790" y2="200" stroke="black" stroke-width="1" class="gate"/>
		    <path d="M790 200 A 5 5 0 0 1 800 200" stroke="black" fill="transparent" stroke-width="1" class="gate"/>
		    
		    <!-- 22번 게이트 -->
		    <line x1="840" y1="270" x2="870" y2="270" stroke="black" stroke-width="1" class="gate"/>
		    <line x1="840" y1="260" x2="870" y2="260" stroke="black" stroke-width="1" class="gate"/>
		    <path d="M870 260 A 5 5 0 0 1 870 270" stroke="black" fill="transparent" stroke-width="1" class="gate"/>
		    
		    <!-- 23번 게이트 -->
		    <line x1="840" y1="310" x2="870" y2="310" stroke="black" stroke-width="1" class="gate"/>
		    <line x1="840" y1="300" x2="870" y2="300" stroke="black" stroke-width="1" class="gate"/>
		    <path d="M870 300 A 5 5 0 0 1 870 310" stroke="black" fill="transparent" stroke-width="1" class="gate"/>
		    
		    <!-- 면세위치 입/출구 -->
		    <rect x="370" y="480" width="10" height="50" fill="gray" stroke="gray" stroke-width="1" class="exit"/>
		    <rect x="400" y="480" width="10" height="50" fill="gray" stroke="gray" stroke-width="1" class="exit"/>
		    <rect x="430" y="480" width="10" height="50" fill="gray" stroke="gray" stroke-width="1" class="exit"/>
		    <rect x="460" y="480" width="10" height="50" fill="gray" stroke="gray" stroke-width="1" class="exit"/>
		    <rect x="490" y="480" width="10" height="50" fill="gray" stroke="gray" stroke-width="1" class="exit"/>
		    <rect x="520" y="480" width="10" height="50" fill="gray" stroke="gray" stroke-width="1" class="exit"/>
		    <rect x="550" y="480" width="10" height="50" fill="gray" stroke="gray" stroke-width="1" class="exit"/>
		    <rect x="580" y="480" width="10" height="50" fill="gray" stroke="gray" stroke-width="1" class="exit"/>
		    <rect x="610" y="480" width="10" height="50" fill="gray" stroke="gray" stroke-width="1" class="exit"/>
		
		
		    <!-- 스토어 (좌->우 / 하->상)-->
		    <rect x="190" y="470" width="40" height="15" stroke-width="1" class="store"/>
		    <rect x="240" y="470" width="25" height="15" stroke-width="1" class="store"/>
		    <rect x="280" y="470" width="50" height="15" stroke-width="1" class="store"/>
		    <rect x="670" y="470" width="20" height="15" stroke-width="1" class="store"/>
		    <rect x="705" y="470" width="40" height="15" stroke-width="1" class="store"/>
		    <rect x="775" y="470" width="40" height="15" stroke-width="1" class="store"/>
		    <rect x="170" y="400" width="20" height="55" stroke-width="1" class="store"/>
		    <rect x="820" y="430" width="10" height="30" stroke-width="1" class="store"/>
		    <rect x="210" y="395" width="40" height="12" stroke-width="1" class="store"/>
		    <rect x="270" y="395" width="25" height="12" stroke-width="1" class="store"/>
		
		    <rect x="310" y="395" width="50" height="12" stroke-width="1" class="store"/>
		    <rect x="660" y="395" width="40" height="15" stroke-width="1" class="store"/>
		    <rect x="720" y="395" width="25" height="15" stroke-width="1" class="store"/>
		    <rect x="760" y="395" width="50" height="15" stroke-width="1" class="store"/>
		    <rect x="210" y="310" width="30" height="15" stroke-width="1" class="store"/>
		    <rect x="270" y="310" width="45" height="15" stroke-width="1" class="store"/>
		    <rect x="340" y="310" width="30" height="15" stroke-width="1" class="store"/>
		    <rect x="610" y="310" width="70" height="15" stroke-width="1" class="store"/>
		    <rect x="705" y="310" width="40" height="15" stroke-width="1" class="store"/>
		    <rect x="775" y="310" width="30" height="15" stroke-width="1" class="store"/>
		
		    <rect x="210" y="260" width="40" height="12" stroke-width="1" class="store"/>
		    <rect x="270" y="260" width="25" height="12" stroke-width="1" class="store"/>
		    <rect x="310" y="260" width="50" height="12" stroke-width="1" class="store"/>
		    <rect x="420" y="260" width="30" height="12" stroke-width="1" class="store"/>
		    <rect x="650" y="260" width="40" height="15" stroke-width="1" class="store"/>
		    <rect x="710" y="260" width="25" height="15" stroke-width="1" class="store"/>
		    <rect x="750" y="260" width="50" height="15" stroke-width="1" class="store"/>
		
		
		
		    <!-- fabric(갈색 구조물) (좌->우 / 하->상)-->
		    <rect x="380" y="395" width="10" height="8" stroke-width="1" class="fabric"/>
		    <rect x="400" y="395" width="10" height="8" stroke-width="1" class="fabric"/>
		    <rect x="420" y="395" width="10" height="8" stroke-width="1" class="fabric"/>
		    <rect x="385" y="317" width="45" height="8" stroke-width="1" class="fabric"/>
		
		    <!-- 체어 (좌->우 / 하->상)-->
		    <circle cx="500" cy="430" r="25" stroke="black" stroke-width="1" class="chair"/>
		    <rect x="680" y="455" width="40" height="5" stroke-width="1" class="chair"/>
		    <rect x="740" y="455" width="60" height="5" stroke-width="1" class="chair"/>
		    <rect x="220" y="410" width="70" height="5" stroke-width="1" class="chair"/>
		    <rect x="300" y="410" width="50" height="5" stroke-width="1" class="chair"/>
		    <rect x="220" y="300" width="70" height="5" stroke-width="1" class="chair"/>
		    <rect x="725" y="300" width="60" height="5" stroke-width="1" class="chair"/>
		    <rect x="492" y="90" width="16" height="130" stroke-width="1" class="chair"/>
		    
		    
		    
		
		    <!-- 원형 구조물 (좌->우 / 하->상)-->
		
		    <!-- 안내 데스크 -->
		    <rect x="570" y="395" width="4" height="15" stroke-width="1" class="info"/>
		    <rect x="570" y="407" width="70" height="4" stroke-width="1" class="info"/>
		    <circle cx="500" cy="285" r="20" class="info"/>
		    <circle cx="500" cy="285" r="15" class="svg"/>
		
		
		    <!-- 편의시설 -->
		
		    <!--  -->
		    <c:if test="${xCoor ne null and yCoor ne null}">
			    <image href="${pageContext.request.contextPath}/resources/assets/images/airport/free-icon-location-pin-2776067.png" width="30px" x="${xCoor - 15}" y="${yCoor - 25 }" id="mapIcon" />
		    </c:if>
		    
			</svg>
			<div id="searchingBox">
				<div class="card">
					<div class="card-body">
						<table>
							<tr>
								<td>
									<input type="text" class="form-control" placeholder="출발지를 입력하세요..." id="arrivalInput">
								</td>
								<td>
									<input type="text" class="form-control" placeholder="도착지를 입력하세요..." id="departureInput">
								</td>
								<td>
									<button class="btn btn-primary" id="searchBtn">검색</button>
								</td>
							</tr>
							<tr>
								<td>
									<div class="position-relative mt-3 p-3 border overflow-auto" style="height: 380px" data-bs-spy="scroll" id="arrivalList">
										<c:forEach items="${partnerList }" var="store">
											<p class="arrivalStore" data-ptNo="${store.ptNo }" data-xPos="${store.ptXpos }" data-yPos="${store.ptYpos }">${store.ptName }</p>
										</c:forEach>
										<c:forEach items="${pointList }" var="point">
											<p class="arrivalStore" data-ptNo="${point.pointNo }" data-xPos="${point.pointX }" data-yPos="${point.pointY }">${point.pointName }</p>
										</c:forEach>
									</div>
								</td>
								<td>
									<div class="position-relative mt-3 p-3 border overflow-auto" style="height: 380px" data-bs-spy="scroll" id="departureList">
										<c:forEach items="${partnerList }" var="store">
											<p class="departureStore" data-ptNo="${store.ptNo }" data-xPos="${store.ptXpos }" data-yPos="${store.ptYpos }">${store.ptName }</p>
										</c:forEach>
										<c:forEach items="${pointList }" var="point">
											<p class="departureStore" data-ptNo="${point.pointNo }" data-xPos="${point.pointX }" data-yPos="${point.pointY }">${point.pointName }</p>
										</c:forEach>
									</div>
								</td>
								<td></td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		 </div>
	</div>
</div>

<!-- JavaScript 코드 -->
<!-- <script>
$(document).ready(function() {
    const whaleportMap = $('#whaleportMap');
    const originalViewBox = whaleportMap.attr('viewBox');
    const minZoomLevel = -2; // 최소 줌 레벨
    const maxZoomLevel = 4;  // 최대 줌 레벨
    let currentZoom = 0;     // 현재 줌 레벨
    const zoomFactor = 1.4;  // 확대/축소 비율
    
    // map-icon 깜빡이기
	var mapInterval = setInterval(() => {
	    $("#mapIcon").toggle();
	}, 300);
    // map-icon 깜빡임 횟수 제어
    setTimeout(() => {
    	clearTimeout(mapInterval);
    }, 2000);

    // 줌 인 함수
    function zoomIn() {
        if (currentZoom < maxZoomLevel) {
            applyZoom(1 / zoomFactor);
            currentZoom++;
        }
    }

    // 줌 아웃 함수
    function zoomOut() {
        if (currentZoom > minZoomLevel) {
            applyZoom(zoomFactor);
            currentZoom--;
        }
    }

    // 줌 적용 함수
    function applyZoom(scale) {
        const viewBox = $("#whaleportMap").attr('viewBox').split(' ').map(Number);
        const [x, y, width, height] = viewBox;

        // 중앙을 기준으로 확대/축소된 새로운 viewBox 계산
        const newWidth = width * scale;
        const newHeight = height * scale;
        const newX = x + (width - newWidth) / 2;
        const newY = y + (height - newHeight) / 2;
        
        $("#whaleportMap").attr('viewBox', `\${newX} \${newY} \${newWidth} \${newHeight}`);
    }

    // 뷰 초기화 함수
    function resetView() {
        whaleportMap.attr('viewBox', originalViewBox);
        $("#whaleportMap").attr('viewBox', '-500 0 2000 500');
        currentZoom = 0;
    }

    // 버튼 이벤트 바인딩
    $('#zoomInBtn').click(zoomIn);
    $('#zoomOutBtn').click(zoomOut);
    $('#resetViewBtn').click(resetView);


    // 마우스 눌렀을 때 패닝 시작
    whaleportMap.on('mousedown', function(event) {
        isPanning = true;
        startPoint = { x: event.clientX, y: event.clientY };
        startViewBox = whaleportMap.attr('viewBox').split(' ').map(Number);
        whaleportMap.css('cursor', 'grabbing');
    });

    // 마우스 이동 중 패닝
    $(document).on('mousemove', function(event) {
        if (!isPanning) return;

        event.preventDefault();
        const dx = (startPoint.x - event.clientX) * (startViewBox[2] / whaleportMap.width());
        const dy = (startPoint.y - event.clientY) * (startViewBox[3] / whaleportMap.height());

        const [x, y, width, height] = startViewBox;
        whaleportMap.attr('viewBox', `\${x + dx} \${y + dy} \${width} \${height}`);
        
    });

    // 마우스 놓거나 벗어났을 때 패닝 종료
    $(document).on('mouseup mouseleave', function() {
        if (isPanning) {
            isPanning = false;
            whaleportMap.css('cursor', 'grab');
        }
    });
    
    
    
    
    
    /* 최단거리 알고리즘 */
    
    
    
    
}); 
</script>
-->

<!-- JavaScript 코드 -->
<script>
$(document).ready(function() {
    const whaleportMap = $('#whaleportMap');
    const originalViewBox = whaleportMap.attr('viewBox');
    const minZoomLevel = -2; // 최소 줌 레벨
    const maxZoomLevel = 4;  // 최대 줌 레벨
    let currentZoom = 0;     // 현재 줌 레벨
    const zoomFactor = 1.4;  // 확대/축소 비율
    let departurePtNo = "";
    let arrivalXpos = "";
	let arrivalYpos = "";
	let departureXpos = "";
	let departureYpos = "";
    
    
    // 검색버튼 눌렀을 때 최단거리 표시하기

    
    // 출발지 검색 리스트 클릭 시 자동완성
    $(".arrivalStore").on("click", function(){
    	let arrivalStore = $(this).text();
    	let arrivalPtNo = $(this).attr('data-ptNo');
    	arrivalXpos = $(this).attr('data-xPos');
    	arrivalYpos = $(this).attr('data-yPos');
    	$("#arrivalInput").attr('data-ptNo', arrivalPtNo);
    	$("#arrivalInput").attr('data-xPos', arrivalXpos);
    	$("#arrivalInput").attr('data-yPos', arrivalYpos);
    	$("#arrivalInput").val(arrivalStore);
    });
    
 	// 도착지 검색 리스트 클릭 시 자동완성
    $(".departureStore").on("click", function(){
    	let departureStore = $(this).text();
    	departurePtNo = $(this).attr('data-ptNo');
    	departureXpos = $(this).attr('data-xPos');
    	departureYpos = $(this).attr('data-yPos');
    	$("#departureInput").attr('data-ptNo', departurePtNo); 
    	$("#arrivalInput").attr('data-xPos', departureXpos);
    	$("#arrivalInput").attr('data-yPos', departureYpos);
    	$("#departureInput").val(departureStore);
    });
 	
 	// 출발지 검색 자동 필터링
    $("#arrivalInput").on("keyup", function() {
        let value = $(this).val().toLowerCase();
        $("#arrivalList p").each(function() {
            if ($(this).text().toLowerCase().includes(value)) {
                $(this).show();
            } else {
                $(this).hide();
            }
        });
    });

    // 도착지 검색 자동 필터링
    $("#departureInput").on("keyup", function() {
        let value = $(this).val().toLowerCase();
        $("#departureList p").each(function() {
            if ($(this).text().toLowerCase().includes(value)) {
                $(this).show();
            } else {
                $(this).hide();
            }
        });
    });
 	
    
	
    

	
    

//     // edges 객체에 'departure'와 'arrival' 추가
//     edges['departure'] = [departureNearest];
//     edges['arrival'] = [arrivalNearest];

//     // 가장 가까운 노드에서 'departure'와 'arrival'을 추가
//     if (edges[departureNearest]) {
//         edges[departureNearest].push('departure');
//     } else {
//         edges[departureNearest] = ['departure'];
//     }

//     if (edges[arrivalNearest]) {
//         edges[arrivalNearest].push('arrival');
//     } else {
//         edges[arrivalNearest] = ['arrival'];
//     }
    
    
    
    
    
    // map-icon 깜빡이기
    var mapInterval = setInterval(() => {
        $("#mapIcon").toggle();
    }, 300);
    // map-icon 깜빡임 횟수 제어
    setTimeout(() => {
    	clearInterval(mapInterval);
    }, 2000);

    // 줌 인 함수
    function zoomIn() {
        if (currentZoom < maxZoomLevel) {
            applyZoom(1 / zoomFactor);
            currentZoom++;
        }
    }

    // 줌 아웃 함수
    function zoomOut() {
        if (currentZoom > minZoomLevel) {
            applyZoom(zoomFactor);
            currentZoom--;
        }
    }

    // 줌 적용 함수
    function applyZoom(scale) {
        const viewBox = $("#whaleportMap").attr('viewBox').split(' ').map(Number);
        const [x, y, width, height] = viewBox;

        // 중앙을 기준으로 확대/축소된 새로운 viewBox 계산
        const newWidth = width * scale;
        const newHeight = height * scale;
        const newX = x + (width - newWidth) / 2;
        const newY = y + (height - newHeight) / 2;
        
        $("#whaleportMap").attr('viewBox', `\${newX} \${newY} \${newWidth} \${newHeight}`);
    }

    // 뷰 초기화 함수
    function resetView() {
        whaleportMap.attr('viewBox', originalViewBox);
        $("#whaleportMap").attr('viewBox', '-200 40 1400 500');
        currentZoom = 0;
    }

    // 버튼 이벤트 바인딩
    $('#zoomInBtn').click(zoomIn);
    $('#zoomOutBtn').click(zoomOut);
    $('#resetViewBtn').click(resetView);

    let isPanning = false;
    let startPoint = { x: 0, y: 0 };
    let startViewBox = [0, 0, 0, 0];

    // 마우스 눌렀을 때 패닝 시작
    whaleportMap.on('mousedown', function(event) {
        isPanning = true;
        startPoint = { x: event.clientX, y: event.clientY };
        startViewBox = whaleportMap.attr('viewBox').split(' ').map(Number);
        whaleportMap.css('cursor', 'grabbing');
    });

    // 마우스 이동 중 패닝
    $(document).on('mousemove', function(event) {
        if (!isPanning) return;

        event.preventDefault();
        const dx = (startPoint.x - event.clientX) * (startViewBox[2] / whaleportMap.width());
        const dy = (startPoint.y - event.clientY) * (startViewBox[3] / whaleportMap.height());

        const [x, y, width, height] = startViewBox;
        whaleportMap.attr('viewBox', `\${x + dx} \${y + dy} \${width} \${height}`);
        
    });

    // 마우스 놓거나 벗어났을 때 패닝 종료
    $(document).on('mouseup mouseleave', function() {
        if (isPanning) {
            isPanning = false;
            whaleportMap.css('cursor', 'grab');
        }
    });
    
    /* 최단거리 알고리즘 */
    var nodes = {
    // A1 ~ A9
    'A1': {x: 210, y: 460},
    'A2': {x: 243, y: 460},
    'A3': {x: 263, y: 460},
    'A4': {x: 295, y: 460},
    'A5': {x: 325, y: 460},
    'A6': {x: 375, y: 460},
    'A7': {x: 405, y: 460},
    'A8': {x: 435, y: 460},
    'A9': {x: 465, y: 460},
    'A10': {x: 495, y: 460},
    'A11': {x: 525, y: 460},
    'A12': {x: 555, y: 460},
    'A13': {x: 585, y: 460},
    'A14': {x: 615, y: 460},

    // B1 ~ B18
    'B1': {x: 210, y: 430},
    'B2': {x: 243, y: 430},
    'B3': {x: 263, y: 430},
    'B4': {x: 295, y: 430},
    'B5': {x: 325, y: 430},
    'B6': {x: 357, y: 430},
    'B7': {x: 375, y: 430},
    'B8': {x: 405, y: 430},
    'B9': {x: 435, y: 430},
    'B10': {x: 463, y: 430},
    'B11': {x: 545, y: 430},
    'B12': {x: 555, y: 430},
    'B13': {x: 585, y: 430},
    'B14': {x: 615, y: 430},
    'B15': {x: 675, y: 430},
    'B16': {x: 696, y: 430},
    'B17': {x: 732, y: 430},
    'B18': {x: 766, y: 430},
    'B19': {x: 805, y: 430},

    // C1 ~ C2
    'C1': {x: 463, y: 360},
    'C2': {x: 545, y: 360},
    'C3': {x: 463, y: 400},
    'C4': {x: 545, y: 400},

    // D1 ~ D22
    'D1': {x: 195, y: 285},
    'D2': {x: 215, y: 285},
    'D3': {x: 245, y: 285},
    'D4': {x: 260, y: 285},
    'D5': {x: 275, y: 285},
    'D6': {x: 304, y: 285},
    'D7': {x: 345, y: 285},
    'D8': {x: 367, y: 285},
    'D9': {x: 405, y: 285},
    'D10': {x: 425, y: 285},
    'D11': {x: 447, y: 285},
    'D12': {x: 463, y: 285},
    'D13': {x: 545, y: 285},
    'D14': {x: 595, y: 285},
    'D15': {x: 635, y: 285},
    'D16': {x: 655, y: 285},
    'D17': {x: 675, y: 285},
    'D18': {x: 700, y: 285},
    'D19': {x: 715, y: 285},
    'D20': {x: 742, y: 285},
    'D21': {x: 755, y: 285},
    'D22': {x: 795, y: 285},
    'D23': {x: 815, y: 285},

    // G1 ~ G30
    'G1': {x: 195, y: 305},
    'G2': {x: 195, y: 265},
    'G3': {x: 195, y: 250},
    'G4': {x: 205, y: 250},
    'G5': {x: 245, y: 250},
    'G6': {x: 260, y: 250},
    'G7': {x: 285, y: 250},
    'G8': {x: 302, y: 250},
    'G9': {x: 325, y: 250},
    'G10': {x: 365, y: 250},
    'G11': {x: 405, y: 250},
    'G12': {x: 480, y: 250},
    'G13': {x: 480, y: 155},
    'G14': {x: 480, y: 115},
    'G15': {x: 485, y: 89},
    'G16': {x: 500, y: 80},
    'G17': {x: 515, y: 89},
    'G18': {x: 520, y: 115},
    'G19': {x: 520, y: 155},
    'G20': {x: 520, y: 250},
    'G21': {x: 595, y: 250},
    'G22': {x: 635, y: 250},
    'G23': {x: 675, y: 250},
    'G24': {x: 700, y: 250},
    'G25': {x: 715, y: 250},
    'G26': {x: 742, y: 250},
    'G27': {x: 755, y: 250},
    'G28': {x: 795, y: 250},
    'G29': {x: 815, y: 250},
    'G30': {x: 815, y: 265},
    'G31': {x: 815, y: 305}
};
    // 엣지 정의
var edges = {
    // A1 ~ A9
    'A1': ['A2', 'B1'],
    'A2': ['A1', 'A3', 'B2'],
    'A3': ['A2', 'B3', 'A4'],
    'A4': ['A3', 'B4', 'A5'],
    'A5': ['A4', 'A6', 'B5'],
    'A6': ['A5', 'B7', 'A7'],
    'A7': ['A6', 'B8', 'A8'],
    'A8': ['A7', 'B9', 'A9'],
    'A9': ['A8', 'B10', 'A10'],
    'A10': ['A9', 'A11'],
    'A11': ['A10', 'B11', 'A12'],
    'A12': ['A11', 'B12', 'A13'],
    'A13': ['A12', 'B13', 'A14'],
    'A14': ['A13', 'B14'],

    // B1 ~ B18
    'B1': ['A1', 'B2'],
    'B2': ['B1', 'A2', 'B3'],
    'B3': ['B2', 'B4', 'A3'],
    'B4': ['B3', 'B5', 'A4'],
    'B5': ['B4', 'B6', 'A5'],
    'B6': ['B5', 'B7'],
    'B7': ['B6', 'B8', 'A6'],
    'B8': ['B7', 'B9', 'A7'],
    'B9': ['B8', 'B10', 'A8'],
    'B10': ['B9', 'A9', 'C3'],
    'B11': ['A11', 'C4', 'B12'],
    'B12': ['B11', 'B13', 'A12'],
    'B13': ['B12', 'B14', 'A13'],
    'B14': ['B13', 'B15', 'A14'],
    'B15': ['B14', 'B16'],
    'B16': ['B15', 'B17'],
    'B17': ['B16', 'B18'],
    'B18': ['B17', 'B19'],
    'B19': ['B18'],

    // C1 ~ C2
    'C1': ['D12', 'C2', 'C3'],
    'C2': ['C1', 'D13', 'C4'],
    'C3': ['C1', 'B10', 'C4'],
    'C4': ['C3', 'C2', 'B11'],

    // D1 ~ D22
    'D1': ['G1', 'G2', 'D2'],
    'D2': ['D1', 'D3'],
    'D3': ['D2', 'D4'],
    'D4': ['D3', 'D5', 'G6'],
    'D5': ['D4', 'D6'],
    'D6': ['D5', 'D7', 'G8'],
    'D7': ['D6', 'D8'],
    'D8': ['D7', 'D9', 'G10'],
    'D9': ['D8', 'D10', 'D11'],
    'D10': ['D9', 'D11'],
    'D11': ['D10', 'D12'],
    'D12': ['D11', 'G12', 'C1'],
    'D13': ['G20', 'C2', 'D14'],
    'D14': ['D13', 'D15', 'G21'],
    'D15': ['D14', 'D16', 'G22'],
    'D16': ['D15', 'D17'],
    'D17': ['D16', 'D18'],
    'D18': ['D17', 'D19', 'G24'],
    'D19': ['D18', 'D20'],
    'D20': ['D19', 'D21', 'G26'],
    'D21': ['D20', 'D22'],
    'D22': ['D21', 'D23'],
    'D23': ['D22', 'G30', 'G31'],

    // G1 ~ G30
    'G1': ['D1'],
    'G2': ['D1', 'G3'],
    'G3': ['G2', 'G4'],
    'G4': ['G3', 'G5'],
    'G5': ['G4', 'G6'],
    'G6': ['G5', 'G7', 'D4'],
    'G7': ['G6', 'G8'],
    'G8': ['G7', 'G9', 'D6'],
    'G9': ['G8', 'G10'],
    'G10': ['G9', 'G11'],
    'G11': ['G10', 'D9', 'G12'],
    'G12': ['G11', 'G20', 'G13', 'D12'],
    'G13': ['G12', 'G14'],
    'G14': ['G13', 'G15'],
    'G15': ['G14', 'G16'],
    'G16': ['G15', 'G17'],
    'G17': ['G16', 'G18'],
    'G18': ['G17', 'G19'],
    'G19': ['G18', 'G20'],
    'G20': ['G12', 'G19', 'D13', 'G21'],
    'G21': ['G20', 'D14', 'G22'],
    'G22': ['G21', 'D15', 'G23'],
    'G23': ['G22', 'G24'],
    'G24': ['G23', 'D18', 'G25'],
    'G25': ['G24', 'G26'],
    'G26': ['G25', 'D20', 'G27'],
    'G27': ['G26', 'G28'],
    'G28': ['G27', 'G29'],
    'G29': ['G28', 'G30'],
    'G30': ['G29', 'D23'],
    'G31': ['D23']
};
    
    $("#searchBtn").on("click", function(){
    	
    	whaleportMap.find('.path-animation').remove();
    	
    	let currentNodes = JSON.parse(JSON.stringify(nodes));
        let currentEdges = JSON.parse(JSON.stringify(edges));
    	
    	//출발지 좌표(동적으로 작동하도록 수정해야함)
    	let departure = {
    		    'departure': {x: arrivalXpos, y: arrivalYpos}
    	};
    	
    	//	도착지 좌표(동적으로 작동하도록 수정해야함)
    	let arrival = {
    		    'arrival': {x: departureXpos, y: departureYpos}
    	};
        
    	    
    	//출발지에서 가장 가까운 노드 찾기
    	var nearestDepartureNode = findNearestNode(departure.departure.x, departure.departure.y, currentNodes);
    	
    	// 도착지에서 가장 가까운 노드 찾기
    	var nearestArrivalNode = findNearestNode(arrival.arrival.x, arrival.arrival.y, currentNodes);
    	
    	// edges 객체에 'departure'와 'arrival' 추가
    	currentEdges['departure'] = [nearestDepartureNode];
    	currentEdges['arrival'] = [nearestArrivalNode];
    	
    	// 기존의 객체에 departure와 arrival을 추가
    	currentEdges[nearestDepartureNode].push('departure');
    	currentEdges[nearestArrivalNode].push('arrival');
    	
    	// 노드 추가
    	Object.assign(currentNodes, departure, arrival);
        
    	

        // 가중치 그래프 생성
        var graph = {};
        for (var node in currentEdges) {
            graph[node] = {};
            currentEdges[node].forEach(function(neighbor) {
                graph[node][neighbor] = dist(node, neighbor);
            });
        }
        
        
        // 최단거리 출발 도착 지정하기
        // 최단거리 출발 도착 지정하기
        // 최단거리 출발 도착 지정하기
        // 최단거리 출발 도착 지정하기
        var shortestPath = dijkstra(graph, 'departure', 'arrival');
        
        

        // 최단 경로 그리기
        var pathData = '';
        for (var i = 0; i < shortestPath.length; i++) {
            var node = shortestPath[i];
            if (i === 0) {
                pathData += 'M' + currentNodes[node].x + ' ' + currentNodes[node].y;
            } else {
                pathData += ' L' + currentNodes[node].x + ' ' + currentNodes[node].y;
            }
        }

        var path = $(document.createElementNS('http://www.w3.org/2000/svg', 'path'));
        path.attr({
            d: pathData,
            stroke: 'red',
            'stroke-width': 3,
            fill: 'none',
            class: 'path-animation'
        });
        whaleportMap.append(path);

        // 경로의 총 길이 계산 및 CSS 속성 설정
        var totalLength = path[0].getTotalLength();
        path.css({
            'stroke-dasharray': totalLength,
            'stroke-dashoffset': totalLength
        });
        
        
        console.log(departurePtNo);
        $.ajax({
	    	url: "/customer/map/count",
	    	type: "post",
	    	data: {ptNo : departurePtNo}
	    });
        
        
        
	 	// 두 노드 사이의 거리 계산
	    function dist(a, b) {
	        var dx = currentNodes[a].x - currentNodes[b].x;
	        var dy = currentNodes[a].y - currentNodes[b].y;
	        return Math.hypot(dx, dy);
	    }
	    
	    
		// 다익스트라 알고리즘 함수
	    function dijkstra(graph, start, end) {
	        var distances = {};
	        var prev = {};
	        var nodesSet = new Set();
	
	        for (var node in graph) {
	            distances[node] = Infinity;
	            prev[node] = null;
	            nodesSet.add(node);
	        }
	
	        distances[start] = 0;
	
	        while (nodesSet.size > 0) {
	            var minNode = null;
	            nodesSet.forEach(function(node) {
	                if (minNode === null || distances[node] < distances[minNode]) {
	                    minNode = node;
	                }
	            });
	
	            if (minNode === end) break;
	            nodesSet.delete(minNode);
	
	            for (var neighbor in graph[minNode]) {
	                var alt = distances[minNode] + graph[minNode][neighbor];
	                if (alt < distances[neighbor]) {
	                    distances[neighbor] = alt;
	                    prev[neighbor] = minNode;
	                }
	            }
	        }
	
	        var path = [];
	        var u = end;
	        while (prev[u]) {
	            path.unshift(u);
	            u = prev[u];
	        }
	        if (u === start) path.unshift(u);
	        return path;
	    }
	    
	    
	    // 가장 가까운 노드 찾기(출발점에서)
	    function findNearestNode(x, y, nodes) {
		    let nearestNode = null;
		    let minDistance = Infinity;
	
		    for (let node in nodes) {
		        if (nodes.hasOwnProperty(node)) {
		            let nodeX = currentNodes[node].x;
		            let nodeY = currentNodes[node].y;
		            let distance = Math.hypot(x - nodeX, y - nodeY); // 유클리드 거리 계산
		
		            if (distance < minDistance) {
		                minDistance = distance;
		                nearestNode = node;
		            }
		        }
		    }
		
		    return nearestNode;
		}
	    
    });
    
	
    
    
});
</script>
