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
                      <li class="breadcrumb-item" aria-current="page">Attendance</li>
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
        <div class="card w-100 position-relative overflow-hidden">
     <div >
		
        <br/>
        
        <input type="hidden" id="empNo" name="empNo" value="${empWorkVO.empNo }"  />
       <!-- 출퇴근 체크 -->
       <div class="row justify-content-center">
        <div class="col-md-4 d-flex justify-content-center">
        
		   <div class="card-body text-center shadow-sm rounded" >
            
              <div class="d-flex justify-content-center gap-3">
    
			    <!-- 첫 번째 버튼 (출근) -->
			    <div style="width:180px; height: 80px;" class="row">
			      <button class="card text-bg-success align-items-center" onclick="goToWork()" id="btnArrive" style="padding: 10px;">
			        <div class="card-body text-white" style="padding: 0;">
			          <div class="d-flex flex-row align-items-center justify-content-center">
			            <div class="round-40 rounded-circle d-flex align-items-center justify-content-center bg-white">
			              <i class="fas fa-clock fs-6 text-success"></i>
			            </div>
			            <div class="ms-3">
			              <h4 class="mb-0 text-white fs-6"><strong>출근</strong></h4>
			            </div>
			          </div>
			        </div>
			      </button>
			    </div>
			    
			    <!-- 두 번째 버튼 (출근) -->
			    <div style="width:180px; height: 80px;" class="row">
			      <div class="" style="padding: 10px;">
			        <div class="card-body" style="padding: 0;">
			          <div class="d-flex flex-row align-items-center justify-content-center">
			            <div class="round-40 rounded-circle d-flex align-items-center justify-content-center bg-white">
			            </div>
			            <div class="ms-3">
			              <h4 class="mb-0  fs-3"><strong>
                        <c:choose>
				        	<c:when test="${not empty empWorkVO.workArrive }">
				        	${fn:split(empWorkVO.workArrive, " ")[0]  } <span id="workArrDay">요일</span> ${fn:split(empWorkVO.workArrive, " ")[1]  }
				        	</c:when>
				        	<c:otherwise>
								<span id="workArriveArea"></span>
				        	</c:otherwise>
				        </c:choose>
						</strong></h4>
			            </div>
			          </div>
			        </div>
			      </div>
			    </div>
    
  			</div>
            
            
             <div class="d-flex justify-content-center gap-3">
              <!-- 첫 번째 퇴근 버튼 -->
              <div style="width:180px; height: 80px;" class="row">
		      <button class="card text-bg-info align-items-center" onclick="goToHome()" id="btnLeave" style="padding: 10px;">
		        <div class="card-body text-white" style="padding: 0;">
		          <div class="d-flex flex-row align-items-center justify-content-center">
		            <div class="round-40 rounded-circle d-flex align-items-center justify-content-center bg-white">
		              <i class="ti ti-clock-hour-4 fs-6 text-info"></i>
		            </div>
		            <div class="ms-3">
		              <h4 class="mb-0 text-white fs-6"><strong>퇴근</strong></h4>
		            </div>
		          </div>
		        </div>
		      </button>
		    </div>

		    <!-- 두 번째 퇴근 버튼 -->
		    <div style="width:180px; height: 80px;" class="row">
		      <div class="" style="padding: 10px;">
		        <div class="card-body text-white" style="padding: 0;">
		          <div class="d-flex flex-row align-items-center justify-content-center">
		            <div class="round-40 rounded-circle d-flex align-items-center justify-content-center bg-white">
		            </div>
		            <div class="ms-3">
		              <h4 class="mb-0  fs-3"><strong>
		              <c:choose>
			        	<c:when test="${not empty empWorkVO.workLeave }">
			        	${fn:split(empWorkVO.workLeave, " ")[0]  } <span id="workLeaDay">요일</span> ${fn:split(empWorkVO.workLeave, " ")[1]  }
			        	</c:when>
			        	<c:otherwise>
							<span id="workLeaveArea"></span>
			        	</c:otherwise>
			          </c:choose>
		              </strong></h4>
		            </div>
		          </div>
		        </div>
		      </div>
		    </div>
            
           </div>
            
            
         </div>
         
         
         <!-- 시간 -->
           <div class="col-md-8 d-flex justify-content-center">
       		 <div class="card-body text-center shadow-sm rounded" style="margin: 0 10px;">
			    <span class="text-muted display-4">
			      <i class="ti ti-clock-hour-4"></i>
			    </span>
			     <div class="d-flex justify-content-center align-items-center mt-3" >
			     <h4 id="time"></h4>
			    </div>
			     	<h2>   
			     	    <span id="total">
				        <c:choose>
				        	<c:when test="${not empty empWorkVO.workLeave }">
				    			${empWorkVO.workTime }
				        	</c:when>
				        	<c:otherwise>
				        	</c:otherwise>
				        </c:choose>
						</span>
					</h2>
			  </div>
			</div>
      
       </div> 
     </div>
           
        
		<br>
		
		
		<br><br>

			<h3>오늘 근태 현황</h3>
 			<div class="table-responsive mb-4 border rounded-1 mt-3">
                    <table class="table table-hover text-nowrap mb-0 align-middle" style="table-layout: fixed;">
                        <thead class="text-dark fs-4">
                            <tr>
                                <th width=""><h6 class="fs-4 fw-semibold mb-0">정상출근</h6></th>
                                <th width=""><h6 class="fs-4 fw-semibold mb-0">지각</h6></th>
                                <th width=""><h6 class="fs-4 fw-semibold mb-0">조기 퇴근</h6></th>
                                <th width=""><h6 class="fs-4 fw-semibold mb-0">결근</h6></th>
                                <th width=""><h6 class="fs-4 fw-semibold mb-0">퇴근 미체크</h6></th>
                            </tr>
                        </thead>
                        <tbody>
							<tr>   
							<c:choose>
							<c:when test="${not empty empWorkVO.workLeave }">
                                <td><p id="ew1" class="mb-0 fw-normal fs-4">${empWorkVO.workNormal}</p></td>
                                <td><p id="ew2" class="mb-0 fw-normal fs-4">${empWorkVO.workLate}</p></td>
                                <td><p id="ew3" class="mb-0 fw-normal fs-4">${empWorkVO.workEarly}</p></td>
                                <td><p id="ew4" class="mb-0 fw-normal fs-4">${empWorkVO.workOff}</p></td>
                                <td><p id="ew5" class="mb-0 fw-normal fs-4">${empWorkVO.workNochk}</p></td>
    						</c:when>                                         
    						<c:otherwise>
                                <td><p id="ew1" class="mb-0 fw-normal fs-4"></p></td>
                                <td><p id="ew2" class="mb-0 fw-normal fs-4"></p></td>
                                <td><p id="ew3" class="mb-0 fw-normal fs-4"></p></td>
                                <td><p id="ew4" class="mb-0 fw-normal fs-4"></p></td>
                                <td><p id="ew5" class="mb-0 fw-normal fs-4"></p></td>
    						</c:otherwise>
							</c:choose>
                           </tr>
                        </tbody>
                    </table>
                </div>
                
              <h3>월 별 근태 현황</h3>
			 <div class="table-responsive mb-4 border rounded-1 mt-3">
		      <select class="form-select me-2"  style="width: 160px;" id="workMonth">    
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
					<div class="row" style="width: 100%; display: flex;">
					<table id="empWorkTable" class="table table-hover text-nowrap mb-0 align-middle" style="table-layout: fixed; width: 50%;">
                        <thead class="text-dark fs-4">
                            <tr>
                                <th width="10%"><h6 class="fs-4 fw-semibold mb-0">주</h6></th>
                                <th width="10%"><h6 class="fs-4 fw-semibold mb-0">정상출근</h6></th>
                                <th width="10%"><h6 class="fs-4 fw-semibold mb-0">지각</h6></th>
                                <th width="10%"><h6 class="fs-4 fw-semibold mb-0">조기 퇴근</h6></th>
                                <th width="10%"><h6 class="fs-4 fw-semibold mb-0">결근</h6></th>
                                <th width="10%"><h6 class="fs-4 fw-semibold mb-0">퇴근 미체크</h6></th>
                            </tr>
                        </thead>
                        <tbody>
							<tr>   
                               <td><p class="mb-0 fw-normal fs-4"></p></td>
                               <td><p class="mb-0 fw-normal fs-4"></p></td>
                               <td><p class="mb-0 fw-normal fs-4"></p></td>
                               <td><p class="mb-0 fw-normal fs-4"></p></td>
                               <td><p class="mb-0 fw-normal fs-4"></p></td>
                               <td><p class="mb-0 fw-normal fs-4"></p></td>
                           </tr>
                        </tbody>
                    </table>
				 <div style="width: 50%; display: inline-block; padding-left: 10px;">
				        <span id="empWorkDetail"></span>
				    </div>
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
				$('#empWorkTable2 > thead').empty(); //기존 테이블데이터 삭제
				$('#empWorkTable2 > tbody').empty(); //기존 테이블데이터 삭제
				html2 = '<table id="empWorkTable2"  class="table table-hover text-nowrap mb-0 align-middle" style="table-layout: fixed; width: 100%;"><tr>';
				html2 +='<tr><thead class="text-dark fs-4">';
                html2 +='<th width=""><h6 class="fs-4 fw-semibold mb-0">날짜</h6></th>';
                html2 +='<th width=""><h6 class="fs-4 fw-semibold mb-0">출근시간</h6></th>';
                html2 +='<th width=""><h6 class="fs-4 fw-semibold mb-0">퇴근시간</h6></th>';
                html2 +='<th width=""><h6 class="fs-4 fw-semibold mb-0">총 근무 시간</h6></th>';
                html2 +='</tr></thead><tbody>';
				for(var i=0; i<result.length; i++ ){
					html2 += '<tr>';
					html2 += '<td><p class="mb-0 fw-normal fs-4">'+result[i].workArrive.split(" ")[0]+'</p></td>';
					html2 += '<td><p class="mb-0 fw-normal fs-4">'+result[i].workArrive.split(" ")[1]+'</p></td>';
					html2 += '<td><p class="mb-0 fw-normal fs-4">'+result[i].workLeave.split(" ")[1]+'</p></td>';
					html2 += '<td><p class="mb-0 fw-normal fs-4">'+  result[i].workTime +'</p></td>';
					html2 += '</tr>';
				}
				html2 += '</tbody></table>';
				$("#empWorkDetail").append(html2); // 새로운 데이터 덮어쓰기
				
			}
		});
	    
	    
	    
	    
	    
	    
	    
// 		$("#empWorkDetail").html("디테일")
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
			
			$("#workArriveArea").html(date+" "+day+ " "+time);
			 	
			$("#btnArrive").attr("disabled",true);
		}
	});
	
	displayDateBtn();
	
}

//시간이 계속 바뀌는 타이머로 설정
function displayDateBtn(){
	interval = setInterval("displayDate()",1000);
}

//시계
function displayDate() {
	
	let d = new Date();	
	
	var todayHours = d.getHours();
	var todayMinutes = d.getMinutes();
	var todaySeconds = d.getSeconds();
	
	var todayString = "";
	
	if (todayHours < 10) {
		todayString = "0"+todayHours;
	}
	todayString += todayHours + ":";
	
	if (todayMinutes < 10) {
		todayString = "0"+todayMinutes;
	}
	todayString += todayMinutes + ":";
	
	if (todaySeconds < 10) {
		todayString = "0"+todaySeconds;
	}
	todayString += todaySeconds;
	
// 	let dVal = d.getFullYear()+"-"+(d.getMonth()+1)+"-"+d.getDate()+" "
// 						+d.getHours()+":"+d.getMinutes()+":"+d.getSeconds();
// 	let dVal = d.getHours()+":"+d.getMinutes()+":"+d.getSeconds();
// 	document.getElementById("time").innerHTML = dVal;
	document.getElementById("time").innerHTML = todayString;
	
	
}

// 퇴근 버튼
function goToHome(){
	
	clearInterval(interval);
	
	
	$.ajax({
		url : "/common/attendanceLeave",
		type : "get",
		success : function(result){
			console.log("workLeave:"+result.workLeave);


			var WEEKDAY = ['일', '월', '화', '수', '목', '금', '토'];
			var date2 = result.workLeave.split(" ")[0];
			var day2 = WEEKDAY[new Date().getDay()];
			var time2 = result.workLeave.split(" ")[1];
			
			$("#workLeaveArea").html(date2+" "+day2+ " "+time2);
			
			$("#total").html("총"+result.workTime);
			$("#ew1").html(result.workNormal);
			$("#ew2").html(result.workLate);
			$("#ew3").html(result.workEarly);
			$("#ew4").html(result.workOff);
			$("#ew5").html(result.workNochk);
			
			 	
			$("#btnLeave").attr("disabled",true);
		}
	});

}

if("${empWorkVO.workArrive}" != "" && "${empWorkVO.workLeave}" == ""){
	displayDateBtn();
}



</script>

