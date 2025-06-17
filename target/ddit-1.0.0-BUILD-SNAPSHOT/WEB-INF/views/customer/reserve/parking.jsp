<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<style>
.custom-height {
	height: 250px; /* 원하는 높이로 조정 */
	display: flex;
	align-items: center; /* 중앙 정렬 */
	justify-content: center; /* 중앙 정렬 */
	/*     background-image: url('${pageContext.request.contextPath }/resources/assets/images/backgrounds/car.jpg'); /* 배경 이미지 경로 */
	*/
	/*     background-size: cover; /* 이미지 크기 조정 */
	/*     background-position: center; /* 이미지 중앙 정렬 */
}
</style>

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

<!-- start Custom Design Example -->
<div class="card" style="margin: 0 auto; max-width: 1000px;">
	<div class="card-body wizard-content">
		<h3 class="title"><strong>주차장 예약</strong></h3>

		<hr>
		<h6 class="card-subtitle mb-3"></h6>

		<form action="#" class="tab-wizard wizard-circle">
			<!-- Step 1 -->
			<h6>예약가능조회</h6>
			<section>
				<h4>예약 일자</h4>
				<br>
				<div class="row">
					<div class="col-md-6">
						<div class="bg-light p-3 rounded"
							style="height: 100%; border: 1px solid #ddd;">
							<div class="mb-3">
								<label class="form-label" for="location1">주차장 :</label> <input
									type="text" class="form-control" id="location1" name="location"
									value="여객터미널 예약주차장" readonly />
							</div>

							<div class="mb-3">
								<label class="form-label" for="date1">입차일자 :</label> <input
									type="date" class="form-control datetime" id="date1" />
							</div>

							<div class="mb-3">
								<label class="form-label" for="date2">출차일자 :</label> <input
									type="date" class="form-control" id="date2" />
							</div>
							<div class="mb-3">
								<label class="form-label" for="location1">주차예약여부 :</label> <input
									type="text" class="form-control" id="location1" name="location"
									value="" readonly />
							</div>
						</div>
					</div>
					<div class="col-md-6">
						<div class="bg-light p-3 rounded"
							style="height: 100%; border: 1px solid #ddd; display: flex; justify-content: center; align-items: center; height: 100%;">
							<img
								src="${pageContext.request.contextPath}/resources/assets/images/backgrounds/주차장.gif"
								alt="주차장"
								style="max-width: 100%; height: auto; margin: 20px 0; border-radius: 15px;">
						</div>
					</div>

				</div>
			</section>



			<!-- Step 2 -->
			<h6>예약신청</h6>
			<section>
				<h4>예약 정보입력</h4>
				<br>
				<div class="row">
					<div class="col-md-6">
						<div class="bg-light p-3 rounded"
							style="height: 100%; border: 1px solid #ddd;">
							<div class="mb-3">
								<label class="form-label" for="location1">예약 일시 :</label> <input
									type="text" class="form-control" id="location1" name="location"
									value="2024-11-10 ~ 2024-11-12" readonly />
							</div>
							<div class="mb-3">
								<label class="form-label" for="location1">예약 주차장 :</label> <input
									type="text" class="form-control" id="location1" name="location"
									value="여객터미널 예약주차장" readonly />
							</div>
							<div class="mb-3">
								<label class="form-label" for="location1">차량번호 :</label> <input
									type="text" class="form-control" id="location1" name="location"
									value="예) 00가 0000" />
							</div>
							<div class="mb-3">
								<label class="form-label" for="location1">핸드폰번호 :</label> <input
									type="text" class="form-control" id="location1" name="location"
									value="예) 010-0000-0000" />
							</div>
							<div class="mb-3">
								<label class="form-label" for="location1">비밀번호 :</label> <input
									type="text" class="form-control" id="location1" name="location"
									value="4자리 숫자 입력" />
							</div>
<!-- 							<div class="mb-3"> -->
<!-- 								<label class="form-label" for="location1">비밀번호 확인 :</label> <input -->
<!-- 									type="text" class="form-control" id="location1" name="location" -->
<!-- 									value="4자리 숫자 입력" /> -->
<!-- 							</div> -->
						</div>
					</div>
					<div class="col-md-6">
						<div class="bg-light p-3 rounded"
							style="height: 100%; border: 1px solid #ddd;">
							<p class="title" style="font-size: 0.8rem;">예약 전 반드시 읽어주세요</p>
							<ul class="list" style="font-size: 0.6rem;">
								<li>[예약 기간]</br> ・최소 2시간부터 최장 30일까지 예약이 가능합니다.
								</li>
								<br>
								<li>[입차 시간]</br> ・예약시간 기준 2시간 전 및 예약시간 기준 2시간 후 까지는 예약변경 없이 입차가
									가능합니다.
								</li>
								<br>
								<li>[예약 변경/취소]</br> ・예약의 변경 및 취소는 입차 예정시간 1시간 전까지 가능합니다. </br>・입차
									예정시간 1시간 전 예약한 경우 20분 이내에는 예약의 변경 및 취소가 가능합니다.
								</li>
								<br>
								<li class="colorType green">[예약부도 및 패널티]</br> ・입차 예정시간 2시간 경과까지
									입차하지 않는 경우 예약 보증금의 100%를 위약금으로 하며, 예약이 취소됩니다. </br> ・예약일 기준 1년간 2회
									이상 예약부도 시 예약 출차일로부터 3개월 동안 공항 주차 예약서비스를 이용할 수 없습니다.
								</li>
								<br>
								<li class="showText">[장애인 차량]</br> ・장애인 차량 주차면이 별도로 마련되어
									있습니다.(엘리베이터 및 에스컬레이터 없음)
								</li>
								<br>
								<li>[주차요금]</br> ・주차요금은 실제 입출차 시간을 기준으로 부과됩니다.
								</li>
								<br>
								<li>[안내사항] </br> ※ 대구공항 예약주차장은 2023년 04월 01일부터 운영하지 않습니다. </br> *
									예약주차장 외 다른 주차장은 예약없이 이용 가능합니다.(이용 주차장 만차 시 대기 발생 참조)
								</li>
								<br>
							</ul>
							<ul class="list" style="font-size: 0.6rem;">
								<li class="colorType dkBlue">예상 주차요금 계산기</li>
								<br>
								<li>[할인적용]</br> ・할인은 출차(유인, 무인) 시 증빙 후 적용됩니다. <span
									class="colorType green"></br>(단, 정부에 등록된 차량(저공해, 경차, 국가유공상이자
										등) 및 공사 홈페이지에 다자녀 사전 등록 차량은 자동 할인 가능)</span></li>
								<br>
							</ul>
						</div>
					</div>
				</div>
			</section>

			<!-- Step 3 -->
			<h6>예약확인</h6>
			<section>
				<h4>예약 내역으로 이동할려 ?</h4>
			</section>
		</form>
	</div>
</div>

<!-- end Custom Design Example -->




