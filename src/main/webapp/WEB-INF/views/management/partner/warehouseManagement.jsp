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
    .badge{
    	cursor: pointer;
    }
</style>


<div class="body-wrapper">
	<div class="container-fluid">
    	<!-- 상단 카드 시작-->
        <div class="card bg-info-subtle shadow-none position-relative overflow-hidden mb-4">
           <div class="card-body px-4 py-3">
             <div class="row align-items-center" style="margin-top:20px;">
               <div class="col-9">
                 <h4 class="fw-semibold mb-8">물류창고 관리</h4>
                 <nav aria-label="breadcrumb">
                   <ol class="breadcrumb">
                     <li class="breadcrumb-item">
                       <a class="text-muted text-decoration-none" href="../main/index.html">DashBoard</a>
                     </li>
                     <li class="breadcrumb-item" aria-current="page">물류창고 관리</li>
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
															<c:if test="${not empty warehouse.ptNo}">
														        data-ptNo="${warehouse.ptNo }"
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
							<div class="card-body" style="">
								<h3>신청 현황</h3>
								<button type="button" class="btn btn-secondary whSectionBtn" id="whASectionBtn">A 구역</button>
								<button type="button" class="btn btn-secondary whSectionBtn" id="whBSectionBtn">B 구역</button>
								<button type="button" class="btn btn-secondary whSectionBtn" id="whCSectionBtn">C 구역</button>
								<button type="button" class="btn btn-secondary whSectionBtn" id="whDSectionBtn">D 구역</button>
								<button type="button" class="btn btn-secondary whSectionBtn" id="whESectionBtn">E 구역</button>
								<button type="button" class="btn btn-secondary whSectionBtn" id="whFSectionBtn">F 구역</button>
								<button type="button" class="btn btn-secondary whSectionBtn" id="whGSectionBtn">G 구역</button>
								<button type="button" class="btn btn-secondary whSectionBtn" id="whHSectionBtn">H 구역</button>
								<button type="button" class="btn btn-secondary whSectionBtn" id="whISectionBtn">I 구역</button>
								<button type="button" class="btn btn-outline-danger whSectionBtn" id="rejectedListBtn">반려 내역</button>

								<hr/>
								<table class="table text-nowrap mb-0 align-middle" id="whSubState">
									<thead class="text-dark fs-4">
										<tr align="center">
											<th>창고번호</th>
											<th>업체명</th>
											<th>계약 시작일</th>
											<th>계약 종료일</th>
											<th>상태</th>
										</tr>
									</thead>
									<tbody>
									<c:forEach items="${warehouseVO }" var="whList">
										<tr  class="warehouse-row" data-section="${fn:substring(whList.whNo, 0, 1)}" data-status="${whList.whYn}" align="center">
											<td>
												<p class="mb-0 fw-normal fs-4">${whList.whNo }</p>
											</td>
											<c:choose>
												<c:when test="${whList.ptNo eq 0 }">
													<td colspan="4" align="center">
														<span style="font-weight:bold;">미사용 창고</span>
													</td>
												</c:when>
												<c:otherwise>
													<td>
														${whList.ptName}
													</td>
												</c:otherwise>
											</c:choose>
											<c:choose>
												<c:when test="${whList.whYn eq 'Y'}">
													<td>
														<p class="mb-0 fw-normal fs-4">${fn:substring(whList.whStartdate, 0, 10)}</p>
													</td>
													<td>
														<p class="mb-0 fw-normal fs-4">${fn:substring(whList.whEnddate, 0, 10)}</p>
													</td>
													<td>			
														<span class="badge bg-primary-subtle text-primary">승인 완료</span>
													</td>
												</c:when>
												<c:when test="${whList.whYn eq 'N' }">
													<td>
														<p class="mb-0 fw-normal fs-4">${fn:substring(whList.whStartdate, 0, 10)}</p>
													</td>
													<td>
														<p class="mb-0 fw-normal fs-4">${fn:substring(whList.whEnddate, 0, 10)}</p>
													</td>
													<td>			
														<span class="badge bg-danger-subtle text-danger rejectResonBtn">승인 반려</span>
													</td>
												</c:when>
												<c:when test="${whList.whYn eq 'D' }">
													<td>
														<p class="mb-0 fw-normal fs-4">${fn:substring(whList.whStartdate, 0, 10)}</p>
													</td>
													<td>
														<p class="mb-0 fw-normal fs-4">${fn:substring(whList.whEnddate, 0, 10)}</p>
													</td>
													<td>			
														<span class="badge bg-warning-subtle text-warning waitingApprove" data-whNo='${whList.whNo }'>승인 대기</span>
													</td>
												</c:when>
												<c:otherwise>
													
												</c:otherwise>
											</c:choose>
										</tr>
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



<!-- 거절 사유 모달 띄우기 -->
<div id="rejectReson" class="modal fade" tabindex="-1" aria-labelledby="bs-example-modal-md" aria-hidden="true">
  <div class="modal-dialog modal-dialog-scrollable modal-lg">
    <div class="modal-content">
      <div class="modal-header d-flex align-items-center">
        <h4 class="modal-title" id="myModalLabel">
        </h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <h4>
          반려 사유
        </h4>
        <p>
          Aenean lacinia bibendum nulla sed consectetur.
          Praesent commodo cursus magna, vel scelerisque
          nisl consectetur et. Donec sed odio dui. Donec
          ullamcorper nulla non metus auctor fringilla.
        </p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn bg-danger-subtle text-danger  waves-effect" data-bs-dismiss="modal">
          Close
        </button>
      </div>
    </div>
    <!-- /.modal-content -->
  </div>
  <!-- /.modal-dialog -->
</div>


<!-- 승인/거절 모달 -->
<div id="approveModal" class="modal fade" tabindex="-1" aria-labelledby="bs-example-modal-md" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-md">
    <div class="modal-content">
      <div class="modal-header d-flex align-items-center">
        <h4 class="modal-title" id="myModalLabel">
        </h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body" id="questionApprove">
        <h4 align="center">
          승인하시겠습니까?
        </h4>
      </div>
<!--       반려 시작 -->
<!--       <div class="modal-body" id="rejectReasonForm"> -->
<!--       	<div style="display: flex;"> -->
<!-- 	      <h4> -->
<!-- 	        반려 사유를 작성해주세요 -->
<!-- 	      </h4> -->
<!-- 		      <button class="btn btn-outline-primary" id="rejectReasonAutoBtn" style="margin-left: 12px;">자동입력</button> -->
<!--       	</div> -->
<!-- 	      <br/> -->
<!-- 	      <textarea class="form-control" id="rejectReason" name="rejectReason" rows="10" required></textarea> -->
<!-- 	      <input type="hidden" id="rejectWhNo" /> -->
<!--       </div> -->
<!--       반려 끝 -->
<!-- 반려 START -->
            <div class="modal-body mx-3" id="rejectReasonForm" style="height: 500px;"> <!-- 높이를 고정 -->
                <div class="text-center">
                    <a href="https://example.com" class="text-success">
                        <img src="${pageContext.request.contextPath }/resources/assets/images/logos/whale-favi.png" class="img-fluid" alt="modernize-img" style="width: 50px; height: auto;" />
                    </a>
                </div>
               	<button class="btn btn-outline-primary" id="rejectReasonAutoBtn">자동입력</button>
			    <div>
			        <label for="inGoal" class="form-label" style="font-size: 1.0rem;">반려사유</label>
		        	<textarea class="form-control" id="rejectReason" name="rejectReason" rows="15" required></textarea>
		        	<input type="hidden" id="rejectWhNo" />
			    </div>
            </div>
<!-- 반려 END -->
      <div class="modal-footer justify-content-center">
        <button type="button" id="approveBtn" class="btn btn-primary" style="margin: 10px;">승인</button>
        <button type="button" id="rejectBtnForm" class="btn btn-danger" style="margin: 10px;">반려</button>
        <button type="button" id="rejectBtn" class="btn btn-primary mb-2">등록</button>
      </div>
    </div>
    <!-- /.modal-content -->
  </div>
  <!-- /.modal-dialog -->
</div>





<script type="text/javascript">
$(function() {
	
	$("#rejectReasonAutoBtn").on("click", function(){
	    $("#rejectReason").html(`안녕하세요, 신청하신 창고 구역 예약 건에 대해 안내드립니다. 
	    		
입점업체의 물류 일정을 검토한 결과, 지정된 창고 구역에 대한 사용 가능 날짜가 시스템의 기준 일정과 일치하지 않는 점이 확인되었습니다. 이로 인해 원활한 운영과 관리 절차에 차질이 발생할 수 있어 부득이하게 반려하게 되었습니다.
	        
더 나은 서비스 제공을 위해 해당 구역의 예약 일정을 조정하시거나, 대체 가능한 창고 구역의 일정 조율을 부탁드립니다. 세부적인 일정 및 기타 문의사항이 있으시면 언제든지 고객지원센터로 연락해 주시기 바랍니다.
	        
불편을 드려 죄송하며, 신속하고 효율적인 처리를 위해 노력하겠습니다. 감사합니다.`);
	});

	
	// 클릭 시 창고 상세내역 확인(승인 대기 => 승인/거절 || 승인 완료 => 상세내역 확인)


	
	// 승인대기 => 승인 버튼 클릭 이벤트
	$("#approveBtn").on("click", function(){
		var whNo = $("#rejectWhNo").val();
		var approveData = {
				whNo : whNo
		}
		
		$.ajax({
			url : '/management/partner/warehouse/approve',
			method: 'post',
			data : JSON.stringify(approveData),
			contentType : 'application/json; charset=utf-8',
			success: function(warehouseListVO){
				Swal.fire(
	                    '승인 완료!',
	                    '승인이 완료되었습니다.',
	                    'success'
	                ).then(() => {
	                	location.reload();
	                });
			},
			error: function(xhr, status, error) {
            	Swal.fire(
                        '오류!',
                        '등록 처리에 실패했습니다.',
                        'error'
                );
            }
		})
		
	});
	
	// 승인대기 => 반려 버튼 => 등록버튼 클릭 시 이벤트
	$("#rejectBtn").on("click", function(){
		var whReject = $("#rejectReason").val();
		var whNo = $("#rejectWhNo").val();
		var rejectData = {
				whReject : whReject,
				whNo : whNo
		}
		
		$.ajax({
			url : '/management/partner/warehouse/addReject',
			method: 'post',
			data : JSON.stringify(rejectData),
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
                        '등록 처리에 실패했습니다.',
                        'error'
                );
            }
		})
		
	});
	
	// 첫 반려버튼 클릭
	$("#rejectBtnForm").on("click", function(){
		$("#questionApprove").hide();
		$("#approveBtn").hide();
		$("#rejectBtnForm").hide();
		$("#rejectBtn").show();
		$("#rejectReasonForm").show();
	});
	
	// 버튼 클릭 시 해당 구역 창고만 표시 또는 반려 내역 표시
	$('.whSectionBtn').on('click', function() {
        var buttonId = $(this).attr('id');

        if (buttonId === 'rejectedListBtn') {
            // 모든 행 숨기기
            $('.warehouse-row').hide();

            // data-status가 'N'인 행만 표시 (승인 반려)
            $('.warehouse-row[data-status="N"]').show();
        } else {
            var sectionLetter = buttonId.replace('wh', '').replace('SectionBtn', '');

            // 모든 행 숨기기
            $('.warehouse-row').hide();

            // 선택된 구역의 행만 표시
            $('.warehouse-row').each(function() {
                var section = $(this).data('section');
                if (section === sectionLetter) {
                    $(this).show();
                }
            });
        }
    });
	
	
	// 승인 대기 버튼(모달창 활성화)
	$(".waitingApprove").on("click", function(){
		var whNo = $(this).data('whno');
		$("#approveModal").modal('show');
		$("#rejectBtn").hide();
		$("#rejectReasonForm").hide();
		$("#questionApprove").show();
		$("#approveBtn").show();
		$("#rejectBtnForm").show();
		$("#rejectWhNo").val(whNo);
		console.log(whNo);
		
	});
	
	// 승인 반려 사유 확인 버튼(모달창 활성화)
	$(".rejectResonBtn").on("click", function(){
		$("#rejectReson").modal('show');
	});
	
	
    // 색깔부여하는 코드 => 로그인 기능 구연 시 수정해야함
    $('.warehouseSection').each(function() {
        var ptNo = $(this).data('ptno'); 
        var whYn = $(this).data('whyn');

        if(whYn === 'D'){
        	$(this).css("background-color", "#F7BE81");
        }else if (ptNo != 0) {
            $(this).css("background-color", "lightgray"); 
        }
    });
});
    
</script>

