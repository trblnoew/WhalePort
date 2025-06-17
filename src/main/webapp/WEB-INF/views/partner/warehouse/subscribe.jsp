<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>



<style>
    .warehouseBoxSection {
        width: 100%;
        height: 100%;
    }
    table {
        width: 100%;
        table-layout: fixed;
    }

    #warehouseFirstBox{
        width: 30%;
        vertical-align: top;
    }
    
    #warehouseSecondBox {
        width: 70%;
        vertical-align: top;
    }
    .warehouseSection{
    	text-align: center;
    	height: 22px;
    }
    #partnerWarehouseMap{
    	border-spacing: 5px;
    }
    #partnerWarehouseMap td{
    	cursor: pointer;
    	border: 1px solid gray;
    	-webkit-user-select: none;
		-moz-user-select: none;
		-ms-use-select: none;
		user-select: none;
    }
    button{
    	margin-right: 10px;
    	margin-bottom: 12px;
    }
    .spacer{
    	height: 18px;
    }
    #zeroConfig{
    	margin-top: 10px;
    }
    .warehouseSection:hover{
    	background-color: gray;
    }
    .rejectReasonBoxBtn{
    	cursor: pointer;
    }
</style>


<div class="body-wrapper">
	<div class="container-fluid">
		<div class="card bg-info-subtle shadow-none position-relative overflow-hidden mb-4">
	           <div class="card-body px-4 py-3">
	             <div class="row align-items-center" style="margin-top:20px;">
	               <div class="col-9">
	                 <h4 class="fw-semibold mb-8">물류창고 신청</h4>
	                 <nav aria-label="breadcrumb">
	                   <ol class="breadcrumb">
	                     <li class="breadcrumb-item">
	                       <a class="text-muted text-decoration-none" href="../main/index.html">DashBoard</a>
	                     </li>
	                     <li class="breadcrumb-item" aria-current="page">물류창고 신청</li>
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
		
		<table id="partnerWarehouseBoxes">
			<tr>
				<!-- 첫 번째 박스 출력 부 -->
				<td id="warehouseFirstBox">
					<div class="warehouseBoxSection" id="warehouseBoxSection1">
						<div class="card">
							<div class="card-body">
							<table style="width: 100%;">
											<tr>
												<td style="width: 50%;">
													<h3>창고 도식화</h3>
												</td>
												<td align="right">
												</td>
											</tr>
										</table>
				
										<hr />
								<table>
									<tr>
										<td>
											<!-- 창고 도식화 -->
											<table id="partnerWarehouseMap">
												<tr>
												<c:forEach items="${warehouseVO }" var="warehouse" varStatus="no">
														<td class="warehouseSection" id="${warehouse.whNo }" data-endDate="${warehouse.whEnddate }" data-startDate="${warehouse.whStartdate }"  data-whYn="${warehouse.whYn }" 
															<c:if test="${not empty warehouse.ptName}">
														        data-ptName="${warehouse.ptName }"
														    </c:if>
														>
															${warehouse.whNo }
														</td>
													<c:if test="${no.index % 6 == 5  }">
													</tr>
														<c:if test="${no.index % 12 == 11  }">
															<tr>
																<td colspan="6" class="spacer"></td>
															</tr>
														</c:if>
													<tr>
													</c:if>
												</c:forEach>
										  	</table>
										</td>
									</tr>
								</table>
							</div>
						</div>
					</div>
				</td>
				
				
				
				<!-- 두 번째 박스 출력 부 -->
				<td id="warehouseSecondBox">
					<div class="warehouseBoxSection" id="warehouseBoxSection2">
						<div class="card">
							<div class="card-body">
								<h4>사용중인 창고</h4><hr/>
								<table class="table text-nowrap mb-0 align-middle">
									<thead class="text-dark fs-4">
										<tr>
											<th>창고번호</th>
											<th>상태</th>
											<th>계약 시작일</th>
											<th>계약 종료일</th>
										</tr>
									</thead>
									<tbody>
									<c:forEach items="${warehouseVO }" var="whList">
									<c:if test="${whList.ptName eq '대한항공' }">
										<tr>
											<td>
												<p class="mb-0 fw-normal fs-4">${whList.whNo }</p>
											</td>
											<c:choose>
												<c:when test="${whList.whYn eq 'Y'}">
													<td>			
														<span class="badge bg-primary-subtle text-primary">승인 완료</span>
													</td>
													<td>
														<p class="mb-0 fw-normal fs-4">${fn:substring(whList.whStartdate, 0, 10)}</p>
													</td>
													<td>
														<p class="mb-0 fw-normal fs-4">${fn:substring(whList.whEnddate, 0, 10)}</p>
													</td>
												</c:when>
												<c:when test="${whList.whYn eq 'N' }">
													<td>			
														<span class="badge bg-danger-subtle text-danger rejectReasonBoxBtn">승인 반려</span>
													</td>
													<td>
														<p class="mb-0 fw-normal fs-4">${fn:substring(whList.whStartdate, 0, 10)}</p>
													</td>
													<td>
														<p class="mb-0 fw-normal fs-4">${fn:substring(whList.whEnddate, 0, 10)}</p>
													</td>
													<div style="display: none" id="whReject">
														${whList.whReject }
													</div>
												</c:when>
												<c:otherwise>
													<td>
														<span class="badge bg-warning-subtle text-warning">승인 대기</span>
													</td>
													<td>
														<p class="mb-0 fw-normal fs-4">${fn:substring(whList.whStartdate, 0, 10)}</p>
													</td>
													<td>
														<p class="mb-0 fw-normal fs-4">${fn:substring(whList.whEnddate, 0, 10)}</p>
													</td>
												</c:otherwise>
											</c:choose>
										</tr>
									</c:if>
									</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</td>
			</tr>
		</table>
	</div>
</div>

<!-- 물류창고 신청 모달창 -->
<div class="modal fade" id="subscribeWarehouse" tabindex="-1" aria-labelledby="editFaqLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header d-flex align-items-center">
        <div id="subWarehouseLabel">
	        <h4 class="subWarehouseNo"></h4>
        </div>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <hr/>
	      <div class="modal-body">
	  		<input type="hidden" name="ptNo" id="subptNo">
	     	<input type="hidden" name="whNo" id="subwhNo">
		    <div class="mb-3">
		    	<div>
			    	<h4 id="subWhNo"></h4>
		    	</div><br/>
				<label for="editStockName" class="form-label">계약 시작일</label>
				<div class="form-group">
		          <input type="date" class="form-control" id="subStartDate" name="subStartDate" required>
		        </div>
				<label for="editStockName" class="form-label">계약 종료일</label>
				<div class="form-group">
		          <input type="date" class="form-control" id="subEndDate" name="subEndDate" required>
		        </div>
	  	    </div>
	  	    <div align="right">
	  	    	<button type="button" id="whSubscribeBtn" class="btn btn-primary">신청</button>
	  	    </div>
    </div>
  </div>
</div>
</div>




<!-- 접근 권한 모달 // 회색인 부분에 대해서만@!!@ || 하얀 부분은 신청할 때 폼 띄워야하니까 제외-->
    <div class="modal fade" id="warningModal" tabindex="-1" aria-labelledby="vertical-center-modal" aria-hidden="true">
      <div class="modal-dialog modal-sm">
        <div class="modal-content modal-filled bg-warning-subtle">
          <div class="modal-body p-4">
            <div class="text-center text-warning">
              <i class="ti ti-alert-octagon fs-7"></i>
              <h4 class="mt-2">Warning</h4>
              <p class="mt-3">
               접근 권한이 없습니다.
              </p>
              <button type="button" class="btn btn-light my-2" data-bs-dismiss="modal">
                Close
              </button>
            </div>
          </div>
        </div>
        <!-- /.modal-content -->
      </div>
    </div>


<!-- <div id="scheduleRegister" class="modal fade" tabindex="-1" aria-labelledby="bs-example-modal-md" aria-hidden="true"> -->
<!--   <div class="modal-dialog modal-dialog-scrollable modal-lg"> -->
<!--     <div class="modal-content"> -->
<!--       <div class="modal-header d-flex align-items-center"> -->
<!--         <h4 class="modal-title" id="myModalLabel"> -->
<!--         </h4> -->
<!--         <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button> -->
<!--       </div> -->
<!--       <div class="modal-body"> -->
<!--         <h4> -->
<!--           반려 사유 -->
<!--         </h4> -->
<!--         <p id="rejectReason"> -->
          
<!--         </p> -->
<!--       </div> -->
<!--       <div class="modal-footer"> -->
<!--         <button type="button" class="btn bg-danger-subtle text-danger  waves-effect" data-bs-dismiss="modal"> -->
<!--           닫기 -->
<!--         </button> -->
<!--       </div> -->
<!--     </div> -->
<!--     /.modal-content -->
<!--   </div> -->
<!--   <!-- /.modal-dialog --> -->
<!-- </div> -->

<!-- 거절 사유 모달 띄우기 START -->
<div id="rejectReasonBox" class="modal fade" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-dialog-scrollable" style="max-width: 600px;"> <!-- 원하는 너비로 조정 -->
        <div class="modal-content">
            <div class="modal-body" style="height: 550px;"> <!-- 높이를 고정 -->
                <div class="text-center mt-3 mb-4">
                    <a href="https://example.com" class="text-success">
                        <img src="${pageContext.request.contextPath }/resources/assets/images/logos/whale-favi.png" class="img-fluid" alt="modernize-img" style="width: 50px; height: auto;" />
                    </a>
                </div>
				<form action="/management/facility/scheduleRegister" method="post" class="mx-3">
				    <div class="mb-4">
				        <label for="inGoal" class="form-label" style="font-size: 1.0rem;">반려사유</label>
				        <div class="form-control" style="height: 300px; overflow: hidden; text-align: left; background-color: #f8f9fa;">
				        	<p id="rejectReason">    	
				        </div>
				    </div>
				    <div class="text-center">
				        <button type="button" class="btn btn-rounded bg-info-subtle text-info" data-bs-dismiss="modal">닫기</button>
				    </div>
				</form>
            </div>
        </div>
    </div>
</div>
<!-- 거절 사유 모달 띄우기 END -->


<script type="text/javascript">
$(function() {
	
	// 승인 반려 사유 확인 버튼(모달창 활성화)
	$(".rejectReasonBoxBtn").on("click", function(){
		var whReject = $("#whReject").html();
		$("#rejectReasonBox").modal('show');
		$("#rejectReason").html(whReject);
	});
	
	
	// 신청버튼 클릭 시
	$("#whSubscribeBtn").on("click", function(){
		var subStartDate = $("#subStartDate").val();
		var subEndDate = $("#subEndDate").val();
		var ptNo = $("#subptNo").val()
		var whNo = $("#subwhNo").val()
		
		var addData = {
				whStartdate : subStartDate,
				whEnddate : subEndDate,
				ptNo : ptNo,
				whNo : whNo
		}
		
		$.ajax({
			url : '/partner/warehouse/list',
			method: 'post',
			data : JSON.stringify(addData),
			contentType : 'application/json; charset=utf-8',
			success: function(warehouseListVO){
				Swal.fire(
	                    '등록 완료!',
	                    '등록이 완료되었습니다.',
	                    'success'
	                ).then(() => {
	                	location.reload();
	                });
			},
			error: function(xhr, status, error) {
            	Swal.fire(
                        '오류!',
                        '등록 신청에 실패했습니다.',
                        'error'
                );
            }
		});
		
	});
    
	// 빈 창고 구역 클릭
	$('.warehouseSection').on("click", function(){
		var ptNo = $(this).data('ptno');
		var ptName = $(this).data('ptname');
		if(ptName == null){
			var whNo = $(this).attr("id");
			$("#subwhNo").val(whNo);
			// 세션에서 받아온 해당 인원 출력
			$("#subptNo").val('대한항공');
			$('#subscribeWarehouse').modal('show');
			$(".subWarehouseNo").html("창고 신청");
			$("#subWhNo").html(whNo + " 번 창고");
		}
	});
	
    // 색깔부여하는 코드 => 로그인 기능 구연 시 수정해야함
    $('.warehouseSection').each(function() {
    	var ptNo = $(this).data('ptno'); 
        var ptName = $(this).data('ptname'); 
        var whYn = $(this).data('whyn');

        if (ptName === '대한항공' && whYn === 'N') {
            $(this).css("background-color", "orangered");
        } else if (ptName === '대한항공' && whYn === 'D') {
            $(this).css("background-color", "#F7BE81");
        } else if (ptName === '대한항공') {
            $(this).css("background-color", "Yellowgreen"); 
        } else if (ptName) { // ptName이 존재하는 경우
            $(this).css("background-color", "lightgray");
        }
    });
});
    
</script>

