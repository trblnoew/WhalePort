<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<style>
    .table th {
        text-align: center;
    }
    .table td {
        text-align: center;
    }
    
    .table td:hover{
    	background-color : blue;
    	cursor : pointer;
    }
</style>


<div class="body-wrapper">
    <div class="container-fluid">
    	<!-- 상단 카드 시작-->
        <div class="card bg-info-subtle shadow-none position-relative overflow-hidden mb-4">
           <div class="card-body px-4 py-3">
             <div class="row align-items-center" style="margin-top:20px;">
               <div class="col-9">
                 <h4 class="fw-semibold mb-8">항공편 관리</h4>
                 <nav aria-label="breadcrumb">
                   <ol class="breadcrumb">
                     <li class="breadcrumb-item">
                       <a class="text-muted text-decoration-none" href="../main/index.html">DashBoard</a>
                     </li>
                     <li class="breadcrumb-item" aria-current="page">항공편 관리</li>
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
        <!-- 상단 카드 끝 -->
<!--         <input type="text" id="boarding" value="ICN"/> -->
<!--           <input type="text" id="arrive" value="HND"/> -->
<!--           <input type="text" id="pageNo" value="1"/> -->
<!-- 		<input type="button" value="c111lick" id="test"/> -->
<!-- 		<input type="button" value="che111k" id="chk"/><br/> -->
<!-- 		<input type="text" id="hrs" value="0"/>시간<br/> -->
<!-- 		<input type="text" id="min" value="0"/>분<br/>		 -->
<!-- 		<hr/> -->
<!-- 		 <div id="data"> -->
<!-- 		 </div> -->
<!-- 		 <div id="dataLength"></div> -->
<!-- 		 <hr/> -->
		 
		  <div class="row mb-4 align-items-center">
                <div class="col-md-3">
                    <input type="button" class="btn btn-primary autoCommit me-2" value="자동배정" />
<!--                     <input type="button" class="btn btn-outline-primary emptyCommit" value="빈값배정" /> -->
                    
                    <c:if test="${not empty searchWord}">
                        <a href="/management/airport/schedule" class="btn btn-outline-primary me-3">목록</a>
                    </c:if>
                </div>
	            <div class="col-md-9 d-flex justify-content-end align-items-center">
	                <form action="/management/airport/schedule" method="get" class="position-relative me-2" id="searchForm">
	                	<input type="hidden" name="page" id="page" value=""/>
	                    <input type="text" class="form-control product-search ps-5 pe-5" id="input-search" name="searchWord" placeholder="항공사 또는 출/도착지 검색" value="${searchWord}" style="width:280px;" />
	                    <i class="ti ti-search position-absolute top-50 start-0 translate-middle-y fs-6 text-dark ms-3"></i>
	                </form>
	                <button type="button" class="btn btn-primary" id="searchBtn">검색</button>
	            </div>
            </div>
            
            
		 <div class="table-responsive mb-4 border rounded-1 mt-3">
                <table class="table table-hover text-nowrap mb-0 align-middle" style="table-layout: fixed;">
                    <colgroup>
                    	<col style="width: 5%;">
                        <col style="width: 15%;">
                        <col style="width: 10%;">
                        <col style="width: 15%;">
                        <col style="width: 15%;">
                        <col style="width: 6%;">
                        <col style="width: 6%;">
                        <col style="width: 10%;">
                        <col style="width: 6%;">
                    </colgroup>
                    <thead class="text-dark fs-4">
                        <tr>
                            <th></th>
                            <th><h6 class="fs-4 fw-semibold mb-0">항공사명</h6></th>
							<th><h6 class="fs-4 fw-semibold mb-0">노선</h6></th>
                            <th><h6 class="fs-4 fw-semibold mb-0">시작일</h6></th>
                            <th><h6 class="fs-4 fw-semibold mb-0">종료일</h6></th>
                            <th><h6 class="fs-4 fw-semibold mb-0">게이트위치</h6></th>
                            <th><h6 class="fs-4 fw-semibold mb-0">체크인위치</h6></th>
                            <th><h6 class="fs-4 fw-semibold mb-0">가격</h6></th>
                            <th><h6 class="fs-4 fw-semibold mb-0">배정</h6></th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:choose>
                            <c:when test="${empty pagingVO.dataList}">
                                <tr>
                                    <td colspan="7">입력하신 정보에 부합하는 정보가 없습니다.</td>
                                </tr>
                            </c:when>
                            <c:otherwise>
                                <c:forEach items="${pagingVO.dataList}" var="plane">
                                      
                                        <tr data-distance="${plane.icDistance }" data-scarrived="${plane.scArrived }" data-scboarding="${plane.scBoarding }">
                                        <input type="hidden" value="" class="realNum" />
                                            <td><img src="${plane.scImage }" width="30px" height="30px"/></td>
                                            <td><p class="mb-0 fw-normal fs-4 scAirline" style="text-align : left;">${plane.scAirline}</p></td>
                                            <td><p class="mb-0 fw-normal fs-4 scBoarding">${plane.scBoarding } - ${plane.scArrived }</p></td>
											<fmt:parseDate value="${plane.scStdate}" pattern="EEE MMM dd HH:mm:ss z yyyy" var="parsedStdate" parseLocale="en" />
                                            <td><p class="mb-0 fw-normal fs-4"><fmt:formatDate value="${parsedStdate}" pattern="yyyy/MM/dd" /></p></td>                                            
                                            <fmt:parseDate value="${plane.scStd}" pattern="EEE MMM dd HH:mm:ss z yyyy" var="parsedStd" parseLocale="en" />
                                            <td><p class="mb-0 fw-normal fs-4"><fmt:formatDate value="${parsedStd}" pattern="yyyy/MM/dd" /></p></td>
                                            <td><p class="mb-0 fw-normal fs-4 scGate"><input type="text" class="form-control" style="text-align : center;" value="${plane.scGate }" disabled/></p></td>
                                            <td><p class="mb-0 fw-normal fs-4 scCheckin"><input type="text" class="form-control" style="text-align : center;" value="${plane.scCheckin }" disabled/></p></td>
                                            <fmt:setLocale value="ko_KR"/>
                                            <td><p class="mb-0 fw-normal fs-4 scPrice"><input type="text" class="form-control" style="text-align : right;" value='<fmt:formatNumber type="number" value="${plane.scPrice }" />' disabled/></p></td>                                            
                                            <td><p class="mb-0 fw-normal fs-4">
                                            <c:choose>
                                            	<c:when test="${plane.scPrice == 0 }">
                                            	<input type="button" class="btn btn-outline-primary assign" value="배정" />	
                                            	</c:when>
                                            	<c:otherwise>
                                            	<input type="button" class="btn btn-outline-primary assign" value="수정" />
                                            	</c:otherwise>
                                            </c:choose>
                                            </p></td>
                                        </tr>

                                </c:forEach>
                            </c:otherwise>
                        </c:choose>
                    </tbody>
                </table>
            </div>
            
	            <div class="text-end mb-3">
                    <c:if test="${not empty searchWord}">
                        <a href="/management/airport/schedule" class="btn btn-outline-primary me-3">목록</a>
                    </c:if>
                </div>
            <!-- Pagination 시작 -->
				<div class="d-flex justify-content-center" style="margin-top: 20px;" id="pagingArea">
				    <nav aria-label="...">
				        ${pagingVO.pagingHTML }
				    </nav>
				</div>
			<!-- Pagination 끝 -->
            
    </div>
</div>

<script type="text/javascript">

$(function() {
	var it;
	var its;
	let resultData = [];
	let solData = [];
	var autoCommit = $('.autoCommit');
	var emptyCommit = $('.emptyCommit');
	$('#arrive').on('keyup', enterKey);
	$('#pageNo').on('keyup', enterKey);
	$('#boarding').on('keyup', enterKey);
	
	
	
	
	let plane = '${pagingVO.dataList}';
	
	//paging처리
	$('#pagingArea').on('click','a',function(e){
		e.preventDefault();
		var pNo = $(this).data('page');
		$('#searchForm').find('#page').val(pNo);
		$('#searchForm').submit();
		
	});
	
	$('#searchBtn').on('click',function(){
// 		var valo = $('#input-search').val().toUpperCase();
// 		$('#input-search').val(valo);
		$('#searchForm').submit();
		
	});
	

	$('.assign').on('click',function(){
	        var signBtn = $(this);
		if($(this).val() == "수정" || $(this).val() == "배정"){
		    $(this).closest('tr').find('input:disabled').prop('disabled', false);
		    $(this).val('확인');
			return;
		} else if($(this).val() == '확인'){
			console.log(typeof $(this).closest('tr').find('.scPrice input').val());
			console.log(typeof $(this).closest('tr').find('.scGate input').val());
			console.log(typeof $(this).closest('tr').find('.scCheckin input').val());
			
			var splitText = $(this).closest('tr').find('.scBoarding').html().split('-');
			var onePrice = $(this).closest('tr').find('.scPrice input').val();
			
			let oneData = [{
					scGate : $(this).closest('tr').find('.scGate input').val(),
					scCheckin : $(this).closest('tr').find('.scCheckin input').val(),
					scPrice : $(this).closest('tr').find('.scPrice input').val().replace(',',''),
					scAirline : $(this).closest('tr').find('.scAirline').html(),
					scBoarding : splitText[0].trim(),
					scArrived : splitText[1].trim()
			}];
			
			console.log('oneData :: ' + JSON.stringify(oneData));
			
	        Swal.fire({
	            title: '정보 변경', // 제목 변경
	            text: '항공 정보를 수정하시겠습니까?',
	            icon: 'warning', // 아이콘 설정
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
	                $.ajax({
	                    url: '/management/airport/schedule/commit', // 삭제 API 엔드포인트
	                    type : 'post',
	                    data: JSON.stringify(oneData),
	                    contentType : 'application/json; charset=utf-8',
	                    success: function(res) {
	                        Swal.fire(
	                            '정보 처리 완료!',
	                            '해당 항공편의 정보 처리가 완료되었습니다.',
	                            'success'
	                        ).then(() => {
	                            // SweetAlert2의 성공 메시지 후에 delForm을 제출
	                            if(onePrice == 0){
	                            	signBtn.val('배정');	
	                            } else {
	                            	signBtn.val('수정');
	                            }
	                            
	                            signBtn.closest('tr').find('.scPrice input').prop('disabled', true);
	                            signBtn.closest('tr').find('.scGate input').prop('disabled', true);
	                            signBtn.closest('tr').find('.scCheckin input').prop('disabled', true);
	                        });
	                    },
	                    error: function(xhr, status, error) {
	                        // 오류가 발생했을 때
	                        Swal.fire(
	                            '오류!',
	                            '정보 수정에 실패했습니다.',
	                            'error'
	                        );
	                    }
	                });
	            }
	        });
		}
	});
	
	
	emptyCommit.on('click',function(){
		
		
		
	});
	
	autoCommit.on('click', function() {
	    // 모든 <tr> 요소를 반복
		    if(autoCommit.val() === "자동배정"){
		    	$('tr').each(function() {	        
		    		var distance = $(this).data('distance');
			        var calculatedPrice;
			        if (distance < 2000) {
			            calculatedPrice = distance * 195;
			        } else if (distance < 3500){
			        	calculatedPrice = distance * 160;	
			        } else if (distance < 6500){
			        	calculatedPrice = distance * 140;
			        } else if (distance < 10000) {
			        	calculatedPrice = distance * 120;
			        } else {
			        	calculatedPrice = distance * 100;
			        } 
			        calculatedPrice = Math.round(Math.ceil(calculatedPrice * (Math.random() * (0.97 - 0.8) + 0.8)) / 100) * 100; 
			        
			        var formattedPrice = new Intl.NumberFormat('ko-KR', {
		             style: 'decimal',
		             currency: 'KRW'
		         }).format(calculatedPrice);
			        
			        $(this).find('.realNum').val(calculatedPrice);
			        $(this).find('.scPrice input').val(formattedPrice);
			    
			        var gateNum = getRandomNumber(20);
			        
			        $(this).find('.scGate input').val(gateNum);
					var checkInNum = getRandomNumber(8);
					$(this).find('.scCheckin input').val(checkInNum);

			        $('.autoCommit').val('데이터 전체수정');
		    	});
		    } else {
		    	let commitData = [];
		    	
		    	$('tr').each(function(){
		    		
		    	let data = {
		    			scAirline 	: $(this).find('.scAirline').html(),
		   				scBoarding 	: $(this).data('scboarding'),
		   				scArrived 	: $(this).data('scarrived'),	
		   				scPrice 	: $(this).find('.realNum').val(),
		   				scCheckin 	: $(this).find('.scCheckin input').val(),
	    				scGate 		: $(this).find('.scGate input').val()
		    		}
		    		commitData.push(data);
		    	});
		    	
		    	commitData.shift();
		    	console.log(commitData);
		       	$.ajax({
		       		type : 'post',
		       		url : '/management/airport/schedule/commit',
		       		data : JSON.stringify(commitData),
		       		contentType : 'application/json; charset=utf-8',
		       		success : function(res){
		       			if(res == "SUCCESS"){
		       			 Swal.fire(
		                         '배정 완료!',
		                         '항공정보 자동배정이 완료되었습니다.',
		                         'success'
		                     ).then(() => {
		                     });

		       				$('.autoCommit').val('자동배정');
		       			} else {
		       				alert('수정 실패');
		       			}
		       		}
		       		
		       	});
		    }
	    
	});

	function assignPrice(){
		 var distance = $(this).data('distance');
	        var calculatedPrice;
	        if (distance < 2000) {
	            calculatedPrice = distance * 195;
	        } else if (distance < 3500){
	        	calculatedPrice = distance * 160;	
	        } else if (distance < 6500){
	        	calculatedPrice = distance * 140;
	        } else if (distance < 10000) {
	        	calculatedPrice = distance * 120;
	        } else {
	        	calculatedPrice = distance * 100;
	        } 
	        calculatedPrice = Math.round(Math.ceil(calculatedPrice * (Math.random() * (0.97 - 0.8) + 0.8)) / 100) * 100; 
	        
	        var formattedPrice = new Intl.NumberFormat('ko-KR', {
             style: 'currency',
             currency: 'KRW'
         }).format(calculatedPrice);
	        
	        $(this).find('.realNum').val(calculatedPrice);
	        $(this).find('.scPrice input').val(formattedPrice);
	    
	        var gateNum = getRandomNumber(20);
	        
	        $(this).find('.scGate input').val(gateNum);
			var checkInNum = getRandomNumber(8);
			$(this).find('.scCheckin input').val(checkInNum);

	}
	
	
	function parseFormattedPrice(formattedPrice) {
	    // 통화 기호 및 쉼표 제거 후 숫자로 변환
	    return Number(formattedPrice.replace(/[^\d.-]/g, ''));
	}
	
	function getRandomNumber(ranNum) {
        // 랜덤 숫자 생성
        var randomNumber = Math.floor(Math.random() * ranNum) + 1;
        return randomNumber;
    }
	
	$('#min').on('keyup',function(){
		console.log('change');
	});
	

	
	$('#chk').on('click',function(){
		var hrs = $('#hrs').val();
		console.log('h1rs Type :: ' + typeof parseInt(hrs));
		console.log('static Type :: ' + typeof 13);
		console.log('min1s Type :: ' + typeof $('#min').val());
		
	});
	
	
	function enterKey(event) {
        if($('#arrive').val().trim() == "") {
            return false;
        }
        if (event.keyCode == 13) {
        	console.log('ready');
            find();
        }
    }
	
	$('#test').on('click', function() {
		find();
	});
	
	$(this).on('click', '.send' ,function(){
		let cosData = $(this).data('airdata');
		console.log('JSONcosData :: '+JSON.stringify(cosData));
		
		$.ajax({
			type : 'post',
			url : '/management/airport/insertData',
			data : JSON.stringify(cosData),
			dataType : 'json',
			contentType : 'application/json; charset=utf-8',
			success : function(res){
				console.log(res);
				$(this).attr('disabled', true);
			}
			
		});
		
	});
	
	function find() {
	
			resultData = [];
			var data = {
					scBoarding : $('#boarding').val(), // 출발공항
					scArrived : $('#arrive').val(), // 도착공항
					pageNo : $('#pageNo').val()
			}
				$.ajax({
					url : '/management/airport/getData',
					type : 'post',
					data : JSON.stringify(data),
					contentType : 'application/json',
					success : function(res) {
						$('#data').empty();
						it = JSON.parse(res);
						its = it.response.body.items.item;
						if (it.response.body.totalCount > $('#pageNo').val() * 10) {
							for (var i = 0; i < its.length; i++) {
								let weekData = {
									Mon: its[i].internationalMon,
								    Tue: its[i].internationalTue,
								    Wed: its[i].internationalWed,
								    Thu: its[i].internationalThu,
								    Fri: its[i].internationalFri,
								    Sat: its[i].internationalSat,
								    Sun: its[i].internationalSun
								};
								let startDate = its[i].internationalStdate.substr(0,10);
								let endDate = its[i].internationalEddate.substr(0,10);
								
					            let scAirfln = its[i].internationalNum;
					            let scAirline = its[i].airlineEnglish;
					            let scBoarding = its[i].airportCode;
					            let scArrived = its[i].cityCode;
					            var ttat = its[i].internationalTime;
					            let scStdate = String(ttat).substr(0,2) + ":" + String(ttat).substr(2);
								
					            
								let datas = getDatesForYDays(weekData, startDate, endDate, scAirfln, scAirline, scBoarding, scArrived, scStdate);
								if(datas == "fail"){
									
								} else {

									var ttHtml = "<input type='button' class='send' value='send' data-airdata='" + JSON.stringify(datas) + "'/>";
									$('#data').append(ttHtml);
								}
								
								
							}
						} else {
							$('#data').html("<tr><td colspan='7'>데이터가 존재하지 않습니다.</td></tr>");
						}
						console.log('res :: ' + resultData);
						$('#dataLength').html('데이터 개수 :: ' + it.response.body.totalCount + '개');
						
					},
				});
			
	}
	function getDatesForYDays(weekData, startDate, endDate, scAirfln, scAirline, scBoarding, scArrived, scStdate) {
	    let today = new Date();
	    let end = new Date(endDate);
	    if (today > end) {
	        console.log("오늘 날짜가 endDate보다 큽니다. 작업을 중단합니다.");
	        return "fail";
	    } else {
	        let start = new Date(startDate);
	        const daysOfWeek = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
	        let result = []; // 초기화 추가
	        while (start <= end) {
	            let dayName = daysOfWeek[start.getDay()];
	            if (weekData[dayName] === 'Y') {
	                let formattedDate = start.toISOString().split('T')[0].replace(/-/g, '/');
	                
	                let scStdateTime = new Date(formattedDate + ' ' + scStdate);
	                let scStdTime = new Date(scStdateTime);
	                
	                // 시간더하기
	                scStdTime.setHours(scStdTime.getHours() + parseInt($('#hrs').val()));
	                scStdTime.setMinutes(scStdTime.getMinutes() + parseInt($('#min').val()));
	                
	                let airData = {
	                    scAirfln: scAirfln,
	                    scAirline: scAirline,
	                    scBoarding: scBoarding,
	                    scArrived: scArrived,
	                    scStdate: scStdateTime,
	                    scStd : scStdTime,
	                    
	                };
	                result.push(airData); // JSON 문자열로 합쳐짐
	            }
	            start.setDate(start.getDate() + 1);
	        }
	        return result; // 문자열로 반환
	    }
	}



	
});

</script>
