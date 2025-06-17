<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
.custom-height {
	height: 250px; 
	display: flex;
	align-items: center; 
	justify-content: center; 
}
</style>

<div class="main-wrapper overflow-hidden">
	<!-- ------------------------------------- -->
	<!-- banner Start -->
	<!-- ------------------------------------- -->
	<section class="bg-primary-subtle custom-height">
		<div class="container-fluid">
			<div class="text-center">
				<p class="text-primary fs-4 fw-bolder">related site</p>
				<h1 class="fw-bolder fs-12">관련 사이트 안내</h1>
			</div>
		</div>
	</section>
</div>

<div>
              <h4 class="card-title p-4 mb-0" style="font-size: small; text-align: center; margin-top:50px;">
    			<i class="ti ti-alert-circle"></i>홈페이지 내의 정보는 참고사항으로 정확한 정보는 해당 항공사/기관/시설에 확인하여 주시기 바랍니다.</h4>
              <div class="row p-3 mx-0 bg-light-subtle">
                <div class="col-sm-4">
                  <div class="b-label">
				    <img src="${pageContext.request.contextPath }/resources/assets/images/site/passport.png" alt="passport" style="max-width: 40%; height: 40%;">
				</div>
                </div>
                <div class="col-sm-5" style="margin-top:50px;">
				    <h5><strong>여권</strong></h5>
				    <p> 
				        - 해외여행 중 여권을 분실하였을 경우 가까운 대사관 또는 총영사관에 여권 분실 신고를 하고 여행증명서나 단수여권을 발급 받으시기 바랍니다.<br/>
				        - 여권이 훼손된 경우 외국 출입국 및 항공권 발권 등에 제한이 있을 수도 있으므로, 여권을 재발급 받으시기 바랍니다.<br/>
				        - 여권 분실 등의 사유로 긴급하게 발급해야 하는 경우에는 인천국제공항 여객터미널 내 영사민원실에서 발급 받으실 수 있으니 참고하시기 바랍니다.
				    </p>
				    <div class="d-flex justify-content-start" style="margin-top: 10px;">
				        <button type="button" class="btn waves-effect waves-light btn-primary" style="margin-right: 5px; width: 200px;" onclick="window.location.href='https://www.passport.go.kr/home/kor/contents.do?menuPos=2';">일반여권</button>
						<button type="button" class="btn waves-effect waves-light btn-primary" style="margin-right: 5px; width: 200px;" onclick="window.location.href='https://www.passport.go.kr/home/kor/contents.do?menuPos=25' ;">관용·외교관여권</button>
						<button type="button" class="btn waves-effect waves-light btn-primary" style="margin-right: 5px; width: 200px;" onclick="window.location.href='https://www.passport.go.kr/home/kor/contents.do?idx=&act=&menuPos=21';">여행증명서</button>
						<button type="button" class="btn waves-effect waves-light btn-primary" style="width: 200px;" onclick="window.location.href='https://www.passport.go.kr/home/kor/contents.do?menuPos=41';">여권발급수수료</button>
				    </div>
				</div>
              </div>
              <div class="row p-3 mx-0">
                <div class="col-sm-4">
                  <div class="b-label">
				    <img src="${pageContext.request.contextPath }/resources/assets/images/site/visa.png" alt="visa" style="max-width: 40%; height: 40%;">
				</div>
                </div>
                <div class="col-sm-5" style="margin-top:50px;">
                  <h5><strong>비자</strong></h5>
                <p> 
				- 비자 취득은 각 나라의 주권사항으로 해당 주한대사관에 직접 문의하시기 바랍니다.<br/>
				- '사증면제협정 체결국가＇와 '한국인의 무사증 입국이 가능한 국가＇에는 사증(비자) 없이 입국할 수 있습니다.<br/>
				- 미국 입국시(ESTA), 캐나다 입국시(eTA)라는 전자여행허가를 꼭 받으셔야 하고 영국 입국시에는 신분증명서, 재직증명서, 귀국항공권, 숙소정보, 여행계획을 반드시 지참하셔야 합니다.</p>
                <div class="d-flex justify-content-start" style="margin-top: 10px;">
			        <button type="button" class="btn waves-effect waves-light btn-primary" style="margin-right: 5px; width: 800px;" onclick="window.location.href='https://www.0404.go.kr/consulate/visa.jsp';">비자취득정보안내</button>
                </div>
                </div>
              </div>
              <div class="row p-3 mx-0 bg-light-subtle">
                <div class="col-sm-4">
                  <div class="b-label">
				    <img src="${pageContext.request.contextPath }/resources/assets/images/site/drive.png" alt="drive" style="max-width: 40%; height: 40%;">
				</div>
                </div>
                <div class="col-sm-5" style="margin-top:70px;">
                  <h5><strong>국제운전 면허증</strong></h5>
                <p> 
				- 외국에서 운전하고자 하는 분께서는 웨일여객터미널 및 전국 지방자치단체에서 발급 가능하오니 한국도로교통공단 홈페이지를 참고하시기 바랍니다.</p>
				<div class="d-flex justify-content-start" style="margin-top: 10px;">
			        <button type="button" class="btn waves-effect waves-light btn-primary" style="margin-right: 5px; width: 266px;" onclick="window.open('https://www.safedriving.or.kr/guide/larGuide10.do?menuCode=MN-PO-12111', '_blank');">운전면허증발급안내</button>
					<button type="button" class="btn waves-effect waves-light btn-primary" style="margin-right: 5px; width: 266px;" onclick="window.location.href='https://www.safedriving.or.kr/guide/larGuide011.do?menuCode=MN-PO-1211' ;">적성검사/면허 갱신안내</button>
					<button type="button" class="btn waves-effect waves-light btn-primary" style="margin-right: 5px; width: 266px;" onclick="window.location.href='https://www.safedriving.or.kr/guide/larGuide013.do?menuCode=MN-PO-1211';">면허 연기 신청안내</button>
			    </div>
                </div>
              </div>
              <div class="row p-3 mx-0">
                <div class="col-sm-4">
                  <div class="b-label">
				    <img src="${pageContext.request.contextPath }/resources/assets/images/site/army.png" alt="army" style="max-width: 40%; height: 40%;">
				</div>
                </div>
                <div class="col-sm-5" style="margin-top:50px;">
                  <h5><strong>병역</strong></h5>
                <p> 
				- 병역의무자가 국외여행을 하고자 할 때에는 출국일 2일 전까지 병무청장의 국외여행허가를 받아야 합니다. (국외여행허가 대상)<br/>
				- 25세 이상 병역미필자(병역준비역, 보충역 또는 대체역으로서 소집되지 아니한 사람)<br/>
				- 사회복무요원, 전무연구요원, 산업기능요원, 대체복무요원 등으로 복무 중인 사람<br/>
				- 사전에 국외여행허가를 받지 못해 출국 전 긴급하게 허가를 받아야 하는 경우에는 인천국제공항 여객터미널 내 병무민원센터(연중무휴)를 방문하시기 바랍니다.</p>
				<div class="d-flex justify-content-start" style="margin-top: 10px;">
			        <button type="button" class="btn waves-effect waves-light btn-primary" style="margin-right: 5px; width: 200px;" onclick="window.location.href='https://www.mma.go.kr/contents.do?mc=usr0000186';">허가 절차 안내</button>
					<button type="button" class="btn waves-effect waves-light btn-primary" style="margin-right: 5px; width: 200px;" onclick="window.location.href='https://www.mma.go.kr/contents.do?mc=mma0000787' ;">단기여행 등 일반 허가</button>
					<button type="button" class="btn waves-effect waves-light btn-primary" style="margin-right: 5px; width: 200px;" onclick="window.location.href='https://www.mma.go.kr/contents.do?mc=mma0000801';">국외이주 목적 허가</button>
					<button type="button" class="btn waves-effect waves-light btn-primary" style="width: 200px;" onclick="window.location.href='https://www.airport.kr/ap/ko/svc/getFacilityMain.do?CTGRY_ID=18&UPPER_ID=184';">병무민원센터 위치</button>
			    </div>
                </div>
              </div>
            </div>