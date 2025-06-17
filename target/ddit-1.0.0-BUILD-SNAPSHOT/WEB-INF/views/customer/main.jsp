<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>

<style>
   
   .banner-section {
       background-color: #eef2ff; 
       padding: 80px; /* 내부 여백 추가 */
       border-radius: 15px; /* 각을 둥글게 */
       box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1); /* 그림자 추가 (선택 사항) */
       
         
   }
   .bg-primary-subtle {
       background-image: url('${pageContext.request.contextPath }/resources/assets/images/backgrounds/plane.jpg'); /* 이미지 URL을 여기에 입력 */
       background-size: cover; /* 배경 이미지 크기를 조절 */
       background-position: center; /* 중앙 정렬 */
   }
   
     .carousel-item img {
       height: 580px; /* 원하는 높이로 조정 */
       object-fit: cover; /* 비율 유지하면서 크기 조정 */
     }
     
     .new-demos-title {
     padding-top: 90px; /* 위쪽 패딩 추가 */
     padding-bottom: 70px; /* 아래쪽 패딩 추가 */
     display: block; /* 블록 요소로 설정하여 높이를 적용 */
   }
   
   .solar--history-bold {
     display: inline-block;
     width: 1em;
     height: 1em;
     background-repeat: no-repeat;
     background-size: 100% 100%;
     background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 24 24'%3E%3Cpath fill='black' fill-rule='evenodd' d='M5.079 5.069c3.795-3.79 9.965-3.75 13.783.069c3.82 3.82 3.86 9.993.064 13.788s-9.968 3.756-13.788-.064a9.81 9.81 0 0 1-2.798-8.28a.75.75 0 1 1 1.487.203a8.31 8.31 0 0 0 2.371 7.017c3.245 3.244 8.468 3.263 11.668.064c3.199-3.2 3.18-8.423-.064-11.668c-3.243-3.242-8.463-3.263-11.663-.068l.748.003a.75.75 0 1 1-.007 1.5l-2.546-.012a.75.75 0 0 1-.746-.747L3.575 4.33a.75.75 0 1 1 1.5-.008zm6.92 2.18a.75.75 0 0 1 .75.75v3.69l2.281 2.28a.75.75 0 1 1-1.06 1.061l-2.72-2.72V8a.75.75 0 0 1 .75-.75' clip-rule='evenodd'/%3E%3C/svg%3E");
   } 
   
   
	font-family: SF Pro KR, SF Pro Display, SF Pro Icons, AOS Icons, Apple Gothic, HY Gulim, MalgunGothic, HY Dotum, Lexi Gulim, Helvetica Neue, Helvetica, Arial, sans-serif;
	.layerPopup img{
	margin-bottom : 20px;}
	.layerPopup:before {display:block; content:""; position:fixed; left:0; top:0; width:100%; height:100%; background:rgba(0,0,0,0); z-index:9000}
	.layerPopup .layerBox {    z-index:10000;   
	position:fixed; left:85%; top:48%; transform:translate(-50%, -50%); padding:30px; background:#fff; border-radius:6px; }
	.layerPopup .layerBox .title {margin-bottom:10px; padding-bottom:10px; font-weight:600; border-bottom:1px solid #d9d9d9;}
	.layerPopup .layerBox .btnTodayHide {
	font-size:14px; font-weight:600; color:black; 
	float: left;text-decoration:none;width: 150px; 
	height : 30px;line-height:30px;border:black solid 1px; text-align : center;text-decoration:none;
	}
	.layerPopup div{
		display : inline;
	}
	.layerPopup form{
		margin-top : 5px;
		font-size:16px; font-weight:600;
		weight: 100%;
		height : 30px;
		line-height:30px
	}
	.layerPopup #close {
	font-size:16px; font-weight:600; width: 40px; height : 30px;color:black; float: right; line-height:30px; text-align : center;text-decoration:underline;
	}
	.layerPopup a{
		text-decoration : none;
		color : black;width: 50px;height : 40px;
	}
	.form-control {
    background-color: white; /* 배경색을 흰색으로 설정 */
}
.opsStsCd {
font-weight: bold;
}
#ASection, #BSection, #CSection, #DSection {
    font-size: 17px; /* 원하는 크기로 변경 */
    padding: 16px; /* 여백 추가 (선택 사항) */
     border-radius: 40px; /* 모서리 둥글게 */
     width : 160px;
     margin-top : -20px;
  }
   
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<!--팝업 컨텐츠 영역-->
<div class="layerPopup" id="layer_popup" style="display: none;">
    <div class="layerBox">
        <h4 class="title">${popupVO.popTitle }</h4>
        <div class="cont">
            <p>
                <img src="${popupVO.popImg }" width=350 height=500 usemap="#popup" alt="event page">
            </p>
        </div>
        <form name="pop_form">
            <div id="check">
                <input type="checkbox" name="chkbox" value="checkbox" id="chkbox">
                <label for="chkbox">&nbsp;&nbsp;오늘 하루 동안 보지 않기</label>
            </div>
            <div id="close">
                <a href="javascript:closePop();">닫기</a>
            </div>
        </form>
    </div>
</div>

 <!-- 2. With controls -->
            <!-- ------------------------------------------ -->
              <!-- start With controls -->
                <div class="card-body">
                  <div id="carouselExampleControls" class="carousel slide carousel-dark" data-bs-ride="carousel">
                    <div class="carousel-inner">
                      <div class="carousel-item active">
                        <img src="${pageContext.request.contextPath }/resources/assets/images/backgrounds/plane.jpg" class="d-block w-100" alt="modernize-img" />
                      </div>
                      <div class="carousel-item">
                        <img src="${pageContext.request.contextPath }/resources/assets/images/backgrounds/plane3.jpg" class="d-block w-100" alt="modernize-img" />
                      </div>
                      <div class="carousel-item">
                        <img src="${pageContext.request.contextPath }/resources/assets/images/backgrounds/plane2.jpg" class="d-block w-100" alt="modernize-img" />
                      </div>
                    </div>
                    <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-bs-slide="prev">
                      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                      <span class="visually-hidden">Previous</span>
                    </a>
                    <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-bs-slide="next">
                      <span class="carousel-control-next-icon" aria-hidden="true"></span>
                      <span class="visually-hidden">Next</span>
                    </a>
                  </div>
                </div>
              <div class="banner-section mt-0"> <!-- 상단 마진을 0으로 설정 -->
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-lg-12">
                            <div class="banner-content text-center">
                                <h2>항공권 예약</h2>
                                <form class="d-flex justify-content-between mt-4" action="/customer/reserve" method="get">
<!--                                     <div class="form-group me-2"> -->
<!--                                         <input type="text" class="form-control" placeholder="출발지" name="scBoarding"/> -->
<!--                                     </div> -->
<!--                                     <div class="form-group me-2"> -->
<!--                                         <input type="text" class="form-control" placeholder="도착지" name="scArrived"/> -->
<!--                                     </div> -->
	                                <div class="form-group me-2" style="width:200px;">
                                        <select name="scBoarding" class="form-control">
                                            <option value="">출발지</option>
                                            <option value="ICN">서울</option>
                                            <option value="CGK">자카르타</option>
                                            <option value="PKX">베이징(다싱)</option>
                                            <option value="PEK">베이징(서우두)</option>
                                            <option value="FCO">로마</option>
                                            <option value="LHR">런던</option>
                                            <option value="IAD">워싱턴</option>
                                            <option value="HND">도쿄(하네다)</option>
                                            <option value="JFK">뉴욕</option>
                                            <option value="CDG">파리</option>
                                            <option value="YYZ">토론토</option>
                                            <option value="NRT">도쿄(나리타)</option>
                                            <option value="ORD">시카고</option>
                                        </select>
                                    </div>
	                                <div class="form-group me-2" style="width:200px;">
                                        <select name="scArrived" class="form-control">
                                            <option value="">도착지</option>
                                            <option value="ICN">서울</option>
                                            <option value="CGK">자카르타</option>
                                            <option value="PKX">베이징(다싱)</option>
                                            <option value="PEK">베이징(서우두)</option>
                                            <option value="FCO">로마</option>
                                            <option value="LHR">런던</option>
                                            <option value="IAD">워싱턴</option>
                                            <option value="HND">도쿄(하네다)</option>
                                            <option value="JFK">뉴욕</option>
                                            <option value="CDG">파리</option>
                                            <option value="YYZ">토론토</option>
                                            <option value="NRT">도쿄(나리타)</option>
                                            <option value="ORD">시카고</option>
                                        </select>
                                    </div>
                                    <div class="d-flex align-items-center me-6"> <!-- Flexbox를 사용하여 나란히 배치 -->
                                        <input type="date" class="form-control me-2" name="scStdate"/>
                                        <span>~</span>
                                        <input type="date" class="form-control ms-2" name="scStd"/>
                                    </div>
                                    <div class="form-group me-2" style="width:150px;">
                                        <select class="form-control">
                                            <option value="adult">성인</option>
                                            <option value="child">어린이</option>
                                            <option value="baby">유아</option>
                                        </select>  
                                    </div>
                                    <div class="form-group me-2">
                                        <select class="form-control" name="cusCnt">
                                            <option value="0">인원</option>
                                            <option value="1">1</option>
                                            <option value="2">2</option>
                                            <option value="3">3</option>
                                            <option value="4">4</option>
                                            <option value="5">5</option>
                                        </select>
                                    </div>
                                    <button type="submit" class="btn btn-primary">항공권 검색</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
              <!-- end With controls -->

    <!-- ------------------------------------- -->
    <!-- banner End -->
    <!-- ------------------------------------- -->

<!--     <div class="planeWay" style="font-size: 24px; text-align: center; margin: 20px 0;"> -->

    <div class="planeWay" style="text-align: center; margin: 20px 0; margin-top:100px;">
    <p style="color: #5d87ff;"><strong>BOARDING PROCESS TIME</strong></p>
    <h2 style="font-size: 50px;"><strong>국내선 탑승수속 소요시간 안내</strong></h2>
    <h5>셀프 체크인부터 항공기 탑승까지 평균 체류시간</h5>
    <h1 id="opsStsCd"></h1>
      <span id="AllSection" style="font-size: 50px; color: #870f69;"></span><br/>
           <span style="font-size: 20px; font-weight: bold;">기준시간 : </span><span id="criterionTime" style="font-size: 20px; font-weight: bold;"></span>
			<button class="ti ti-reload fs-5" id="reload" style="border:0; background: white;"></button>


       
      <span class="badge text-bg-primary" style="margin-left:850px;"> </span> 원활 &nbsp;&nbsp;&nbsp;
      <span class="badge text-bg-success"> </span> 보통 &nbsp;&nbsp;&nbsp;
      <span class="badge text-bg-warning"> </span> 혼잡 &nbsp;&nbsp;&nbsp;
      <span class="badge text-bg-danger"> </span> 매우혼잡 <br />
      
<img src="${pageContext.request.contextPath }/resources/assets/images/airport/walking_man.gif" style="width: 70%; border-radius:20px;" ></img>
<p style="text-align: center; margin-left: 1000px;">※ 본 데이터는 <span style="color: blue;">공공 데이터 API</span>를 참조하였습니다.</p>
      <br/> <br/>
<!--       셀프체크인 ---신분확인<span id="ASection"></span> 분 │ -->
<!--       신분확인---보얀검색 <span id="BSection"></span>분 │ -->
<!--       보안검색---탑승시간<span id="CSection"></span>분 │ -->
<!--       탑승시간---출발 <span id="DSection"></span>분││ -->
<!--       총 소요 시간<span id="AllSection"></span>분 -->
      
<!--       <span class="mb-1 badge text-bg-light" id="AllSection"> </span> -->
      
      <span id="ASection"  style="margin-right:150px;"></span> 
      <span id="BSection" style="margin-right:100px;"></span> 
      <span id="CSection" style="margin-right:50px;"></span>
      <span class="mb-1 badge" id="DSection" style="background-color: #bdbdbd; color: white;"></span>
    
    </div>
    <h5 style="text-align: center;font-size: 15px;">※ <strong>항공권 셀프 체크인 및 수하물 위탁 가능 시간</strong>은 항공사별 정책에 따라 달라질 수 있으며, 일반적으로 <strong>국내선 항공기는 출발 예정 시각 30분전까지</strong> 가능함에 유의하시기 바랍니다.</h5>
<h5 style="text-align: center; margin-left:-235px; font-size: 15px;">※ 본 서비스는 <strong>탑승수속 구간별 여객이 체류하는 평균시간을 실시간으로 안내</strong>하는 것으로, <strong>개개인의 실제 소요시간과 차이가 있을 수 있습니다.</strong></h5>

    <hr>

    

    <!-- ------------------------------------- -->
    <!-- Faq -->
    <!-- ------------------------------------- -->

    <div class="row justify-content-center" style="margin-top:100px;">
      <div class="col-lg-8">
        <div class="text-center mb-7">
          <h3 class="fw-semibold">FAQ</h3>
          <p class="fw-normal mb-0 fs-4">무엇이든 물어보세요.</p>
        </div>
        <div class="accordion accordion-flush mb-5 card position-relative overflow-hidden" id="accordionFlushExample">
          <div class="accordion-item">
            <h2 class="accordion-header" id="flush-headingOne">
              <button class="accordion-button collapsed fs-4 fw-semibold shadow-none" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
                [탑승수속] 탑승수속은 언제부터 가능한가요 ?
              </button>
            </h2>
            <div id="flush-collapseOne" class="accordion-collapse collapse" aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">
              <div class="accordion-body fw-normal">
                일반적인 경우 탑승수속은 출발시간 3시간～2시간 30분 전부터 가능합니다. 각 항공사별로 체크인카운터 운영 시간이 상이하기 때문에 대체로 3시간 전에 공항에 도착하시면 탑승수속을 진행하실 수 있습니다. <br><br>탑승수속은 당일 출발 편에 한해 가능하며 자세한 체크인카운터 위치는 인천공항 홈페이지 > 출발 > 출발시간 > 여객 > 여객출발시간표에서 확인하실 수 있습니다.
              </div>
            </div>
          </div>
          <div class="accordion-item">
            <h2 class="accordion-header" id="flush-headingTwo">
              <button class="accordion-button collapsed fs-4 fw-semibold shadow-none" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo" aria-expanded="false" aria-controls="flush-collapseTwo">
               [세관신고] 세관검사는 어떻게 이루어지나요?
              </button>
            </h2>
            <div id="flush-collapseTwo" class="accordion-collapse collapse" aria-labelledby="flush-headingTwo" data-bs-parent="#accordionFlushExample">
              <div class="accordion-body fw-normal">
                세관검사는 크게 두가지로 분류할 수 있습니다. 직접 소지하시고 기내로 반입한 물품(Handy Carry)인 경우에는 문형 게이트 옆에 설치된 X-ray(엑스레이) 투시기를 통과해야 하며 여행객은 문형금속탐지기를 통해 신변검색을 받습니다.<br><br>
                이때 귀하의 주머니 속에 들어있는 금속성 물질은 미리 문형게이트 앞에 설치된 빈 바구니에 넣어 주십시오. 문형금속탐지기에서 벨소리가 나는 경우 여행객의 신변을 휴대용 금속 탐지기로 검색할 수도 있으며, 직접 신변 수색을 할 수도 있습니다. (관세법 제301조)<br><br>
                기내에 들고 탑승하지 못한 짐(기탁화물)은 1층 입국장으로 내려오셔서 지정된 콘베이어벨트에서 찾으셔야 하며, 이때 “세관검사안내표시” 가 부착된 수하물이 있는 경우에는 가까운 세관직원의 안내를 받아 검사대로 이동하여 정밀 검사를 받아야 합니다.<br>
              </div>
            </div>
          </div>
          <div class="accordion-item">
            <h2 class="accordion-header" id="flush-headingThree">
              <button class="accordion-button collapsed fs-4 fw-semibold shadow-none" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseThree" aria-expanded="false" aria-controls="flush-collapseThree">
                [교통/주차] 공항 오는 길 및 통행료 안내
              </button>
            </h2>
            <div id="flush-collapseThree" class="accordion-collapse collapse" aria-labelledby="flush-headingThree" data-bs-parent="#accordionFlushExample">
              <div class="accordion-body fw-normal">
                차량을 이용하여 공항에 오시는 경우, 고속도로 및 통행료 등에 대한 관련정보는 홈페이지>교통/주차>길찾기에서 확인하실 수 있습니다.<br>
                * 차량이용안내 바로가기
              </div>
            </div>
          </div>
          <div class="accordion-item">
            <h2 class="accordion-header" id="flush-headingfour">
              <button class="accordion-button collapsed fs-4 fw-semibold shadow-none" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapsefour" aria-expanded="false" aria-controls="flush-collapsefour">
                [검역] 여행자 검역
              </button>
            </h2>
            <div id="flush-collapsefour" class="accordion-collapse collapse" aria-labelledby="flush-headingfour" data-bs-parent="#accordionFlushExample">
              <div class="accordion-body fw-normal">
                검역감염병 오염지역을 감시기간 내 방문(체류·경유)한 사람은 입국 시 반드시「건강상태질문서」를 작성하여 검역관에게 제출해야 합니다. 이를 위반할 경우, 검역법 41조에 의거 1천만원 이하의 과태료가 부과될 수 있습니다.<br><br>
                  
                ○ 검역감염병 오염지역 및 해외여행 질병정보 안내<br>
                - 질병관리본부 홈페이지 > 감염병 > 해외감염정보 > 국가별정보<br><br>

                * 질병관리본부 홈페이지 바로가기
              </div>
            </div>
          </div>
        </div>
      </div>
    </div><hr>
    <!-- ------------------------------------- -->
    <!-- Card Start -->
    <!-- ------------------------------------- -->
    <section class="pt-5 pt-md-14 pt-lg-12 pb-3 pb-md-7 pb-lg-14">
      <div class="container-fluid">
        <div class="row justify-content-center">
          <div class="col-lg-6">
            <p class="fs-4 fw-normal text-center mb-7 mb-md-5">
              Welcome to <span class="fw-bolder">WhalePort</span>
            </p>
          </div>
        </div>
        <div class="row">
          <div class="col-sm-6 col-lg-4">
            <div class="card shadow-none bg-warning-subtle rounded-24">
              <div class="card-body text-center py-14">
                <img src="${pageContext.request.contextPath }/resources/assets/images/browser/solar--bus-bold.png" alt="icon" style="width: 40px; height: auto;">
                <h5 class="my-3 fw-bolder fs-5">교통 안내</h5>
                <p class="mb-0 fs-4">PUBLIC TRANSPORT</p>
              </div>
            </div>
            <div class="card shadow-none bg-secondary-subtle rounded-24">
              <div class="card-body text-center pt-14 pb-5 mb-8">
                <img src="${pageContext.request.contextPath }/resources/assets/images/browser/solar--map-point-wave-bold.png" alt="icon" style="width: 40px; height: auto;">
                <h5 class="my-3 fw-bolder fs-5">시설 안내</h5>
                <p class="mb-0 fs-4">FACILITIES INFORMATION</p>
              </div>
            </div>
          </div>
          <div class="col-lg-4 order-last order-lg-0">
            <div class="card shadow-none bg-primary-subtle rounded-24">
              <div class="card-body text-center py-14 px-3">
			    <img src="${pageContext.request.contextPath }/resources/assets/images/logos/whale-favi.png" alt="icon" width="40" height="auto">
			    <h2 class="fs-10 fw-bolder mt-5 mb-9 new-demos-title">공항 이용 알짜 팁</h2>
			    <p class="mb-14 fs-4"><span class="fw-semibold">AT THE AIRPORT</span></p>
			</div>
            </div>
          </div>
          <div class="col-sm-6 col-lg-4">
            <div class="card shadow-none bg-secondary-subtle rounded-24">
              <div class="card-body text-center py-14">
                <img src="${pageContext.request.contextPath }/resources/assets/images/browser/solar--hand-pills-bold.png" alt="icon" style="width: 40px; height: auto;">
                <h5 class="my-3 fw-bolder fs-5">교통약자 서비스</h5>
                <p class="mb-0 fs-4">SPECIAL ASSISTANCE</p>
              </div>
            </div>
            <div class="card shadow-none bg-danger-subtle rounded-24">
              <div class="card-body text-center pt-14 pb-5 mb-8">
                <img src="${pageContext.request.contextPath }/resources/assets/images/browser/solar--phone-calling-rounded-bold.png" alt="icon" style="width: 40px; height: auto;">
                <h5 class="my-3 fw-bolder fs-5">전화번호 안내</h5>
                <p class="mb-0 fs-4">CONTACT INFORMATION</p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!-- ------------------------------------- -->
    <!-- Card end -->
    <!-- ------------------------------------- -->
    

    
    
    
    
<script type="text/javascript">
$(function(){
   var reloadFlag = false;
   
   if(reloadFlag == false){
      $.ajax({
         url : "/customer/airportCongestionTime",
         type : "get",
         contentType : "application/json; charset=utf-8",
         success : function(result){
//             console.log("result:"+result);
            const personObj = JSON.parse(result);
            console.log(personObj);
            console.log('personObj>>', personObj);
            console.log('personObj.data>>',personObj.data);
            console.log('personObj.data[0]>>',personObj.data[0]);
            console.log('personObj.data[0].STY_TCT_AVG_A>>',personObj.data[0].STY_TCT_AVG_A);
            console.log('STY_TCT_AVG_A(분)>>',personObj.data[0].STY_TCT_AVG_A/60);
            console.log('STY_TCT_AVG_A(분, 반올림)>>',Math.ceil(personObj.data[0].STY_TCT_AVG_A/60));
            console.log('OPR_STS_CD>>',personObj.data[0].OPR_STS_CD);
            var ASection = $('#criterionTime').text(personObj.data[0].PRC_HR);
            if(personObj.data[0].OPR_STS_CD ==1){
               $('#ASection').text(Math.ceil(personObj.data[0].STY_TCT_AVG_A/60)+"분");
               $('#BSection').text(Math.ceil(personObj.data[0].STY_TCT_AVG_B/60)+"분");
               $('#CSection').text(Math.ceil(personObj.data[0].STY_TCT_AVG_C/60)+"분");
               $('#DSection').text(Math.ceil(personObj.data[0].STY_TCT_AVG_D/60)+"분");
               $('#AllSection').text(Math.ceil(personObj.data[0].STY_TCT_AVG_ALL/60)+"분");
               
            }else{
               $('#opsStsCd').text("21:30~6:30 미운행");
               
            }
            
         }
      });
      
      $.ajax({
         url : "https://api.odcloud.kr/api/getAPRTPsgrCongestion/v1/aprtPsgrCongestion%E2%80%8B?page=1&perPage=10&serviceKey=51vxpkkHfLI6NaiCFf0WCYcmf9bribGyPb%2BnhJ3O3AWxQCJfqIOSIKe%2B%2F2SapG7j2wQvAT9SfiKZjYp3imgsHA%3D%3D",
         type : "get",
         success: function(res){
            let data1 = res.data[0].CGDR_ALL_LVL;   
            let data2 = res.data[0].CGDR_A_LVL;   
            let data3 = res.data[0].CGDR_B_LVL;   
            let data4 = res.data[0].CGDR_C_LVL;   
            let data5 = res.data[0].IATA_APCD;   
            let data6 = res.data[0].PRC_HR;   
            
            console.log(data1);
            console.log(data2);
            console.log(data3);
            console.log(data4);
            console.log(data5);
            console.log(data6);
            if(data2 == 1){
               $("#ASection").attr("class", "mb-1 badge text-bg-primary" );
            }
            if(data2 == 2){
               $("#ASection").attr("class", "mb-1 badge text-bg-success" );
            }
            if(data2 == 3){
               $("#ASection").attr("class", "mb-1 badge text-bg-warning" );
            }
            if(data2 == 4){
               $("#ASection").attr("class", "mb-1 badge text-bg-danger" );
            }
            
            if(data3 == 1){
               $("#BSection").attr("class", "mb-1 badge text-bg-primary" );
            }
            if(data3 == 2){
               $("#BSection").attr("class", "mb-1 badge text-bg-success" );
            }
            if(data3 == 3){
               $("#BSection").attr("class", "mb-1 badge text-bg-warning" );
            }
            if(data3 == 4){
               $("#BSection").attr("class", "mb-1 badge text-bg-danger" );
            }
            
            if(data4 == 1){
               $("#CSection").attr("class", "mb-1 badge text-bg-primary" );
            }
            if(data4 == 2){
               $("#CSection").attr("class", "mb-1 badge text-bg-success" );
            }
            if(data4 == 3){
               $("#CSection").attr("class", "mb-1 badge text-bg-warning" );
            }
            if(data4 == 4){
               $("#CSection").attr("class", "mb-1 badge text-bg-danger" );
            }
         }
      });
      
      
      
      
      reloadFlag = true;
      
   }


   $('#reload').on('click', function() {
      $.ajax({
         url : "/customer/airportCongestionTime",
         type : "get",
         contentType : "application/json; charset=utf-8",
         success : function(result){
//             console.log("result:"+result);
            const personObj = JSON.parse(result);
            console.log(personObj);
            console.log('personObj>>', personObj);
            console.log('personObj.data>>',personObj.data);
            console.log('personObj.data[0]>>',personObj.data[0]);
            console.log('personObj.data[0].STY_TCT_AVG_A>>',personObj.data[0].STY_TCT_AVG_A);
            console.log('STY_TCT_AVG_A(분)>>',personObj.data[0].STY_TCT_AVG_A/60);
            console.log('STY_TCT_AVG_A(분, 반올림)>>',Math.ceil(personObj.data[0].STY_TCT_AVG_A/60));
            console.log('OPR_STS_CD>>',personObj.data[0].OPR_STS_CD);
            var ASection = $('#criterionTime').text(personObj.data[0].PRC_HR);
            if(personObj.data[0].OPR_STS_CD ==1){
               $('#ASection').text(Math.ceil(personObj.data[0].STY_TCT_AVG_A/60)+"분");
               $('#BSection').text(Math.ceil(personObj.data[0].STY_TCT_AVG_B/60)+"분");
               $('#CSection').text(Math.ceil(personObj.data[0].STY_TCT_AVG_C/60)+"분");
               $('#DSection').text(Math.ceil(personObj.data[0].STY_TCT_AVG_D/60)+"분");
               $('#AllSection').text(Math.ceil(personObj.data[0].STY_TCT_AVG_ALL/60)+"분");
//                ASection.text(Math.ceil(personObj.data[0].STY_TCT_AVG_A/60));
//                BSection.text(Math.ceil(personObj.data[0].STY_TCT_AVG_B/60));
//                CSection.text(Math.ceil(personObj.data[0].STY_TCT_AVG_C/60));
//                DSection.text(Math.ceil(personObj.data[0].STY_TCT_AVG_D/60));
//                AllSection.text(Math.ceil(personObj.data[0].STY_TCT_AVG_ALL/60));
               
            }else{
               $('#opsStsCd').text("21:30~6:30 미운영");
               
            }
            
         }
      });
      

      $.ajax({
         url : "https://api.odcloud.kr/api/getAPRTPsgrCongestion/v1/aprtPsgrCongestion%E2%80%8B?page=1&perPage=10&serviceKey=51vxpkkHfLI6NaiCFf0WCYcmf9bribGyPb%2BnhJ3O3AWxQCJfqIOSIKe%2B%2F2SapG7j2wQvAT9SfiKZjYp3imgsHA%3D%3D",
         type : "get",
         success: function(res){
            let data1 = res.data[0].CGDR_ALL_LVL;   
            let data2 = res.data[0].CGDR_A_LVL;   
            let data3 = res.data[0].CGDR_B_LVL;   
            let data4 = res.data[0].CGDR_C_LVL;   
            let data5 = res.data[0].IATA_APCD;   
            let data6 = res.data[0].PRC_HR;   
            
            console.log(data1);
            console.log(data2);
            console.log(data3);
            console.log(data4);
            console.log(data5);
            console.log(data6);
            if(data2 == 1){
               $("#ASection").attr("class", "mb-1 badge text-bg-primary" );
            }
            if(data2 == 2){
               $("#ASection").attr("class", "mb-1 badge text-bg-success" );
            }
            if(data2 == 3){
               $("#ASection").attr("class", "mb-1 badge text-bg-warning" );
            }
            if(data2 == 4){
               $("#ASection").attr("class", "mb-1 badge text-bg-danger" );
            }
            
            if(data3 == 1){
               $("#BSection").attr("class", "mb-1 badge text-bg-primary" );
            }
            if(data3 == 2){
               $("#BSection").attr("class", "mb-1 badge text-bg-success" );
            }
            if(data3 == 3){
               $("#BSection").attr("class", "mb-1 badge text-bg-warning" );
            }
            if(data3 == 4){
               $("#BSection").attr("class", "mb-1 badge text-bg-danger" );
            }
            
            if(data4 == 1){
               $("#CSection").attr("class", "mb-1 badge text-bg-primary" );
            }
            if(data4 == 2){
               $("#CSection").attr("class", "mb-1 badge text-bg-success" );
            }
            if(data4 == 3){
               $("#CSection").attr("class", "mb-1 badge text-bg-warning" );
            }
            if(data4 == 4){
               $("#CSection").attr("class", "mb-1 badge text-bg-danger" );
            }
         }
      });
   
   });
   

   

      
      
})
</script>

<script language="JavaScript">
    function setCookie(name, value, expiredays) {
        var todayDate = new Date();
        todayDate.setDate(todayDate.getDate() + expiredays);
        document.cookie = name + "=" + encodeURIComponent(value) + "; path=/; expires=" + todayDate.toUTCString() + ";";
    }

    function getCookie(name) {
        var value = "; " + document.cookie;
        var parts = value.split("; " + name + "=");
        if (parts.length == 2) return parts.pop().split(";").shift();
    }

    function closePop() {
        if (document.pop_form.chkbox.checked) {
            setCookie("maindiv", "done", 1);
        }
        document.getElementById('layer_popup').style.display = "none";
    }

    window.onload = function() {
        var cookiedata = getCookie("maindiv");
        if (cookiedata !== "done") {
            document.getElementById('layer_popup').style.display = "block";
        }
    };
</script>