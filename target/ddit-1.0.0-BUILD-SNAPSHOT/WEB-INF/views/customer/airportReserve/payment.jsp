<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en" dir="ltr" data-bs-theme="light"
	data-color-theme="Blue_Theme" data-layout="vertical">
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
				<p class="text-primary fs-4 fw-bolder">airplane</p>
				<h1 class="fw-bolder fs-12">항공권</h1>
			</div>
		</div>
	</section>     
</div>
<div class="col-8 mx-auto" style="margin-top:30px;" >
              <!-- start Person Info -->
              <div class="card">
                <div class="card-header text-bg-primary">
                  <h4 class="mb-0 text-white">예약 정보 입력</h4>
                </div>
                 <form action="/customer/reserve/pay" method="post" id="formId">
                  <div>
                    <div class="card-body">
                      <h4 class="card-title">여권 정보와 동일하게 입력해주세요.</h4>
                      <div class="row pt-3">
                        <div class="col-md-12">
<!--                          <div class="mb-3 form-group col-12"> -->
<%-- 			                <c:forEach begin="1" step="1" end="${planeVO[0].seat.size() }" var="i"> --%>
<%-- 			                    <input type="button" class="form-control btns" data-num="${i }" value="${i }번" required data-validation-required-message="This field is required" /> --%>
<%-- 			                </c:forEach> --%>
<!-- 			            </div> -->
                         <div class="mb-3 form-group col-3">
			                <c:forEach begin="1" step="1" end="${planeVO[0].seat.size() }" var="i">
			                    <input type="button" class="btn waves-effect waves-light bg-primary-subtle text-primary btns" data-num="${i}" value="여권정보 ${i}" style="font-weight: bold;" />
			                </c:forEach>
							<button type="button" class="btn btn-outline-primary w-10 py-10 rounded-2" id="autoValBtn">자동입력</button>
			            </div>
                        </div>
                        <!--/span-->
                        <div class="mb-3 form-group col-12">
			                <label class="form-label">성/이름(국문)
			                    <span class="text-danger">*</span>
			                </label>
			                <div class="controls">
			                    <c:forEach begin="0" step="1" end="${planeVO[0].seat.size() - 1}" var="i">
			                        <input type="text" name="tkVO[${i }].tkKrname" id="tkKrname" class="form-control tkVO${i }" required data-validation-required-message="This field is required" />
			                    </c:forEach>
			                </div>
			            </div>
                        <div class="mb-3 form-group col-6">
			                <label class="form-label">성(영문)
			                    <span class="text-danger">*</span>
			                </label>
			                <div class="controls">
			                    <c:forEach begin="0" step="1" end="${planeVO[0].seat.size() - 1}" var="i">
			                        <input type="text" name="tkVO[${i }].tkEngfirst" id="tkEngfirst" class="form-control tkVO${i }" value="" required data-validation-required-message="This field is required" />
			                    </c:forEach>
			                </div>
			            </div>
                        <!--/span-->
                       <div class="mb-3 form-group col-6">
			                <label class="form-label">이름(영문)
			                    <span class="text-danger">*</span>
			                </label>
			                <div class="controls">
			                    <c:forEach begin="0" step="1" end="${planeVO[0].seat.size() - 1}" var="i">
			                        <input type="text" name="tkVO[${i }].tkLastname" id="tkLastname" class="form-control tkVO${i }" required data-validation-required-message="This field is required" />
			                    </c:forEach>
			                </div>
			            </div>
                      <!--/row-->
                      <div class="mb-3 form-group col-6">
			                <label class="form-label">여권번호
			                    <span class="text-danger">*</span>
			                </label>
			                <div class="controls">
			                    <c:forEach begin="0" step="1" end="${planeVO[0].seat.size() - 1}" var="i">
			                        <input type="text" name="tkVO[${i }].tkPassport" id="tkPassport" class="form-control tkVO${i }" required data-validation-required-message="This field is required" />
			                    </c:forEach>
			                </div>
			            </div>
                        <!--/span-->
                        <div class="mb-3 form-group col-6">
			                <label class="form-label">성별
			                    <span class="text-danger">*</span>
			                </label>
			                <div class="controls">
			                    <c:forEach begin="0" step="1" end="${planeVO[0].seat.size() - 1}" var="i">
			                        <div class="form-check tkVO${i }">
			                            <input class="form-check-input tkVO${i }" type="radio" name="tkVO[${i }].tkGender" id="exampleRadios1" value="M" checked>
			                            <label class="form-check-label tkVO${i }" for="exampleRadios1">
			                                남성
			                            </label>
			                        </div>
			                        <div class="form-check tkVO${i }">
			                            <input class="form-check-input tkVO${i }" type="radio" name="tkVO[${i }].tkGender" id="exampleRadios2" value="W">
			                            <label class="form-check-label tkVO${i }" for="exampleRadios2">
			                                여성
			                            </label>
			                        </div>
			                    </c:forEach>
			                </div>
			            </div>
                        <!--/span-->
                      </div>
                      <!--/row-->
                       <div class="mb-3 form-group col-12">
			                <label class="form-label">휴대폰번호
			                    <span class="text-danger">*</span>
			                </label>
			                <div class="controls">
			                    <c:forEach begin="0" step="1" end="${planeVO[0].seat.size() - 1}" var="i">
			                        <input type="text" name="tkVO[${i }].tkTel" id="tkTel" class="form-control tkVO${i }" required data-validation-required-message="This field is required" />
			                    </c:forEach>
			                </div>
			            </div>
                        <!--/span-->
                        <div class="mb-3 form-group col-12">
			                <label class="form-label">생년월일
			                    <span class="text-danger">*</span>
			                </label>
			                <div class="controls">
			                    <c:forEach begin="0" step="1" end="${planeVO[0].seat.size() - 1}" var="i">
<%-- 			                        <input type="date" max="9999-12-31" name="tkVO[${i }].tkBirth" class="form-control tkVO${i }" required data-validation-required-message="This field is required" /> --%>
			                        <input type="text" name="tkVO[${i }].tkBirth" id="tkBirth" class="form-control tkVO${i }" required data-validation-required-message="This field is required" />
			                    </c:forEach>
			                </div>
			            </div>
                        <!--/span-->
                        <div class="mb-3 form-group col-12">
			                <label class="form-label">이메일
			                    <span class="text-danger">*</span>
			                </label>
			                <div class="controls">
			                    <c:forEach begin="0" step="1" end="${planeVO[0].seat.size() - 1}" var="i">
			                        <input type="text" name="tkVO[${i }].tkEmail" id="tkEmail" class="form-control tkVO${i }" required data-validation-required-message="This field is required" />
			                    </c:forEach>
			                </div>
			            </div>
			            <c:if test="${pVO.size() > 1 }">
			            	<c:set var="pPrice" value="${pVO[1].scPrice }"/>
			            </c:if>
			            <c:set var="realPrice" value="${(pVO[0].scPrice + pPrice) * planeVO[0].seat.size()}"/>
			            
			            <div id="ticketPrice" style="text-align : right; font-size: 30px;"><span id="tkV"><fmt:formatNumber type="number" value="${realPrice }" /></span>원</div>
			            <span class="hiding">
			                <c:forEach var="i" begin="0" end="${pVO.size() - 1 }" step="1">
			                    <c:forEach begin="0" step="1" end="${planeVO[0].seat.size() - 1}" var="j">
			                    	<input type="text" name="tkVO[${j }].tkSetprice" value="${pVO[i].scPrice }" />
			                        <input type="text" name="tkVO[${j }].tkFlight" value="${pVO[i].scNo }" />
			                        <input type="text" name="tkVO[${j }].tkDepart" value="${pVO[i].scBoarding }" />
			                        <input type="text" name="tkVO[${j }].tkDepartdate" value="<fmt:formatDate value="${pVO[i].scStdate }" pattern="yyyy-MM-dd HH:mm:ss"/>" />
			                        <input type="text" name="tkVO[${j }].tkArrival" value="${pVO[i].scArrived}" />
			                        <input type="text" name="tkVO[${j }].tkArridate" value="<fmt:formatDate value="${pVO[i].scStd }" pattern="yyyy-MM-dd HH:mm:ss"/>" />
			                        <input type="text" name="tkVO[${j }].tkSeat" value="${planeVO[i].seat[j] }" />
			                        
			                    </c:forEach>
			                </c:forEach>
			            </span>
                      </div>
                    </div>
                    <div class="form-actions">
                      <div class="card-body border-top text-end">
					    <button type="button" class="btn btn-primary payment">
					        결제
					    </button>
					    <button type="button" class="btn btn-outline-primary mainBtn" onclick="history.back()">
					        이전
					    </button>
<!-- 			                <button type="button" class="btn btn-primary testVal"> -->
<!-- 			                    더미데이터 -->
<!-- 			                </button> -->
						</div>
                  	  </div>
                	</form>
                  </div>
              </div>
              <!-- end Person Info -->


		<div class="modal fade" id="warningModal" tabindex="-1" aria-labelledby="vertical-center-modal" aria-hidden="true">
      <div class="modal-dialog modal-sm">
        <div class="modal-content modal-filled bg-warning-subtle">
          <div class="modal-body p-4">
            <div class="text-center text-warning">
              <i class="ti ti-alert-octagon fs-7"></i>
              <h4 class="mt-2">Warning</h4>
              <p class="mt-3">
             로그인을 완료해주세요.
              </p>
              <button type="button" class="btn btn-light my-2" data-bs-dismiss="modal" onclick="location.href='/customer/login'">
                	이동
              </button>
            </div>
          </div>
        </div>
        </div>
        </div>
        
        
</div>
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<script type="text/javascript">
$(function(){
    var len = parseInt("${planeVO[0].seat.size()}"); // seat 크기
    console.log('총 seat 크기1: ' + len);
	$('.hiding').hide();
	
	let loginUser = '${loginUser}';
	console.log('user :: ' + loginUser);
	if(loginUser == ""){
		$('#warningModal').modal('show');
	}
	
    // 초기 설정: 모든 tkVO input 숨기기
    for (var i = 0; i < len; i++) {
    	if(i == 0){
    		$('.tkVO' + i).show();	
    	} else {
    		$('.tkVO' + i).hide();
    	}
        
    }
    
    // 버튼 클릭 이벤트 설정
    $(this).on('click', '.btns', function() {
    	var me = $(this);
        var num = $(this).data('num') - 1; // 클릭된 버튼의 번호
        for(var i = 0 ; i < $('.btns').length ; i++){
        	
        	if($('.btns').eq(i).data('num') == $(this).data('num')){
        		$('.btns').eq(i).addClass('active');
        	} else {
        		$('.btns').eq(i).removeClass('active');
        	}
        	
        }
        
        // 모든 tkVO input 숨기고 클릭된 번호의 input만 표시
        for (var i = 0; i < len; i++) {
            if (i === num) {
                $('.tkVO' + i).show();
                
            } else {
                $('.tkVO' + i).hide();
                
            }
        }
    });
	$('.payment').on('click',function(){
		for(var i = 0; i < $('input').length; i++){
			if($('input').eq(i).val().trim() == ""){
				alert('정보 기입을 정확히 부탁드립니다.');
				return false;
			}
		}
		requestPay();
		
	});
	$('.testVal').on('click',function(){
	});
	// 자동 입력 버튼 - 최종 프로젝트를 위한
	$("#autoValBtn").on("click", function(){
		$("#tkEngfirst").val("KIM");         
        $("#tkLastname").val("YEJI");           
        $("#tkPassport").val("A12312313");    
        $("#tkTel").val("010-1234-1234");   
        $("#tkBirth").val("1988-07-01");   
        $("#tkEmail").val("qwe@naver.com"); 
        $("#tkKrname").val("김예지"); 
	});
	function requestPay() {
		var uuid = '${uuid}';

		var IMP = window.IMP;
	    IMP.init("imp15656112");
        // 결제창 호출      
        IMP.request_pay(
          {
            pg: "kakaopay.TC0ONETIME",
            pay_method: "card",
            merchant_uid: uuid, // 상점 고유 주문번호
            name: 'WhalePort',
            amount: $('#tkV').html(),
            buyer_email: "good@portone.io",
            buyer_name: "난데요",
            buyer_tel: "010-3573-7532",
            buyer_addr: "서울특별시 강남구 삼성동",
            buyer_postcode: "123-456",
          },
          function (rsp) {
        	  if (rsp.success) {
        		  Swal.fire(
                          '결제 완료!',
                          '항공권 예매가 완료되었습니다.',
                          'success'
                      ).then(() => {
                          // SweetAlert2의 성공 메시지 후에 Form을 제출
                    	  $('#formId').submit();
                      });
        		  		  
        	    } else {
        	    	Swal.fire(
                            '오류!',
                            '등록 처리에 실패했습니다.',
                            'error'
                        );
        	    }
          }
        );        
	}
});
</script>
</html>