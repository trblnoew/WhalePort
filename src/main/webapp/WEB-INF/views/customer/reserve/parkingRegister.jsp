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

<div class="container">
  <div class="row justify-content-center">
    <div class="col-lg-12">
       <div style="height: 50px;"></div>
      <div class="card">
        <div class="px-4 py-3 border-bottom" style="display: flex; vertical-align: middle;">
          <h3 class="title"><strong>예약자 정보 입력</strong></h3>
          <button type="button" class="btn btn-outline-primary" id="autoValBtn" style="margin-left: 15px;">자동입력</button>
        </div>
<!--   		<div class="mb-3" style="text-align: center;"> -->
<!-- 			<button type="button" class="btn btn-outline-primary" id="autoValBtn">자동입력</button> -->
<!-- 		</div> -->
<!--         <button type="button" class="btn btn-primary w-100 py-8 rounded-2" id="autoValBtn">자동입력</button> -->
        <div class="card-body">
        <form action="/customer/reserve/parking/register" method="post" id="sbForm">
         <input type="hidden" name="plNo" id="exampleInputText32" class="form-control border-0 ps-2" value="${parkingVO.plNo }" readonly/>
          <div class="mb-4 row align-items-center">
            <label for="exampleInputText32" class="form-label col-sm-3 col-form-label">주차장 유형</label>
            <div class="col-sm-9">
              <div class="input-group border rounded-1">
                <span class="input-group-text bg-transparent px-6 border-0" id="basic-addon1">
                  <i class="ti ti-building-arch fs-6"></i>
                </span>
                <input type="text" name="plName" id="exampleInputText32" class="form-control border-0 ps-2" value="${parkingVO.plName }" readonly/>
              </div>
            </div>
          </div>
          <div class="mb-4 row align-items-center">
            <label for="exampleInputText33" class="form-label col-sm-3 col-form-label">입차일</label>
            <div class="col-sm-9">
              <div class="input-group border rounded-1">
                <span class="input-group-text bg-transparent px-6 border-0" id="basic-addon1">
                  <i class="ti ti-user fs-6"></i>
                </span>
                <input type="text" name="prEntry" class="form-control border-0 ps-2" id="exampleInputText31" value="${parkingVO.prEntry }">
              </div>
            </div>
          </div>
          <div class="mb-4 row align-items-center">
            <label for="exampleInputText34" class="form-label col-sm-3 col-form-label">출차일</label>
            <div class="col-sm-9">
              <div class="input-group border rounded-1">
                <span class="input-group-text bg-transparent px-6 border-0" id="basic-addon1">
                  <i class="ti ti-user fs-6"></i>
                </span>
                <input type="text" name="prExit" class="form-control border-0 ps-2" id="exampleInputText32" value="${parkingVO.prExit }">
              </div>
            </div>
          </div>
<!--                          <div class="mb-3 form-group"> -->
<!--                   <label class="form-label">제목 <span class="text-danger">*</span> -->
<!--                   </label> -->
<!--                   <div class="controls"> -->
<%--                      <input type="text" name="popTitle" id="popTitle" class="form-control" placeholder="제목을 입력하세요." value="${eventVO.popTitle }" --%>
<!--                       required data-validation-required-message="필수입력 사항입니다." /> -->
<!--                   </div> -->
<!--                </div> -->
               
          <div class="mb-4 row align-items-center">
            <label for="exampleInputText35" class="form-label col-sm-3 col-form-label">차량번호</label>
            <div class="col-sm-9">
              <div class="input-group border rounded-1">
                <span class="input-group-text bg-transparent px-6 border-0" id="basic-addon1">
                  <i class="ti ti-user fs-6"></i>
                </span>
                <input type="text" name="prCarno" class="form-control border-0 ps-2" id="prCarno" placeholder="차량번호를 입력하세요." value="${parkingVO.prCarno }">
              </div>
            </div>
          </div>
          <div class="mb-4 row align-items-center">
            <label for="exampleInputText36" class="form-label col-sm-3 col-form-label">이름</label>
            <div class="col-sm-9">
              <div class="input-group border rounded-1">
                <span class="input-group-text bg-transparent px-6 border-0" id="basic-addon1">
                  <i class="ti ti-user fs-6"></i>
                </span>
                <input type="text" name="prName" class="form-control border-0 ps-2" id="prName" placeholder="이름을 입력하세요." value="${parkingVO.prName }">
              </div>
            </div>
          </div>
          <div class="mb-4 row align-items-center">
            <label for="exampleInputText40" class="form-label col-sm-3 col-form-label">휴대폰 번호</label>
            <div class="col-sm-9">
              <div class="input-group border rounded-1">
                <span class="input-group-text bg-transparent px-6 border-0" id="basic-addon1">
                  <i class="ti ti-phone fs-6"></i>
                </span>
                <input type="text" name="prTel" id="prTel" class="form-control border-0 ps-2" placeholder="예) 010-0000-0000" value="${parkingVO.prTel }">
              </div>
            </div>
          </div>
<!--           <div class="mb-4 row align-items-center"> -->
<!--             <label for="exampleInputText33" class="form-label col-sm-3 col-form-label">객실 수</label> -->
<!--             <div class="col-sm-9"> -->
<!--               <div class="input-group border rounded-1"> -->
<!--                 <span class="input-group-text bg-transparent px-6 border-0" id="basic-addon1"> -->
<!--                   <i class="ti ti-mail fs-6"></i> -->
<!--                 </span> -->
<!--                 <input type="text" name="hCost" class="form-control" id="open" placeholder="1" readonly="readonly"/> -->
<!--               </div> -->
<!--             </div> -->
<!--           </div> -->
          <hr>
         <div class="mb-4 row align-items-center justify-content-end"> <!-- justify-content-end 클래스를 추가 -->
			    <div class="col-sm-9 fw-bold fs-7 text-end">
			        <label for="exampleInputText34" class="form-label col-sm-3 col-form-label fs-7">결제 금액 : </label>
			        <input type="hidden" name="prCost" id="exampleInputText34" class="form-control border-0 ps-2" value="${parkingVO.plCost}" readonly/>
			        <span id="totalCost">${parkingVO.plCost} 원</span> <!-- 총 결제 금액을 표시할 span 추가 -->
			    </div>
			</div>
        </div>
      </div>
    </div>
        <div class="wrapper svelte-18zge7r">
        <div style="display: flex; justify-content: right; padding-top: 10px;">
              <div class="policy-check-title svelte-18zge7r">전체 약관 동의 체크</div>
              <div class="form-check"><input placeholder="" class="form-check-input" id="all-agree" type="checkbox" name=""
                  value="" >
              </div>
            </div>
          <div class="body svelte-18zge7r">
            <div style="margin-top: 50px; display: flex; justify-content: space-between; align-items: baseline">
              <div style="font-size: 19px; font-weight: bold">개인정보처리방침 (필수)</div>

              <div class="policy-subTitle svelte-18zge7r" style="font-size: 13px">원활한 서비스 이용을 위하여, 사용자 본인의 동의가 필요합니다.
              </div>
            </div>
            <textarea style="height:300px; resize: none; background-color: white; padding: 20px; margin-top: 10px"
              class="form-control" name="" placeholder="" readonly>‘웨일포트'는 (이하 '회사'는) 고객님의 개인정보를 중요시하며, "정보통신망 이용촉진 및 정보보호"에 관한 법률을 준수하고 있습니다. 회사는 개인정보취급방침을 통하여 고객님께서 제공하시는 개인정보가 어떠한 용도와 방식으로 이용되고 있으며, 개인정보보호를 위해 어떠한 조치가 취해지고 있는지 알려드립니다.

			회사는 개인정보취급방침을 개정하는 경우 웹사이트 공지사항(또는 개별공지)을 통하여 공지할 것입니다.
			
			ο 본 방침은 : 2019 년 07 월 01 일 부터 시행됩니다.
			
			
			1. 수집하는 개인정보 항목
			
			회사는 회원가입, 상담, 서비스 신청 등등을 위해 아래와 같은 개인정보를 수집하고 있습니다.
			ο 수집항목 : 이름, 성별, 로그인ID, 비밀번호, 자택 전화번호, 자택 주소, 휴대전화번호, 이메일, 생년월일, 서비스 이용기록, 접속 로그, 접속 IP 정보, sms수신여부
			ο 개인정보 수집방법 : 홈페이지(회원가입 및 이용예약)
			
			
			
			2. 개인정보의 수집 및 이용목적
			회사는 수집한 개인정보를 다음의 목적을 위해 활용합니다.
			
			ο 회원 관리
			회원제 서비스 이용에 따른 본인확인 , 개인 식별 , 불량회원의 부정 이용 방지와 비인가 사용 방지 , 가입 의사 확인 , 불만처리 등 민원처리 , 고지사항 전달
			
			3. 개인정보의 보유 및 이용기간
			회사는 고객이 회사가 제공하는 서비스를 받는 동안 고객님의 개인정보를 계속 보유하며 서비스 제공을 위해 이용하게 됩니다. 다만 고객이 본인의 개인정보와 관련하여 불만이나 의견이 있으신 경우, 개인정보 관리담당자에게 메일로 의견을 주시면 삭제 조치하고 처리결과를 메일로 통보해 드리겠습니다.
			
			4. 개인정보의 파기절차 및 방법
			회사는 고객이 요청한 경우 해당 정보를 지체 없이 파기합니다. 파기방법은 다음과 같습니다.
			
			ο 파기방법
			- 전자적 파일형태로 저장된 개인정보는 기록을 재생할 수 없는 기술적 방법을 사용하여 삭제합니다.
			
			5. 개인정보 제공
			회사는 이용자의 개인정보를 원칙적으로 외부에 제공하지 않습니다. 다만, 아래의 경우에는 예외로 합니다.
			- 법령의 규정에 의거하거나, 수사 목적으로 법령에 정해진 절차와 방법에 따라 수사기관의 요구가 있는 경우
			
			6. 이용자 및 법정대리인의 권리와 그 행사방법
			고객님 및 법정 대리인은 언제든지 등록되어 있는 자신 혹은 당해 만 14세 미만 아동의 개인정보를 조회하거나 수정할 수 있으며 가입해지를 요청할 수도 있습니다.
			
			고객님 혹은 만 14세 미만 아동의 개인정보 조회/수정을 위해서는 ‘개인정보 변경’(또는 ‘회원정보수정’ 등)을 가입해지(동의철회)를 위해서는 “회원탈퇴”를 클릭 하여 본인 확인 절차를 거치신 후 직접 열람, 정정 또는 탈퇴가 가능합니다. 혹은 개인정보 관리책임자에게 이메일로 연락하시면 지체 없이 조치하겠습니다.
			
			고객이 개인정보의 오류에 대한 정정을 요청하신 경우에는 정정을 완료하기 전까지 당해 개인정보를 이용 또는 제공하지 않습니다. 또한 잘못된 개인정보를 제3자 에게 이미 제공한 경우에는 정정 처리결과를 제3자에게 지체 없이 통지하여 정정이 이루어지도록 하겠습니다.
			
			회사는 고객님 혹은 법정 대리인의 요청에 의해 해지 또는 삭제된 개인정보는 “회사가 수집하는 개인정보의 보유 및 이용기간”에 명시된 바에 따라 처리하고 그 외의 용도로 열람 또는 이용할 수 없도록 처리하고 있습니다.
			
			7. 개인정보 자동수집 장치의 설치, 운영 및 그 거부에 관한 사항
			회사는 고객님의 정보를 수시로 저장하고 찾아내는 ‘쿠키(cookie)’ 등을 운용합니다. 쿠키란 자사의 웹사이트를 운영하는데 이용되는 서버가 귀하의 브라우저에 보내는 아주 작은 텍스트 파일로서 고객의 컴퓨터 하드디스크에 저장됩니다. 회사는 다음과 같은 목적을 위해 쿠키를 사용합니다.
			- 쿠키 등 사용 목적
			- 회원과 비회원의 접속 빈도나 방문 시간 등을 분석, 이용자의 취향과 관심분야를 파악 및 자취 추적, 각종 이벤트 참여 정도 및 방문 회수 파악 등을 통한 타겟 마케팅 및 개인 맞춤 서비스 제공
			고객님은 쿠키 설치에 대한 선택권을 가지고 있습니다. 따라서 고객님은 웹브라우저에서 옵션을 설정함으로써 모든 쿠키를 허용하거나, 쿠키가 저장될 때마다 확인을 거치거나, 아니면 모든 쿠키의 저장을 거부할 수도 있습니다.
			- 쿠키 설정 거부 방법
			쿠키 설정을 거부하는 방법으로는 고객님이 사용하시는 웹 브라우저의 옵션을 선택함으로써 모든 쿠키를 허용하거나 쿠키를 저장할 때마다 확인을 거치거나, 모든 쿠키의 저장을 거부할 수 있습니다.
			- 설정방법
			예(인터넷 익스플로어의 경우) : 웹 브라우저 상단의 도구 > 인터넷 옵션 > 개인정보
			단, 귀하께서 쿠키 설치를 거부하였을 경우 서비스 제공에 어려움이 있을 수 있습니다.
			
			8. 개인정보에 관한 민원서비스
			회사는 고객의 개인정보를 보호하고 개인정보와 관련한 불만을 처리하기 위하여 아래와 같이 개인정보관리책임자를 지정하고 있습니다.
			
			
			고객님께서는 회사의 서비스를 이용하시며 발생하는 모든 개인정보보호 관련 민원을 개인정보관리책임자에게 신고하실 수 있습니다. 회사는 이용자들의 신고사항에 대해 신속하게 충분한 답변을 드릴 것입니다.
			기타 개인정보침해에 대한 신고나 상담이 필요하신 경우에는 아래 기관에 문의하시기 바랍니다.
			개인분쟁조정위원회 : 1833-6972 (www.kopico.go.kr)
			개인정보침해신고센터 : 118, (privacy.kisa.or.kr)
			대검찰청 사이버범죄수사단 : 1301, cid@spo.go.kr (www.spo.go.kr)
			경찰청 사이버안전국 : 182, (cyberbureau.police.go.kr)</textarea>
			
			            <div style="display: flex; justify-content: right; padding-top: 10px">
			              <div class="policy-check-title svelte-18zge7r">개인정보처리방침 내용을 모두 확인하였으며, 동의합니다.
			              </div>
			              <div class="form-check"><input placeholder="" class="form-check-input" id="personal-info-agree" type="checkbox" name=""
			                  value="" >
			              </div>
			            </div>
			            <div style="margin-top: 50px; display: flex; justify-content: space-between; align-items: baseline">
			              <div style="font-size: 19px; font-weight: bold">이용약관 (필수)</div>
			
			              <div class="policy-subTitle svelte-18zge7r" style="font-size: 13px">원활한 서비스 이용을 위하여, 사용자 본인의 동의가 필요합니다.
			              </div>
			            </div>
			            <textarea style="height:300px; resize: none; background-color: white; padding: 20px; margin-top: 10px"
			              class="form-control" name="" placeholder=""
			              readonly>주차대행서비스 이용약관
			
			제1조 (서비스 시작과 종료)
			① 서비스의 시작은 고객이 차량을 직원에게 인도한 시점으로 한다. 고객은 서비스 시작 시 차량상태를 점검하여 직접 사진, 동영상 등을 촬영해두어야 한다. 
			② 서비스의 종료는 고객이 차량을 인도받은 시점으로 한다. 
			
			제2조 (서비스 요금)
			① 주차요금은 홈페이지 내 요금안내 기준에 따른다.
			② 주차대행 이용 시 주차대행료는 주차요금과 별도로 추가된다. 
			③ 요금 결제 시 최종요금의 부가가치세(10%)는 별도로 추가된다. 
			
			제3조 (차량파손 및 손해배상)
			① 당사가 차량을 인수한 시점에서 차량의 고객인계시점(서비스 지역에서 출발)까지의 차량의 파손 및 손상에 대해서는 고객이 차량인도 시(서비스 시작 시) 현장에서 촬영한 사진 및 동영상 대조 등을 통해 이상 유무가 명확히 확인되어야 하며 귀책사유가 당사에 있을 경우 당사에서 손해배상을 한다. 
			② 고객은 차량 인수시점에서 차량의 이상 유무를 확인하여야 하며, 차량의 손상이 발생했을 경우에는 반드시 서비스 지역에서 출발 전 담당직원에게 알려야 손해배상을 청구할 수 있다. 고객이 손해배상을 청구할 때는 고객이 직접 당사의 귀책여부를 입증해야 한다. 
			③ 당사의 책임으로 하는 차량 수리는 반드시 당사에서 지정한 업체에서 수리하여야 한다. (강제조항임)
			④ 차량 수리 시 차량 렌트 등 수리 이외의 사항은 당사에서 부담할 수 없다. 
			⑤ 다음의 각 호의 경우에는 고객이 당사의 책임문제 제기 및 손해배상을 청구할 수 없다. 1. 고객이 서비스 지역을 출발하여 운행 중 추후 차량 손상을 제기한 경우2. 천재지변, 자연적 마모에 따른 고장에 의한 경우(타이어 펑크, 밧데리 방전 등) 3. 서비스 시작 시 이미 손상된 차량 및 손상이 확대된 경우(유리금 확대 등)4. 일반적인 촬영 및 육안으로 식별이 불가능한 미세한 생활흠집, 문콕 등의 경우5. 차량 자체의 기계적인 결함(엔진, 블랙박스, 내장 전자기기 불량 등)
			⑥ 차량 사고 시 손해배상금은 주차대행비의 100배를 초과할 수 없다. 
			⑦ 인사사고 및 차량사고 시 당사에서 가입한 보험 외 고객의 책임보험 및 종합보험으로 처리될 수 있다. 
			
			제4조 (귀중품의 보관)
			
			고객은 현금, 유가증권, 기타 귀중품은 휴대하여야 하고, 보관으로 필요로 하는 품목은 서비스 요청 시 목록을 작성하여 담당자 및 고객센터에 확인을 받아야 한다. 확인되지 않은 귀중품의 분실 및 손상에 대해서는 손해배상을 청구할 수 없다. </textarea>
			
			            <div style="display: flex; justify-content: right; padding-top: 10px">
			              <div class="policy-check-title svelte-18zge7r">약관의 내용을 모두 확인하였으며, 동의합니다.</div>
			
			              <div class="form-check"><input placeholder="" class="form-check-input" id="terms-agree" type="checkbox" name=""
			                  value="" >
			              </div>
			            </div>
			            <div style="margin-top: 50px; display: flex; justify-content: space-between; align-items: baseline">
			              <div style="font-size: 19px; font-weight: bold">제3자 정보제공동의 (필수)</div>
			              <div class="policy-subTitle svelte-18zge7r" style="font-size: 13px">원활한 서비스 이용을 위하여, 사용자 본인의 동의가 필요합니다.
			              </div>
			            </div>
			            <textarea style="height:300px; resize: none; background-color: white; padding: 20px; margin-top: 10px"
			              class="form-control" name="" placeholder="" readonly>회사는 수집·보유하고 있는 개인정보를 이용자의 동의 없이 제3자에게 제공하지 않으나, 다음의 경우에는 개인정보를 제3자에게 제공할 수 있습니다.
			
			1. 정보주체로부터 별도의 서비스의 원활한 이용을 위해 동의를 받은 경우
			2. 법률에 특별한 규정이 있거나 법령상 의무를 준수하기 위하여 불가피한 경우
			
			회사의 개인정보 제3자 제공은 아래와 같습니다.
			
			개인정보 3자 정보 제공 주체
			1.    제공받는자 : 웨일포트(사업자 등록번호 : 723-88-01089)
			2.    주차 서비스 예약과 차량 관련 부가서비스(주차대행,세차,기타 차량관련 서비스)이용을 위한 소프트웨어 사용 및 안내문자 및 SNS 발송 용도
			3.    제공 개인정보: (이름,연락처,이메일,주소, 등)
			4.    제공기한: 위탁서비스 종료 또는 이용자 요청시 까지</textarea>

            <div style="display: flex; justify-content: right; padding-top: 10px">
              <div class="policy-check-title svelte-18zge7r">약관의 내용을 모두 확인하였으며, 동의합니다.</div>
              <div class="form-check"><input placeholder="" class="form-check-input" id="third-party-info-agree" type="checkbox" name=""
                  value="" >
              </div>
            </div>
            
          </div>
          <div>
        </div>
      </div>
      <hr>
     <div class="row">
    <div class="col text-end">
        <button type="button" class="btn btn-primary">결제</button>
        <a href="/customer/reserve/parking/list" class="btn btn-outline-primary">취소</a>
    </div>
	</div>
 	</form>
 	
 	<!-- 약관 동의 경고 모달 -->
<div class="modal fade" id="al-warning-alert" tabindex="-1" aria-labelledby="vertical-center-modal" aria-hidden="true">
    <div class="modal-dialog modal-sm">
        <div class="modal-content modal-filled bg-warning-subtle">
            <div class="modal-body p-4">
                <div class="text-center text-warning">
                    <i class="ti ti-alert-octagon fs-7"></i>
                    <h4 class="mt-2">Warning</h4>
                    <p class="mt-3">약관 내용을 모두 확인 후 동의해 주세요.</p>
                    <button type="button" class="btn btn-light my-2" data-bs-dismiss="modal">확인</button>
                </div>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
</div>
  </div>
  </div>
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<script>
    $(function() {
    	
        // 자동 입력 버튼 - 최종 프로젝트를 위한
    	$("#autoValBtn").on("click", function(){
    		$("#prCarno").val("12가4567");         
            $("#prName").val("김예지");           
            $("#prTel").val("010-8362-4769");   
    	});
    	
        // 입차일과 출차일을 가져옴
        var entryDate = new Date("${parkingVO.prEntry}");
        var exitDate = new Date("${parkingVO.prExit}");
        
        // 날짜 차이 계산 함수
        function calculateDaysDifference(startDate, endDate) {
            var differenceInTime = endDate.getTime() - startDate.getTime();
            return differenceInTime / (1000 * 3600 * 24) + 1; 
        }
   
        // 결제 금액
        var costPerDay = parseInt("${parkingVO.plCost}");
        var daysDifference = calculateDaysDifference(entryDate, exitDate);
        var totalCost = costPerDay * daysDifference;

        // 총 결제 금액 표시
        $('#totalCost').text(totalCost.toLocaleString() + ' 원');
        $('#exampleInputText34').val(totalCost);
        
        // 결제하기 버튼 클릭 이벤트
        $('.btn-primary').click(function() {
            var name = document.querySelector('input[name="prName"]').value;
            var tel = document.querySelector('input[name="prTel"]').value;

            // 모든 체크박스의 상태 확인
            var allChecked = true;
            $('.form-check-input').each(function() {
                if (!$(this).is(':checked')) {
                    allChecked = false;
                }
            });

            if (!allChecked) {
                $('#al-warning-alert').modal('show'); // 알림 메시지
                return; // 체크박스가 모두 체크되지 않으면 폼 전송 중단
            }

            $('#sbForm').submit();
        });
        
        // 전체 약관 동의 체크박스
        $('#all-agree').change(function() {
            var isChecked = $(this).is(':checked');
            $('.form-check-input').prop('checked', isChecked);
        });
        
        function requestPay(name, tel) {
            var IMP = window.IMP;
            IMP.init("imp15656112");
            var uuid = '${uuid}';
            IMP.request_pay(
             {
               pg: "kakaopay.TC0ONETIME",
               pay_method: "card",
               merchant_uid: uuid,
               name: name,
               amount: totalCost,
               buyer_email: "good@portone.io",
               buyer_name: "난데요",
               buyer_tel: "010-3573-7532",
               buyer_addr: "서울특별시 강남구 삼성동",
               buyer_postcode: "123-456",
             },
             function (rsp) {
                 if (rsp.success) {
                    $('#sbForm').submit();
                 } else {
                    alert('결제에 실패하였습니다');
                 }
             }
           );
        }
    });
</script>
