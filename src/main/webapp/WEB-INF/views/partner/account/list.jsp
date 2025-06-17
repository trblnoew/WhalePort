<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

<!-- table-basic.html 사용 -->

<style>
    .table th {
        text-align: center;
    }
    .table td {
        text-align: center;
    }
    .modal-title {
        font-size: 1rem; /* 제목 글씨 크기 조정 */
    }
    .modal-body h5 {
        font-size: 0.9rem; /* 본문 글씨 크기 조정 */
    }
</style>


<!-- 아무것도 누르지 않았을때 -->
<div class="modal fade" id="al-info-alert" tabindex="-1" aria-labelledby="vertical-center-modal" aria-hidden="true"> 
    <div class="modal-dialog modal-sm">
        <div class="modal-content modal-filled bg-info-subtle">
            <div class="modal-body p-4">
                <div class="text-center text-info">
                    <h4 class="mt-2">알림</h4>
                    <p class="mt-3">항목을 선택해주세요.</p>
                    <button type="button" class="btn btn-light my-2" data-bs-dismiss="modal">닫기</button>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- 승인 -->
<div id="add-modal" class="modal fade" tabindex="-1" aria-labelledby="add-modalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-scrollable modal-sm"> <!-- modal-sm 추가 -->
        <div class="modal-content">
            <div class="modal-header modal-colored-header bg-info text-white">
                <h4 class="modal-title text-white" id="add-modalLabel">승인</h4>
                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <h5 class="mt-0">선택한 업체의 신청을 승인하시겠습니까?</h5>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-light" data-bs-dismiss="modal">취소</button>
                <button type="button" class="btn bg-info-subtle text-info" id="confirm">승인</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>

<!-- 반려 -->

<div class="modal fade" id="reject-modal" tabindex="-1" role="dialog" aria-labelledby="rejectContactModalTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header d-flex align-items-center">
                <h5 class="modal-title">반려</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <p>반려 사유를 입력하세요.</p>
                <textarea class="form-control" rows="3" placeholder="사유를 입력하세요"></textarea>
            </div>
            <div class="modal-footer">
                <button class="btn btn-light" data-bs-dismiss="modal">취소</button>
                <button class="btn bg-info-subtle text-info">확인</button>
            </div>
        </div>
    </div>
</div>


<div class="body-wrapper">
    <div class="container-fluid">
        <div class="card bg-info-subtle shadow-none position-relative overflow-hidden mb-4">
            <div class="card-body px-4 py-3">
                <h4 class="fw-semibold mb-0">협력업체 관리</h4>
            </div>
        </div>
        <div class="card w-100 position-relative overflow-hidden">
            <div class="card-header text-bg-primary">
                <h5 class="mb-0 text-white">업체 목록</h5>
            </div>
            <div class="card-body p-4">
				<!-- 검색창 시작 -->
				<div class="row justify-content-end">
					<div class="col-md-4 col-xl-3">
						<form action="/partner/account/list" method="get" class="position-relative w-100">
							<input type="text" class="form-control product-search ps-5 pe-5" id="input-search" name="searchWord" placeholder="Search Contacts..." value="${searchWord}" />
							<i class="ti ti-search position-absolute top-50 start-0 translate-middle-y fs-6 text-dark ms-3"></i>
							<button type="submit" class="btn btn-primary position-absolute top-50 end-0 translate-middle-y" style="padding: 0.25rem 0.5rem; margin-right: 0.5rem;">검색</button>
							<input type="hidden" name="searchType" value="${searchType}" />
						</form>
					</div>
				</div>
				<!-- 검색창 끝 -->
                
                <div class="table-responsive mb-4 border rounded-1 mt-3">
                    <table class="table text-nowrap mb-0 align-middle" style="table-layout: fixed;">
                        <colgroup>
                            <col style="width: 5%;">
                            <col style="width: 19%;">
                            <col style="width: 19%;">
                            <col style="width: 19%;">
                            <col style="width: 19%;">
                            <col style="width: 19%;">
                        </colgroup>
                        <thead class="text-dark fs-4">
                            <tr>
                                <th></th>
                                <th><h6 class="fs-4 fw-semibold mb-0">관리번호</h6></th>
                                <th><h6 class="fs-4 fw-semibold mb-0">업체명</h6></th>
                                <th><h6 class="fs-4 fw-semibold mb-0">사업자등록번호</h6></th>
                                <th><h6 class="fs-4 fw-semibold mb-0">개업연월일</h6></th>
                                <th><h6 class="fs-4 fw-semibold mb-0">업체구분</h6></th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:choose>
                                <c:when test="${empty pagingVO.dataList}">
                                    <tr>
                                        <td colspan="6">협력업체 신청내역이 존재하지 않습니다.</td>
                                    </tr>
                                </c:when>
                                <c:otherwise>
                                    <c:forEach items="${pagingVO.dataList}" var="pt">
                                        <tr>
					                       <td>
					                         <input class="form-check-input" type="checkbox" id="checkbox-${pt.ptNo}" value="${pt.ptNo}">
					                       </td>  
                                           <td><span class="badge bg-primary-subtle text-primary">${pt.ptApproval}</span></td>
                                           <td><p class="mb-0 fw-normal fs-4">${pt.ptName}</p></td>
                                           <td><a href="/partner/account/detail?ptNo=${pt.ptNo}" class="mb-0 fw-normal fs-4">${pt.ptBusnum}</a></td>
                                           <td><p class="mb-0 fw-normal fs-4">${fn:split(pt.ptOpendate, " ")[0] }</p></td>
                                           <td><p class="mb-0 fw-normal fs-4">${pt.comdName}</p></td>
                                        </tr>
                                    </c:forEach>
                                </c:otherwise>
                            </c:choose>	
                        </tbody>
                    </table>
                </div>
                <div class="d-flex justify-content-end">
					<button type="button" id="btn-cancel-contact" class="btn btn-outline-primary me-3 rounded-2">반려</button>
					<button type="button" id="btn-add-contact" class="btn btn-primary">승인</button>
				</div>

                <!-- Pagination 시작 -->
                <div class="d-flex justify-content-center" style="margin-top: 20px;">
                    <nav aria-label="...">
                        <ul class="pagination">
                            <li class="page-item <c:if test='${pagingVO.currentPage == 1}'>disabled</c:if>">
                                <a class="page-link" href="?page=${pagingVO.currentPage - 1}" tabindex="-1" aria-disabled="true">Previous</a>
                            </li>
                            <c:forEach begin="1" end="${pagingVO.totalPage}" var="pageNum">
                                <li class="page-item <c:if test='${pagingVO.currentPage == pageNum}'>active</c:if>">
                                    <a class="page-link" href="?page=${pageNum}">${pageNum}</a>
                                </li>
                            </c:forEach>
                            <li class="page-item <c:if test='${pagingVO.currentPage == pagingVO.totalPage}'>disabled</c:if>">
                                <a class="page-link" href="?page=${pagingVO.currentPage + 1}">Next</a>
                            </li>
                        </ul>
                    </nav>
                </div>
                <!-- Pagination 끝 -->
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
$(document).ready(function() {
    $('#btn-add-contact').on('click', function() {
        var checkboxes = $('.form-check-input:checked');

        if (checkboxes.length === 0) {
            $('#al-info-alert').modal('show');
            return;
        }

        $('#add-modal').modal('show');
    });
    

    $('#btn-cancel-contact').on('click', function() {
        var checkboxes = $('.form-check-input:checked');

        if (checkboxes.length === 0) {
            $('#al-info-alert').modal('show');
            return;
        }

        $('#reject-modal').modal('show')
    });
});

</script>


