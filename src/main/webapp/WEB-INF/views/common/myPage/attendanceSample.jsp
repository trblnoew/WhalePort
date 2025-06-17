<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<style>
    .table th {
        text-align: center;
    }
    .table td {
        text-align: center;
    }
</style>
<div class="body-wrapper">
<div class="container-fluid">
<div class="card bg-info-subtle shadow-none position-relative overflow-hidden mb-4">
            <div class="card-body px-4 py-3">
              <div class="row align-items-center">
                <div class="col-9">
                  <h4 class="fw-semibold mb-8">근태 현황</h4>
                  <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                      <li class="breadcrumb-item">
                        <a class="text-muted text-decoration-none" href="/common/home">DashBoard</a>
                      </li>
                      <li class="breadcrumb-item" aria-current="page">근태 현황</li>
                    </ol>
                  </nav>
                </div>
                <div class="col-3">
                 <div class="text-center mb-n4">
                    <img src="${pageContext.request.contextPath }/resources/assets/images/logos/symbol-01.png" alt="modernize-img" class="img-fluid" style="width: 120px; height: auto;">
                  </div>
                </div>
              </div>
            </div>
          </div>

		<div class="card">
			<div class="card-header">
             <h4 class="mb-0 text-dark card-title">출퇴근 기록</h4>
        <input type="hidden" id="empNo" name="empNo" value="${empWorkVO.empNo }"  />
           </div>
		<div class="row d-flex flex-row justify-content-center align-items-center mt-6 gap-3">
			<div class="card col-4 d-flex flex-column justify-content-center align-items-center" style="height: 40vh;">
			  <div class="col-md-8 mb-3 mt-3">
			    <div class="card border-top border-success">
			      <div class="card-body">
			        <div class="d-flex justify-content-center align-items-center">
					  <div class="text-center">
					    <h6 class="card-title fs-4" style="color: gray;" >
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
					    <span class="text-success display-6">
					      <button type="button" class="btn btn-rounded bg-success-subtle text-success btn-sm" onclick="goToWork()" id="btnArrive" ${not empty empWorkVO.workArrive ? 'disabled':''} ><i class="ti ti-clock-play me-2" ></i>go to work</button>
					    </span>
					  </div>
					</div>

			      </div>
			    </div>
			  </div>
			  <div class="col-md-8">
			    <div class="card border-top border-dark">
			      <div class="card-body">
			        <div class="d-flex justify-content-center align-items-center">
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
					    <span class="text-success display-6">
					      <button type="button" class="btn btn-light text-gray btn-sm" onclick="goToHome()" id="btnLeave" ${not empty empWorkVO.workLeave ? 'disabled':''}><i class="ti ti-clock-pause me-2"></i>leave work</button>
					    </span>
					  </div>
			        </div>
			      </div>
			    </div>
			  </div>
			</div>

			  <div class="card col-3 ms-3">
			    <div class="card-body text-center" style="height: 380px; padding: 40px;"> <!-- 원하는 여백으로 조정 -->
			        <h4 class="text-center fs-5 text-info">
			            <span class="mb-1 badge rounded-pill bg-secondary-subtle text-secondary">today</span>
			            근무 기록
			        </h4>
			       <h4 id="time">
			       <c:if test="${not empty empWorkVO.todayTime }">
				       ${empWorkVO.todayTime }
			       </c:if>
			       </h4>
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
			
			<!-- 추가 시작  -->
			  <div class="card col-3 ms-3">
			    <div class="card-body text-center" style="height: 380px; padding: 40px;">
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
		  <!-- 추가 끝 -->
         </div>
       </div>

<div class="card card-body">
<div class="card-header">
             <h4 class="mb-0 text-dark card-title">오늘 근태 현황</h4>
           </div>
              <div class="table-responsive">
                <table class="table table-hover text-nowrap align-middle">
                <colgroup>
                        <col style="width: 10%;">
                        <col style="width: 10%;">
                        <col style="width: 10%;">
                        <col style="width: 10%;">
                        <col style="width: 10%;">
                    </colgroup>
                  <thead class="header-item">
                    <tr>
                    <th>정상출근</th>
                    <th>지각</th>
                    <th>조기 퇴근</th>
                    <th>결근</th>
                    <th>퇴근 미체크</th>
                  </tr></thead>
                  <tbody>
                  	
                    <tr>      
                    <c:choose>
							<c:when test="${not empty empWorkVO.workLeave }">
                                <td><span class="${empWorkVO.workNormal eq 0 ? '':'mb-1 badge rounded-pill  bg-info-subtle text-info'}" id="ew1" >${empWorkVO.workNormal}</span></td>
                                <td><span class="${empWorkVO.workLate eq 0 ? '':'mb-1 badge rounded-pill  bg-info-subtle text-info'}" id="ew2" >${empWorkVO.workLate}</span></td>
                                <td><span class="${empWorkVO.workEarly eq 0 ? '':'mb-1 badge rounded-pill  bg-info-subtle text-info'}" id="ew3" >${empWorkVO.workEarly}</span></td>
                                <td><span class="${empWorkVO.workOff eq 0 ? '':'mb-1 badge rounded-pill  bg-info-subtle text-info'}" id="ew4" >${empWorkVO.workOff}</span></td>
                                <td><span class="${empWorkVO.workNochk eq 0 ? '':'mb-1 badge rounded-pill  bg-info-subtle text-info'}" id="ew5" >${empWorkVO.workNochk}</span></td>
    						</c:when>              
    						<c:otherwise>
                                <td id="ew1"><span></span></td>
                                <td id="ew2"><span></span></td>
                                <td id="ew3"><span></span></td>
                                <td id="ew4"><span></span></td>
                                <td id="ew5"><span></span></td>
    						</c:otherwise>
					</c:choose>
                    </tr>
                  	
                  </tbody>
                </table>
                </div>
              </div>
	<div class="row">              
		<div class="card card-body col-6">
			<div class="card-header">
             <h4 class="mb-0 text-dark card-title">월별 근태 현황</h4>
            </div>
			<select class="form-select form-control" id="workMonth" style="width:120px;">
			 		<option value="" >월 선택</option>
			 		<option value="01" >1월</option>
			 		<option value="02" >2월</option>
			 		<option value="03" >3월</option>
			 		<option value="04" >4월</option>
			 		<option value="05" >5월</option>
			 		<option value="06" >6월</option>
			 		<option value="07" >7월</option>
			 		<option value="08" >8월</option>
			 		<option value="09" >9월</option>
			 		<option value="10" >10월</option>
			 		<option value="11" >11월</option>
			 		<option value="12" >12월</option>
               </select>
              <div class="table-responsive">
                <table id="empWorkTable" class="table table-hover text-nowrap align-middle">
                <colgroup>
                        <col style="width: 10%;">
                        <col style="width: 10%;">
                        <col style="width: 10%;">
                        <col style="width: 10%;">
                        <col style="width: 10%;">
                    </colgroup>
                  <thead class="header-item">
                    <tr>
                    <th>주</th>
                    <th>정상출근</th>
                    <th>지각</th>
                    <th>조기 퇴근</th>
                    <th>결근</th>
                    <th>퇴근 미체크</th>
                  </tr></thead>
                  <tbody>
                    <tr class="search-items" style="cursor: pointer;">                                            
                      <td><span class="usr-empId"></span></td>
                      <td><span class="usr-empId"></span></td>
                      <td><span class="usr-empId"></span></td>
                      <td><span class="usr-empStartdate"></span></td>
                      <td><span class="usr-department"></span></td>
                      <td><span class="usr-position"></span></td>
                    </tr>
                  </tbody>
                </table>
               </div>
             </div>
		<div class="card card-body col-6">
			<div class="card-header">
             <h4 class="mb-0 text-dark card-title">출결 상세</h4>
           </div>
              <div class="table-responsive">
                <table class="table table-hover text-nowrap align-middle" id="empWorkTable2">
                <colgroup>
                        <col style="width: 10%;">
                        <col style="width: 10%;">
                        <col style="width: 10%;">
                        <col style="width: 10%;">
                    </colgroup>
                  <thead class="header-item">
                    <tr>
                    <th>날짜</th>
                    <th>출근 시간</th>
                    <th>퇴근 시간</th>
                    <th>총 근무 시간</th>
                  </tr></thead>
                  <tbody>
                    <tr class="search-items" style="cursor: pointer;">                                            
                      <td><span class="usr-empId"></span></td>
                      <td><span class="usr-empId"></span></td>
                      <td><span class="usr-empStartdate"></span></td>
                      <td><span class="usr-department"></span></td>
                 	 </tr>
                  	
                  </tbody>
                </table>
                </div>
                
            <div class="row">
            <div class="col-md-4 col-xl-3">
            </div>
          </div> 
          </div>
         </div>

</div>
</div>

<script type="text/javascript">
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
	
	$("#workMonth").on("change", function(){
// 		alert($(this).val());
		month = $(this).val();
// 		var empNo = $("#empNo").val();
		var empNo = "1";
		
		$.ajax({
			url : "/common/attendanceMonth",
			type : "post",
			data : JSON.stringify({ month : month , empNo : empNo }),
			contentType : 'application/json; charset=utf-8',
			success : function(result){
// 				alert('result[0]',result[0]);
// 				alert(JSON.stringify(result));
// 				alert(JSON.stringify(result)[0]);
// 				console.log('res :: ' + JSON.stringify(result));
// 				console.log("empWorkVO.sumWorkLate:"+result[0].sumWorkLate);
				
				var html = '';
				for(var i=0; i<result.length; i++ ){
					$('#empWorkTable > tbody').empty(); //기존 테이블데이터 삭제
					html += '<tr>';
					html += '<td><p class="mb-0 fw-normal fs-4">'+(i+1)+'주'+'</p></td>';
					html += '<td><p class="mb-0 fw-normal fs-4">'+result[i].sumWorkNormal+'</p></td>';
					html += '<td><p class="mb-0 fw-normal fs-4">'+result[i].sumWorkLate+'</p></td>';
					html += '<td><p class="mb-0 fw-normal fs-4">'+result[i].sumWorkEarly+'</p></td>';
					html += '<td><p class="mb-0 fw-normal fs-4">'+result[i].sumWorkOff+'</p></td>';
					html += '<td><p class="mb-0 fw-normal fs-4">'+result[i].sumWorkNochk+'</p></td>';
					html += '</tr>';
				}
				$("#empWorkTable").append(html); // 새로운 데이터 덮어쓰기
				
			}
		});
	});
	
	$("#empWorkTable tbody").on("click", "tr", function() {
// 	    alert("tr 클릭");
// 		alert($(this).text());
// 		alert($(this).text()[0]);
		var week = $(this).text()[0];
// 		var empNo = $("#empNo").val();
		var empNo = "1";
	    $.ajax({
			url : "/common/attendanceMonthDetail",
			type : "post",
			data : JSON.stringify({ week : week , empNo : empNo,  month : month }),
			contentType : 'application/json; charset=utf-8',
			success : function(result){
				var html2 = '';
				for(var i=0; i<result.length; i++ ){
					$('#empWorkTable2 > tbody').empty(); //기존 테이블데이터 삭제
					html2 += '<tr>';
					html2 += '<td><p class="mb-0 fw-normal fs-4">'+result[i].workArrive.split(" ")[0]+'</p></td>';
					html2 += '<td><p class="mb-0 fw-normal fs-4">'+result[i].workArrive.split(" ")[1]+'</p></td>';
					html2 += '<td><p class="mb-0 fw-normal fs-4">'+result[i].workLeave.split(" ")[1]+'</p></td>';
					html2 += '<td><p class="mb-0 fw-normal fs-4">'+  result[i].workTime +'</p></td>';
					html2 += '</tr>';
				}
				$("#empWorkTable2").append(html2); // 새로운 데이터 덮어쓰기
				
			}
		});
	});
});


// 출근 버튼 
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
			
// 			$("#workArriveArea").html(date+" "+day+ " "+time);
			$("#workArriveArea").html(time);
			$("#workArriveArea2").html(date+" "+day+ " "+time);
			 	
			$("#btnArrive").attr("disabled",true);
		}
	});
	
	displayDateBtn();
	
}

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
		
		todayTime = todayString;
	    
	    // clock 요소를 페이지 로딩 후 보이게 설정
	    const clock = document.getElementById('clock');
	    clock.style.visibility = 'visible';
	    
	    
	
	}else{
		var workArriveVal = $("#workArriveVal").val();
		var workArriveDate = new Date(workArriveVal.replace(' ', 'T'));
		 var currentDate = new Date();
		 var elapsedTime = currentDate - workArriveDate; 
		 
	    var hours = Math.floor(elapsedTime / (1000 * 60 * 60)); // 시간 단위
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
		
		todayTime = todayString;
	    
	    // 콘솔에 경과 시간 출력
	    console.log("Elapsed Time:", hours, "시간", minutes, "분", seconds, "초");
	    
	
	
	    // clock 요소를 페이지 로딩 후 보이게 설정
	    const clock = document.getElementById('clock');
	    clock.style.visibility = 'visible';
	}
		
}



// 퇴근 버튼
function goToHome(){
	
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
