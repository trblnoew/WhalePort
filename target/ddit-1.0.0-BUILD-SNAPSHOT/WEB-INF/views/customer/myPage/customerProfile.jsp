<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

	
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://developers.kakao.com/v2/kakaomap.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=YOUR_APP_KEY&libraries=services"></script>

 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/noUiSlider/14.6.3/nouislider.min.css" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/noUiSlider/14.6.3/nouislider.min.js"></script>

  
<style>
.custom-height {
	height: 250px; 
	display: flex;
	align-items: center; 
	justify-content: center; 
}
.border-bottom {
	
}
</style>

<div class="main-wrapper overflow-hidden">
	<!-- ------------------------------------- -->
	<!-- banner Start -->
	<!-- ------------------------------------- -->
	<section class="bg-primary-subtle custom-height">
		<div class="container-fluid">
			<div class="text-center">
				<p class="text-primary fs-4 fw-bolder">MYPAGE</p>
				<h1 class="fw-bolder fs-12">마이페이지</h1>
			</div>
		</div>
	</section>
</div>
<%-- <div class="card bg-primary-gt text-white overflow-hidden shadow-none">
                <div class="card-body">
                  <div class="row justify-content-between align-items-center">
                    <div class="col-sm-6">
                      <h5 class="fw-semibold mb-9 fs-5 text-white">Welcome back Natalia!</h5>
                      <p class="mb-9 opacity-75">
                        You have earned 54% more than last month
                        which is great thing.
                      </p>
                      <button type="button" class="btn btn-danger">Check</button>
                    </div>
                    <div class="col-sm-5">
                      <div class="position-relative mb-n7 text-end">
                        <img src="${pageContext.request.contextPath }/resources/assets/images/logos/symbol-01.png" style="width:100px;" alt="modernize-img" class="img-fluid">
                      </div>
                    </div>
                  </div>
                </div>
              </div> --%>
<div class="body-wrapper bg-primary-subtle">

<div class="row ms-10">
  <div class="card col-11 mx-auto">
                <div class="card-body" style="padding-bottom: 0px;">
                  <div class="d-flex flex-row">
                    <div>
                      <img src="${pageContext.request.contextPath }/resources/assets/images/profile/user-6.jpg" alt="user" class="rounded-circle" width="100" />
                    </div>
                   <div class="ps-3 d-flex align-items-center"> <!-- d-flex 클래스를 추가하여 flexbox 사용 -->
					    <div class="me-2"> <!-- 버튼과 텍스트 사이의 간격을 위해 margin-end 추가 -->
					        <h4 class="card-title mb-0">Welcome!</h4> <!-- mb-0으로 아래 마진 제거 -->
					        <h2 class="mb-2 mt-2">${customerVO.cusName } 님, <span class="card-title mb-2">환영합니다!</span></h2>
					        <input type="hidden" id="cusNo" name="cusNo" value="${customerVO.cusNo }">
					        <button class="btn bg-primary-subtle btn-sm text-primary me-2" id="myInfo" data-bs-toggle="modal" data-bs-target="#infoModal">내 정보</button>
					        <button class="btn bg-primary-subtle btn-sm text-primary" id="myBoard" onclick="location.href='/customer/myBoardList'">내 게시글</button>
					         <!-- mb-0으로 아래 마진 제거 -->
					    </div>
				   </div>
                  </div>
                  <div class="row mt-5">
                   <div class="col-md-4 col-lg-2 border-end d-flex justify-content-center align-items-center" style="height: 200px;">
				    <div class="text-center"> <!-- 텍스트를 수평 중앙 정렬 -->
				        <h2 class="fs-7">${myReserveCount.TRCOUNT }<span class="fs-5 ms-2" style="color: gray;">건</span></h2>
				        <h6 class="mb-0">나의 항공권</h6>
				    </div>
				  </div>

             <div class="col-md-4 col-lg-5 d-flex align-items-stretch">
    <div class="card w-100 rounded-bottom-0">
        <div class="card-body">

                    <c:set value="false" var="loop_flags" />
                	<c:forEach var="myTicketingVO" items="${myTicketingVO }"> 
						<c:if test="${loop_flags eq false}">
	
						<c:if test="${myTicketingVO.tkDepart eq 'ICN' }">
	                <input type="hidden" id="tkNo" name="tkNo" value="${myTicketingVO.tkNo}">
	                <input type="hidden" id="tkGroup" name="tkGroup" value="${myTicketingVO.tkGroup}">
                    <div class="border-end pe-3 d-flex">
                        <h6 class="text-primary fw-normal" style="margin-right: 80px;">${myTicketingVO.tkDepartcity}</h6>
                        <h6 class="text-primary fw-normal">${myTicketingVO.tkArrivalcity}</h6>
                        <div class="ms-auto">
                            <span class="text-danger fs-3"><i class="ti ti-caret-down fs-4"></i> 왕복</span>
                        </div>
                    </div>
                    <div class="d-flex align-items-center">
                        <h4 class="card-title mb-0">${myTicketingVO.tkDepart} 출발
                            <i class="ti ti-line-dotted fs-4 ms-2 me-2"></i>
                            ${myTicketingVO.tkArrival} 도착
                        </h4>
                    </div>
                    <div class="d-flex align-items-center my-3">
                        <div class="border-end pe-3">
                            <h6 class="text-muted fw-normal">출발지 <i class="ti ti-plane-departure fs-4 text-info"></i></h6>
                            <b>${myTicketingVO.tkDepart}</b>
                        </div>
                        <div class="ms-3 border-end pe-3">
                            <h6 class="text-muted fw-normal">출발 시간</h6>
                            <b>${myTicketingVO.tkDepartdate}</b>
                        </div>
                        <div class="ms-3">
                            <h6 class="text-muted fw-normal">FLIGHT</h6>
                            <b>${myTicketingVO.tkFlight}</b>
                        </div>
                    </div>
                    <div class="d-flex align-items-center my-3">
                        <div class="border-end pe-3">
                            <h6 class="text-muted fw-normal">도착지 <i class="ti ti-plane-arrival fs-4 text-info"></i></h6>
                            <b>${myTicketingVO.tkArrival}</b>
                        </div>
                        <div class="ms-3 border-end pe-3">
                            <h6 class="text-muted fw-normal">도착시간</h6>
                            <b>${myTicketingVO.tkArridate}</b>
                        </div>
                        <div class="ms-3 border-end pe-3">
                            <h6 class="text-muted fw-normal">GATE</h6>
                            <b>${myTicketingVO.scGate}</b>
                        </div>
                        <div class="ms-3 border-end pe-3">
                            <h6 class="text-muted fw-normal">CHECK-IN</h6>
                            <b>${myTicketingVO.scCheckin}</b>
                        </div>
                        <div class="ms-3">
                            <h6 class="text-muted fw-normal">SEAT</h6>
                            <b>${myTicketingVO.tkSeat}</b>
                        </div>
                    </div>
                    <button class="btn bg-primary-subtle btn-sm text-primary" data-bs-toggle="modal" data-bs-target="#passportModal">여권 정보</button>
							<c:set value="true" var="loop_flags"/>
							</c:if>
						</c:if>	                	
                	</c:forEach>
                	<c:if test="${loop_flags eq false }">
                	<div class="text-center">
                        <p class="text-muted">티켓정보가 없습니다.</p>
                    </div>
                	</c:if>    

        </div>
        <div class="progress text-bg-light">
            <div class="progress-bar progress-bar-striped text-bg-secondary progress-bar-animated" style="width: 100%; height: 6px;" role="progressbar">
                <span class="sr-only">100% Complete</span>
            </div>
        </div>
    </div>
</div>

            
             <div class="col-md-4 col-lg-5 d-flex align-items-stretch">
    <div class="card w-100 rounded-bottom-0">
        <div class="card-body">
 
                <c:set value="false" var="loop_flag" />
                	<c:forEach var="myTicketingVO" items="${myTicketingVO }"> 
						<c:if test="${loop_flag eq false}">
							<c:if test="${myTicketingVO.tkArrival eq 'ICN' }">
								
								
                    <input type="hidden" id="tkNo" name="tkNo" value="${myTicketingVO.tkNo}">
                    <div class="border-end pe-3 d-flex">
                        <h6 class="text-primary fw-normal" style="margin-right: 80px;">${myTicketingVO.tkDepartcity}</h6>
                        <h6 class="text-primary fw-normal">${myTicketingVO.tkArrivalcity}</h6>
                        <div class="ms-auto">
                            <span class="text-danger fs-3"><i class="ti ti-caret-down fs-4"></i> 왕복</span>
                        </div>
                    </div>
                    <div class="d-flex align-items-center">
                        <h4 class="card-title mb-0">${myTicketingVO.tkDepart} 출발
                            <i class="ti ti-line-dotted fs-4 ms-2 me-2"></i>
                            ${myTicketingVO.tkArrival} 도착
                        </h4>
                    </div>
                    <div class="d-flex align-items-center my-3">
                        <div class="border-end pe-3">
                            <h6 class="text-muted fw-normal">출발지 <i class="ti ti-plane-departure fs-4 text-info"></i></h6>
                            <b>${myTicketingVO.tkDepart}</b>
                        </div>
                        <div class="ms-3 border-end pe-3">
                            <h6 class="text-muted fw-normal">출발 시간</h6>
                            <b>${myTicketingVO.tkDepartdate}</b>
                        </div>
                        <div class="ms-3">
                            <h6 class="text-muted fw-normal">FLIGHT</h6>
                            <b>${myTicketingVO.tkFlight}</b>
                        </div>
                    </div>
                    <div class="d-flex align-items-center my-3">
                        <div class="border-end pe-3">
                            <h6 class="text-muted fw-normal">도착지 <i class="ti ti-plane-arrival fs-4 text-info"></i></h6>
                            <b>${myTicketingVO.tkArrival}</b>
                        </div>
                        <div class="ms-3 border-end pe-3">
                            <h6 class="text-muted fw-normal">도착시간</h6>
                            <b>${myTicketingVO.tkArridate}</b>
                        </div>
                        <div class="ms-3 border-end pe-3">
                            <h6 class="text-muted fw-normal">GATE</h6>
                            <b>${myTicketingVO.scGate}</b>
                        </div>
                        <div class="ms-3 border-end pe-3">
                            <h6 class="text-muted fw-normal">CHECK-IN</h6>
                            <b>${myTicketingVO.scCheckin}</b>
                        </div>
                        <div class="ms-3">
                            <h6 class="text-muted fw-normal">SEAT</h6>
                            <b>${myTicketingVO.tkSeat}</b>
                        </div>
                    </div>
                    <button class="btn bg-primary-subtle btn-sm text-primary" data-bs-toggle="modal" data-bs-target="#passportModal">여권 정보</button>
							<c:set value="true" var="loop_flag"/>
							</c:if>
						</c:if>	                	
                	</c:forEach>                
                	<c:if test="${loop_flag eq false }">
                    <div class="text-center">
                        <p class="text-muted">티켓정보가 없습니다.</p>
                    </div>
                	</c:if>
        </div>
        <div class="progress text-bg-light">
            <div class="progress-bar progress-bar-striped text-bg-primary progress-bar-animated" style="width: 100%; height: 6px;" role="progressbar">
                <span class="sr-only">100% Complete</span>
            </div>
        </div>
    </div>
</div>



          </div>
         <!-- 항공권 금액 -->     
         		 <c:choose>
					<c:when test="${empty myTicketingVO }">
						<p></p>
					</c:when>
						<c:otherwise>
         <div class="d-flex justify-content-end">    
          <div class="col-md-3">
              <div class="card">
                <div class="card-body">
                  <div class="d-flex flex-row">
                    <div class="round-40 rounded-circle text-white d-flex align-items-center justify-content-center text-bg-info">
                      <i class="ti ti-credit-card fs-6"></i>
                    </div>
                    <div class="ms-3 align-self-center">
                      <h4 class="mb-0 fs-5">금액</h4>
                      <span>항공권</span>
                    </div>
                    <div class="ms-auto align-self-center">
                    <c:set var="tkPrice1" value="${myTicketingVO[0].tkPrice }"/>
                    <c:set var="tkPrice2" value="${myTicketingVO[1].tkPrice }"/>
                    <c:set var="sum" value="${tkPrice1 + tkPrice2 }"/>
                      <h2 class="fs-7 mb-0">₩ <fmt:formatNumber value="${sum}" pattern="#,##0" /> 원</h2>
                    </div>
                  </div>
                </div>
              </div>
            </div> 
           </div>  
             </c:otherwise>
			</c:choose>   
          <!-- 항공권 끝 -->        
       </div>
      <div>
     <hr />
    <div class="col-lg-12"> <!-- 두 번째 카드 -->
      <div class="card mx-2 mb-10"> 
        <div class="card-body">
          <h4 class="card-title fw-semibold mb-7">나의 여정</h4>
            <div class="row justify-content-center">
            
			    <div class="col-lg-2 col-md-6">
			        <div class="card card-hover reservation-card" id="parking-card"  data-info="pkReservation-info">
			            <div class="card-body d-flex align-items-center"> <!-- Flexbox 추가 -->
			                <div class="d-flex align-items-center">
			                    <div class="bg-warning-subtle text-warning rounded d-flex align-items-center p-3 justify-content-center me-3"> <!-- p-3로 패딩 조정 -->
			                        <i class="ti ti-parking fs-8"></i>
			                    </div>
			                    <div>
			                        <h4 class="card-title mb-0">${myReserveCount.PRCOUNT } <span class="fs-4 ms-2" style="color: gray;">건</span></h4> <!-- mb-0로 아래 여백 제거 -->
			                        <h6 class="card-subtitle mb-0">주차장</h6>
			                    </div>
			                </div>
			            </div>
			        </div>
			    </div>
			    
			    <div class="col-lg-2 col-md-6">
			        <div class="card card-hover reservation-card" id="hotel-card" data-info="htReservation-info">
			            <div class="card-body d-flex align-items-center"> <!-- Flexbox 추가 -->
			                <div class="d-flex align-items-center">
			                    <div class="bg-primary-subtle text-primary rounded d-flex align-items-center p-3 justify-content-center me-3"> <!-- p-3로 패딩 조정 -->
			                        <i class="ti ti-building fs-8"></i>
			                    </div>
			                    <div>
			                        <h4 class="card-title mb-0">${myReserveCount.HRCOUNT } <span class="fs-4 ms-2" style="color: gray;">건</span></h4> <!-- mb-0로 아래 여백 제거 -->
			                        <h6 class="card-subtitle mb-0">캡슐호텔</h6>
			                    </div>
			                </div>
			            </div>
			        </div>
			    </div>
			    
			    <div class="col-lg-2 col-md-6">
			        <div class="card card-hover reservation-card" id="meeting-card" data-info="mrReservation-info">
			            <div class="card-body d-flex align-items-center"> <!-- Flexbox 추가 -->
			                <div class="d-flex align-items-center">
			                    <div class="bg-danger-subtle text-danger rounded d-flex align-items-center p-3 justify-content-center me-3"> <!-- p-3로 패딩 조정 -->
			                        <i class="ti ti-brand-hipchat fs-8"></i>
			                    </div>
			                    <div>
			                        <h4 class="card-title mb-0">${myReserveCount.MRCOUNT } <span class="fs-4 ms-2" style="color: gray;">건</span></h4> <!-- mb-0로 아래 여백 제거 -->
			                        <h6 class="card-subtitle mb-0">회의실</h6>
			                    </div>
			                </div>
			            </div>
			        </div>
			    </div>
    
			    <div class="col-lg-2 col-md-6">
			        <div class="card card-hover reservation-card" id="rounge-card" data-info="rgReservation-info">
			            <div class="card-body d-flex align-items-center"> <!-- Flexbox 추가 -->
			                <div class="d-flex align-items-center">
			                    <div class="bg-success-subtle text-success rounded d-flex align-items-center p-3 justify-content-center me-3"> <!-- p-3로 패딩 조정 -->
			                        <i class="ti ti-armchair-2 fs-8"></i>
			                    </div>
			                    <div>
			                        <h4 class="card-title mb-0">${myReserveCount.RRRCOUNT } <span class="fs-4 ms-2" style="color: gray;">건</span></h4> <!-- mb-0로 아래 여백 제거 -->
			                        <h6 class="card-subtitle mb-0">라운지</h6>
			                    </div>
			                </div>
			            </div>
			        </div>
			    </div>
    
			    <div class="col-lg-2 col-md-6">
			        <div class="card card-hover reservation-card" id="ticket-card" data-info="ticketing-info">
			            <div class="card-body d-flex align-items-center"> <!-- Flexbox 추가 -->
			                <div class="d-flex align-items-center">
			                    <div class="bg-info-subtle text-info rounded d-flex align-items-center p-3 justify-content-center me-3"> <!-- p-3로 패딩 조정 -->
			                        <i class="ti ti-plane-inflight fs-8"></i>
			                    </div>
			                    <div>
			                        <h4 class="card-title mb-0">${myReserveCount.TRCOUNT }<span class="fs-4 ms-2" style="color: gray;">건</span></h4> <!-- mb-0로 아래 여백 제거 -->
			                        <h6 class="card-subtitle mb-0">항공권</h6>
			                    </div>
			                </div>
			            </div>
			        </div>
			    </div>
			</div>
          </div>
        </div>
      </div>
    </div>
    
	<div class="mt-2"> 
	<div class="tab-pane" id="reserve" role="tabpanel" aria-labelledby="pills-bills-tab" tabindex="0">

    <!-- 주차예약내역 카드 시작 -->
    <form action="/customer/myReserveDelete" method="post" id="myParkingReserveCard">
	<div class="row justify-content-center mb-3" id="pkReservation-info" style="display: none;">
    <div class="col-lg-5">
        <div class="card border shadow-none" style="height: 270px; overflow-y: auto;">
            <div class="card-body p-4">
                <c:choose>
                    <c:when test="${empty myParkingVO}">
                        <h4 class="card-title">선택한 예약 정보 <span class="text-warning ms-3">주차장</span></h4>
                        <h3>주차장 예약내역이 없습니다.</h3>
                    </c:when>
                    <c:otherwise>
                        <h4 class="card-title">선택한 예약 정보 <span class="text-warning ms-3">주차장</span></h4>
                        <p class="card-subtitle">예약 내역을 확인하고 취소할 수 있습니다.</p>
                        <div class="d-flex align-items-center justify-content-between mt-7 mb-3">
                            <div class="d-flex align-items-center gap-3">
                                <div class="text-bg-light rounded-1 p-6 d-flex align-items-center justify-content-center">
                                    <i class="ti ti-car text-dark d-block fs-7" width="22" height="22"></i>
                                </div>
                                <div>
                                    <p class="mb-0">차량 정보</p>
                                    <h5 class="fs-4 fw-semibold me-2">${myParkingVO.prCarno}</h5>
                                </div>
                                <div>
                                    <p class="mb-0">입차일</p>
                                    <h5 class="fs-4 fw-semibold me-2">${fn:split(myParkingVO.prEntry, ' ')[0]}</h5>
                                </div>
                                <div>
                                    <p class="mb-0">출차일</p>
                                    <h5 class="fs-4 fw-semibold me-2">${fn:split(myParkingVO.prExit, ' ')[0]}</h5>
                                </div>
                            </div>
                        </div>

                        <div class="d-flex align-items-center gap-3 mt-4">
                            <div class="text-bg-light rounded-1 p-6 d-flex align-items-center justify-content-center">
                                <i class="ti ti-user text-dark d-block fs-7" width="22" height="22"></i>
                            </div>
                            <div>
                                <p class="mb-0">주차 유형</p>
                                <c:if test="${myParkingVO.plNo == '1'}">
                                    <h5 class="fs-4 fw-semibold me-2">일반 차량</h5>
                                </c:if>
                                <c:if test="${myParkingVO.plNo == '2'}">
                                    <h5 class="fs-4 fw-semibold me-2">장애인/유공자</h5>
                                </c:if>
                                <c:if test="${myParkingVO.plNo == '3'}">
                                    <h5 class="fs-4 fw-semibold me-2">다자녀</h5>
                                </c:if>
                            </div>
                            <div>
                                <p class="mb-0">예약자명</p>
                                <h5 class="fs-4 fw-semibold me-2">${myParkingVO.prName}</h5>
                            </div>
                            <div>
                                <p class="mb-0">연락처</p>
                                <h5 class="fs-4 fw-semibold me-2">${myParkingVO.prTel}</h5>
                            </div>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>

    <div class="col-lg-5">
        <div class="card border shadow-none" style="height: 270px; overflow-y: auto;">
            <div class="card-body p-4">
                <h4 class="card-title">결제 내역</h4>
                <c:choose>
                    <c:when test="${empty myParkingVO}">
                        <h3>결제내역이 없습니다.</h3>
                    </c:when>
                    <c:otherwise>
                        <p class="card-subtitle">결제 일시 ${fn:split(myParkingVO.prDate, ' ')[0]}</p>
                        <div class="d-flex align-items-center justify-content-between mt-7 mb-0">
                            <div class="d-flex align-items-center gap-3">
                                <div class="text-bg-light rounded-1 p-6 d-flex align-items-center justify-content-center">
                                    <i class="ti ti-credit-card text-dark d-block fs-7" width="22" height="22"></i>
                                </div>
                                <div>
                                    <p class="mb-0 text-dark">결제 수단</p>
                                    <h5 class="fs-4 fw-semibold">KakaoPay</h5>
                                </div>
                            </div>
                            <p class="my-2">예약을 변경하고 싶다면 결제를 취소하고 다시 예약해주세요.</p>
                        </div>
                        <div class="d-flex align-items-center justify-content-between mt-3">
                            <div class="d-flex align-items-center gap-3">
                                <div class="text-bg-light rounded-1 p-6 d-flex align-items-center justify-content-center">
                                    <i class="ti ti-currency-won text-dark d-block fs-7" width="22" height="22"></i>
                                </div>
                                <div>
                                    <p class="mb-0 text-dark">결제 금액</p>
                                    <h5 class="fs-4 fw-semibold">₩ <fmt:formatNumber value="${myParkingVO.prCost}" pattern="#,##0" /> 원</h5>
                                </div>
                            </div>
                            <div class="d-flex justify-content-end mt-4">
                            	<input type="hidden" id="prNo" name="prNo" value="${myParkingVO.prNo}">
                                <button type="button" class="btn btn-danger" id="parkingReserveCancelBtn">예약 취소</button>
                            </div>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>
</div>
</form>
<!-- 주차예약내역 카드 끝 -->
    <!-- 호텔예약내역 카드 시작 -->
    <form action="/customer/myReserveDelete" method="post" id="myHotelReserveCard">
	<div class="row justify-content-center mb-3" id="htReservation-info" style="display: none;">
    <div class="col-lg-5">
        <div class="card border shadow-none" style="height: 270px; overflow-y: auto;">
            <div class="card-body p-4">
                <c:choose>
                    <c:when test="${empty myHotelVO}">
                        <h4 class="card-title">선택한 예약 정보 <span class="text-primary ms-3">캡슐호텔</span></h4>
                        <h3>호텔 예약내역이 없습니다.</h3>
                    </c:when>
                    <c:otherwise>
                        <h4 class="card-title">선택한 예약 정보 <span class="text-primary ms-3">캡슐호텔</span></h4>
                        <p class="card-subtitle">예약 내역을 확인하고 취소할 수 있습니다.</p>
                        <div class="d-flex align-items-center justify-content-between mt-7 mb-3">
                            <div class="d-flex align-items-center gap-3">
                                <div class="text-bg-light rounded-1 p-6 d-flex align-items-center justify-content-center">
                                    <i class="ti ti-heading text-dark d-block fs-7" width="22" height="22"></i>
                                </div>
                                <div>
                                    <p class="mb-0">호텔 호수</p>
                                    <c:if test="${myHotelVO.htNo == '1'}">
                                    <h5 class="fs-4 fw-semibold me-2">
										싱글룸(101~105)                                    	
                                    </h5>
                                    </c:if>
                                    <c:if test="${myHotelVO.htNo == '2'}">
                                    <h5 class="fs-4 fw-semibold me-2">
										싱글룸(201~205)                                    	
                                    </h5>
                                    </c:if>
                                    <c:if test="${myHotelVO.htNo == '3'}">
                                    <h5 class="fs-4 fw-semibold me-2">
										싱글룸(301~305)                                    	
                                    </h5>
                                    </c:if>
                                    <c:if test="${myHotelVO.htNo == '4'}">
                                    <h5 class="fs-4 fw-semibold me-2">
										싱글룸(401~405)                                    	
                                    </h5>
                                    </c:if>
                                    <c:if test="${myHotelVO.htNo == '5'}">
                                    <h5 class="fs-4 fw-semibold me-2">
										싱글룸(501~505)                                    	
                                    </h5>
                                    </c:if>
                                </div>
                                <div>
                                    <p class="mb-0">체크인</p>
                                    <h5 class="fs-4 fw-semibold me-2">${fn:split(myHotelVO.hrCheckin, ' ')[0]}</h5>
                                </div>
                            </div>
                        </div>

                        <div class="d-flex align-items-center gap-3 mt-4">
                            <div class="text-bg-light rounded-1 p-6 d-flex align-items-center justify-content-center">
                                <i class="ti ti-user text-dark d-block fs-7" width="22" height="22"></i>
                            </div>
                            <div>
                                <p class="mb-0">예약자명</p>
                                    <h5 class="fs-4 fw-semibold me-2">${myHotelVO.hrName}</h5>
                            </div>
                            <div>
                                <p class="mb-0">연락처</p>
                                <h5 class="fs-4 fw-semibold me-2">${myHotelVO.hrTel}</h5>
                            </div>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>

    <div class="col-lg-5">
        <div class="card border shadow-none" style="height: 270px; overflow-y: auto;">
            <div class="card-body p-4">
                <h4 class="card-title">결제 내역</h4>
                <c:choose>
                    <c:when test="${empty myHotelVO}">
                        <h3>결제내역이 없습니다.</h3>
                    </c:when>
                    <c:otherwise>
                        <p class="card-subtitle">결제 일시 ${fn:split(myHotelVO.hrDate, ' ')[0]}</p>
                        <div class="d-flex align-items-center justify-content-between mt-7 mb-0">
                            <div class="d-flex align-items-center gap-3">
                                <div class="text-bg-light rounded-1 p-6 d-flex align-items-center justify-content-center">
                                    <i class="ti ti-credit-card text-dark d-block fs-7" width="22" height="22"></i>
                                </div>
                                <div>
                                    <p class="mb-0 text-dark">결제 수단</p>
                                    <h5 class="fs-4 fw-semibold">KakaoPay</h5>
                                </div>
                            </div>
                            <p class="my-2">예약을 변경하고 싶다면 결제를 취소하고 다시 예약해주세요.</p>
                        </div>
                        <div class="d-flex align-items-center justify-content-between mt-3">
                            <div class="d-flex align-items-center gap-3">
                                <div class="text-bg-light rounded-1 p-6 d-flex align-items-center justify-content-center">
                                    <i class="ti ti-currency-won text-dark d-block fs-7" width="22" height="22"></i>
                                </div>
                                <div>
                                    <p class="mb-0 text-dark">결제 금액</p>
                                    <h5 class="fs-4 fw-semibold">₩ <fmt:formatNumber value="${myParkingVO.prCost}" pattern="#,##0" /> 원</h5>
                                </div>
                            </div>
                            <div class="d-flex justify-content-end mt-4">
                            <input type="hidden" id="hrNo" name="hrNo" value="${myHotelVO.hrNo}">
                                <button type="button" class="btn btn-danger" id="HotelReserveCancelBtn">예약 취소</button>
                            </div>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>
</div>
</form>
<!-- 호텔예약내역 카드 끝 -->
    <!-- 회의실 예약내역 카드 시작 -->
	<div class="row justify-content-center mb-3" id="mrReservation-info" style="display: none;">
    <div class="col-lg-5">
        <div class="card border shadow-none" style="height: 270px; overflow-y: auto;">
            <div class="card-body p-4">
                        <h4 class="card-title">선택한 예약 정보 <span class="text-danger ms-3">회의실</span></h4>
                        <h3>회의실 예약내역이 없습니다.</h3>
                       <%--  <p class="card-subtitle">예약 내역을 확인하고 취소할 수 있습니다.</p>
                        <div class="d-flex align-items-center justify-content-between mt-7 mb-3">
                            <div class="d-flex align-items-center gap-3">
                                <div class="text-bg-light rounded-1 p-6 d-flex align-items-center justify-content-center">
                                    <i class="ti ti-heading text-dark d-block fs-7" width="22" height="22"></i>
                                </div>
                                <div>
                                    <p class="mb-0">회의실 이름</p>
                                    <h5 class="fs-4 fw-semibold me-2">
										싱글룸(101~105)                                    	
                                    </h5>
                                </div>
                                <div>
                                    <p class="mb-0">이용시간</p>
                                    <h5 class="fs-4 fw-semibold me-2">${fn:split(myHotelVO.hrCheckin, ' ')[0]}</h5>
                                </div>
                            </div>
                        </div>

                        <div class="d-flex align-items-center gap-3 mt-4">
                            <div class="text-bg-light rounded-1 p-6 d-flex align-items-center justify-content-center">
                                <i class="ti ti-user text-dark d-block fs-7" width="22" height="22"></i>
                            </div>
                            <div>
                                <p class="mb-0">예약자명</p>
                                    <h5 class="fs-4 fw-semibold me-2">${myHotelVO.hrName}</h5>
                            </div>
                            <div>
                                <p class="mb-0">연락처</p>
                                <h5 class="fs-4 fw-semibold me-2">${myHotelVO.hrTel}</h5>
                            </div>
                        </div> --%>
            </div>
        </div>
    </div>

    <div class="col-lg-5">
        <div class="card border shadow-none" style="height: 270px; overflow-y: auto;">
            <div class="card-body p-4">
                <h4 class="card-title">결제 내역</h4>
                        <h3>결제내역이 없습니다.</h3>
                        <%-- <p class="card-subtitle">결제 일시 ${fn:split(myHotelVO.hrDate, ' ')[0]}</p>
                        <div class="d-flex align-items-center justify-content-between mt-7 mb-0">
                            <div class="d-flex align-items-center gap-3">
                                <div class="text-bg-light rounded-1 p-6 d-flex align-items-center justify-content-center">
                                    <i class="ti ti-credit-card text-dark d-block fs-7" width="22" height="22"></i>
                                </div>
                                <div>
                                    <p class="mb-0 text-dark">결제 수단</p>
                                    <h5 class="fs-4 fw-semibold">KakaoPay</h5>
                                </div>
                            </div>
                            <p class="my-2">예약을 변경하고 싶다면 결제를 취소하고 다시 예약해주세요.</p>
                        </div>
                        <div class="d-flex align-items-center justify-content-between mt-3">
                            <div class="d-flex align-items-center gap-3">
                                <div class="text-bg-light rounded-1 p-6 d-flex align-items-center justify-content-center">
                                    <i class="ti ti-currency-won text-dark d-block fs-7" width="22" height="22"></i>
                                </div>
                                <div>
                                    <p class="mb-0 text-dark">결제 금액</p>
                                    <h5 class="fs-4 fw-semibold">₩ ${myHotelVO.hrCost}</h5>
                                </div>
                            </div>
                            <div class="d-flex justify-content-end mt-4">
                                <button class="btn btn-danger">예약 취소</button>
                            </div>
                        </div> --%>
            </div>
        </div>
    </div>
</div>
<!-- 회의실 예약내역 카드 끝 -->
    <!-- 라운지 예약내역 카드 시작 -->
    <form action="/customer/myReserveDelete" method="post" id="myRoungeReserveCard">
	<div class="row justify-content-center mb-3" id="rgReservation-info" style="display: none;">
    <div class="col-lg-5">
        <div class="card border shadow-none" style="height: 270px; overflow-y: auto;">
            <div class="card-body p-4">
                <c:choose>
                    <c:when test="${empty myRoungeVO}">
                        <h4 class="card-title">선택한 예약 정보 <span class="text-success ms-3">라운지</span></h4>
                        <h3>라운지 예약내역이 없습니다.</h3>
                    </c:when>
                    <c:otherwise>
                        <h4 class="card-title">선택한 예약 정보 <span class="text-success ms-3">라운지</span></h4>
                        <p class="card-subtitle">예약 내역을 확인하고 취소할 수 있습니다.</p>
                        <div class="d-flex align-items-center justify-content-between mt-7 mb-3">
                            <div class="d-flex align-items-center gap-3">
                                <div class="text-bg-light rounded-1 p-6 d-flex align-items-center justify-content-center">
                                    <i class="ti ti-circle-letter-r text-dark d-block fs-7" width="22" height="22"></i>
                                </div>
                                <div>
                                    <p class="mb-0">라운지 이름</p>
                                    <c:if test="${myRoungeVO.rgNo == '7'}">
                                    <h5 class="fs-4 fw-semibold me-2">
										더 라운지                                    	
                                    </h5>
                                    </c:if>
                                    <c:if test="${myRoungeVO.rgNo == '8'}">
                                    <h5 class="fs-4 fw-semibold me-2">
										마티나 라운지                                    	
                                    </h5>
                                    </c:if>
                                    <c:if test="${myRoungeVO.rgNo == '9'}">
                                    <h5 class="fs-4 fw-semibold me-2">
										스카이허브 라운지                                    	
                                    </h5>
                                    </c:if>
                                </div>
                                <div>
                                    <p class="mb-0">이용 수량</p>
                                    <h5 class="fs-4 fw-semibold me-2">${myRoungeVO.rrCount} 매</h5>
                                </div>
                            </div>
                        </div>

                        <div class="d-flex align-items-center gap-3 mt-4">
                            <div class="text-bg-light rounded-1 p-6 d-flex align-items-center justify-content-center">
                                <i class="ti ti-user text-dark d-block fs-7" width="22" height="22"></i>
                            </div>
                            <div>
                                <p class="mb-0">예약자명</p>
                                    <h5 class="fs-4 fw-semibold me-2">${myRoungeVO.rrName}</h5>
                            </div>
                            <div>
                                <p class="mb-0">연락처</p>
                                <h5 class="fs-4 fw-semibold me-2">${myRoungeVO.rrTel}</h5>
                            </div>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>

    <div class="col-lg-5">
        <div class="card border shadow-none" style="height: 270px; overflow-y: auto;">
            <div class="card-body p-4">
                <h4 class="card-title">결제 내역</h4>
                <c:choose>
                    <c:when test="${empty myRoungeVO}">
                        <h3>결제내역이 없습니다.</h3>
                    </c:when>
                    <c:otherwise>
                        <p class="card-subtitle">결제 일시 ${fn:split(myRoungeVO.rrDate, ' ')[0]}</p>
                        <div class="d-flex align-items-center justify-content-between mt-7 mb-0">
                            <div class="d-flex align-items-center gap-3">
                                <div class="text-bg-light rounded-1 p-6 d-flex align-items-center justify-content-center">
                                    <i class="ti ti-credit-card text-dark d-block fs-7" width="22" height="22"></i>
                                </div>
                                <div>
                                    <p class="mb-0 text-dark">결제 수단</p>
                                    <h5 class="fs-4 fw-semibold">KakaoPay</h5>
                                </div>
                            </div>
                            <p class="my-2">예약을 변경하고 싶다면 결제를 취소하고 다시 예약해주세요.</p>
                        </div>
                        <div class="d-flex align-items-center justify-content-between mt-3">
                            <div class="d-flex align-items-center gap-3">
                                <div class="text-bg-light rounded-1 p-6 d-flex align-items-center justify-content-center">
                                    <i class="ti ti-currency-won text-dark d-block fs-7" width="22" height="22"></i>
                                </div>
                                <div>
                                    <p class="mb-0 text-dark">결제 금액</p>
                                    <h5 class="fs-4 fw-semibold">₩ <fmt:formatNumber value="${myRoungeVO.rrCost}" pattern="#,##0" /> 원</h5>
                                </div>
                            </div>
                            <div class="d-flex justify-content-end mt-4">
                            	<input type="hidden" id="rrNo" name="rrNo" value="${myRoungeVO.rrNo}">
                                <button type="button" class="btn btn-danger" id="RoungeReserveCancelBtn">예약 취소</button>
                            </div>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>
</div>
</form>
<!-- 라운지 예약내역 카드 끝 -->
    <!-- 항공권 예약내역 카드 시작 -->
    <form action="/customer/myReserveDelete" method="post" id="ticketingCard">
    <input type="hidden" id="tkNoInput" name="tkNo">
	<div class="row justify-content-center mb-3" id="ticketing-info" style="display: none;">

    <!-- 항공권 리스트가 비어 있는 경우 안내 메시지 출력 -->
    <c:if test="${empty myTicketingVO}">
        <div class="col-lg-10">
            <div class="card border shadow-none">
                <div class="card-body text-center">
                    <h4 class="card-title">선택한 예약 정보</h4>
                    <h3 class="text-muted">항공권 예약 내역이 없습니다.</h3>
                </div>
            </div>
        </div>
    </c:if>

    <!-- 항공권 리스트가 있는 경우 항목 반복 출력 -->
    <c:forEach items="${myTicketingVO}" var="ticket">
        <div class="col-lg-5 mb-3"> <!-- 예약 정보 카드 -->
            <div class="card border" style="height: 300px; overflow-y: auto;">
                <div class="card-body p-4">
                    <h4 class="card-title d-flex align-items-center">
                        <span>선택한 예약 정보</span>
                        <span class="text-info ms-3 me-5">항공권</span><span class="text-warning ms-3" style="font-size: 15px;">예약번호</span> <span class="ms-3" style="font-size: 18px; color: gray;"> ${fn:toUpperCase(ticket.tkGroup)}</span>
                       <%--  <p>예약번호 ${ticket.tkGroup}</p> --%>
                        <span class="mb-1 badge rounded-pill bg-primary-subtle text-primary ms-auto">
                            <span class="round-8 text-bg-primary rounded-circle d-inline-block me-1"></span>사용전</span>
                    </h4>

                    <p class="card-subtitle">예약 내역을 확인하고 취소할 수 있습니다.</p>
                    <div class="d-flex align-items-center justify-content-between mt-7 mb-3">
                        <div class="d-flex align-items-center gap-3">
                            <div class="text-bg-light rounded-1 p-6 d-flex align-items-center justify-content-center">
                                <i class="ti ti-plane text-dark d-block fs-7"></i>
                            </div>
                            <div>
                                <p class="mb-0">편명</p>
                                <h5 class="fs-4 fw-semibold me-2">${ticket.tkFlight}</h5>
                            </div>
                            <div>
	                            <p class="mb-0">좌석</p>
	                            <h5 class="fs-4 fw-semibold me-2">${ticket.tkSeat}</h5>
	                        </div>
                            
                            <div>
                                <p class="mb-0">게이트</p>
                                <h5 class="fs-4 fw-semibold me-2">${ticket.scGate} </h5>
                            </div>
                            <div>
                                <p class="mb-0">CHECK-IN</p>
                                <h5 class="fs-4 fw-semibold me-2">${ticket.scCheckin}</h5>
                            </div>
                            <div class="text-bg-light rounded-1 p-6 d-flex align-items-center justify-content-center ms-5">
                                <i class="ti ti-currency-won text-dark d-block fs-7"></i>
                            </div>
                            <div>
                                <p class="mb-0">티켓 금액</p>
                                <h5 class="fs-4 fw-semibold me-2"><fmt:formatNumber value="${ticket.tkPrice}" pattern="#,##0" /> 원</h5>
                            </div>
                        </div>
                    </div>

                    <div class="d-flex align-items-center gap-4 mt-4">
                        <div class="text-bg-light rounded-1 p-6 d-flex align-items-center justify-content-center">
                            <i class="ti ti-plane-departure text-dark d-block fs-7"></i>
                        </div>
                        <div>
                            <p class="mb-0">출발일시</p>
                            <h5 class="fs-4 fw-semibold me-2">${ticket.tkDepartdate}</h5>
                        </div>
                        <div class="text-bg-light rounded-1 p-6 d-flex align-items-center justify-content-center">
                            <i class="ti ti-plane-arrival text-dark d-block fs-7"></i>
                        </div>
                        <div>
                            <p class="mb-0">도착일시</p>
                            <h5 class="fs-4 fw-semibold me-2">${ticket.tkArridate}</h5>
                        </div>
                        <div>
                                <p class="mb-0">•출발지</p>
                                <h5 class="fs-4 fw-semibold me-2">${ticket.tkDepart} / ${ticket.tkDepartcity}</h5>
                            </div>
                            <div>
                                <p class="mb-0">•도착지</p>
                                <h5 class="fs-4 fw-semibold me-2">${ticket.tkArrival} / ${ticket.tkArrivalcity}</h5>
                            </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- 예약자 정보 카드 -->
        <div class="col-lg-5 mb-3">
            <div class="card border" style="height: 300px; overflow-y: auto;">
                <div class="card-body p-4">
                    <h4 class="card-title">예약자 정보</h4>
                    <div class="d-flex align-items-center justify-content-between mt-7 mb-0">
                        <div class="d-flex align-items-center gap-3">
                            <div class="text-bg-light rounded-1 p-6 d-flex align-items-center justify-content-center">
                                <i class="ti ti-user text-dark d-block fs-7"></i>
                            </div>
                            <div>
                                <p class="mb-0 text-dark">영문 성</p>
                                <h5 class="fs-4 fw-semibold">${ticket.tkEngfirst}</h5>
                            </div>
                            <div class="me-4">
                                <p class="mb-0 text-dark">영문 이름</p>
                                <h5 class="fs-4 fw-semibold">${ticket.tkLastname}</h5>
                            </div>
                            <div>
                                <p class="mb-0 me-3 text-dark">성별</p>
                                <h5 class="fs-4 fw-semibold">${ticket.tkGender}</h5>
                            </div>
                             <div>
                                <p class="mb-0 text-dark">생일</p>
                                <h5 class="fs-4 fw-semibold">${fn:split(ticket.tkBirth, ' ')[0]}</h5>
                            </div>
                        </div>
                    </div>
                    <div class="d-flex align-items-center justify-content-between mt-3">
                        <div class="d-flex align-items-center gap-3">
                            <div class="text-bg-light rounded-1 p-6 d-flex align-items-center justify-content-center">
                                <i class="ti ti-mail text-dark d-block fs-7"></i>
                            </div>
                            <div>
                                <p class="mb-0 text-dark">이메일</p>
                                <h5 class="fs-4 fw-semibold">${ticket.tkEmail}</h5>
                            </div>
                        </div>
                    </div>
                    <div class="d-flex align-items-center justify-content-between mt-3">
                        <div class="d-flex align-items-center gap-3">
                            <div class="text-bg-light rounded-1 p-6 d-flex align-items-center justify-content-center">
                                <i class="ti ti-phone text-dark d-block fs-7"></i>
                            </div>
                            <div>
                                <p class="mb-0 text-dark">연락처</p>
                                <h5 class="fs-4 fw-semibold">${ticket.tkTel}</h5>
                            </div>
                        </div>
                        <div class="d-flex justify-content-end mt-4">
                            <button type="button" class="btn btn-danger ticketingCancelBtn" data-tkno="${ticket.tkNo}">예약 취소</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </c:forEach>
</div>
</form>


<!-- 항공권 예약내역 카드 끝 -->
     </div>
  </div>
</div>
  
  
 </div> <!-- row 끝 -->
 
 <!-- 내 정보 보기(수정) 모달 시작 -->
 <div class="modal fade" id="infoModal" tabindex="-1" aria-labelledby="info-header-modalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header modal-colored-header bg-info text-white">
                <h4 class="modal-title text-white" id="info-header-modalLabel">
                    ${customerVO.cusName } 님의 상세정보
                </h4>
                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body d-flex justify-content-center align-items-center" style="min-height: 300px;"> <!-- 중앙 정렬을 위한 Flexbox 추가 -->
                <div class="auth-max-width col-sm-8 col-md-6 col-xl-7 px-4">
                    <div class="position-relative text-center my-4">
                        <p class="mb-0 fs-4 px-3 d-inline-block bg-body text-dark z-index-5 position-relative">내 정보 수정이 가능합니다.</p>
                        <span class="border-top w-100 position-absolute top-50 start-50 translate-middle"></span>
                    </div>
                    <form action="/customer/myInfoUpdate" method="post" id="myInfoUpdateForm">
                        <div class="mb-3">
                            <label class="form-label">아이디</label>
                            <div class="input-group">
                                <input type="text" class="form-control"  value="${customerVO.cusId }" disabled>
                                <input type="hidden" class="form-control" id="cusId" name="cusId" value="${customerVO.cusId }">
                            </div>
                            <p class="error" style="display: block;"></p>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">이름</label>
                            <input type="text" class="form-control" id="cusName" name="cusName"  value="${customerVO.cusName }">
                        </div>
                        <div class="mb-3">
                            <label class="form-label">비밀번호<span class="text-danger">*</span></label>
                            <input type="password" class="form-control passwordChk" id="cusDepw" name="cusDepw" >
                            <p>영문, 숫자, 특수문자의 조합으로 8자 이상 12자 이하의 비밀번호를 작성 해주세요.</p>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">비밀번호 확인<span class="text-danger">*</span></label>
                            <input type="password" class="form-control passwordChk" id="cusDepw2" name="cusDepw2" >
                            <p id="pwChk"></p>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">휴대전화</label>
                            <input type="text" class="form-control" placeholder="'-'를 포함한 핸드폰 번호를 입력해주세요." id="cusTel" name="cusTel"  value="${customerVO.cusTel }">
                        </div>
                        <div class="mb-3">
                            <label class="form-label">이메일</label>
                            <input type="text" class="form-control" id="cusEmail" name="cusEmail"  value="${customerVO.cusEmail }">
                        </div>
                        <div class="mb-3">
                            <label class="form-label">생년월일</label>
                            <input type="date" class="form-control" id="cusBirth" name="cusBirth"  value="${customerVO.formattedCusBirth }">
                        </div>
                         <div class="mb-3">
                            <label class="form-label">우편번호</label>
                            <div class="input-group">
                                <input type="text" class="form-control" name="cusPostcode" id="cusPostcode"  value="${customerVO.cusPostcode }">
                                <button type="button" class="btn btn-primary" onclick="DaumPostcode()">검색</button>
                            </div>
                        </div> 
                        <div class="mb-3">
                            <label class="form-label">주소</label>
                            <input type="text" class="form-control" name="cusAdd" id="cusAdd"  value="${customerVO.cusAdd }">
                        </div>
                        <div class="mb-3">
                            <label class="form-label">상세주소</label>
                            <input type="text" class="form-control" name="cusAdd2" id="cusAdd2" value="${customerVO.cusAdd2 }">
                        </div>
                        
                    </form>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-info" id="myInfoUdt">
                    저장
                </button>
                <button type="button" class="btn btn-light" data-bs-dismiss="modal">
                    닫기
                </button>
            </div>
        </div>
    </div>
</div>

<!-- 내 정보 보기(수정) 모달 끝 -->

<!-- 여권정보 보기(수정) 모달 시작 -->
<div class="modal fade" id="passportModal" tabindex="-1" aria-labelledby="passportModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header modal-colored-header bg-info text-white">
                <h4 class="modal-title text-white" id="passportModalLabel">여권 정보</h4>
                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="text-center mt-2 mb-4">
                    <a href="../main/index.html" class="text-success">
                        <span>
                            <img src="${pageContext.request.contextPath }/resources/assets/images/logos/whale-favi.png" class="me-3 img-fluid" style="width:40px;" alt="modernize-img">
                        </span>
                    </a>
                </div>
					 <div class="position-relative text-center my-4">
                        <p class="mb-0 fs-4 px-3 d-inline-block bg-body text-dark z-index-5 position-relative">여권 정보 수정이 가능합니다.</p>
                        <span class="border-top w-100 position-absolute top-50 start-50 translate-middle"></span>
                    </div>
                 <c:choose>
                   <c:when test="${empty myTicketingVO }">
                        <h3>여권정보 내역이 없습니다.</h3>
                    </c:when>
                    <c:otherwise>
		               	 <form class="ps-3 pr-3" action="/customer/myPassportUpdate" method="post" id="myPassportUpdateForm">
		                    <div class="mb-3">
		                    	<%-- <input type="hidden" id="tkNo" name="tkNo" value="${myTicketingVO.tkNo }"> --%>
		                    	<input type="hidden" id="tkGroup" name="tkGroup" value="${myTicketingVO[0].tkGroup}">
		                        <label for="username">영문 성</label>
		                        <input class="form-control" type="text" id="tkEngfirst" name="tkEngfirst" value="${myTicketingVO[0].tkEngfirst }">
		                    </div>
		
		                    <div class="mb-3">
		                        <label for="emailaddress">영문 이름</label>
		                        <input class="form-control" type="text" id="tkLastname" name="tkLastname" value="${myTicketingVO[0].tkLastname }">
		                    </div>
		
		                    <div class="mb-3">
		                        <label for="passport">여권번호</label>
		                        <input class="form-control" type="text" required id="tkPassport" name="tkPassport" value="${myTicketingVO[0].tkPassport }">
		                    </div>
		
		                    <div class="mb-3 text-center">
		                        <button class="btn btn-info me-2" type="button" id="myPassportUdt">
		                            저장
		                        </button>
		                        <button type="button" class="btn btn btn-light" data-bs-dismiss="modal">
		                            닫기
		                        </button>
		                    </div>
		                </form>
                  </c:otherwise>
              </c:choose>
            </div>
        </div>
    </div>
</div>
<!-- 여권정보 보기(수정) 모달 끝 -->
</div>

<!-- Noui-Slider -->
<!-- <script src="https://cdn.jsdelivr.net/npm/iconify-icon@1.0.8/dist/iconify-icon.min.js"></script>
<script src="../assets/libs/wnumb/wNumb.min.js"></script>
<script src="../assets/libs/nouislider-orxe/distribute/nouislider.min.js"></script>
<script src="../assets/js/plugins/nouislider-init.js"></script> -->

 <!-- SweetAlert2 -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="../assets/libs/sweetalert2/dist/sweetalert2.min.js"></script>
<script src="../assets/js/forms/sweet-alert.init.js"></script>   
<script type="text/javascript">
$(function(){
	
	// 특정 조건에 따라 footer의 클래스를 변경
    var isSpecificPage = true; // 특정 JSP 페이지인지 여부를 판단하는 조건

    if (isSpecificPage) {
        $('footer').addClass('bg-primary-subtle'); // 클래스 추가
    } else {
        $('footer').removeClass('bg-primary-subtle'); // 클래스 제거
    }
    
	var myInfo = $("#myInfo"); // 내 정보 보기 버튼
	var cusBirth = $("#cusBirth"); // 내 생일 입력
	var infoModal = $("#infoModal"); // 내 정보 모달
	var myInfoUdt = $("#myInfoUdt"); // 내 정보 수정 버튼
	var myPassportUdt = $("#myPassportUdt"); // 내 여권 정보 수정 버튼
	var passwordChk = $(".passwordChk"); // 비밀번호 일치 확인 버튼
	var parkingReserveCancelBtn = $("#parkingReserveCancelBtn"); // 주차예약 취소 버튼
	var HotelReserveCancelBtn = $("#HotelReserveCancelBtn"); // 호텔예약 취소 버튼
	var RoungeReserveCancelBtn = $("#RoungeReserveCancelBtn"); // 라운지예약 취소 버튼
	var ticketingCancelBtn = $("#ticketingCancelBtn"); // 항공권예약 취소 버튼
	
	var cusName = $("#cusName").val;
	var cusDepw = $("#cusDepw").val;
	var cusAdd = $("#cusAdd").val;
	var cusAdd2 = $("#cusAdd2").val;
	var cusPostcode = $("#cusPostcode").val;
	var cusTel = $("#cusTel").val;
	var cusGender = $("#cusGender").val;
	var cusEmail = $("#cusEmail").val;
	var cusBirth = $("#cusBirth"); 
	var formData = new FormData(myParkingReserveCard);
	
	
	cusBirth.on('focusout', function() {
        // 날짜 입력 요소 선택
        var selectedDate = $(this).val();
        
        // 날짜 형식 변경: 2024-10-10 -> 2024/10/10
        cusBirth = selectedDate.replace(/-/g, '/');
        
        // 선택한 날짜 출력
        console.log('선택한 생년월일:', cusBirth);
        
         var strArr = cusBirth.split('/');

         cusBirth = new Date(strArr[0], strArr[1]-1, strArr[2]); 
        
    }); 
	
	// 내 정보 수정 버튼을 누를 때
	 myInfoUdt.on("click", function(){
		var myInfoUpdateForm = $("#myInfoUpdateForm");
		myInfoUpdateForm.submit();
	}); 
	
	// 내 여권 정보 수정 버튼을 누를 때
	 myPassportUdt.on("click", function(){
		var myPassportUpdateForm = $("#myPassportUpdateForm");
		myPassportUpdateForm.submit();
	}); 
	
	// 주차 예약 취소 버튼 누를 때
	 parkingReserveCancelBtn.on("click", function(){
		var myParkingReserveCard = $("#myParkingReserveCard");
		
		Swal.fire({
            title: '주차 예약 취소', 
            text: '주차 예약을 취소하시겠습니까?',
            icon: 'info', // 아이콘 설정
            showCancelButton: true, // 취소 버튼 표시
            confirmButtonText: '확인', // 확인 버튼 텍스트 변경
            cancelButtonText: '취소', // 취소 버튼 텍스트 변경
            customClass: {
                cancelButton: 'btn btn-outline-primary', // 취소 버튼에 Bootstrap 클래스 추가
                confirmButton: 'btn btn-primary me-2' // 확인 버튼에 Bootstrap 기본 클래스 추가 (선택 사항)
            },
            buttonsStyling: false // SweetAlert2의 기본 버튼 스타일 비활성화
        }).then((result) => {
            if (result.isConfirmed) {
                // 사용자가 "확인" 버튼을 클릭했을 경우
				myParkingReserveCard.submit();
            }
            else {
            	return false;
            }
        });
	 });
	
	// 호텔 예약 취소 버튼 누를 때
	 HotelReserveCancelBtn.on("click", function(){
		var myHotelReserveCard = $("#myHotelReserveCard");
		
		Swal.fire({
            title: '호텔 예약 취소', 
            text: '호텔 예약을 취소하시겠습니까?',
            icon: 'info', // 아이콘 설정
            showCancelButton: true, // 취소 버튼 표시
            confirmButtonText: '확인', // 확인 버튼 텍스트 변경
            cancelButtonText: '취소', // 취소 버튼 텍스트 변경
            customClass: {
                cancelButton: 'btn btn-outline-primary', // 취소 버튼에 Bootstrap 클래스 추가
                confirmButton: 'btn btn-primary me-2' // 확인 버튼에 Bootstrap 기본 클래스 추가 (선택 사항)
            },
            buttonsStyling: false // SweetAlert2의 기본 버튼 스타일 비활성화
        }).then((result) => {
            if (result.isConfirmed) {
                // 사용자가 "확인" 버튼을 클릭했을 경우
				myHotelReserveCard.submit();
            }
            else {
            	return false;
            }
        });
	 });
	
	// 라운지 예약 취소 버튼 누를 때
	 RoungeReserveCancelBtn.on("click", function(){
		var myRoungeReserveCard = $("#myRoungeReserveCard");
		
		Swal.fire({
            title: '라운지 예약 취소', 
            text: '라운지 예약을 취소하시겠습니까?',
            icon: 'info', // 아이콘 설정
            showCancelButton: true, // 취소 버튼 표시
            confirmButtonText: '확인', // 확인 버튼 텍스트 변경
            cancelButtonText: '취소', // 취소 버튼 텍스트 변경
            customClass: {
                cancelButton: 'btn btn-outline-primary', // 취소 버튼에 Bootstrap 클래스 추가
                confirmButton: 'btn btn-primary me-2' // 확인 버튼에 Bootstrap 기본 클래스 추가 (선택 사항)
            },
            buttonsStyling: false // SweetAlert2의 기본 버튼 스타일 비활성화
        }).then((result) => {
            if (result.isConfirmed) {
                // 사용자가 "확인" 버튼을 클릭했을 경우
				myRoungeReserveCard.submit();
            }
            else {
            	return false;
            }
        });
	 });
	
	// 항공권 예약 취소 버튼 누를 때
	  $(document).on("click", ".ticketingCancelBtn", function() {
        const tkNo = $(this).data("tkno"); // 클릭한 버튼의 tkNo 값을 가져옴
        const ticketingCard = $("#ticketingCard");
        
        Swal.fire({
            title: '선택한 항공권 예약 취소', 
            text: '선택한 항공권의 예약을 취소하시겠습니까?',
            icon: 'info',
            showCancelButton: true,
            confirmButtonText: '확인',
            cancelButtonText: '취소',
            customClass: {
                cancelButton: 'btn btn-outline-primary',
                confirmButton: 'btn btn-primary me-2'
            },
            buttonsStyling: false
        }).then((result) => {
            if (result.isConfirmed) {
                // "확인" 버튼을 클릭했을 때 tkNo 값을 숨겨진 필드에 설정하고 폼을 제출
                $("#tkNoInput").val(tkNo); // 숨겨진 필드에 tkNo 설정
                ticketingCard.submit(); // 폼 제출
            }
        });
    });
	
	
	
//  	myInfoUdt.on("click", function(){
// 		var myInfoUpdateForm = $("#myInfoUpdateForm");
// 		 var formData = new FormData(myInfoUpdateForm[0]); 
// 		 console.log(formData); 
		
// 		/* var data = {
// 			cusName : cusName,
// 			cusDepw : cusDepw,
// 			cusAdd : cusAdd,
// 			cusAdd2 : cusAdd2,
// 			cusPostcode : cusPostcode,
// 			cusTel : cusTel,
// 			cusGender : cusGender,
// 			cusEmail : cusEmail,
// 			cusBirth : cusBirth,
// 	}
		
// 		console.log("cusName:" , cusName);
// 		console.log("cusAdd:" , cusAdd);
// 		console.log("cusGender:" , cusGender);
// 		console.log("cusBirth:" , cusBirth); */
		
// 		 $.ajax({
// 			url: '/customer/myInfoUpdate',
// 			method : 'POST',
// 			data : formData,
//             contentType: false, // jQuery에서 content-type을 자동으로 설정하지 않도록
//             processData: false, // jQuery에서 데이터 처리를 하지 않도록
// 			success : function(response){
// 				console.log(response);
// 				Swal.fire(
// 	                    '수정 완료!',
// 	                    '고객님의 정보 수정이 완료되었습니다.',
// 	                    'success'
// 	                ).then(() => {
// 	                    // SweetAlert2의 성공 메시지 후에 Form을 제출
// 	                	location.reload();
// 	                });	
// 			},
// 			error: function(xhr, status, error) {
//                 // 오류가 발생했을 때
//                 Swal.fire(
//                     '오류!',
//                     '수정 처리에 실패했습니다.',
//                     'error'
//                 );
//             }
// 		}); 
// 	}); 
	
	

//비밀번호 일치 확인 이벤트
passwordChk.on("keyup", function(){
	var cusDepw = $("#cusDepw").val();
    var cusDepw2 = $("#cusDepw2").val();
    var cusDepwRegex = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d!@#$%^&*]{8,12}$/;

    // 비밀번호 정규화 검사
    if (!cusDepwRegex.test(cusDepw)) {
        $("#pwChk").html("비밀번호는 영문, 숫자, 특수문자의 조합으로 8자 이상 12자 이하이어야 합니다.").css("color", "red");
        return false;
    }else{
    	pwRegexFlag = true;
    	console.log("pwRegexFlag : " + pwRegexFlag);
    }
    // 비밀번호 일치 여부 검사
    if (cusDepw !== cusDepw2) {
        $("#pwChk").html("비밀번호가 서로 일치하지 않습니다.").css("color", "red");
    } else {
        $("#pwChk").html("비밀번호가 서로 일치합니다.").css("color", "green");
        pwFlag = true;
        console.log("pwFlag : " + pwFlag);
    }
});


$('.reservation-card').on('click', function() {
    // 모든 예약 정보를 숨김
    $('#pkReservation-info, #htReservation-info, #rgReservation-info, #mrReservation-info, #ticketing-info').hide();
    
    // 클릭한 카드에 해당하는 예약 정보만 토글
    const infoId = $(this).data('info'); // data-info 속성에서 ID를 가져옴
    $('#' + infoId).toggle();
});


/* 
	//주차예약 카드 클릭시
	$('#parking-card').on('click', function() {
	    $('#pkReservation-info').toggle();
	    $('#htReservation-info').hide();
	    $('#rgReservation-info').hide();
	    $('#mrReservation-info').hide();
	    $('#ticketing-info').hide();
	});
	
	// 호텔예약 카드 클릭시
	$('#hotel-card').on('click', function() {
	    $('#htReservation-info').toggle();
	    $('#pkReservation-info').hide();
	    $('#rgReservation-info').hide();
	    $('#mrReservation-info').hide();
	    $('#ticketing-info').hide();
	});
	// 라운지예약 카드 클릭시
	$('#rounge-card').on('click', function() {
	    $('#rgReservation-info').toggle();
	    $('#htReservation-info').hide();
	    $('#pkReservation-info').hide();
	    $('#mrReservation-info').hide();
	    $('#ticketing-info').hide();
	});
	// 회의실예약 카드 클릭시
	$('#meeting-card').on('click', function() {
	    $('#mrReservation-info').toggle();
	    $('#rgReservation-info').hide();
	    $('#htReservation-info').hide();
	    $('#pkReservation-info').hide();
	    $('#ticketing-info').hide();
	});
	// 항공권 카드 클릭시
	$('#ticket-card').on('click', function() {
	    $('#ticketing-info').toggle();
	    $('#mrReservation-info').hide();
	    $('#rgReservation-info').hide();
	    $('#htReservation-info').hide();
	    $('#pkReservation-info').hide();
	}); */

	
	


/* var slider = document.getElementById('slider-step');

noUiSlider.create(slider, {
    start: [20],
    step: 1,
    range: {
        'min': [0],
        'max': [100]
    }
});
 */





});

//유효성 검사
/* function validation(){
	var msg;
	var valiId;
	var valiName;

	var valiChk = false;
	$('[data-validation = Y]').each(function(){
		if($(this).val() == ''){
			valiChk = true;
			valiId = $(this).attr('id');
			valiName = $(this).attr('data-name');
			return false;
		}
	});

	if(valiChk){
		$('#al-warning-alert').find('p.mt-3').text(valiName + '를(을) 입력해 주세요.');
        $('#al-warning-alert').modal('show');
		return false;
	}
	return true;
} */

//카카오 주소 API
function DaumPostcode() {
	new daum.Postcode({
		oncomplete : function(data) {
			var addr = '';
			var extraAddr = '';

			if (data.userSelectedType === 'R') {
				addr = data.roadAddress;
			} else {
				addr = data.jibunAddress;
			}

			if (data.userSelectedType === 'R') {
				if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
					extraAddr += data.bname;
				}
				if (data.buildingName !== '' && data.apartment === 'Y') {
					extraAddr += (extraAddr !== '' ? ', '
							+ data.buildingName : data.buildingName);
				}
			}
			document.getElementById('cusPostcode').value = data.zonecode;
			document.getElementById("cusAdd").value = addr;
			document.getElementById("cusAdd2").focus();
		}
	}).open();
}
</script>