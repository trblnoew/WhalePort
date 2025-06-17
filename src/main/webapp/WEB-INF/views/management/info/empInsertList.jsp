<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<style>
.table th {
	text-align: center;
}

.table td {
	text-align: center;
}
.form-check-input {
    width: 20px; /* 체크박스 너비 */
    height: 20px; /* 체크박스 높이 */
    border: 2px solid #d3d3d3; /* 체크박스 테두리 색상 (연한 회색) */
    border-radius: 4px; /* 체크박스 모서리 둥글게 */
    background-color: #f8f9fa; /* 체크박스 기본 배경색 */
    transition: background-color 0.3s, border-color 0.3s; /* 부드러운 전환 효과 */
}
.table-responsive {
    overflow-x: hidden; /* 가로 스크롤 숨기기 */
}
</style> 
   

   <div class="body-wrapper"> 
			<!-- 선택한 항목이 없을때 모달 -->
			<div class="modal fade" id="warningModal" tabindex="-1" aria-labelledby="vertical-center-modal" aria-hidden="true">
			    <div class="modal-dialog modal-sm">
			      <div class="modal-content modal-filled bg-warning-subtle">
			        <div class="modal-body p-4">
			          <div class="text-center text-warning">
			            <i class="ti ti-alert-octagon fs-7"></i>
			            <h4 class="mt-2">Warning</h4>
			            <p class="mt-3">
			             항목을 선택해주세요.
			            </p>
			            <button type="button" class="btn btn-light my-2" data-bs-dismiss="modal">
			              Close
			            </button>
			          </div>
			        </div>
			      </div>
			  </div>
			</div>
            
            <!-- 반려 Modal -->
			<div class="modal fade" id="rejectContactModal" tabindex="-1" role="dialog" aria-labelledby="rejectContactModalTitle" aria-hidden="true">
			    <div class="modal-dialog modal-dialog-centered" role="document">
			        <div class="modal-content">
			            <div class="modal-header d-flex align-items-center">
			                <h5 class="modal-title">반려</h5>
			                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			            </div>
			            <div class="modal-body">
			                <p>반려 사유를 입력하세요.</p>
			                <textarea class="form-control" id="empReject" name="empReject" rows="3" placeholder="사유를 입력하세요"></textarea>
			            </div>
			            <div class="modal-footer">
			                <button class="btn btn-outline-primary" data-bs-dismiss="modal">취소</button>
			                <button id="rejectBtn" class="btn btn-primary">확인</button>
			            </div>
			        </div>
			    </div>
			</div>
   
   <div class="container-fluid" style="padding-top: calc(var(--bs-gutter-x)* .5);">
           <div class="card bg-info-subtle shadow-none position-relative overflow-hidden mb-4">
            <div class="card-body px-4 py-3">
              <div class="row align-items-center" style="margin-top:20px;">
                <div class="col-9">
                  <h4 class="fw-semibold mb-8">직원 등록 내역 관리</h4>
                  <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                      <li class="breadcrumb-item">
                        <a class="text-muted text-decoration-none" href="../main/index.html">DashBoard</a>
                      </li>
                      <li class="breadcrumb-item" aria-current="page">직원 등록 내역 관리</li>
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
          
     <!-- 상태별 카운트 위젯 시작 -->
     <div class="widget-content searchable-container list mt-5">
    	<form id="filter-form" action="/info/empInsertList" method="get">
			<div class="row d-flex align-items-center justify-content-center g-4">
				<div style="width: 17%" onclick="selectFilter('')" class="filter-card">
			            <div class="card border-bottom border-info card-hover">
			                <div class="card-body p-4" style="height: 125px">
			                <div class="d-flex align-items-center">
			                    <div>
			                        <h4 class="card-title fs-5">${countVO.totalCount }</h4>
			                        <p class="card-subtitle text-info">직원 총원</p>
			                    </div>
			                    <div class="ms-auto">
			                        <span class="text-info display-6">
			                            <i class="ti ti-users"></i>
			                        </span>
			                    </div>
			                </div>
			            </div>
			        </div>
			    </div>
					 <div style="width: 17%" onclick="selectFilter('Y')" class="filter-card">
			            <div class="card border-bottom border-primary card-hover">
			                <div class="card-body p-4" style="height: 125px">
			                <div class="d-flex align-items-center">
			                    <div>
			                        <h4 class="card-title fs-5">${countVO.countY }</h4>
			                        <p class="card-subtitle text-info">승인된 직원</p>
			                    </div>
			                    <div class="ms-auto">
			                        <span class="text-primary display-6">
			                            <span class="badge bg-primary-subtle text-primary" style="font-size: 1rem; padding: 0.5rem 0.5rem;">승인</span>
			                        </span>
			                    </div>
			                </div>
			            </div>
			        </div>
			    </div>
			        <div style="width: 17%" onclick="selectFilter('N')" class="filter-card">
			            <div class="card border-bottom border-success card-hover">
			                <div class="card-body p-4" style="height: 125px">
			                <div class="d-flex align-items-center">
			                    <div>
			                        <h4 class="card-title fs-5">${countVO.countN }</h4>
			                        <p class="card-subtitle text-success">승인 대기 중인<br>직원</p>
			                    </div>
			                    <div class="ms-auto">
			                        <span class="text-success display-6">
			                            <span class="badge bg-success-subtle text-success" style="font-size: 1rem; padding: 0.5rem 0.5rem;">승인대기</span>
			                        </span>
			                    </div>
			                </div>
			            </div>
			        </div>
			    </div>
			        <div style="width: 17%" onclick="selectFilter('R')" class="filter-card">
			            <div class="card border-bottom border-danger card-hover">
			                <div class="card-body p-4" style="height: 125px">
			                <div class="d-flex align-items-center">
			                    <div>
			                        <h4 class="card-title fs-5">${countVO.countR }</h4>
			                        <p class="card-subtitle text-danger">반려된 직원</p>
			                    </div>
			                    <div class="ms-auto">
			                        <span class="text-danger display-6">
			                            <span class="badge bg-danger-subtle text-danger" style="font-size: 1rem; padding: 0.5rem 0.5rem;">반려</span>
			                        </span>
			                    </div>
			                </div>
			            </div>
			        </div>
			    </div>
			        <div style="width: 17%" onclick="selectFilter('X')" class="filter-card">
			            <div class="card border-bottom border-dark card-hover">
			                <div class="card-body p-4" style="height: 125px">
			                <div class="d-flex align-items-center">
			                    <div>
			                        <h4 class="card-title fs-5">${countVO.countX }</h4>
			                        <p class="card-subtitle text-gray">퇴사한 직원</p> 
			                    </div>
			                    <div class="ms-auto">
			                        <span class="text-warning display-6">
			                            <span class="badge text-bg-light" style="color: gray !important; font-size: 1rem; padding: 0.5rem 0.5rem;">퇴사</span>
			                        </span>
			                    </div>
			                </div>
			            </div>
			        </div>
			    </div>
			</div>
			<input type="hidden" name="selectedItem" id="selectedItem" value="">
			</form>			
			<br/>
			<!-- 상태별 카운트 위젯 끝 -->
            <!-- 검색창 시작 -->
			<div class="row justify-content-start">
			    <div class="col-md-6 d-flex justify-content-end align-items-center ms-auto">
			        <form action="/info/empInsertList" method="get" class="w-90 d-flex" id="searchForm">
						<input type="hidden" name="page" id="page"/>
	                	<input type="hidden" name="selectedItem" value="${pagingVO.selectedItem }">				           
			            <select class="form-select me-2" name="searchType" style="width: 160px;">    
			                <option value="all" <c:if test="${searchType eq 'all' }">selected</c:if> >검색 유형 선택</option>
			                <option value="name" <c:if test="${searchType eq 'name' }">selected</c:if> >이름</option>
			                <option value="dept" <c:if test="${searchType eq 'dept' }">selected</c:if> >부서</option>
			                <option value="position" <c:if test="${searchType eq 'position' }">selected</c:if>>직위</option>
			            </select>
		            	<div class="input-group position-relative">
			                <input type="text" class="form-control product-search ps-5 pe-5" id="input-search" name="searchWord" placeholder="Search Contacts..." value="${searchWord}" />
			                <i class="ti ti-search position-absolute top-50 start-0 translate-middle-y fs-6 text-dark ms-3"></i>
			                <button type="submit" class="btn btn-primary" style="padding: 0.25rem 0.5rem;">검색</button>
			            </div>
			        </form>
			    </div>
			 </div>
			<!-- 검색창 끝 -->
			<br/>


             

             <div class="card card-body">
              <div class="table-responsive">
                <!-- <table class="table search-table align-middle text-nowrap"> -->
                <!-- <table class="table table-hover text-nowrap mb-0 align-middle" style="table-layout: fixed;"> -->
                <table class="table table-hover text-nowrap align-middle">
                 <colgroup>
                        <col style="width: 5%;">
                        <col style="width: 5%;">
                        <col style="width: 5%;">
                        <col style="width: 5%;">
                        <col style="width: 5%;">
                        <col style="width: 5%;">
                        <col style="width: 5%;">
                        <col style="width: 5%;">
                    </colgroup>
                  <thead class="header-item">
                    <tr>
                    <th>
                    </th>
                    <th>이름</th>
                    <th>사번</th>
                    <th>입사일</th>
                    <th>부서</th>
                    <th>직위</th>
                    <th>승인여부</th>
                    <th>상세보기</th>
                  </tr></thead>
                  <tbody>
                    <!-- start row -->
                    <c:choose>
                  		<c:when test="${empty pagingVO.dataList }">
                  			<tr>
                  				<td colspan="8">조회하신 게시글이 존재하지 않습니다.</td>
                  			</tr>
                  		</c:when>
                  	
                  	<c:otherwise>
                  	<c:forEach items="${pagingVO.dataList }" var="emp">
                   <tr>
                    <td>
                        <div class="n-chk align-self-center text-center" style="margin-left: 70%;">
                          <div class="form-check">
                            <input type="checkbox" class="form-check-input contact-chkbox primary" id="checkbox-${emp.empId}" value="${emp.empId}">
                            <label class="form-check-label" for="checkbox-${emp.empId}"></label>
                          </div>
                        </div>
                      </td>  
                    
                      <td>
<!--                         <div class="d-flex align-items-center" style="margin-left: 30%;"> -->
<%--                           <img src="${pageContext.request.contextPath }/resources/assets/images/profile/user-2.jpg" alt="avatar" class="rounded-circle" width="35"> --%>
<!--                           <div class="ms-3"> -->
<!--                             <div class="user-meta-info"> -->
<%--                               <h6 class="user-name mb-0" id="empName" data-name="user-name">${emp.empName }</h6> --%>
<!--                             </div> -->
<!--                           </div> -->
<!--                         </div> -->
                        <div class="d-flex align-items-center" style="margin-left: 30%;">
                          <img src="${emp.empImage}" alt="avatar" class="rounded-circle" width="35">
                          <div class="ms-3">
                            <div class="user-meta-info">
                              <h6 class="user-name mb-0"  id="empName" data-name="user-name" >${emp.empName }</h6>
                            </div>
                          </div>
                        </div>
                      </td>
                      <td>
                        <span class="usr-empId" id="usr-empId" data-empId="${emp.empId }">${emp.empId }</span>
                      </td>
                      <td>
                        <span class="usr-startdate">${fn:split(emp.empStartdate, " ")[0]}</span>
                      </td>
                      <td>
                        <span class="usr-department">${emp.empDept }</span>
                      </td>
                      <td>
                        <span class="usr-position">${emp.empPosition }</span>
                      </td>
                      <td>
                    	<c:choose>
						    <c:when test="${emp.empApproval == 'Y'}">
						        <span class="badge bg-primary-subtle text-primary" data-emplNo="승인여부">승인</span>
						    </c:when>
						    <c:when test="${emp.empApproval == 'R'}">
						        <span class="badge bg-danger-subtle text-danger" data-emplNo="승인여부">반려</span>
						    </c:when>
						    <c:when test="${emp.empApproval == 'N'}">
						        <span class="badge bg-success-subtle text-success" data-emplNo="승인여부">승인대기</span>
						    </c:when>
						    <c:when test="${emp.empDel == 'Y' }">
						        <span class="badge text-bg-light" style="color: gray !important;" data-emplNo="승인여부">퇴사</span>
						    </c:when>
						</c:choose>

                  	</td>
                      <td>
                        <div class="action-btn" style="display: flex; justify-content: center; align-items: center;">
                          <a href="/info/empInsertDetail?empId=${emp.empId }" class="text-primary edit">
                            <i class="ti ti-eye fs-5"></i>
                          </a>
                        </div>
                      </td>
                    </tr>
                    <!-- end row -->
                    	</c:forEach>
                  	</c:otherwise>
                  	</c:choose>
                  </tbody>
                </table>
              
				<div class="row">
				    <div class="col-md-0 col-xl-3">
				        <!-- 필요한 내용이 있으면 여기에 추가 -->
				    </div>
				    <div class="col-md-5 col-xl-9 text-end d-flex justify-content-md-end justify-content-center mt-3 mt-md-0">
				        <div class="action-btn d-flex justify-content-center align-items-center">
				            <a href="javascript:void(0)" id="btn-add-contact" class="btn btn-primary me-2 d-flex align-items-center">
				                승인
				            </a>
				            <a href="javascript:void(0)" id="btn-cancel-contact" class="btn btn-danger text-white d-flex align-items-center">
				                반려
				            </a>
				        </div>
				    </div>
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
            <!-- </form> -->
          </div>
        </div>
       </div>
       
 <!-- SweetAlert2 -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="../assets/libs/sweetalert2/dist/sweetalert2.min.js"></script>
<script src="../assets/js/forms/sweet-alert.init.js"></script>
    
<script type="text/javascript">
$(document).ready(function() {
    
    // 승인 버튼 눌렀을 때
    $('#btn-add-contact').on('click', function() {
        var checkboxes = $('.contact-chkbox:checked');
        
        if (checkboxes.length === 0) {
            $('#warningModal').modal('show');
            return;
        }

        checkboxes.each(function() {
            var row = $(this).closest('tr');
            var empIdElement = row.find('.usr-empId');
            if (empIdElement.length) {
                var empId = empIdElement.text();
                console.log("선택한 직원의 사번 : " + empId);
                
                
                
                
                Swal.fire({
                    title: '승인 처리', // 제목 변경
                    text: '해당 직원 등록을 승인하시겠습니까?', // 내용 변경
                    icon: 'info', // 아이콘 설정
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
                            url: '/info/empApproval', 
                            method: 'POST',
                            data: {
                                empId: empId // 삭제할 데이터의 ID
                            },
                            success: function(response) {
                                // 성공적으로 삭제되었을 때
                                Swal.fire(
                                    '승인 완료!',
                                    '해당 직원의 승인 처리가 완료되었습니다.',
                                    'success'
                                ).then(() => {
                                    // SweetAlert2의 성공 메시지 후에
                                	location.reload();
                                });
                            },
                            error: function(xhr, status, error) {
                                // 오류가 발생했을 때
                                Swal.fire(
                                    '오류!',
                                    '승인 처리에 실패했습니다.',
                                    'error'
                                );
                            }
                        });
                    }
                });
            } else {
                console.log('empId 요소가 존재하지 않습니다.');
            } 
        }); 
    }); 
    
    // 반려 버튼 눌렀을 때
    $("#btn-cancel-contact").on("click", function() {
        var checkboxes = $('.contact-chkbox:checked');
        
        if (checkboxes.length === 0) {
            $('#warningModal').modal('show');
            return;
        }

        checkboxes.each(function() {
            var row = $(this).closest('tr');
            var empIdElement = row.find('.usr-empId');
            if (empIdElement.length) {
                var empId = empIdElement.text();
                console.log("선택한 직원의 사번 : " + empId);
                
                // 반려 모달 열기
                var rejectModal = new bootstrap.Modal($("#rejectContactModal")[0]);
                rejectModal.show();
                
                $("#rejectBtn").off('click').on("click", function() {
                    var empReject = $("#empReject").val();
                    
                    // 반려 사유가 입력되지 않은 경우 경고
                    if (!empReject) {
                        alert('반려 사유를 입력하세요.');
                        return;
                    }
                    
                    $.ajax({
                        url: '/info/empApprovalRe',
                        method: 'POST',
                        data: { empId: empId, empReject: empReject },
                        
                        
                        success: function(response) {
                            // 성공적으로 반려되었을 때
                            Swal.fire(
                                '반려 완료!',
                                '해당 직원의 반려 처리가 완료되었습니다.',
                                'success'
                            ).then(() => {
                                // SweetAlert2의 성공 메시지 후에
                            	location.reload();
                            });
                        },
                        error: function(xhr, status, error) {
                            // 오류가 발생했을 때
                            Swal.fire(
                                '오류!',
                                '반려 처리에 실패했습니다.',
                                'error'
                            );
                        }
                        
                    });
                });
            } else {
                console.log('empId 요소가 존재하지 않습니다.');
            }
        }); 
    }); 
});

function selectFilter(value) {
	
    document.getElementById('selectedItem').value = value; // 전체 선택일 경우 값이 없게 설정
    document.getElementById('filter-form').submit();
}

$(function(){
	$("#pagingArea").on("click", "a", function(e){
		e.preventDefault();
		var pageNo = $(this).data("page");
		$("#searchForm").find("#page").val(pageNo);
		$("#searchForm").submit();
	});
});
</script>


