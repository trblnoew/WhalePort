<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
	.header {
		    background-color: #eef2ff;
		}
	.dropdown-menu {
	    display: none; /* 기본적으로 숨김 */
	    background-color: #EEF2FF; /* 드롭다운 배경색 */
	/*     border: 1px solid #dee2e6; /* 테두리 색상 (선택 사항) */ */
	    border-radius: 0.25rem; /* 테두리 반경 (선택 사항) */
	}
	
	.nav-item:hover .dropdown-menu {
	    display: block; /* 마우스 오버 시 표시 */
	}
	
	.session-timer {
	    display: flex;
	    align-items: center;
	    justify-content: space-between; /* 양쪽 정렬 */
	    flex-direction: row;            /* 가로 정렬 */
	    gap: 10px;                      /* 간격 조절 */
	}
	
	#elapsed-time {
	    font-size: 16px;
	    text-align: right;
	    margin: 0;
	}
	
	#resetSessionBtn {
	    padding: 5px 10px;
	    font-size: 14px;
	    cursor: pointer;
	}
</style>
<%
    // 세션의 최대 비활성화 시간(초 단위)을 가져옴
    int sessionTimeout = session.getMaxInactiveInterval(); // 초 단위
%>
<header class="header" >
	<nav class="navbar navbar-expand-lg py-0">
		 <div class="container-fluid">
			<!-- 로고 들어갈 부분 -->
				<a class="navbar-brand ms-5 me-0 py-0" href="/customer/main">
					<img src="${pageContext.request.contextPath }/resources/assets/images/logos/headertype-01.png" class="dark-logo" alt="Logo-Dark" style="width: 180px; height: auto;" />
				</a>
				<button class="navbar-toggler d-none" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
					<i class="ti ti-menu-2 fs-9"></i>
				</button>
				<button class="navbar-toggler border-0 p-0 shadow-none" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar" aria-controls="offcanvasNavbar">
					<i class="ti ti-menu-2 fs-9"></i>
				</button>
				<!-- 메뉴 -->
				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav align-items-center mb-2 mb-lg-0 ms-auto">
						
					<!-- 카테고리 -->
					<li class="nav-item dropdown ">
                     		<a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="javascript:void(0)" role="button" aria-expanded="false">
                       		<span>통합예약<i class="ti ti-chevron-down"></i></span>
                     		</a>
                     		<ul class="dropdown-menu">
	                    	<li>
	                        	<a class="dropdown-item" id="dropdown1-tab" href="/customer/reserve" role="tab" data-bs-toggle="tab" aria-controls="dropdown1">항공권</a>
	                        </li>
	                        <li>
	                          	<a class="dropdown-item" id="dropdown2-tab" href="/customer/reserve/parking/list" role="tab" data-bs-toggle="tab" aria-controls="dropdown2">주차장</a>
	                        </li>
	                        <li>
	                          	<a class="dropdown-item" id="dropdown3-tab" href="/customer/reserve/hotel/list" role="tab" data-bs-toggle="tab" aria-controls="dropdown3">캡슐호텔</a>
	                        </li>
	                        <li>
	                          	<a class="dropdown-item" id="dropdown4-tab" href="/customer/reserve/rounge/list" role="tab" data-bs-toggle="tab" aria-controls="dropdown4">라운지</a>
	                        </li>
	                        <li>
	                          	<a class="dropdown-item" id="dropdown5-tab" href="/customer/reserve/meeting/list" role="tab" data-bs-toggle="tab" aria-controls="dropdown5">회의실</a>
	                        </li>
	                    </ul>
              			</li>
					<li class="nav-item dropdown">
	                	<a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="javascript:void(0)" role="button" aria-expanded="false">
	                    	<span>운항정보<i class="ti ti-chevron-down"></i></span>
	                    </a>
	                    <ul class="dropdown-menu">
	                    	<li>
	                        	<a class="dropdown-item" id="dropdown1-tab" href="/customer/flightInfo/departureArrival" role="tab" data-bs-toggle="tab" aria-controls="dropdown1">출발/도착 안내</a>
	                        </li>
	                        <li>
	                          	<a class="dropdown-item" id="dropdown2-tab" href="/customer/flightInfo/schedule" role="tab" data-bs-toggle="tab" aria-controls="dropdown2">운항 스케줄</a>
	                        </li>
	                        <li>
	                          	<a class="dropdown-item" id="dropdown3-tab" href="/customer/flightInfo/boardingSimulation" role="tab" data-bs-toggle="tab" aria-controls="dropdown3">탑승 시뮬레이션</a>
	                        </li>
	                        <li>
	                          	<a class="dropdown-item" id="dropdown4-tab" href="/customer/flightInfo/arrivalSimulation" role="tab" data-bs-toggle="tab" aria-controls="dropdown4">도착 시뮬레이션</a>
	                        </li>
	                        <li>
	                          	<a class="dropdown-item" id="dropdown5-tab" href="/customer/flightInfo/OperatingAirline" role="tab" data-bs-toggle="tab" aria-controls="dropdown5">취항 항공사</a>
	                        </li>
	               		</ul>
	               	</li>
					<li class="nav-item dropdown">
	                	<a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="javascript:void(0)" role="button" aria-expanded="false">
	                        <span>시설정보<i class="ti ti-chevron-down"></i></span>
	                    </a>
                      	<ul class="dropdown-menu">
                        	<li>
                          		<a class="dropdown-item" id="dropdown1-tab" href="/customer/facility/guide" role="tab" data-bs-toggle="tab" aria-controls="dropdown1">안내 · 편의시설</a>
                        	</li>
                        	<li>
                          		<a class="dropdown-item" id="dropdown2-tab" href="/customer/facility/shopping" role="tab" data-bs-toggle="tab" aria-controls="dropdown2">쇼핑 · 면세점</a>
                        	</li>
                        	<li>
                          		<a class="dropdown-item" id="dropdown3-tab" href="/customer/facility/restaurant" role="tab" data-bs-toggle="tab" aria-controls="dropdown3">식당</a>
                        	</li>
                        	<li>
                          		<a class="dropdown-item" id="dropdown4-tab" href="/customer/map/coordinate" role="tab" data-bs-toggle="tab" aria-controls="dropdown4">공항 최적 동선 안내</a>
                        	</li>
                      	</ul>
	               	</li>
					<li class="nav-item dropdown">
	                	<a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="javascript:void(0)" role="button" aria-expanded="false">
	                        <span>교통정보<i class="ti ti-chevron-down"></i></span>
	                    </a>
                        <ul class="dropdown-menu">
                        	<li>
                        		<a class="dropdown-item" id="dropdown1-tab" href="/customer/trafficInfo/direction" role="tab" data-bs-toggle="tab" aria-controls="dropdown1">오시는 길</a>
                        	</li>
                        	<li>
                          		<a class="dropdown-item" id="dropdown2-tab" href="/customer/trafficInfo/parkingInfo" role="tab" data-bs-toggle="tab" aria-controls="dropdown2">주차 안내</a>
                        	</li>
                        	<li>
                          		<a class="dropdown-item" id="dropdown3-tab" href="/customer/trafficInfo/shuttleBus" role="tab" data-bs-toggle="tab" aria-controls="dropdown3">공항 · 셔틀버스</a>
                        	</li>
                        	<li>
                          		<a class="dropdown-item" id="dropdown4-tab" href="/customer/trafficInfo/rentalCar" role="tab" data-bs-toggle="tab" aria-controls="dropdown4">렌터카</a>
                        	</li>
                      	</ul>
	               	</li>
					<li class="nav-item dropdown">
	                	<a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="javascript:void(0)" role="button" aria-expanded="false">
	                    	<span>안내·서비스<i class="ti ti-chevron-down"></i></span>
	                    </a>
	                    <ul class="dropdown-menu">
	                    	<li>
	                        	<a class="dropdown-item" id="dropdown1-tab" href="/customer/qna/list" role="tab" data-bs-toggle="tab" aria-controls="dropdown1">고객센터</a>
	                        </li>
	                        <li>
	                          	<a class="dropdown-item" id="dropdown2-tab" href="/customer/infoService/customize" role="tab" data-bs-toggle="tab" aria-controls="dropdown2">맞춤형 서비스</a>
	                        </li>
	                        <li>
	                          	<a class="dropdown-item" id="dropdown3-tab" href="/customer/infoService/realFly" role="tab" data-bs-toggle="tab" aria-controls="dropdown3">실시간 항공편 추적</a>
	                        </li>
	                        <li>
	                          	<a class="dropdown-item" id="dropdown4-tab" href="/customer/restrictGoods" role="tab" data-bs-toggle="tab" aria-controls="dropdown4">제한물품 조회</a>
	                        </li>
	                        <li>
	                          	<a class="dropdown-item" id="dropdown5-tab" href="/customer/infoService/siteInfo" role="tab" data-bs-toggle="tab" aria-controls="dropdown5">관련 사이트 안내</a>
	                        </li>
	               		</ul>
	               	</li>
					<!-- 마이프로필 -->
					<li class="nav-item ms-2">
						<c:choose>
							<c:when test="${not empty sessionScope.SessionInfo}">
								<li class="nav-item dropdown">
									<a class="nav-link pe-0" href="javascript:void(0)" id="drop1" aria-expanded="false">
										<div class="d-flex align-items-center">
											<div class="user-profile-img">
												<img src="${pageContext.request.contextPath }/resources/assets/images/logos/customerMainProfile.png" class="rounded-circle" width="35" height="35"/>
											</div>
										</div>
									</a>
									<ul class="dropdown-menu">
										<li>
											<a class="dropdown-item" id="dropdown5-tab" href="/customer/myPage" role="tab" data-bs-toggle="tab" aria-controls="dropdown5">마이페이지</a>
										</li>
										<li>
											<form action="/customer/logout" method="post" id="logoutForm">
												<input type="button" value="로그아웃" class="dropdown-item" id="cusLogoutBtn"/>
											</form>
										</li>
									</ul>
								</li>
								<span class="ms-2">${SessionInfo.cusName}님, 환영합니다!</span>&nbsp;&nbsp;&nbsp;&nbsp;
								<div class="session-timer" style="width:160px;">
								    <span id="elapsed-time">남은 시간: </span>
								    <button class="ti ti-reload fs-5" id="reload" style="border:0; background: #eef2ff;" onclick="resetSession()"></button>
								</div>
							</c:when>
							<c:otherwise>
								<button type="button" class="btn btn-primary fs-3 rounded btn-hover-shadow px-3 py-2" id="cusLoginBtn">Login</button>
							</c:otherwise>
						</c:choose>
					</li>
				</ul>
			</div>
		</div>
	</nav>
</header>
<div class="modal fade" id="info-header-modal" tabindex="-1" aria-labelledby="vertical-center-modal" aria-hidden="true">
	<div class="modal-dialog modal-sm">
		<div class="modal-content modal-filled bg-info-subtle">
			<div class="modal-body p-4">
				<div class="text-center text-info">
					<i class="ti ti-info-circle fs-7"></i>
					<h4 class="mt-2">로그아웃 확인</h4>
					<p class="mt-3 mb-0">정말 로그아웃 하시겠습니까?</p>
					<button type="button" class="btn btn-primary my-2" style="margin-right: 10px;" id="logoutBtn">확인</button>
					<button type="button" class="btn btn-light my-2" data-bs-dismiss="modal">취소</button>
				</div>
			</div>
		</div>
	</div>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script>
$(document).ready(function() {
    $('.nav-item.dropdown').hover(
        function() {
            $(this).find('.dropdown-menu').stop(true, true).slideDown(200); // 마우스 오버 시 열기
        },
        function() {
            $(this).find('.dropdown-menu').stop(true, true).slideUp(200); // 마우스 벗어날 시 닫기
        }
    );

    // 드롭다운 메뉴의 클릭 이벤트 활성화
    $('.dropdown-item').on('click', function(event) {
	    // 만약 클릭한 요소가 로그아웃 버튼이라면 이벤트를 무시
	    if ($(this).attr('id') === 'cusLogoutBtn') {
	        return;
	    }
	    // 다른 항목 클릭 시 href로 이동
	    window.location.href = $(this).attr('href');
	});
    
 	// 고객 로그인 버튼 이벤트
    $("#cusLoginBtn").on("click", function(){
    	window.location.href = "/customer/login";
    });
    
    // 고객 로그아웃 이벤트
    $("#cusLogoutBtn").on("click", function(event){
        event.preventDefault(); // 기본 동작을 막음
        $("#info-header-modal").modal('show');
    });
    
    // 고객 로그아웃 모달창 버튼 이벤트
    $("#logoutBtn").on("click", function(){
    	logoutForm.submit();
    });

 	// 세션 타이머 시작
    startSessionTimer();
});

// 세션 타임아웃 시간 설정
var sessionTimeout = <%= sessionTimeout %> * 1000;
var remainingTime = sessionStorage.getItem("remainingTime") ? parseInt(sessionStorage.getItem("remainingTime")) : sessionTimeout;
var timer; // 타이머를 전역 변수 - 리셋 가능하도록

function startSessionTimer() {
    if (timer) clearInterval(timer); // 기존 타이머를 초기화

    timer = setInterval(function() {
        remainingTime -= 1000; // 1초씩 감소
        sessionStorage.setItem("remainingTime", remainingTime); // 남은 시간을 세션 스토리지에 저장

        var minutes = Math.floor(remainingTime / (60 * 1000));
        var seconds = Math.floor((remainingTime % (60 * 1000)) / 1000);

        // 남은 시간 표시
        document.getElementById("elapsed-time").innerHTML = "남은 시간: " + (minutes < 10 ? "0" : "") + minutes + ":" + (seconds < 10 ? "0" : "") + seconds;

        // 시간이 다 되면 타이머를 멈추고 만료 처리
        if (remainingTime <= 0) {
            clearInterval(timer);
            sessionStorage.removeItem("remainingTime"); // 세션 스토리지에서 시간 제거
            alert("세션이 만료되었습니다. 다시 로그인해 주세요.");
            window.location.href = "/customer/login";
        }
    }, 1000); // 1초마다 업데이트
}

// 리셋 버튼 이벤트
function resetSession() {
    $.ajax({
        url: "/customer/resetSession",
        type: 'POST',
        success: function(response) {
            alert("시간이 연장되었습니다.");
            remainingTime = response.newTimeout * 1000; // 새로운 타임아웃 값을 설정
            sessionStorage.setItem("remainingTime", remainingTime); // 세션 스토리지에 새로운 타임아웃 값 저장
            startSessionTimer(); // 타이머 재시작
        },
        error: function(xhr, status, error) {
            alert("시간 연장에 실패했습니다.");
            console.error('Error:', error);
        }
    });
}
</script>