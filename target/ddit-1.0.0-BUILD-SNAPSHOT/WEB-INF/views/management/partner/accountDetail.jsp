<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<style>
    .form-group p {
        max-width: 250px; /* 원하는 길이로 조정 */
        white-space: nowrap; /* 한 줄로 유지 */
    }
    .form-label {
        width: 150px; /* 원하는 라벨 너비로 조정 */
    }
</style>

<div class="body-wrapper">
    <div class="container-fluid">
    	<!-- 상단 카드 시작-->
        <div class="card bg-info-subtle shadow-none position-relative overflow-hidden mb-4">
           <div class="card-body px-4 py-3">
             <div class="row align-items-center" style="margin-top:20px;">
               <div class="col-9">
                 <h4 class="fw-semibold mb-8">업체 목록</h4>
                 <nav aria-label="breadcrumb">
                   <ol class="breadcrumb">
                     <li class="breadcrumb-item">
                       <a class="text-muted text-decoration-none" href="../main/index.html">DashBoard</a>
                     </li>
                     <li class="breadcrumb-item" aria-current="page">협력업체 상세</li>
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
        <!-- 업체 상세 정보 시작 -->
        <div class="card">
            <div class="card-header text-bg-primary">
                <h5 class="mb-0 text-white">업체 상세 정보</h5>
            </div>
            <div class="card-body">
			<h5 class="card-title mb-0">
			    ${partnerVO.ptName} 
			    <span id="approvalStatus">
			        <c:choose>
			            <c:when test="${partnerVO.ptApproval == 'N'}">
			                <span class="badge bg-warning-subtle text-warning" style="margin-left:10px">반려</span>
			            </c:when>
			            <c:when test="${partnerVO.ptApproval == 'Y'}">
			                <span class="badge bg-primary-subtle text-primary" style="margin-left:10px">승인</span>
			            </c:when>
			            <c:when test="${partnerVO.ptApproval == 'H'}">
			                <span class="badge bg-success-subtle text-success" style="margin-left:10px">승인대기</span>
			            </c:when>
			        </c:choose>
			    </span>
			</h5>
            </div>
            <hr class="m-0">
			<div class="card-body">
              <br>
			  <div class="row">
                   <div class="col-lg-4 d-flex align-items-stretch">
                     <div class="card w-100 border position-relative overflow-hidden">
                       <div class="card-body">
		                 <div class="d-flex justify-content-center h-50" style="margin-top: 10px;">
						 <img src="${partnerVO.ptImage }" alt="user4" width="130" height="130" class="rounded-circle">
					     </div>
		                 <div class="form-group row col-md-12" style="margin-top: 20px;">
		                	 <div class="col-md-1"></div>
		                	 <div class="col-md-4"> <label class="form-label text-end">업체명</label></div>
		                	 <div class="col-md-2"></div>
		                     <div class="col-md-4"><p>${partnerVO.ptName}</p></div>
		                     <div class="col-md-1"></div>
		            	 </div>
		                 <div class="form-group row col-md-12">
		                 	 <div class="col-md-1"></div>
		                	 <div class="col-md-4"> <label class="form-label text-end">사업자등록번호</label></div>
		                	 <div class="col-md-2"></div>
		                     <div class="col-md-4"><p>${fn:substring(partnerVO.ptBusnum, 0, 3)}-${fn:substring(partnerVO.ptBusnum, 3, 5)}-${fn:substring(partnerVO.ptBusnum, 5, 10)}</p></div>
		                     <div class="col-md-1"></div>
		            	 </div>
		                 <div class="form-group row col-md-12">
		                     <div class="col-md-1"></div>
		                	 <div class="col-md-4"> <label class="form-label text-end">대표자</label></div>
		                	 <div class="col-md-2"></div>
		                     <div class="col-md-4"><p>${partnerVO.ptCeo}</p></div>
		                     <div class="col-md-1"></div>
		            	 </div>
                       </div>
                     </div>
                   </div>
                   <div class="col-lg-8 d-flex align-items-stretch">
                     <div class="card w-100 border position-relative overflow-hidden">
					   <div class="card-body">
                         <div class="row">
                         <div class="col-6 pt-3">
	                           <div class="mb-4 d-flex align-items-stretch">
	                             <label class="form-label">업체 구분</label>
					             <p>${partnerVO.comdName}</p>
	                           </div>
	                           <div class="mb-4 d-flex align-items-stretch">
	                             <label class="form-label">계약기간</label>
					             <p>${fn:split(partnerVO.ptStartdate, ' ')[0]} ~ ${fn:split(partnerVO.ptEnddate, ' ')[0]}</p>
	                           </div>
	                           <div class="mb-4 d-flex align-items-stretch">
	                             <label class="form-label">우편번호</label>
					             <p>${partnerVO.ptPostcode}</p>
	                           </div>
	                           <div class="mb-4 d-flex align-items-stretch">
	                             <label class="form-label">주소</label>
					             <p>${partnerVO.ptAdd}</p>
	                           </div>
	                           <div class="mb-4 d-flex align-items-stretch">
	                             <label class="form-label">상세주소</label>
					             <p>${partnerVO.ptAdd2}</p>
	                           </div>
                         </div>
                         <div class="col-6 pt-3 ps-5">
	                           <div class="mb-4 d-flex align-items-stretch">
	                             <label class="form-label">개업연월일</label>
					             <p>${fn:split(partnerVO.ptOpendate, " ")[0]}</p>
	                           </div>
	                           <div class="mb-4 d-flex align-items-stretch">
	                             <label class="form-label">계약금액</label>
					             <p>${partnerVO.ptMoney}</p>
	                           </div>
	                           <div class="mb-4 d-flex align-items-stretch">
	                             <label class="form-label">담당자</label>
					             <p>${partnerVO.ptMgrname}</p>
	                           </div>
	                           <div class="mb-4 d-flex align-items-stretch">
	                             <label class="form-label">담당자 이메일</label>
					             <p>${partnerVO.ptMgremail}</p>
	                           </div>
	                           <div class="mb-4 d-flex align-items-stretch">
	                             <label class="form-label">담당자 연락처</label>
					             <p>${partnerVO.ptMgrtel}</p>
	                           </div>
                          </div>
                          </div>
						  <div class="col-12 mb-4" id="rejectionReason" style="display: none;">
						      <div class="col-md-12">
						          <div class="form-group row">
						              <label class="form-label col-md-4">반려 사유</label>
						              <div class="col-md-9">
						                  <p>${partnerVO.ptReject}</p>
						              </div>
						          </div>
						      </div>
						  </div>
                          <div class="col-12 mb-4" id="partnerId" style="display: none;">
				            <div class="col-md-12">
				                <div class="form-group row">
				                    <label class="form-label col-md-3">협력업체 ID</label>
				                    <div class="col-md-9">
				                        <p>${partnerVO.ptId}</p>
				                    </div>
				                </div>
				            </div>
				          </div>
							<!-- 첨부파일 부분 시작 -->
							<div class="col-12">
							    <div class="card shadow-none border" style="overflow: auto;"> <!-- 기본 높이 조정 -->
							        <c:if test="${not empty partnerVO.ptFileList}">
							            <ul class="mailbox-attachments d-flex flex-wrap align-items-center justify-content-start clearfix ms-4 md-0 mb-0" style="margin-top: 20px;">
							                <c:forEach items="${partnerVO.ptFileList}" var="ptFile">
							                    <li class="col-md-4 mb-3"> <!-- 넓이를 조정 -->
							                        <div class="d-flex align-items-center">
							                            <i class="fas fa-paperclip ms-2 me-2"></i>
							                            <a href="#" class="mailbox-attachment-name me-2">${ptFile.fileRealname}</a>
							                            <p class="mb-0 me-2" style="white-space: nowrap;">${ptFile.fileFancysize}</p>
							                            <c:url value="/management/partner/account/download" var="downloadUrl">
							                                <c:param name="fileNo" value="${ptFile.fileNo}"/>
							                            </c:url>
							                            <a href="${downloadUrl}">
							                                <sec:csrfInput/>
							                                <button type="button" class="btn btn-primary btn-sm" style="padding: 0.2rem 0.4rem;">
							                                    <i class="ti ti-download fs-6" style="font-size: 0.8rem;"></i>
							                                </button>
							                            </a>
							                        </div>
							                    </li>
							                </c:forEach>
							            </ul>
							        </c:if>
							    </div>
							</div>
							<!-- 첨부파일 부분 끝 -->
                       </div>
                     </div>
                   </div>
                 </div>
			</div>
            <hr class="m-0">
            <div class="card-body">
                <div class="d-flex justify-content-end"  id="actionButtons">
					<a href="#" class="btn btn-primary me-3" id="btn2" data-action="approve">승인</a>
					<a href="#" class="btn btn-danger me-3" id="btn3">반려</a>
                    <a href="/management/partner/account/accountList" class="btn btn-outline-primary me-3" id="btn1">이전</a>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- 아이디 발급 Modal -->
<div class="modal fade" id="idModal" tabindex="-1" role="dialog" aria-labelledby="idContactModalTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header d-flex align-items-center">
                <h5 class="modal-title">아이디 발급</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <p>아이디</p>
                <input class="form-control" id="idIssue" name="idIssue" value="PT-${partnerVO.ptBusnum}${partnerVO.ptNo}"/>
                <br>
                <p>비밀번호</p>
                <input class="form-control" id="pwIssue" name="pwIssue" value="${partnerVO.ptBusnum}"/>
            </div>
            <div class="modal-footer">
                <button class="btn btn-outline-primary" data-bs-dismiss="modal">취소</button>
                <button class="btn btn-primary" id="idConfirmBtn" >확인</button>
            </div>
        </div>
    </div>
</div>
<!-- 아이디 발급 Modal 끝 -->

<!-- 반려 Modal -->
<div class="modal fade" id="rejectModal" tabindex="-1" role="dialog" aria-labelledby="rejectContactModalTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header d-flex align-items-center">
                <h5 class="modal-title">반려</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <p>반려 사유를 입력하세요.</p>
                <textarea class="form-control" id="ptReject" name="ptReject" rows="3" placeholder="사유를 입력하세요."></textarea>
            </div>
            <div class="modal-footer">
                <button class="btn btn-outline-primary" data-bs-dismiss="modal">취소</button>
                <button class="btn btn-primary" id="rejectBtn" >확인</button>
            </div>
        </div>
    </div>
</div>

<!-- 반려 사유 작성 알림 모달 -->
<div class="modal fade" id="rejectReasonModal" tabindex="-1" aria-labelledby="vertical-center-modal" aria-hidden="true">
    <div class="modal-dialog modal-sm">
        <div class="modal-content modal-filled bg-warning-subtle">
            <div class="modal-body p-4">
                <div class="text-center text-warning">
                    <i class="ti ti-alert-octagon fs-7"></i>
                    <h4 class="mt-2">알림</h4>
                    <p class="mt-3">반려 사유를 입력하세요!</p>
                    <button type="button" class="btn btn-light my-2" data-bs-dismiss="modal">닫기</button>
                </div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
$(document).ready(function() {
    var approvalStatus = '${partnerVO.ptApproval}'; // 페이지 로드 시 ptApproval 값에 따라 버튼 텍스트 변경
    var partnerId = '${partnerVO.ptId}'; // 아이디 값 가져오기

    if (approvalStatus === 'Y') {
        $('#btn1').text('이전').attr('href', '/management/partner/account/accountList');
        $('#btn2').removeAttr('data-bs-toggle data-bs-target').attr('id', 'editBtn').text('수정').attr('href', '/management/partner/account/accountUpdate?ptNo=${partnerVO.ptNo}');

        if (partnerId) {
            $('#btn3').hide(); // 아이디 발급 버튼 숨김
            $('#partnerId').show();
            $('#partnerId p').text(partnerId);
        } else {
        	 $('#btn3').removeAttr('id').removeAttr('data-bs-toggle data-bs-target').text('아이디 발급').attr('id', 'idBtn').removeClass().addClass('btn bg-secondary-subtle text-secondary border-0 me-3');
        }
    } else if (approvalStatus === 'N') {
        $('#btn1').text('이전').attr('href', '/management/partner/account/accountList');
        $('#btn2').hide();
        $('#btn3').hide();
        $('#rejectionReason').show(); // 반려 사유 표시
        $('#rejectionReason p').text(rejectReason); // 반려 사유 업데이트
    }

    // 승인 모달
    $('#btn2').on('click', function() {
        Swal.fire({
            title: '승인 확인',
            text: '승인하시겠습니까?',
            icon: 'info',
            showCancelButton: true,
            confirmButtonText: '확인',
            cancelButtonText: '취소',
            customClass: {
                cancelButton: 'btn btn-outline-primary',
                confirmButton: 'btn btn-primary me-2'
            },
            buttonsStyling: false
        }).then((result) => {
            if (result.isConfirmed) {
                $.ajax({
                    url: '/management/partner/account/accountApprove',
                    method: 'POST',
                    data: {
                        ptNo: '${partnerVO.ptNo}',
                        ptApproval: 'Y'
                    },
                    success: function(response) {
                        Swal.fire(
                            '승인 완료!',
                            '승인이 완료되었습니다.',
                            'success'
                        ).then(() => {
                            $('#approvalStatus').html('<span class="badge bg-primary-subtle text-primary">승인</span>');
                            $('#btn1').text('이전').attr('href', '/management/partner/account/accountList');
                            $('#btn2').removeAttr('data-bs-toggle data-bs-target').attr('id', 'editBtn').text('수정').attr('href', '/management/partner/account/accountUpdate?ptNo=${partnerVO.ptNo}');
                            $('#btn3').removeAttr('id').removeAttr('data-bs-toggle data-bs-target').text('아이디 발급').attr('id', 'idBtn').removeClass().addClass('btn bg-secondary-subtle text-secondary border-0 me-3');
                            location.reload(); // 페이지를 새로 고침하여 업데이트된 상태를 반영
                        });
                    },
                    error: function(xhr, status, error) {
                        Swal.fire(
                            '오류!',
                            '승인 처리에 실패했습니다.',
                            'error'
                        );
                    }
                });
            }
        });
    });

    // 반려 모달
    $("#btn3").on("click", function() {
        // 반려 모달 열기
        var rejectModal = new bootstrap.Modal($("#rejectModal")[0]);
        rejectModal.show();

        // 이전에 설정된 클릭 이벤트를 해제하여 중복 방지
        $("#rejectBtn").off('click').on("click", function() {
            var rejectReason = $("#ptReject").val(); // textarea의 id를 ptReject로 수정

            // 반려 사유가 입력되지 않은 경우 경고
            if (!rejectReason) {
                $('#rejectReasonModal').modal('show');
                return; // 사유가 입력되지 않으면 중단
            }

            $.ajax({
                url: '/management/partner/account/accountApprove',
                method: 'POST',
                data: {
                    ptNo: '${partnerVO.ptNo}', 
                    ptApproval: 'N',
                    ptReject: rejectReason
                },
                success: function(response) {
                    Swal.fire(
                        '반려 완료',
                        '반려가 완료되었습니다.',
                        'success'
                    ).then(() => {
                        $('#approvalStatus').html('<span class="badge bg-warning-subtle text-warning">반려</span>');
                        $('#btn1').text('이전').attr('href', '/management/partner/account/accountList');
                        $('#btn2').hide();
                        $('#btn3').hide();
                        rejectModal.hide(); // 반려 모달 닫기
                        $('#rejectionReason').show(); // 반려 사유 표시
                        $('#rejectionReason p').text(rejectReason); // 반려 사유 업데이트
                    });
                },
                error: function(xhr, status, error) {
                    Swal.fire(
                        '오류!',
                        '반려 처리에 실패했습니다.',
                        'error'
                    );
                }
            });
        });
    });

    // 아이디 발급 버튼 클릭 이벤트
    $("#idBtn").on("click", function() {
        // 아이디발급 모달 열기
        var idModal = new bootstrap.Modal($("#idModal")[0]);
        idModal.show();
    });

 // 모달의 확인 버튼 클릭 이벤트 처리
    $("#idConfirmBtn").on("click", function() {
        var idIssue = $("#idIssue").val();
        var pwIssue = $("#pwIssue").val();

        // 아이디 발급 AJAX 요청
        $.ajax({
            url: '/management/partner/account/accountIdIssue',
            method: 'POST',
            data: {
                ptNo: '${partnerVO.ptNo}', 
                ptId: idIssue,
                ptPw: pwIssue
            }
        }).then(function(response) {
            // 아이디 발급 성공
            Swal.fire(
                '아이디 발급 완료',
                '아이디 발급이 완료되었습니다.',
                'success'
            ).then(() => {
                $('#idModal').modal('hide'); // 모달 닫기
                $('#idBtn').hide();
                $('#partnerId').show();
                $('#partnerId p').text(idIssue);

                // 이메일 발송 AJAX 요청
                return $.ajax({
                    url: '/management/partner/account/sendEmail', // 이메일 발송을 위한 URL
                    method: 'POST',
                    data: {
                        ptNo: '${partnerVO.ptNo}',
                        ptId: idIssue,
                        ptPw: pwIssue,
                        ptMgremail: '${partnerVO.ptMgremail}'
                    }
                });
            }).then(function(emailResponse) {
                // 이메일 발송 성공
                Swal.fire(
                    '이메일 발송 완료',
                    '아이디와 비밀번호가 이메일로 발송되었습니다.',
                    'success'
                );
            }).catch(function(error) {
                // 이메일 발송 실패
                Swal.fire(
                    '오류!',
                    '이메일 발송에 실패했습니다.',
                    'error'
                );
            });
        }).catch(function(xhr, status, error) {
            // 아이디 발급 실패
            Swal.fire(
                '오류!',
                '아이디 발급에 실패했습니다.',
                'error'
            );
        });
    });

});

</script>