<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>


<!-- <!-- 상단 바 -->
<!-- <div class="body-wrapper"> -->
<!-- 	<div class="container-fluid"> -->
<!-- 		<div class="card bg-info-subtle shadow-none position-relative overflow-hidden mb-4"> -->
<!-- 			<div class="card-body px-4 py-3"> -->
<!-- 				<div class="row align-items-center"> -->
<!-- 					<div class="col-9"> -->
<!-- 						<h4 class="fw-semibold mb-8">창고 관리</h4> -->
<!-- 						<nav aria-label="breadcrumb"> -->
<!-- 							<ol class="breadcrumb"> -->
<!-- 								<li class="breadcrumb-item"> -->
<!-- 									<a class="text-muted text-decoration-none" href="../main/index.html">Home</a> -->
<!-- 								</li> -->
<!-- 								<li class="breadcrumb-item" aria-current="page">Form Inputs</li> -->
<!-- 							</ol> -->
<!-- 						</nav> -->
<!-- 					</div> -->
<!-- 					<div class="col-3"> -->
<!-- 						<div class="text-center mb-n5"> -->
<!-- 							<img src="../assets/images/breadcrumb/ChatBc.png" alt="modernize-img" class="img-fluid mb-n4" /> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->

<!-- 		<!-- 좌측 창고구역 시 -->
<!-- 		<div class="card w"> -->
<!-- 			<div class="card-body"> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 		<!-- 좌측 창고구역 끝 -->

<!-- 	</div> -->
<!-- </div> -->

<style>
    .warehouseBoxSection {
        width: 100%;
        height: 100%;
    }
    table {
        width: 100%;
        table-layout: fixed;
    }

    #warehouseFirstBox, #warehouseThirdBox {
        width: 30%;
        vertical-align: top;
    }
    
    #warehouseSecondBox {
        width: 40%;
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
</style>


<div class="body-wrapper">
	<div class="container-fluid">
		<div class="card bg-info-subtle shadow-none position-relative overflow-hidden mb-4">
	           <div class="card-body px-4 py-3">
	             <div class="row align-items-center" style="margin-top:20px;">
	               <div class="col-9">
	                 <h4 class="fw-semibold mb-8">물류창고 조회</h4>
	                 <nav aria-label="breadcrumb">
	                   <ol class="breadcrumb">
	                     <li class="breadcrumb-item">
	                       <a class="text-muted text-decoration-none" href="../main/index.html">DashBoard</a>
	                     </li>
	                     <li class="breadcrumb-item" aria-current="page">물류창고 조회</li>
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
														<td class="warehouseSection" id="${warehouse.whNo }" data-ptNo="${warehouse.ptNo }" data-ptName="${warehouse.ptName }" data-endDate="${warehouse.whEnddate }" data-startDate="${warehouse.whStartdate }" data-whYn="${warehouse.whYn }" >
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
					<div class="warehouseBoxSection" id="warehouseBoxSection2" style="display: none">
						<div class="datatables">
							<div class="card">
								<div class="card-body">
									<div class="table-responsive" align="right">
										<table style="width: 100%;">
											<tr>
												<td style="width: 25%;">
													<h3 id="changgoNo"></h3>
												</td>
												<td style="width: 75%;" align="right">
													<p id="endDate"></p>
												</td>
											</tr>
										</table>
				
										<hr />
										
										
										<table id="zeroConfig" class="table table-striped table-bordered text-nowrap align-middle dataTable" aria-describedby="zero_config_info">
											<thead>
												<!-- start row -->
												<tr>
													<th class="stockRow">번호</th>
													<th class="stockRow">상품명</th>
													<th class="stockRow">수량</th>
													<th class="stockRow">단위</th>
													<th class="stockRow">입고일자</th>
													<th class="stockRow">번호</th>
												</tr>
												<!-- end row -->
											</thead>
											<tbody>
											</tbody>
										</table>
										<button class="btn btn-primary" id="addStockFormBtn">재고 등록</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</td>
				
				
				
				<!-- 세 번째 박스 출력 부 -->
				<td id="warehouseThirdBox">
					<div class="warehouseBoxSection" id="warehouseBoxSection3" style="display: none">
						<div class="card">
							<div class="px-4 py-3 border-bottom">
								<h3>재고 상세</h3>
							</div>
							<div class="card-body">
								<div>
									<label class="form-label">상품명</label>
									<input type="text" class="form-control changeData" id="" value="상품명" disabled> 
								</div><br/>
								<div>
									<label class="form-label">수량</label>
									<input type="text" class="form-control changeData" id="" value="수량" disabled> 
								</div><br/>
								<div>
									<label class="form-label">단위</label>
									<input type="text" class="form-control changeData" id="" value="단위" disabled> 
								</div><br/>
								<div>
									<label class="form-label">입고일자</label>
									<input type="text" class="form-control" id="" value="입고일자" disabled> 
								</div>
							</div>
							<div align="right" style="margin-top: -5px;">
								<button class="btn btn-primary" id="editStockFormBtn">수정</button>
								<button class="btn btn-danger" id="delStockBtn">삭제</button>
							</div>
						</div>
					</div>
				</td>
			</tr>
		</table>
	</div>
</div>


<!-- 등록 및 수정 모달창 활성화!! -->
<div class="modal fade" id="editStockModal" tabindex="-1" aria-labelledby="editFaqLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header d-flex align-items-center">
        <div id="editStockLabel" style="display: none">
	        <h4 class="modal-title">재고 수정</h4>
        </div>
	        <div id="addStockLabel" style="display: none">
		        <h4 class="modal-title">재고 등록</h4>
	        </div>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <hr/>
	      
	      <div class="modal-body">
        
        
        <!-- 수정 FORM -->
	      	<input type="hidden" name="whNo" id="addStockwhNo">
	      	<div align="center" id="editStockImgArea" style="display: none;">
            	<img alt="재고이미지" height="150px" style="object-fit: contain;" id="editStockImg" name="wsImage">
            </div>
		    <div class="mb-3">
		        <label for="editStockDetail" class="form-label">이미지</label>
			    <input class="form-control" type="file" id="editFormFile" name="wsImgFile">
		    </div>
		    <div class="mb-3">
		        <label for="editStockName" class="form-label">상품명</label>
		        <input type="text" class="form-control" id="editStockName" name="wsName" required>
		    </div>
		    <div class="mb-3">
		        <label for="editStockQTY" class="form-label">수량</label>
		        <input type="text" class="form-control" id="editStockQTY" name="wsQty" required>
		    </div>
		    <div class="mb-3">
		        <label for="editStockUnit" class="form-label">단위</label>
		        <input type="text" class="form-control" id="editStockUnit" name="wsUnit" required>
		    </div>
		    <div class="mb-3">
		        <label for="editStockDetail" class="form-label">상세설명</label>
		        <textarea class="form-control" id="editStockDetail" name="wsDetail" rows="3" required></textarea>
		    </div>
		    <div class="mb-3">
		        <label for="editStockName" class="form-label">입고일자</label>
		        <div class="form-group">
	              <input type="date" class="form-control" id="editStockDate" name="wsDate" required>
	            </div>
		    </div>
		    <div align="right">
			    <button type="button" class="btn btn-primary" id="addStockBtn" style="display: none">등록</button>
			    <button type="button" class="btn btn-primary" id="editStockBtn" style="display: none">수정</button>
		    </div>
      	  </div>
    </div>
  </div>
</div>

<!-- 접근 권한 모달 -->
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
                닫기
              </button>
            </div>
          </div>
        </div>
        <!-- /.modal-content -->
      </div>
    </div>


<script>
// 	function handleColorTheme(e) {
// 		document.documentElement.setAttribute("data-color-theme", e);
// 	}
</script>


<!-- JSON 데이터를 JavaScript 변수로 전달 -->
<script type="text/javascript">
    var jsonList = ${jsonList};
</script>


<script type="text/javascript">
$(function() {
    var warehouseSection = $(".warehouseSection");
    
    // 재고 수정 Form 버튼
    $("#editStockFormBtn").on("click", function(){
		console.log($("#dataWsNo").text());
		$("#editStockForm").show();
		$("#addStockImgArea").show();
	    $("#addStockBtn").hide();
	    $("#addStockLabel").hide();
	    $("#editStockLabel").show();
	    $("#editStockBtn").show();
	    $('#editStockModal').modal('show');
	    $("#editStockImgArea").show();
	    
	    //재고 삽입
	    $("#addStockwhNo").val($("#dataWsNo").text());
	    $("#editStockImg").attr("src", $("#dataWsImage").text());
	    $("#editStockName").val($("#detailWsName").text());
	    $("#editStockQTY").val($("#detailWsQty").text());
	    $("#editStockUnit").val($("#detailWsUnit").text());
	    $("#editStockDetail").val($("#detailWsDetail").text());
	    $("#editStockDate").val($("#detailWsDate").text());
	    console.log($("#detailWsDate").text())
	    
    });
    
    // 재고 수정 Form => 수정버튼 (수정 최종 버튼)
    $("#editStockBtn").on("click", function(){
    	
    	let whNoName = $("#changgoNo").html();
    	let whNo = whNoName.substring(0, whNoName.indexOf(' '));
    	let wsNo = $("#dataWsNo").text();
    	let wsName = $("#editStockName").val();
    	let wsQty = $("#editStockQTY").val();
    	let wsUnit = $("#editStockUnit").val();
    	let wsDetail = $("#editStockDetail").val();
    	let wsDate = $("#editStockDate").val();
    	let file = $("#editFormFile")[0].files;
    	
    	let formData = new FormData();
    	formData.append("whNo", whNo);
    	formData.append("wsNo", wsNo);
		formData.append("wsName", wsName);
		formData.append("wsQty", wsQty);
		formData.append("wsUnit", wsUnit);
		formData.append("wsDetail", wsDetail);
		formData.append("wsDate", wsDate);
		if (file[0]) {
		    formData.append("wsImgFile", file[0]);
		}

		
		$.ajax({
			url : "/partner/warehouse/editStock",
			type : "post",
			processData : false,
			contentType : false,
			data : formData,
			success : function(data){
				Swal.fire(
                    '수정 완료!',
                    '수정이 완료되었습니다.',
                    'success'
                ).then(() => {
                	// 모달창 닫기
                	$('#editStockModal').modal('hide');
                	// 서버로부터 받은 데이터로 DataTable 업데이트
                    stockDataTable.clear().rows.add(data).draw();
                	// 우측 박스 새로고침
					$("#warehouseBoxSection3").hide();
                });
			},
			error: function(xhr, status, error) {
            	Swal.fire(
                    '오류!',
                    '수정 처리에 실패했습니다.',
                    'error'
                );
            }
		});


    });
    

    $(document).on('hidden.bs.modal', '#editStockModal', function () {
		$(this).find('input[type="text"], textarea, input[type="date"]').val('');
	});
    
    // 재고 삭제!!
    $("#delStockBtn").on("click", function(){
		var wsNo = $("#dataWsNo").text();  // 클릭된 버튼에서 wsNo 가져오기
		var whNoName = $("#changgoNo").html();
		whNo = whNoName.substring(0, whNoName.indexOf(' '));
        var formDataDel = {
        	wsNo : wsNo,
        	whNo : whNo
        };
		Swal.fire({
 		   title: '삭제 처리',
 		   text: '삭제를 진행하시겠습니까?',
 		   icon: 'warning',
 		   
 		   showCancelButton: true, // cancel버튼 보이기. 기본은 원래 없음
 		   confirmButtonText: '확인', // 확인 버튼 텍스트 변경
 		   cancelButtonText: '취소', // 취소 버튼 텍스트 변경
 		   customClass: {
                cancelButton: 'btn btn-outline-primary', // 취소 버튼에 Bootstrap 클래스 추가
                confirmButton: 'btn btn-primary me-2' // 확인 버튼에 Bootstrap 기본 클래스 추가 (선택 사항)
            },
            buttonsStyling: false // SweetAlert2의 기본 버튼 스타일 비활성화
 		   
		}).then(result => {
		   // 만약 Promise리턴을 받으면,
		   if (result.isConfirmed) { // 만약 모달창에서 confirm 버튼을 눌렀다면
		   
			   $.ajax({
		            url: '/partner/warehouse/deleteStock',
		            method: 'POST',
		            data: JSON.stringify(formDataDel),
		            contentType : 'application/json; charset=utf-8',  // 서버로 보낼 데이터 타입
		            success: function(data) {
		            	Swal.fire(
		                    '삭제 처리!',
		                    '삭제가 완료되었습니다.',
		                    'success'
		                ).then(() => {
		                	$("#warehouseBoxSection3").hide();
		                	stockDataTable.clear().rows.add(data).draw();
		                });
		            },
		            error: function(xhr, status, error) {
		            	Swal.fire(
		                        '오류!',
		                        '삭제 처리에 실패했습니다.',
		                        'error'
		                );
		            }
		        });
		   }
		});
    });
    
    
    
    
    
    // 모달창에서 실질적인 재고 등록 => 등록 버튼 클릭 시 재고 Insert 부분
    $("#addStockBtn").on("click", function(){
    	
    	let whNo = $("#addStockwhNo").val();
    	let wsName = $("#editStockName").val();
    	let wsQty = $("#editStockQTY").val();
    	let wsUnit = $("#editStockUnit").val();
    	let wsDetail = $("#editStockDetail").val();
    	let wsDate = $("#editStockDate").val();
    	let file = $("#editFormFile")[0].files;
    	
    	let formData = new FormData();
		formData.append("whNo", whNo);
		formData.append("wsName", wsName);
		formData.append("wsQty", wsQty);
		formData.append("wsUnit", wsUnit);
		formData.append("wsDetail", wsDetail);
		formData.append("wsDate", wsDate);
		formData.append("wsImgFile", file[0]);
		
		$.ajax({
			url : "/partner/warehouse/addStock",
			type : "post",
			processData : false,
			contentType : false,
			data : formData,
			success : function(data){
				Swal.fire(
                    '등록 완료!',
                    '등록이 완료되었습니다.',
                    'success'
                ).then(() => {
                	// 모달창 닫기
                	$('#editStockModal').modal('hide');
                    // 서버로부터 받은 데이터로 DataTable 업데이트
                    stockDataTable.clear().rows.add(data).draw();
                });
			},
			error: function(xhr, status, error) {
            	Swal.fire(
                    '오류!',
                    '등록 처리에 실패했습니다.',
                    'error'
                );
            }
		});
    	
    	
    });
    
    // 재고 등록 버튼 시 모달창 활성화
    $("#addStockFormBtn").on("click", function(){
    	var whNo = $("#changgoNo").html();
		$("#editStockForm").hide();
    	$("#addStockImgArea").hide();
    	$("#addStockwhNo").val(whNo.substring(0, whNo.indexOf(' ')));
	    $("#addStockBtn").show();
	    $("#addStockLabel").show();
	    $("#editStockLabel").hide();
	    $("#editStockBtn").hide();
	    $('#editStockModal').modal('show');
	    $("#editStockImgArea").hide();
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
    
    
    // DataTable을 한 번만 초기화합니다.
    var stockDataTable = $('#zeroConfig').DataTable({
	    layout: {
	        topStart: {
	            buttons: ['copy', 'csv', 'excel']
	        }
	    },
	    autoWidth: false,
	    responsive: false,
	    columns: [
	        {
	            data: null,
	            title: "번호",
	            orderable: false,
	            searchable: false,
	            defaultContent: '',
	        },
	        { data: "wsName", title: "상품명" },
	        { data: "wsQty", title: "수량" },
	        { data: "wsUnit", title: "단위" },
	        { 
	            data: 'wsDate', 
	            title: "입고일자",
	            render: function(data, type, row) {
	                if (data) {
	                    data = data.substring(0, data.indexOf(' '))
	                    return data;
	                } else {
	                    return '';
	                }
	            }
	        },
	        { data: "wsNo", title: "번호" },  
	    ],
	    columnDefs: [
	        { targets: 0, width: "10%", orderable: false }, // '번호' 열
	        { targets: 2, width: "15%" }, // '수량' 열
	        { targets: 3, width: "15%" }, // '단위' 열
	        { targets: 5, visible: false }, // '실질적 번호' 열 숨김
	    ],
	    order: [[1, 'asc']],
	    drawCallback: function(settings) {
	        var api = this.api();
	        api.column(0, { search: 'applied', order: 'applied' }).nodes().each(function(cell, i) {
	            cell.innerHTML = i + 1 + api.page.info().start;
	        });
	    }
	});


    // DataTable 행 클릭 시 상세 정보를 우측에 표시하는 이벤트 핸들러
    $('#zeroConfig tbody').on('click', 'tr', function() {
    	
    	$("#warehouseBoxSection3").show();
    	
        var data = stockDataTable.row(this).data();
        console.log('클릭한 데이터:', data);
        
        // 우측 박스에 상세 정보 표시
        $('#warehouseThirdBox .card-body').html(
        		'<table>' +
                '<tr>' +
                '<div style="display: none;" id="dataWsNo">' + data.wsNo + '</div>' +
                '<div style="display: none;" id="dataWsImage">' + data.wsImage + '</div>' +
                '<div align="center">' +
                '<img alt="재고이미지" src="' + data.wsImage + '" height="230px" style="object-fit: contain;">' +
                '</div><br/>' +
                '<hr/><br/>' +
                '</tr>' +
                '<tr>' +
                    '<td>' +
                        '<h4 class="card-title fw-semibold">상품명</h4>' +
                    '</td>' +
                    '<td>' +
                        '<p id="detailWsName"><strong>' + data.wsName + '</strong><br/>' +
                    '</td>' +
                '</tr>' +
                '<tr>' +
                    '<td>' +
                        '<h4 class="card-title fw-semibold">수량</h4>' +
                    '</td>' +
                    '<td>' +
                        '<p id="detailWsQty"><strong>' + data.wsQty + '</strong></p>' +
                    '</td>' +
                '</tr>' +
                '<tr>' +
                    '<td>' +
                        '<h4 class="card-title fw-semibold">단위</h4>' +
                    '</td>' +
                    '<td>' +
                        '<p id="detailWsUnit"><strong>' + data.wsUnit + '</strong></p>' +
                    '</td>' +
                '</tr>' +
                '<tr>' +
                    '<td>' +
                        '<h4 class="card-title fw-semibold">상세정보</h4>' +
                    '</td>' +
                    '<td>' +
                        '<p id="detailWsDetail"><strong>' + data.wsDetail + '</strong></p>' +
                    '</td>' +
                '</tr>' +
                '<tr>' +
                    '<td>' +
                        '<h4 class="card-title fw-semibold">입고일자</h4>' +
                    '</td>' +
                    '<td>' +
                        '<p id="detailWsDate"><strong>' + data.wsDate.substring(0, data.wsDate.indexOf(' ')) + '</strong></p>' +
                    '</td>' +
                '</tr>' +
            '</table>'
        );
    });

    // 창고 구역 클릭 시 해당 창고의 재고 리스트를 가져오는 AJAX 호출
    warehouseSection.on("click", function() {
    	
    	$("#warehouseBoxSection3").hide();
    	
        var ptNo = $(this).data('ptno');
        var ptName = $(this).data('ptname');
        var endDate = $(this).data('enddate');
        var startDate = $(this).data('startdate');
			// ptNo 로그인시 수정해줘야함
        if(ptName === '대한항공'){
        var whNo = $(this).attr('id');
        
	    	$("#warehouseBoxSection2").show();
	    	$("#changgoNo").html(whNo + " 창고");
	    	$("#endDate").html("계약 기간 : " + startDate + " ~ " + endDate);
        	
	        $.ajax({
	            type: "post",
	            url: "/partner/warehouse/stock",
	            data: JSON.stringify({ whNo: whNo }),
	            contentType: 'application/json; charset=utf-8',
	            dataType: 'json',
	            success: function(data) {
	                console.log("받은 데이터:", data);
	
	                // DataTable에 새로운 데이터 업데이트
	                stockDataTable.clear().rows.add(data).draw();
	            },
	            error: function(jqXHR, textStatus, errorThrown) {
	                console.error("AJAX 에러:", textStatus, errorThrown);
	                alert("정보를 불러오는데 실패하였습니다.");
	            }
	        });
        	
        } else{
        	$("#warningModal").modal('show');
        }
        
    });
});

</script>

