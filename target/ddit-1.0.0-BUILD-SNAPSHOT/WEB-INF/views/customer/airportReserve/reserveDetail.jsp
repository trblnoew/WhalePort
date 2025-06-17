<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
       .custom-height {
   height: 250px; 
   display: flex;
   align-items: center; 
   justify-content: center; 
} 
 .body-wrapper {
        
        background-image: url('${pageContext.request.contextPath}/resources/assets/images/airport/seat.png'); /* 여기에 배경 이미지의 URL을 입력하세요 */
        background-size: 97%; /* 배경 이미지를 테이블 크기에 맞게 조정 */
        background-repeat: no-repeat; /* 배경 이미지 반복 방지 */
        background-position: center; /* 이미지의 중앙을 테이블 중앙에 맞춤 */
        height : 450px;
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

<div class="col-8 mx-auto" style="margin-top:30px;">
    <!-- start Person Info -->
    <div class="card">
        <div class="card-header text-bg-primary">
            <h4 class="mb-0 text-white txt">출국 좌석 선택</h4>
        </div>
        <div class="row" style="text-align: center;">
            <div class="body-wrapper col-9" style="margin-top:40px;">
                <!-- ///좌석 시작 /// -->
                <table class="table-border" id="seatPage" style="margin: 0 auto;">
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
                <br/><br/><br/><br/><br/><br/>
            </div>
            <div class="card-body col-1 mt-3 mb-3">
          <i class="ti ti-alert-circle"></i><p>선택된 좌석정보</p>
          	<div class="practice">
          	
          	</div>
           </div>
          <div class="text-end"> <!-- 바닥과 오른쪽에 여백 추가 -->
             <form action="/customer/reserve/payment" method="get" id="goPay" style="margin-right: 20px; margin-bottom:20px;">
                 <input type="hidden" id="seatVal" name="seatVal"/>
                 <input type="button" class="btn btn-primary" id="seatSelected" disabled value="좌석 선택"/>    
             </form>
         </div>
      </div>
    </div>
</div>
      <br/><br/><br/><br/><br/><br/>
      
      <div id="practice"></div>
      
      
      
   <!-- ///좌석 끝 /// -->
<script type="text/javascript">
$(function(){
   let onSeat = [];
   var cusCnt = '${planeVO.cusCnt}';
   let scNo = '${planeVO.scNo}';
   let scNo2 = '${planeVO.scNo2}';
   var count = 0;
   console.log('cnt :: ' + cusCnt);
   let loginUserId = '${loginUser}';
   console.log('u1111111se111rIa: '+ loginUserId);
   
   
   if(scNo2 == 0){
      
   }
   
   seat(scNo);
   
   $(document).on('click', '.showSeat', function() {
       // 클릭한 좌석 번호 가져오기
      var seatNum = $(this).closest('.alert').find('.selSeat').text().trim();
       
       // onSeat 배열에서 해당 좌석 번호 제거
       onSeat = onSeat.filter(function(item) {
           return item !== seatNum;
       });

       var rowIndex = seatNum.charCodeAt(0) - 64; // A = 1, B = 2, ...
       var columnIndex = parseInt(seatNum.slice(1), 10) - 1; // 열 인덱스 숫자 변환
      console.log('row :: ' + rowIndex);
      console.log('cols :: ' + columnIndex);
       
       // rowIndex를 0부터 시작하는 인덱스로 변환 (jQuery에서는 0부터 시작)
       if(rowIndex >= 4){
          rowIndex = rowIndex + 1;
       }

       // columnIndex를 0부터 시작하는 인덱스로 변환
       

       // 테이블의 해당 셀을 찾아 배경색 제거 및 클래스 제거
       $("tr").eq(rowIndex).find("td").eq(columnIndex).removeClass("clicked").css("background-color", "");


       // 선택된 좌석 수에 따라 버튼 활성화 상태를 업데이트합1니다
       if(onSeat.length == cusCnt) {
           $('#seatSelected').prop('disabled', false);
       } else {
           $('#seatSelected').prop('disabled', true);
       }
   });


   
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
      
      if($(this).hasClass('clicked')){
         
         $(this).css('background-color','green');
         onSeat.push(seatNum);
         $('.practice').append('<div class="alert customize-alert alert-dismissible text-black text-start alert-light-secondary bg-secondary-subtle fade show remove-close-icon" role="alert">' +
                 '<button type="button" class="btn-close showSeat" data-bs-dismiss="alert" aria-label="Close"></button>' +
                 '<div class="d-flex align-items-center me-3 me-md-0">' +
                '좌석 번호 : <div class="d-flex align-items-center me-3 me-md-0 selSeat">' + seatNum +' </div><br/>' +
                 '</div>' +
             '</div>');   
         
      } else {
         $(this).css('background-color','');
         for(var i = 0 ; i < onSeat.length; i++){
            if(onSeat[i] == seatNum){
               onSeat.splice(i, 1);
               $('.practice .alert').filter(function() {
                   return $(this).find('.selSeat').text().trim() === seatNum;
               }).remove();
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
                       'background-color': '#dadde0',
                       'pointer-events': 'none',
                       'cursor': 'not-allowed'
                        });
                      targetCell.html('<img src="${pageContext.request.contextPath}/resources/assets/images/airport/seatt.png"/>'); 
                  }   
               }
            }
         }
         
      });
   }
   let firstSeat;
   $(this).on('click','#seatSelected',function(){
      let data = [];
      // 출국만
      if(scNo == "0") {
      data = [
         {
            scNo : scNo,
            seat : onSeat,
            cusCnt : cusCnt
         }
            ];
      
      } 
      // 입국만
      else if(scNo2 == "0") {
         data = [
            {
               scNo : scNo,
               seat : onSeat,
               cusCnt : cusCnt
            }
               ];
      } 
      // 입,출국 둘다
      else {
         if($('.txt').html() === '입국 좌석 선택'){
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
         } else {
            $('#seatPage td').css({
                 'background-color': '',
                 'pointer-events': '',
                 'cursor': ''
             });
            $('#seatPage td').empty();
            $('#seatSelected').prop('disabled', true);
            firstSeat = onSeat.slice();
            console.log('firstSeat ::' + firstSeat);
            onSeat.splice(0);
            seat(scNo2);
            $('.practice').empty();
            $('#seatSelected').val('결제하기');
            $('.txt').html('입국 좌석 선택');
            return;
         }
         
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
     
   });
});
</script>
