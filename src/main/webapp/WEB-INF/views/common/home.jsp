<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<style>
	.card11 {
		width: 350px;
		height: 350px;
		perspective: 1100px;
		position: relative;
		margin: 10px;
		transition: transform 1.0s;
		transform-style: preserve-3d;
		cursor: pointer;
		transform: rotateY(0deg);
	}
	
	.front, .back {
		position: absolute;
		width: 100%;
		height: 100%;
	}
	
	.front {
		background: teal;
	}
	
	.back {
		background: white;
		display: flex; /* Flexbox를 사용하여 내용 중앙 정렬 */
		justify-content: center;
		align-items: center;
		text-align: center; /* 텍스트 중앙 정렬 */
		transform: rotateY(180deg);
	}

	.custom-card-height {
		height: 360px; /* 원하는 높이로 조정 */
	}
	.food {
/*         background-image: url('${pageContext.request.contextPath}/resources/assets/images/chat/chat2.png'); */
        background-size: cover; /* 배경 이미지 크기 조정 */
        background-position: center; /* 배경 이미지 위치 조정 */
        padding: 20px; /* 내부 여백 조정 (옵션) */
        color: black; /* 텍스트 색상 조정 (옵션) */
    }
    .menu-title {
    background-color: #ddedff; /* 흰색 배경 */
    color: black; /* 검정색 글씨 */
    border-radius: 10px; /* 둥근 모서리 */
    padding: 10px; /* 여백 추가 */
    display: inline-block; /* 내용에 맞게 크기 조정 */
    text-align: center; /* 중앙 정렬 */
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1); /* 약간의 그림자 추가 */
    font-size: 18px !important; /* 글씨 크기 */
}
.card12 {
	height:80%;
}

</style>
<script type="text/javascript">
$(function(){
    const apiKey = '82bfc6d78c38427a90d2696b83850b3c';
    const atptOfcdcScCode = 'G10';
    const schulCode = '7430310';
//     const date = '20241105';
    
    const today = new Date();
    const year = today.getFullYear();
    const month = String(today.getMonth() + 1).padStart(2, '0');
    const day = String(today.getDate()).padStart(2, '0');
    const date = year + month + day;
    
    console.log("date : " + date);

    // URL 구성
	var url = "https://open.neis.go.kr/hub/mealServiceDietInfo?ATPT_OFCDC_SC_CODE=" 
              + atptOfcdcScCode 
              + "&SD_SCHUL_CODE=" 
              + schulCode 
              + "&MLSV_YMD=" 
              + date 
              + "&KEY=" 
              + apiKey 
              + "&Type=json&pIndex=1&pSize=10";

    console.log("Request URL: ", url);

    ajaxCallApiTest(url);
});


function ajaxCallApiTest(url){
    $.ajax({
        url: url,
        type: "GET",
        dataType: 'json',
        success: function(data) {
            console.log("API 전체 응답:", data); // 응답 데이터 전체를 확인합니다.

            if(data != null){
            	if(data.RESULT != null){	// 식단정보를 가져오는데에 있어서 문제가 발생했을때
            		alert("오류: " + data.RESULT.MESSAGE);
            		return;
            	}	
            }
            
            // mealServiceDietInfo[0]을 사용하여 row가 있는지 확인합니다.
            let lunchHtml = '';
            let dinnerHtml = '';
            let mealData = data.mealServiceDietInfo;
            if (mealData && mealData.length > 0) {	// mealService 데이터 존재
                const mStatus = mealData[0].head[1].RESULT.CODE;	// 'INFO-000' 상태코드는 정상처리
                const mData = mealData[1].row;	// 식단정보가 들어있는 목록 데이터 (조식, 중식, 석식)


                mData.forEach(meal => {
                    // 중식과 석식을 각각 확인하고 데이터가 있다면 <li> 태그로 추가합니다.
                    if (meal.MMEAL_SC_NM === '중식') {
                    	let texts = meal.DDISH_NM.split(")");
                		let result = "";
                    	for(let i = 0; i < texts.length; i++){
                    		result += texts[i].split("(")[0];
                    	}
                        lunchHtml += "<li>" + result + "</li>";
                    } else if (meal.MMEAL_SC_NM === '석식') {
                    	let texts = meal.DDISH_NM.split(")");
                		let result = "";
                    	for(let i = 0; i < texts.length; i++){
                    		result += texts[i].split("(")[0];
                    	}
                    	dinnerHtml += "<li>" + result + "</li>";
                    }
                });

            } else {
                // 각 메뉴 리스트에 데이터를 추가합니다.
				lunchHtml = '<li>중식 정보가 없습니다.</li>';
				dinnerHtml = '<li>석식 정보가 없습니다.</li>';
                alert("식단 정보가 없습니다.");
            }
            $('#lunchMenu').html(lunchHtml);
            $('#dinnerMenu').html(dinnerHtml);
            console.log("Lunch HTML:", lunchHtml); // 중식 HTML 확인
            console.log("Dinner HTML:", dinnerHtml); // 석식 HTML 확인
        },
        error: function(req, tst){
            console.error("API 호출 에러:", req.status, req.statusText);
            alert("API 호출 중 오류가 발생했습니다: " + req.status + " " + req.statusText);
        }
    });
}

</script>
<div class="body-wrapper" style="background-color:#eef3ff;">
	<div class="container-fluid">
		<div class="row">
		
			<!-- 에바 -->
			<div class="col-lg-3 d-flex justify-content-center align-items-stretch">
				<div class="card11 w-100" style="border-radius: 15px; overflow: hidden; height: 500px;">
					<div class="front" style="background-image: url('${pageContext.request.contextPath}/resources/assets/images/profile/pass.png'); background-size: cover; background-position: center; padding: 20px;z-index:2000">
						<div class="chat-list chat active-chat" style="margin-top: 100px;">
							<div style="text-align: center;">
								<img src="${employeeVO.empImage }" alt="user4" width="150" height="180" class="rounded-circle"><br>
								<p class="mb-1 fs-3">
									<strong>Name</strong>
								</p>
								<h6 class="fs-4 mb-0" style="font-size: 30px !important;">
									<strong>${employeeVO.empName }</strong>
								</h6>
								<br>
								<div class="row" style="text-align: center;">
									<div class="col-6 mb-9">
										<p class="mb-1 fs-3">
											<strong>Department</strong>
										</p>
										<h6 class="fw-semibold mb-0" style="font-size: 15px;">${employeeVO.empDept }</h6>
									</div>
									<div class="col-6 mb-9">
										<p class="mb-1 fs-3">
											<strong>Position</strong>
										</p>
										<h6 class="fw-semibold mb-0" style="font-size: 15px;">${employeeVO.empPosition }</h6>
									</div>
								</div>
							</div>
							<br/>
						</div>
					</div>
					<div class="back" style="background-image: url('${pageContext.request.contextPath}/resources/assets/images/profile/pass2.png'); background-size: cover; background-position: center; padding: 20px;">
						<div class="row" style="text-align: center;">
							<div class="col-12 mb-7">
								<h6 class="fw-semibold mb-0" style="font-size: 15px;">${employeeVO.empId }</h6>
								<img src="${pageContext.request.contextPath}/resources/assets/images/svgs/qrTest.png" alt="QR Code" id="qr" style="width: 150px; height: 150px; margin-top: 10px;">
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- 끝 -->

			<!-- 근태-->
			
			<input type="hidden" id="empNo" name="empNo" value="${empWorkVO.empNo }"  />
			 <div class="col-lg-9 text-center mb-3"style="margin-top:10px;">
			    <span class="menu-title text-uppercase fs-2 d-block"  style="text-align: left;"> 
			    <img src="${pageContext.request.contextPath}/resources/assets/images/airport/home.png" alt="WhalePort 로고" style="width: 30px; height: 30px; vertical-align: middle; margin-right: 10px;">WhalePort &nbsp; 메인 홈페이지<span style="margin-left: 700px; font-size: small;"><a href="/customer/main"><u>공항 홈페이지로 이동하기</u></a></span></span>
			   <div class="col-lg-12 d-flex align-items-stretch" style="margin-top:10px; height:460px;">
				   <div class="card w-100 overflow-hidden me-2 d-flex flex-column" style="flex: 1;">
				    <div class="card-body d-flex flex-column align-items-center" style="margin-top:30px;">
				   			            <h4 class="text-center fs-5 text-info mb-3">
			                <span class="mb-1 badge rounded-pill bg-secondary-subtle text-secondary">commute</span>
							근태 관리
			            </h4>
				        <div class="col-md-12 mb-3 mt-3">
				            <div class="card border-top border-success">
				                <div class="card-body d-flex justify-content-center align-items-center">
				                    <div class="text-center">
				                        <h6 class="card-title fs-4" style="color: gray;">
								       <c:choose>
								        	<c:when test="${not empty empWorkVO.workArrive }">
								        	${fn:split(empWorkVO.workArrive, " ")[1]}
	        					        	<input type="hidden" value="${empWorkVO.workArrive }" id="workArriveVal"  />
								        	</c:when>
								        	<c:otherwise>
												<span id="workArriveArea"></span>
								        	</c:otherwise>
								        </c:choose>
				                        </h6>
				                        <p class="card-subtitle text-success">출근</p>
				                    </div>
				                    <div class="ms-auto" style="margin-top: -20px;"> 
				                        <span class="text-success display-6" style="margin-left: 20px;">
					     				<button type="button" class="btn btn-rounded bg-success-subtle text-success btn-sm" onclick="goToWork()" id="btnArrive" ${not empty empWorkVO.workArrive ? 'disabled':''} ><i class="ti ti-clock-play me-2" ></i>go to work</button>
				                        </span>
				                    </div>
				                </div>
				            </div>
				        </div>
				        <div class="col-md-12">
				            <div class="card border-top border-dark">
				                <div class="card-body d-flex justify-content-center align-items-center">
				                    <div class="text-center">
				                        <h6 class="card-title fs-4" style="color: gray;">
					        			 <c:choose>
								        	<c:when test="${not empty empWorkVO.workLeave }">
								        	${fn:split(empWorkVO.workLeave, " ")[1]}
								        	</c:when>
								        	<c:otherwise>
												<span id="workLeaveArea"></span>
								        	</c:otherwise>
								          </c:choose>
				                        </h6>
				                        <p class="card-subtitle text-dark">퇴근</p>
				                    </div>
				                    <div class="ms-auto" style="margin-top: -20px;"> 
				                        <span class="text-success display-6" style="margin-left: 20px;">
					      				<button type="button" class="btn btn-light text-gray btn-sm" onclick="goToHome()" id="btnLeave" ${not empty empWorkVO.workLeave ? 'disabled':''}><i class="ti ti-clock-pause me-2"></i>leave work</button>
				                        </span>
				                    </div>
				                </div>
				            </div>
				        </div>
				    </div>
				</div>

			    <div class="card w-100 overflow-hidden d-flex flex-column" style="flex: 1.5; margin-right:-7px;" >
			        <div class="card-body text-center flex-grow-1" style="height: 380px; padding: 40px; margin-top: 50px;">
			            <h4 class="text-center fs-5 text-info">
			                <span class="mb-1 badge rounded-pill bg-secondary-subtle text-secondary">today</span>
							근무 기록
			            </h4>
			       	<h4 id="time"></h4>
			            <div class="row pt-2 pb-2">
			                <div class="col text-center align-self-center">
			            	<c:choose>
			            		<c:when test="${not empty empWorkVO.workLeave }">
					                <i class="display-3 ti ti-clock-stop text-primary"></i>
			            		</c:when>
			            		<c:otherwise>
					                <i class="display-3 ti ti-clock-play text-success" style="visibility: hidden;" id="clock" ></i>
			            		</c:otherwise>
			            	</c:choose>
			                </div>
			            </div>
			            <div class="row mt-3">
			                <div class="col-6 border-end">
			                    <h4 class="fs-5 mb-0">
			                        <i class="ti ti-chevron-up fs-6 text-success"></i>
			                        <br /><h6>출근시간</h6>
					            <c:choose>
						        	<c:when test="${not empty empWorkVO.workArrive }">
						        	${fn:split(empWorkVO.workArrive, " ")[0]  } <span id="workArrDay">요일</span> ${fn:split(empWorkVO.workArrive, " ")[1]  }
						        	</c:when>
						        	<c:otherwise>
										<span id="workArriveArea2"></span>
						        	</c:otherwise>
						        </c:choose>
			                    </h4>
			                </div>
			                <div class="col-6">
			                    <h4 class="fs-5 mb-0">
			                        <i class="ti ti-chevron-down fs-6 text-danger"></i>
			                        <br /><h6>퇴근시간</h6>
						          <c:choose>
						        	<c:when test="${not empty empWorkVO.workLeave }">
						        	${fn:split(empWorkVO.workLeave, " ")[0]  } <span id="workLeaDay">요일</span> ${fn:split(empWorkVO.workLeave, " ")[1]  }
						        	</c:when>
						        	<c:otherwise>
										<span id="workLeaveArea2"></span>
						        	</c:otherwise>
						          </c:choose>
			                    </h4>
			                </div>
			            </div>
			        </div>
			    </div>
			  <div class="card col-3 ms-3" style="flex: 1;">
			    <div class="card-body text-center" style="height: 380px; padding: 40px;  margin-top: 50px; "> 
			        <h4 class="text-center fs-5 text-info mb-5"><span class="mb-1 badge rounded-pill bg-secondary-subtle text-secondary">total</span>
			            총 근무 시간
			        </h4>
			        <div class="py-2 px-3 text-bg-light rounded-4 d-flex align-items-center mt-5">
                      <span class="text-primary">
                        <i class="ti ti-calendar fs-8"></i>
                      </span>
                      <div class="ms-2 text-start">
                        <h6 class="fw-normal text-muted mb-0">오늘 날짜</h6>
                        <h4 class="mb-0 fs-5" id="todayDate"></h4>
                      </div>
                    </div>
                    
			        <div class="py-2 px-3 text-bg-light rounded-4 d-flex align-items-center mt-4">
                      <span class="text-primary">
                        <i class="ti ti-clock fs-8"></i>
                      </span>
                      <div class="ms-2 text-start">
                        <h6 class="fw-normal text-muted mb-0">총 근무 시간</h6>
                        <c:choose>
                        	<c:when test="${not empty empWorkVO.workTime }">
                        		<h4 class="mb-0 fs-5">${empWorkVO.workTime }</h4>
                        	</c:when>
                        	<c:otherwise>
		                        <h4 class="mb-0 fs-5" id="total"></h4>
                        	</c:otherwise>
                        </c:choose>
                       </div>
                    </div>
			    </div>
			</div>
			</div>

			</div>

			<!-- 공지사항 START -->
			<div class="row">
    			<div class="col-6 d-flex">
        			<div class="card flex-fill">
            			<div class="card-body">
                			<div class="d-md-flex align-items-center mb-5">
                    			<div>
                        			<h4 class="card-title fw-semibold">공지사항</h4>
			                        <p class="card-subtitle">전체 ${pagingVO.totalRecord}건</p>
			                    </div>
			                    <div class="ms-auto mt-4 mt-md-0">
			                        <ul class="nav nav-tabs" role="tablist">
			                            <li class="nav-item">
			                                <a class="nav-link rounded active" href="/info/notice/list"> <span>더보기</span></a>
			                            </li>
			                        </ul>
			                    </div>
                			</div>
                <div class="tab-content mt-3">
                    <div class="tab-pane active" id="home" role="tabpanel">
                        <div class="table-responsive">
                            <table class="table align-middle mb-0 text-center">
                                <thead>
                                    <tr>
                                        <th>제목</th>
                                        <th>작성자</th>
                                        <th>작성일</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:set value="${pagingVO.dataList}" var="noticeList" />
                                    <c:choose>
                                        <c:when test="${empty noticeList}">
                                            <tr>
                                                <td colspan="4">조회하신 게시글이 존재하지 않습니다.</td>
                                            </tr>
                                        </c:when>
                                        <c:otherwise>
                                            <c:forEach items="${noticeList}" var="notice">
                                                 <tr onclick="location.href='/info/notice/detail?noNo=${notice.noNo}';" style="cursor: pointer;">
                                                    <td style="text-align: left; width: 400px; padding-left: 20px;"><a href="/info/notice/detail?noNo=${notice.noNo}">${notice.noTitle}</a></td>
                                                    <td>${notice.empName}</td>
                                                    <td>${notice.noDate}</td>
                                               	</tr>
                                            </c:forEach>
                                        </c:otherwise>
                                    </c:choose>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- 식단표 START -->
	<div class="col-6 d-flex justify-content-center">
	    <div class="card flex-fill">
	        <div class="card-body food">
	            <div class="d-md-flex align-items-center mb-3">
	                <div class="text-center w-100"> <!-- 텍스트 중앙 정렬을 위한 div 추가 -->
	                    <h2 class="fw-bolder text-uppercase" style="margin-top:30px;">식단표</h2> 
	                </div>
	            </div>
	            <div class="row justify-content-center">
	                <div class="col-sm-5">
	                    <span class="menu-title fw-bolder text-uppercase fs-2 d-block mb-3 text-center">중식</span>
	                    <div class="card12" style="box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);">
	                        <div class="card-body">
	                            <ul id="lunchMenu" class="list-unstyled mb-7 text-center">
	                                <!-- 중식 정보가 이곳에 표시 -->
	                            </ul>
	                        </div>
	                    </div>
	                </div>
	                <div class="col-sm-5">
	                    <span class="menu-title fw-bolder text-uppercase fs-2 d-block mb-3 text-center">석식</span>
	                    <div class="card12" style="box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);">
	                        <div class="card-body" >
	                            <ul id="dinnerMenu" class="list-unstyled mb-7 text-center">
	                                <!-- 석식 정보 이곳에 표시 -->
	                            </ul>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>
	</div>

	<!-- 식단표 END -->
</div>

		</div>
	</div>
</div>
<script>
$(function(){
	var interval; // 출근 버튼 누르면 흘러가는 시간
	var workArrive; // 출근 시간
	var workLeave;	// 퇴근 시간
	var month;	// 원하는 근태현황 월
	
	var WEEKDAY = ['일', '월', '화', '수', '목', '금', '토'];
	var day = WEEKDAY[new Date().getDay()];
	$("#workArrDay").html(day);
	$("#workLeaDay").html(day);
	
	var TodayDate = new Date();
	var TodayDateVal =TodayDate.getFullYear()+"-"+(TodayDate.getMonth()+1)+"-"+TodayDate.getDate()+"-"+WEEKDAY[TodayDate.getDay()];
	$("#todayDate").html(TodayDateVal)
});




document.addEventListener('DOMContentLoaded', () => {
    const cards = document.querySelectorAll(".card11");
    for (const card of cards) {
        card.addEventListener("click", flipper);
    }

//     $(".front").on("click", function () {
// 		$(this).css("transform","rotateY(90deg)");
// 	});
    
    function flipper(event) {
        const target = event.currentTarget;
        // 현재 회전 상태에 따라 회전
        if (target.style.transform === "rotateY(0deg)" || target.style.transform === "") {
            target.style.transform = "rotateY(180deg)";
        	setTimeout(() => {
	        	$(".front").css("z-index", "0");
	        	$(".back").css("z-index", "1000");
			}, 250);
        } else {
        	setTimeout(() => {
	        	$(".back").css("z-index", "0");
	        	$(".front").css("z-index", "1000");
			}, 250);
        	target.style.transform = "rotateY(0deg)";
        }
    }
});



//출근 버튼 
function goToWork(){
	
	$.ajax({
		url : "/common/attendanceArrive",
		type : "get",
		success : function(result){
			console.log("workArrive:"+result.workArrive);
			
			var WEEKDAY = ['일', '월', '화', '수', '목', '금', '토'];
			var date = result.workArrive.split(" ")[0];
			var day = WEEKDAY[new Date().getDay()];
			var time = result.workArrive.split(" ")[1];
			
//			$("#workArriveArea").html(date+" "+day+ " "+time);
			$("#workArriveArea").html(time);
			$("#workArriveArea2").html(date+" "+day+ " "+time);
			 	
			$("#btnArrive").attr("disabled",true);
		}
	});
	
	displayDateBtn();
	
}

//시간이 계속 바뀌는 타이머로 설정
function displayDateBtn(){
	interval = setInterval("displayDate()",1000);
}

var startTime = new Date(); // 시작 시간을 기록

var todayTime = null;


//시계
function displayDate() {
	
if($("#workArriveVal").val() == null){
		
		var currentDate = new Date();
	    
	    // 경과 시간 계산 (현재 시간 - 시작 시간)
	    var elapsedTime = currentDate - startTime; // 밀리초 단위
	    
	    // 시간, 분, 초 단위로 변환
	    var hours = Math.floor(elapsedTime / (1000 * 60 * 60)); // 시간 단위
	    var minutes = Math.floor((elapsedTime % (1000 * 60 * 60)) / (1000 * 60)); // 분 단위
	    var seconds = Math.floor((elapsedTime % (1000 * 60)) / 1000); // 초 단위
	    
	    // 경과 시간 출력
		var todayString = "";
		
		if (hours < 10) {
			todayString += "0";
		}
		todayString += hours + ":";
		if (minutes < 10) {
			todayString += "0";
		}
		todayString += minutes + ":";
		if (seconds < 10) {
			todayString += "0";
		}
		todayString += seconds;
		
		document.getElementById("time").innerHTML = todayString;
	    
	    // clock 요소를 페이지 로딩 후 보이게 설정
	    const clock = document.getElementById('clock');
	    clock.style.visibility = 'visible';
	    
	    
	
	}else{
		var workArriveVal = $("#workArriveVal").val();
		var workArriveDate = new Date(workArriveVal.replace(' ', 'T'));
		 var currentDate = new Date();
		 var elapsedTime = currentDate - workArriveDate; 
		 
	    var hours = Math.floor(elapsedTime / 1000 / 60 / 60); // 시간 단위
	    var minutes = Math.floor((elapsedTime % (1000 * 60 * 60)) / 1000 / 60); // 분 단위
	    var seconds = Math.floor((elapsedTime % (1000 * 60)) / 1000); // 초 단위
	    
	    // 경과 시간 출력
		var todayString = "";
		
		if (hours < 10) {
			todayString += "0";
		}
		todayString += hours + ":";
		if (minutes < 10) {
			todayString += "0";
		}
		todayString += minutes + ":";
		if (seconds < 10) {
			todayString += "0";
		}
		todayString += seconds;
		
		document.getElementById("time").innerHTML = todayString;
	    
	    // 콘솔에 경과 시간 출력
	    console.log("Elapsed Time:", hours, "시간", minutes, "분", seconds, "초");
	
	    // clock 요소를 페이지 로딩 후 보이게 설정
	    const clock = document.getElementById('clock');
	    clock.style.visibility = 'visible';
	}
}

//퇴근 버튼
function goToHome(){
	
// 	clearInterval(interval);
	
	
// 	$.ajax({
// 		url : "/common/attendanceLeave",
// 		type : "get",
// 		success : function(result){
// 			console.log("workLeave:"+result.workLeave);


// 			var WEEKDAY = ['일', '월', '화', '수', '목', '금', '토'];
// 			var date2 = result.workLeave.split(" ")[0];
// 			var day2 = WEEKDAY[new Date().getDay()];
// 			var time2 = result.workLeave.split(" ")[1];
			
// 			$("#workLeaveArea").html(time2);
// 			$("#workLeaveArea2").html(date2+" "+day2+ " "+time2);
			
// 			$("#total").html(result.workTime);
			
// 			if(result.workNormal > 0){
// 				$("#ew1").html("<span class='mb-1 badge rounded-pill  bg-info-subtle text-info'>"+result.workNormal+"</span>"  );
// 			}else{
// 				$("#ew1").html("<span>"+result.workNormal+"</span>"  );
// 			}
// 			if(result.workLate > 0){
// 				$("#ew2").html("<span class='mb-1 badge rounded-pill  bg-info-subtle text-info'>"+result.workLate+"</span>"  );
// 			}else{
// 				$("#ew2").html("<span>"+result.workLate+"</span>"  );
// 			}
// 			if(result.workEarly > 0){
// 				$("#ew3").html("<span class='mb-1 badge rounded-pill  bg-info-subtle text-info'>"+result.workEarly+"</span>"  );
// 			}else{
// 				$("#ew3").html("<span>"+result.workEarly+"</span>"  );
// 			}
// 			if(result.workOff > 0){
// 				$("#ew4").html("<span class='mb-1 badge rounded-pill  bg-info-subtle text-info'>"+result.workOff+"</span>"  );
// 			}else{
// 				$("#ew4").html("<span>"+result.workOff+"</span>"  );
// 			}
// 			if(result.workNochk > 0){
// 				$("#ew5").html("<span class='mb-1 badge rounded-pill  bg-info-subtle text-info'>"+result.workNochk+"</span>"  );
// 			}else{
// 				$("#ew5").html("<span>"+result.workNochk+"</span>"  );
// 			}
			 	
// 			$("#btnLeave").attr("disabled",true);
// 		}
// 	});

	clearInterval(interval);
	
	$.ajax({
		url : "/common/attendanceLeave",
		type : "post",
		data : JSON.stringify({ todayTime : todayTime }),
		contentType : 'application/json; charset=utf-8',
		success : function(result){
			console.log("workLeave:"+result.workLeave);


			var WEEKDAY = ['일', '월', '화', '수', '목', '금', '토'];
			var date2 = result.workLeave.split(" ")[0];
			var day2 = WEEKDAY[new Date().getDay()];
			var time2 = result.workLeave.split(" ")[1];
			
			$("#workLeaveArea").html(time2);
			$("#workLeaveArea2").html(date2+" "+day2+ " "+time2);
			
			$("#total").html(result.workTime);
			
			if(result.workNormal > 0){
				$("#ew1").html("<span class='mb-1 badge rounded-pill  bg-info-subtle text-info'>"+result.workNormal+"</span>"  );
			}else{
				$("#ew1").html("<span>"+result.workNormal+"</span>"  );
			}
			if(result.workLate > 0){
				$("#ew2").html("<span class='mb-1 badge rounded-pill  bg-info-subtle text-info'>"+result.workLate+"</span>"  );
			}else{
				$("#ew2").html("<span>"+result.workLate+"</span>"  );
			}
			if(result.workEarly > 0){
				$("#ew3").html("<span class='mb-1 badge rounded-pill  bg-info-subtle text-info'>"+result.workEarly+"</span>"  );
			}else{
				$("#ew3").html("<span>"+result.workEarly+"</span>"  );
			}
			if(result.workOff > 0){
				$("#ew4").html("<span class='mb-1 badge rounded-pill  bg-info-subtle text-info'>"+result.workOff+"</span>"  );
			}else{
				$("#ew4").html("<span>"+result.workOff+"</span>"  );
			}
			if(result.workNochk > 0){
				$("#ew5").html("<span class='mb-1 badge rounded-pill  bg-info-subtle text-info'>"+result.workNochk+"</span>"  );
			}else{
				$("#ew5").html("<span>"+result.workNochk+"</span>"  );
			}
			 	
			$("#btnLeave").attr("disabled",true);
			 	
			
			$("#time").html(result.todayTime);
		}
	});
	
	
    // clock 요소를 페이지 로딩 후 보이게 설정
    $("#clock").attr("class", "display-3 ti ti-clock-stop text-primary");


}

if("${empWorkVO.workArrive}" != "" && "${empWorkVO.workLeave}" == ""){
	displayDateBtn();
}




</script>
		