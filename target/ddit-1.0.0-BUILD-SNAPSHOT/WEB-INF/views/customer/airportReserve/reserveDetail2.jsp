<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en" dir="ltr" data-bs-theme="light"
	data-color-theme="Blue_Theme" data-layout="vertical">
<style>

	table td:hover {
    background-color: #f0f8ff; /* 배경색을 연한 파란색으로 변경 */
    border: 1px solid #333; /* 테두리 추가 */
    cursor: pointer; /* 마우스 커서를 포인터로 변경 */
	}
	
	td{
		width : 25px;
		height : 25px;
		background-color : azure;
		border : solid 1px blue; 
		border-radius : 5px;

	}

	
	.table-border{
		border-collapse: separate;
    	border-spacing: 5px;
	}
	
	tbody tr th{
		width : 25px;
		height : 25px;
		text-align : center;
	}
</style>

<div class="main-wrapper overflow-hidden">
	<section class="bg-primary-subtle custom-height">
		<div class="container-fluid">
			<div class="text-center">
				<p class="text-primary fs-4 fw-bolder">airplane</p>
				<h1 class="fw-bolder fs-12">항공권</h1>
			</div>
		</div>
	</section>
</div>
<div class="body-wrapper">
	<!-- ///좌석 시작 /// -->
		<table class="table-border" id="seatPage">
			<thead style="text-align: center;">
				<th></th>
				<c:forEach begin="1" end="18" step="1" var="num">
					<th>${num }</th>
				</c:forEach>
			</thead>
			<tbody>
			<tr>
				<th>A</th>
				<c:forEach begin="1" end="18" step="1" var="num">
					<c:choose>
						<c:when test="${num == 5 }">
							<td style="visibility : hidden;"></td>
						</c:when>
						<c:otherwise>
							<td></td>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</tr>
			<tr>
				<th>B</th>
				<c:forEach begin="1" end="18" step="1" var="num">
					<c:choose>
						<c:when test="${num <= 5 }">
							<td style="visibility : hidden;"></td>
						</c:when>
						<c:otherwise>
							<td></td>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</tr>
			<tr>
				<th>C</th>
				<c:forEach begin="1" end="18" step="1" var="num">
					<c:choose>
						<c:when test="${num == 5 }">
							<td style="visibility : hidden;"></td>
						</c:when>
						<c:otherwise>
							<td></td>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</tr>
			<tr>
				<c:forEach begin="1" end="18" step="1" var="num">
					<th></th>
				</c:forEach>
			</tr>
			<tr>
				<th>D</th>
				<c:forEach begin="1" end="18" step="1" var="num">
					<c:choose>
						<c:when test="${num == 5 }">
							<td style="visibility : hidden;"></td>
						</c:when>
						<c:otherwise>
							<td></td>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</tr>
			<tr>
				<th>E</th>
				<c:forEach begin="1" end="18" step="1" var="num">
					<c:choose>
						<c:when test="${num <= 5 }">
							<td style="visibility : hidden;"></td>
						</c:when>
						<c:otherwise>
							<td></td>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</tr>
			<tr>
				<th>F</th>
				<c:forEach begin="1" end="18" step="1" var="num">
					<c:choose>
						<c:when test="${num == 5 }">
							<td style="visibility : hidden;"></td>
						</c:when>
						<c:otherwise>
							<td></td>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</tr>
			</tbody>
		</table>
		<br/>
		<form action="/customer/reserve/payment" method="get">
			<input type="hidden" id="seatVal" name="seatVal"/>
			<input type="button" class="btn btn-primary" id="seatSelected" disabled value="좌석 선택완료"/>	
		</form>
	<!-- ///좌석 끝 /// -->
</div>
<script type="text/javascript">
$(function(){
	let onSeat = [];
	var cusCnt = '${planeVO.cusCnt}';
	let scNo = '${planeVO.scNo}';
	let scNo2 = '${planeVO.scNo2}';
	if(scNo2 == 0){
		$('#seatSelected').val('submit');
	}
	
	seat(scNo);
	
	$(this).on('click','td',function() {
		$(this).toggleClass('clicked');
		
	    // 클릭한 td의 부모 tr의 인덱스 찾기
	    var rowIndex = $(this).closest('tr').index() + 1;
	    // 클릭한 td의 인덱스 찾기
	    var columnIndex = $(this).closest('td').index();
		if(rowIndex >= 4){
			rowIndex = rowIndex - 1;
		}

		if(columnIndex >= 10){
			columnIndex = "0" + (String)(columnIndex);
		} else {
			columnIndex = "00" + (String)(columnIndex);
		}
	    var seatNum = String.fromCharCode(rowIndex + 64) + columnIndex;
		console.log('seatNum ::: ' + seatNum);
		// 사실 여기까진 아무의미없음
		
		if($(this).hasClass('clicked')){
			
			$(this).css('background-color','green');
			onSeat.push(seatNum);
			
		} else {
			$(this).css('background-color','');
			for(var i = 0 ; i < onSeat.length; i++){
				if(onSeat[i] == seatNum){
					onSeat.splice(i, 1);
					break; 
				}
			}
			
		}
		if(onSeat.length == cusCnt){
			$('#seatSelected').prop('disabled', false);
		} else {
			$('#seatSelected').prop('disabled', true);
		}

	});
	
	function seat(data){

		$.ajax({
			type : 'get',
			url : '/customer/ticketing',
			data : {
				scNo : data
			},
			success : function(exam){
				if(exam.length > 0){
				
					for(var i = 0; i < exam.length ; i++){
						var eng = exam[i].tkSeat.substr(0,1);
						var num = Number(exam[i].tkSeat.substr(1,3));
						var engNum = eng.charCodeAt() - 64;

						// 테이블 요소 가져오기
						let table = $('#seatPage');

						if(eng.charCodeAt() >= 68){
							engNum = engNum + 1 ;
						} 
						let targetCell = table.find('tr').eq(engNum).find('td').eq(num -1);
					
						if (targetCell) {
					    	targetCell.css({			        
					        'background-color': 'red',
					        'pointer-events': 'none',
					        'cursor': 'not-allowed'
					   		});
						}	
					}
				}
			}
			
		});
	}
	let firstSeat;
	$(this).on('click','#seatSelected',function(){
		let data = [];
		if($('#seatSelected').val() == 'submit'){
			console.log('h1');
			if(scNo2 == "0"){
			data = [
				{
					scNo : scNo,
					seat : onSeat,
					cusCnt : cusCnt
				}
					];
			} else {			
			data = [
				{
					scNo : scNo,
					seat : firstSeat,
					cusCnt : cusCnt
				},
				{
					scNo : scNo2,
					seat : onSeat,
					cusCnt : cusCnt
				}
					];
			}
			
			$.ajax({
				type : 'post',
				url : '/customer/reserve/payment',
				data : JSON.stringify(data),
				contentType : 'application/json; charset=utf-8',
				success : function(res){
					window.location.href = "/customer/reserve/payment";
				}
				
			});
// 			$('#seatVal').val(JSON.stringify(data));
// 			$('#seatSelected').attr('type','submit');
			
		} else {
			console.log('h2');
			$('#seatPage td').css({
		        'background-color': '',
		        'pointer-events': '',
		        'cursor': ''
		    });
			$('#seatSelected').prop('disabled', true);
			$('#seatSelected').val('submit');
			firstSeat = onSeat.slice();
			console.log('firstSeat ::' + firstSeat);
			onSeat.splice(0);
			seat(scNo2);
		}
		
	});
});
</script>
</html>