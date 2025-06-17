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
				<p class="text-primary fs-4 fw-bolder">rounge</p>
				<h1 class="fw-bolder fs-12">라운지</h1>
			</div>
		</div>
	</section>
</div>

<div class="container">
  <div class="row justify-content-center">
    <div class="col-lg-6">
    <div style="height: 50px;"></div>
      <div class="card">
        <div class="px-4 py-3 border-bottom">
          <h3 class="title"><strong>예약자 정보 입력</strong></h3>
        </div>
        <div class="card-body">
        <form action="/customer/reserve/rounge/register" method="post" id="sbForm">
         <input type="hidden" name="rgNo" id="exampleInputText32" class="form-control border-0 ps-2" value="${roungeVO.rgNo }" readonly/>
          <div class="mb-4 row align-items-center">
            <label for="exampleInputText32" class="form-label col-sm-3 col-form-label">라운지</label>
            <div class="col-sm-9">
              <div class="input-group border rounded-1">
                <span class="input-group-text bg-transparent px-6 border-0" id="basic-addon1">
                  <i class="ti ti-building-arch fs-6"></i>
                </span>
                <input type="text" name="rgName" id="exampleInputText32" class="form-control border-0 ps-2" value="${roungeVO.rgName }" readonly/>
              </div>
            </div>
          </div>
          <div class="mb-4 row align-items-center">
            <label for="exampleInputText31" class="form-label col-sm-3 col-form-label">이름</label>
            <div class="col-sm-9">
              <div class="input-group border rounded-1">
                <span class="input-group-text bg-transparent px-6 border-0" id="basic-addon1">
                  <i class="ti ti-user fs-6"></i>
                </span>
                <input type="text" name="rrName" class="form-control border-0 ps-2" id="exampleInputText31" placeholder="이름을 입력하세요." value="${roungeVO.rrName }">
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
                <input type="text" name="rrTel" id="exampleInputText40" class="form-control border-0 ps-2" placeholder="예) 010-0000-0000" value="${roungeVO.rrTel }">
              </div>
            </div>
          </div>
          <div class="mb-4 row align-items-center">
            <label for="exampleInputText33" class="form-label col-sm-3 col-form-label">수량</label>
            <div class="col-sm-9">
              <div class="input-group border rounded-1">
                <span class="input-group-text bg-transparent px-6 border-0" id="basic-addon1">
                  <i class="ti ti-mail fs-6"></i>
                </span>
                <input type="text" name="rrCount" id="exampleInputText32" class="form-control border-0 ps-2" value="${roungeVO.rrCount }" readonly/>
              </div>
            </div>
          </div>
          <hr>
        <div class="mb-2 row align-items-center justify-content-end">
		    <label for="exampleInputText34" class="form-label col-sm-8 col-form-label fs-7 text-end">결제금액 :</label>
		    <div class="col-sm-4 d-flex justify-content-end fw-bold fs-7">
		        <input type="hidden" name="rrCost" id="rrCost" class="form-control border-0 ps-2" value="${roungeVO.rgCost * roungeVO.rrCount}" readonly/>
		        <span id="totalCost">${roungeVO.rgCost * roungeVO.rrCount} 원</span>
		    </div>
		</div>
        </div>
      </div>
           <div class="row">
		    <div class="col text-end">
		        <button type="button" class="btn btn-primary">결제</button>
		        <a href="/customer/reserve/rounge/list" class="btn btn-outline-primary">취소</a>
		    </div>
			</div>
          </form>
          
          <div class="modal fade" id="al-warning-alert1" tabindex="-1" aria-labelledby="vertical-center-modal" aria-hidden="true">
    <div class="modal-dialog modal-sm">
        <div class="modal-content modal-filled bg-warning-subtle">
            <div class="modal-body p-4">
                <div class="text-center text-warning">
                    <i class="ti ti-alert-octagon fs-7"></i>
                    <h4 class="mt-2">Warning</h4>
                    <p class="mt-3">이름을 입력해주세요.</p>
                    <button type="button" class="btn btn-light my-2" data-bs-dismiss="modal">확인</button>
                </div>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
</div>
<div class="modal fade" id="al-warning-alert2" tabindex="-1" aria-labelledby="vertical-center-modal" aria-hidden="true">
    <div class="modal-dialog modal-sm">
        <div class="modal-content modal-filled bg-warning-subtle">
            <div class="modal-body p-4">
                <div class="text-center text-warning">
                    <i class="ti ti-alert-octagon fs-7"></i>
                    <h4 class="mt-2">Warning</h4>
                    <p class="mt-3">휴대폰 번호를 입력해주세요.</p>
                    <button type="button" class="btn btn-light my-2" data-bs-dismiss="modal">확인</button>
                </div>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
</div>
    </div>
  </div>
</div>
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<script>
$(function() {
	var IMP = window.IMP;
    IMP.init("imp15656112");
	var uuid = '${uuid}';
    // 결제금액 계산
    var cost = parseInt('${roungeVO.rgCost}') * parseInt('${roungeVO.rrCount}');
    $('#totalCost').text(cost.toLocaleString() + ' 원');
    function requestPay(name, tel) {
        // 결제창 호출      
        IMP.request_pay(
          {
            // 파라미터 값 설정 
            pg: "kakaopay.TC0ONETIME",
            pay_method: "card",
            merchant_uid: uuid, // 상점 고유 주문번호
            name: name,
            amount: cost,
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


$('.btn-primary').click(function(event) {
    var name = document.querySelector('input[name="rrName"]').value;
    var tel = document.querySelector('input[name="rrTel"]').value;

    if (!name && !tel) {
        $('#al-warning-alert1').modal('show');
        $('#al-warning-alert2').modal('show');
        return false;
    } else if (!name) {
        $('#al-warning-alert1').modal('show');
        return false;
    } else if (!tel) {
        $('#al-warning-alert2').modal('show');
        return false;
    }
    requestPay(name, tel);
    // 모든 필드가 채워졌다면 폼 제출
//     return true; 
});
});

</script>