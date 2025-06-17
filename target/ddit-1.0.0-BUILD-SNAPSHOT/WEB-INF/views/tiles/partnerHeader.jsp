<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@ page import="kr.or.ddit.partner.common.account.vo.PartnerVO" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!--  Header Start -->
<%
	// 세션의 최대 비활성화 시간(초 단위)을 가져옴
    int sessionTimeout = session.getMaxInactiveInterval(); // 초 단위
	PartnerVO partnerVO2 = (PartnerVO) session.getAttribute("SessionInfo");
%>
<header class="topbar">
	<div class="with-vertical">
		<nav class="navbar navbar-expand-lg p-0">
			<ul class="navbar-nav">
				<li class="nav-item nav-icon-hover-bg rounded-circle ms-n2">
					<a class="nav-link sidebartoggler" id="headerCollapse" href="javascript:void(0)">
						<i class="ti ti-menu-2"></i>
					</a>
				</li>
				<li class="nav-item nav-icon-hover-bg rounded-circle d-none d-lg-flex">
					<a class="nav-link" href="javascript:void(0)" data-bs-toggle="modal" data-bs-target="#exampleModal">
						<i class="ti ti-search"></i>
					</a>
				</li>
			</ul>
			<ul class="navbar-nav quick-links d-none d-lg-flex align-items-center">
				<li class="nav-item nav-icon-hover-bg rounded w-auto dropdown d-none d-lg-block mx-0">
					<div class="hover-dd">
						<a class="nav-link" href="javascript:void(0)">즐겨찾기
							<span class="mt-1">
								<i class="ti ti-chevron-down fs-3"></i>
							</span>
						</a>
						
					</div>
				</li>
				<li class="nav-item dropdown-hover d-none d-lg-block">
					<a class="nav-link" href="./main/app-chat.html">마이페이지</a>
				</li>
				<li class="nav-item dropdown-hover d-none d-lg-block"> <a
					class="nav-link" href="/partner/qna/list">QnA / FAQ</a>
				</li>
			</ul>
			<div class="d-block d-lg-none py-4">
				<a href="./main/index.html" class="text-nowrap logo-img">
					<img src="${pageContext.request.contextPath }/resources/assets/images/logos/light-logo.svg" class="light-logo" alt="Logo-light" />
				</a>
			</div>
			<a class="navbar-toggler nav-icon-hover-bg rounded-circle p-0 mx-0 border-0" href="javascript:void(0)" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
				<i class="ti ti-dots fs-7"></i>
			</a>
			<div class="collapse navbar-collapse justify-content-end" id="navbarNav">
				<div class="d-flex align-items-center justify-content-between">
					<a href="javascript:void(0)" class="nav-link nav-icon-hover-bg rounded-circle mx-0 ms-n1 d-flex d-lg-none align-items-center justify-content-center" type="button" data-bs-toggle="offcanvas" data-bs-target="#mobilenavbar" aria-controls="offcanvasWithBothOptions"> 
						<i class="ti ti-align-justified fs-7"></i>
					</a>
					<ul class="navbar-nav flex-row ms-auto align-items-center justify-content-center">
						<div>
							<span class="ms-2"><%=partnerVO2.getPtName() %>님, 환영합니다!</span>
						</div>
						<div class="session-timer">
							<span id="elapsed-time" style="margin-bottom:10px;'">&nbsp;&nbsp;남은 시간: </span>
<!-- 							<button class="btn btn-primary" onclick="resetSession()">Reset</button> -->
							<button class="ti ti-reload fs-5" id="reload" style="border:0; background: white;" onclick="resetSession()"></button>
						</div>
						<!-- 드롭다운 START -->
						<li class="nav-item dropdown">
							<a class="nav-link pe-0" href="javascript:void(0)" id="drop1" aria-expanded="false">
								<div class="d-flex align-items-center">
									<div class="user-profile-img">
										<img src="<%=partnerVO2.getPtImage() %>" class="rounded-circle" width="35" height="35" alt="modernize-img" />
									</div>
								</div>
							</a>
							<div class="dropdown-menu content-dd dropdown-menu-end dropdown-menu-animate-up" aria-labelledby="drop1">
								<div class="profile-dropdown position-relative" data-simplebar>
									<div class="py-3 px-7 pb-0">
										<h5 class="mb-0 fs-5 fw-semibold">User Profile</h5>
									</div>
									<div class="d-flex align-items-center py-9 mx-7 border-bottom">
										<img src="<%=partnerVO2.getPtImage() %>" class="rounded-circle" width="80" height="80" alt="modernize-img" />
										<div class="ms-3">
											<h5 class="mb-1 fs-3"><%=partnerVO2.getPtName() %></h5>
											<span class="mb-1 d-block">대표 <%=partnerVO2.getPtCeo() %></span>
											<p class="mb-0 d-flex align-items-center gap-2">
												<i class="ti ti-mail fs-4"></i><%=partnerVO2.getPtMgremail() %>
											</p>
										</div>
									</div>
									<div class="message-body">
										<a href="/common/profile" class="py-8 px-7 mt-8 d-flex align-items-center">
											<span class="d-flex align-items-center justify-content-center text-bg-light rounded-1 p-6">
												<img src="${pageContext.request.contextPath }/resources/assets/images/svgs/icon-account.svg" alt="modernize-img" width="24" height="24" />
											</span>
											<div class="w-100 ps-3">
												<h6 class="mb-1 fs-3 fw-semibold lh-base">내 프로필 </h6>
												<span class="fs-2 d-block text-body-secondary">My Profile</span>
											</div>
										</a> 
										<a href="./main/app-email.html" class="py-8 px-7 d-flex align-items-center">
											<span class="d-flex align-items-center justify-content-center text-bg-light rounded-1 p-6">
												<img src="${pageContext.request.contextPath }/resources/assets/images/svgs/icon-inbox.svg" alt="modernize-img" width="24" height="24" />
											</span>
											<div class="w-100 ps-3">
												<h6 class="mb-1 fs-3 fw-semibold lh-base">My Page</h6>
												<span class="fs-2 d-block text-body-secondary">My Page</span>
											</div>
										</a> 
										<a href="./main/app-notes.html" class="py-8 px-7 d-flex align-items-center">
											<span class="d-flex align-items-center justify-content-center text-bg-light rounded-1 p-6">
												<img src="${pageContext.request.contextPath }/resources/assets/images/svgs/icon-tasks.svg" alt="modernize-img" width="24" height="24" />
											</span>
											<div class="w-100 ps-3">
												<h6 class="mb-1 fs-3 fw-semibold lh-base">QnA / FAQ</h6>
												<span class="fs-2 d-block text-body-secondary">QnA / FAQ</span>
											</div>
										</a>
									</div>
									<div class="d-grid py-4 px-7 pt-8">
										<form action="/partner/logout" method="post" id="logoutForm">
											<input type="button" value="Log Out" class="btn btn-outline-primary" id="partnerLogoutBtn" />
										</form>
									</div>
								</div>
							</div>
						</li>
						<!-- 협력업체 DROPDOWN END -->
					</ul>
				</div>
			</div>
		</nav>
</header>
<!-- 로그아웃 모달창 START -->
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
<!-- 로그아웃 모달창 END -->
<script>
$(document).ready(function() {
	// 협력업체 로그아웃 이벤트
	$("#partnerLogoutBtn").on("click", function(event) {
		console.log("로그아웃 버튼 눌렀다");
		event.preventDefault();
		$("#info-header-modal").modal('show');
	});

	// 협력업체 로그아웃 모달창 버튼 이벤트
	$("#logoutBtn").on("click", function() {
		logoutForm.submit();
	});
	// 세션 타이머 시작
    startSessionTimer();
});

var sessionTimeout = <%= sessionTimeout %> * 1000; // 밀리초 단위로 변환
var remainingTime = sessionTimeout;
var timer; // 타이머를 전역 변수로 선언하여 리셋 가능하도록 함

function startSessionTimer() {
    if (timer) clearInterval(timer); // 기존 타이머를 초기화

    timer = setInterval(function() {
        remainingTime -= 1000; // 1초씩 감소
        var minutes = Math.floor(remainingTime / (60 * 1000));
        var seconds = Math.floor((remainingTime % (60 * 1000)) / 1000);

        // 화면에 남은 시간 표시
        document.getElementById("elapsed-time").innerHTML = "남은 시간: " + (minutes < 10 ? "0" : "") + minutes + ":" + (seconds < 10 ? "0" : "") + seconds;

        // 시간이 다 되면 타이머를 멈추고 만료 처리
        if (remainingTime <= 0) {
            clearInterval(timer);
            alert("세션이 만료되었습니다. 다시 로그인해 주세요.");
            window.location.href = "/partner/login"; // 로그인 페이지로 리디렉션
        }
    }, 1000); // 1초마다 업데이트
}

// 리셋 버튼 이벤트
function resetSession() {
    $.ajax({
        url: "/partner/resetSession",
        type: 'POST',
        success: function(response) {
            alert("시간이 연장되었습니다.");
            remainingTime = response.newTimeout * 1000; // 새로운 타임아웃 값을 설정
            startSessionTimer(); // 타이머 재시작
        },
        error: function(xhr, status, error) {
            alert("시간연장에 실패했습니다.");
            console.error('Error:', error);
        }
    });
}
</script>
