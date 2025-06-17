<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>
.custom-height {
	height: 250px;
	display: flex;
	align-items: center;
	justify-content: center;
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
				<p class="text-primary fs-4 fw-bolder">parking</p>
				<h1 class="fw-bolder fs-12">주차장</h1>
			</div>
		</div>
	</section>
</div>

<div class="body-wrapper">
	<div class="container-fluid">
		<div class="row justify-content-center">
			<!-- 가운데 정렬을 위한 클래스 추가 -->
			<div class="col-lg-4">
				<!-- start With controls -->
				<div class="card">
					<div class="card-body" style="height: 500px;">
						<img
							src="${pageContext.request.contextPath}/resources/assets/images/backgrounds/주차장.gif"
							alt="주차장"
							style="max-width: 100%; height: auto; margin: 20px 0; border-radius: 15px;">
					</div>
				</div>
				<!-- end With controls -->
			</div>



			<div class="col-lg-4 d-flex align-items-stretch">
				<!-- start Issue Tracking -->
				<div class="card w-100">
					<form action="/customer/reserve/parking/registerForm" id="pkForm"
						method="post">
						<div class="card-body border-top">
							<h3 class="title">
								<strong>주차장 예약</strong>
							</h3>
							<hr>
							<div class="row">
								<div class="col-12">
									<div class="mb-3">
										<label for="open" class="form-label">주차장</label> <input
											type="text" name="htNm" class="form-control" id="open"
											placeholder="웨일공항 주차타워" readonly="readonly" />
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-12">
									<div class="mb-3">
										<label for="parkingType" class="form-label">주차장 유형</label> <select
											name="plNo" class="form-control" id="parkingType">
											<option value="default" id="typeNum">유형을 선택해주세요</option>
											<c:forEach var="parkingVO" items="${parkingList}">
												<option value="${parkingVO.plNo}" class="typeNum">${parkingVO.plName}</option>
											</c:forEach>
										</select>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-6">
									<div class="mb-3">
										<label for="dateopen" class="form-label">입차일</label> <input
											type="date" name="prEntry" class="form-control" id="dateopen"
											required />
									</div>
								</div>
								<div class="col-6">
									<div class="mb-3">
										<label for="dateclose" class="form-label">출차일</label> <input
											type="date" name="prExit" class="form-control" id="dateclose"
											required />
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-12">
									<div class="mb-3">
										<label for="result" class="form-label">예약가능여부</label> <input
											type="text" name="result" class="form-control" id="result"
											placeholder="" readonly="readonly" />
									</div>
								</div>
							</div>
							<div class="text-end">
								<button type="submit" class="btn btn-primary" id="confirmButton"
									disabled>확인</button>
							</div>
						</div>
					</form>
					<!-- 약관 동의 경고 모달 -->
					<div class="modal fade" id="al-warning-alert" tabindex="-1"
						aria-labelledby="vertical-center-modal" aria-hidden="true">
						<div class="modal-dialog modal-sm">
							<div class="modal-content modal-filled bg-warning-subtle">
								<div class="modal-body p-4">
									<div class="text-center text-warning">
										<i class="ti ti-alert-octagon fs-7"></i>
										<h4 class="mt-2">Warning</h4>
										<p class="mt-3">입차일 이후 날짜를 선택해주세요.</p>
										<button type="button" class="btn btn-light my-2"
											data-bs-dismiss="modal">확인</button>
									</div>
								</div>
							</div>
							<!-- /.modal-content -->
						</div>
					</div>
				</div>
				<!-- end Issue Tracking -->
			</div>
		</div>
		<!-- End row -->

		<div class="container my-4">
			<!-- 추가된 container -->
			<div class="card-body p-4">
				<ul class="nav nav-pills user-profile-tab border-bottom"
					id="pills-tab" role="tablist">
					<li class="nav-item" role="presentation">
						<button
							class="nav-link position-relative rounded-0 active d-flex align-items-center justify-content-center bg-transparent fs-3 py-6"
							id="pills-description-tab" data-bs-toggle="pill"
							data-bs-target="#pills-description" type="button" role="tab"
							aria-controls="pills-description" aria-selected="true">
							Description</button>
					</li>
				</ul>
				<div class="tab-content pt-4" id="pills-tabContent">
					<div class="tab-pane fade show active" id="pills-description"
						role="tabpanel" aria-labelledby="pills-description-tab"
						tabindex="0">
						<div class="d-flex align-items-center">
							<img
								src="${pageContext.request.contextPath}/resources/assets/images/alert/alert11.png"
								alt="아이콘" style="width: 30px; height: 30px; margin-right: 10px;">
							<h2 class="mb-0">
								<strong>예약 전 반드시 읽어주세요</strong>
							</h2>
						</div>

						<div class="row mb-4">
							<div class="col-6 text-center">
								<img
									src="${pageContext.request.contextPath}/resources/assets/images/backgrounds/map.gif"
									alt="주차장1"
									style="max-width: 100%; height: auto; margin: 20px 0; border-radius: 15px;">
							</div>
							<div class="col-6 text-center">
								<img
									src="${pageContext.request.contextPath}/resources/assets/images/backgrounds/map1.gif"
									alt="주차장2"
									style="max-width: 100%; height: auto; margin: 20px 0; border-radius: 15px;">
							</div>
						</div>

						[예약 기간]<br> ・최소 2시간부터 최장 30일까지 예약이 가능합니다.<br>
						<br> [입차 시간]<br> ・예약시간 기준 2시간 전 및 예약시간 기준 2시간 후 까지는 예약변경
						없이 입차가 가능합니다.<br>
						<br> [예약 변경/취소]<br> ・예약의 변경 및 취소는 입차 예정시간 1시간 전까지 가능합니다.<br>
						・입차 예정시간 1시간 전 예약한 경우 20분이내에는 예약의 변경 및 취소가 가능합니다.<br>
						<br> <span style="color: blue;">[예약부도 및 패널티]<br>
							・입차 예정시간 2시간 경과까지 입차하지 않는 경우 예약 보증금의 100%를 위약금으로 하며, 예약이 취소됩니다.<br>
							・예약일 기준 1년간 2회 이상 예약부도 시 예약 출차일로부터 3개월 동안 공항 주차 예약서비스를 이용할 수
							없습니다.<br>
						<br></span> [장애인 차량]<br> ・장애인 차량 주차면이 별도로 마련되어 있습니다.(엘리베이터 및
						에스컬레이터 없음)<br>
						<br> [주차요금]<br> ・주차요금은 실제 입출차 시간을 기준으로 부과됩니다.<br>
						<br> [안내사항]<br> ※ 대구공항 예약주차장은 2023년 04월 01일부터 운영하지 않습니다.<br>
						* 예약주차장 외 다른 주차장은 예약없이 이용 가능합니다.(이용 주차장 만차 시 대기 발생 참조)<br>
						<br>
						<br> <strong>예상 주차요금 계산기<br>
						<br></strong> [할인적용]<br> ・할인은 출차(유인, 무인) 시 증빙 후 적용됩니다.<br>
						(단, 정부에 등록된 차량(저공해, 경차, 국가유공상이자 등) 및 공사 홈페이지에 다자녀 사전 등록 차량은 자동 할인
						가능)
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script>
	$(function() {
		var today = new Date();
		var dd = String(today.getDate()).padStart(2, '0');
		var mm = String(today.getMonth() + 1).padStart(2, '0');
		var yyyy = today.getFullYear();
		today = yyyy + '-' + mm + '-' + dd; // YYYY-MM-DD 형식

		// 체크인 날짜 입력 필드의 최소값을 오늘 날짜로 설정
		$('#dateopen').attr('min', today);
		$('#dateclose').attr('min', today);

		var type = $('#typeNum').val();
		var entryDate = '';
		var exitDate = '';

		$('#parkingType').on('change', function() {
			type = $(this).val();
			if (entryDate) {
				checkAvailability(type, entryDate);
			}
		});

		// 시작 날짜가 변경될 때
		$('#dateopen').on('change', function() {
			entryDate = $(this).val();
			console.log('entryDate :: ' + entryDate);

			// 끝 날짜가 아직 선택되지 않았다면 확인 버튼 비활성화
			if (!exitDate) {
				$('#confirmButton').prop('disabled', true);
			} else {
				checkAvailability(type, entryDate, exitDate);
			}
		});

		// 끝 날짜가 변경될 때
		$('#dateclose').on('change', function() {
			exitDate = $(this).val();
			console.log('exitDate :: ' + exitDate);

			if (entryDate >= exitDate) {
				$('#al-warning-alert').modal('show')
				$('#dateclose').val(''); // 출차일 입력 필드 초기화
				$('#confirmButton').prop('disabled', true); // 확인 버튼 비활성화
				return; // 함수 종료
			}

			// 시작 날짜가 선택된 경우에만 확인 버튼 활성화
			if (entryDate) {
				checkAvailability(type, entryDate, exitDate);
			} else {
				$('#confirmButton').prop('disabled', true);
			}
		});

		function checkAvailability(type, entryDate, exitDate) {
			$.ajax({
				url : '/customer/reserve/parking/checkin',
				type : 'post',
				data : JSON.stringify({
					plNo : type,
					prEntry : entryDate,
					prExit : exitDate
				}),
				contentType : 'application/json; charset=utf-8',
				success : function(res) {
					if (res === 'possible') {
						$('#result').css('color', 'green');
						$('#result').val('예약 가능합니다.');
						$('#confirmButton').prop('disabled', false); // 확인 버튼 활성화
					} else {
						$('#result').css('color', 'red');
						$('#result').val('예약 불가능합니다.');
						$('#confirmButton').prop('disabled', true); // 확인 버튼 비활성화
					}
				},
				error : function(xhr) {
					console.error('xhr :: ' + xhr);
				}
			});
		}
<%if (msg != null) {%>
	Swal.fire({
			title : '${msg} 완료',
			text : '${message}',
			icon : 'success',
			confirmButtonText : '확인'
		});
<%}%>
	// Enter 키를 눌렀을 때 모달 닫기
		$(document).on('keypress', function(e) {
			if (e.which === 13) { // Enter 키 코드
				$('.swal2-modal').hide(); // SweetAlert 모달 닫기
			}
		});
	});
</script>