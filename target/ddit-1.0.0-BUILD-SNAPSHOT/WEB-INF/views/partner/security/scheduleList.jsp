<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- table-basic.html 사용 -->

<style>
    .table th {
        text-align: center;
    }
    .table td {
        text-align: center;
    }
</style>

<div class="body-wrapper">
    <div class="container-fluid">
        <div class="card bg-info-subtle shadow-none position-relative overflow-hidden mb-4">
            <div class="card-body px-4 py-3">
                <h4 class="fw-semibold mb-0">보안 일정 관리</h4>
            </div>
        </div>
        <div class="card w-100 position-relative overflow-hidden">
            <div class="card-body p-4">
                <div class="table-responsive mb-4 border rounded-1 mt-3">
                    <table class="table text-nowrap mb-0 align-middle" style="table-layout: fixed;">
                        <colgroup>
                            <col style="width: 10%;">
                            <col style="width: 18%;">
                            <col style="width: 18%;">
                            <col style="width: 18%;">
                            <col style="width: 18%;">
                            <col style="width: 18%;">
                        </colgroup>
                        <thead class="text-dark fs-4">
                            <tr>
                                <th>
                                    <h6 class="fs-4 fw-semibold mb-0"></h6>
                                </th>
                                <th>
                                    <h6 class="fs-4 fw-semibold mb-0">일정</h6>
                                </th>
                                <th>
                                    <h6 class="fs-4 fw-semibold mb-0">위치</h6>
                                </th>
                                <th>
                                    <h6 class="fs-4 fw-semibold mb-0">배치 인원</h6>
                                </th>
                                <th>
                                    <h6 class="fs-4 fw-semibold mb-0">점검 목적</h6>
                                </th>
                                <th>
                                    <h6 class="fs-4 fw-semibold mb-0">상태</h6>
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>
                                    <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
                                </td>
                                <td>
                                    <h6 class="mb-0 fw-normal fs-4">2024-09-01</h6>
                                    <h6 class="mb-0 fw-normal fs-4">12:00 ~ 15:00</h6>
                                </td>
                                <td>
                                    <p class="mb-0 fw-normal fs-4">B-007</p>
                                </td>
                                <td>
                                    <h6 class="mb-0 fw-normal fs-4">5명</h6>
                                </td>
                                <td>
                                    <h6 class="mb-0 fw-normal fs-4">보안 검색</h6>
                                </td>
                                <td>
                                    <span class="badge bg-success-subtle text-success">점검 완료</span>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
                                </td>
                                <td>
                                    <h6 class="mb-0 fw-normal fs-4">2024-09-01</h6>
                                    <h6 class="mb-0 fw-normal fs-4">12:00 ~ 15:00</h6>
                                </td>
                                <td>
                                    <p class="mb-0 fw-normal fs-4">B-007</p>
                                </td>
                                <td>
                                    <h6 class="mb-0 fw-normal fs-4">5명</h6>
                                </td>
                                <td>
                                    <h6 class="mb-0 fw-normal fs-4">보안 검색</h6>
                                </td>
                                <td>
                                    <span class="badge bg-warning-subtle text-warning">점검 진행 중</span>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
                                </td>
                                <td>
                                    <h6 class="mb-0 fw-normal fs-4">2024-09-01</h6>
                                    <h6 class="mb-0 fw-normal fs-4">12:00 ~ 15:00</h6>
                                </td>
                                <td>
                                    <p class="mb-0 fw-normal fs-4">B-007</p>
                                </td>
                                <td>
                                    <h6 class="mb-0 fw-normal fs-4">5명</h6>
                                </td>
                                <td>
                                    <h6 class="mb-0 fw-normal fs-4">보안 검색</h6>
                                </td>
                                <td>
                                    <span class="badge bg-primary-subtle text-primary">보고 완료</span>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
                                </td>
                                <td>
                                    <h6 class="mb-0 fw-normal fs-4">2024-09-01</h6>
                                    <h6 class="mb-0 fw-normal fs-4">12:00 ~ 15:00</h6>
                                </td>
                                <td>
                                    <p class="mb-0 fw-normal fs-4">B-007</p>
                                </td>
                                <td>
                                    <h6 class="mb-0 fw-normal fs-4">5명</h6>
                                </td>
                                <td>
                                    <h6 class="mb-0 fw-normal fs-4">보안 검색</h6>
                                </td>
                                <td>
                                    <span class="badge bg-danger-subtle text-danger">점검 신청</span>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>

				<div class="text-end mb-3">
				    <a class="btn btn-primary" href="https://example.com" data-bs-target="#scheduleUpdate" data-bs-toggle="modal">수정</a>
				</div>

				
                <!-- 3. Pagination with Active and Disabled States -->
                <div class="d-flex justify-content-center" style="margin-top: 20px;">
                    <nav aria-label="...">
                        <ul class="pagination">
                            <li class="page-item disabled">
                                <a class="page-link" href="javascript:void(0)" tabindex="-1" aria-disabled="true">Previous</a>
                            </li>
                            <li class="page-item">
                                <a class="page-link" href="javascript:void(0)">1</a>
                            </li>
                            <li class="page-item active" aria-current="page">
                                <a class="page-link" href="javascript:void(0)">2</a>
                            </li>
                            <li class="page-item">
                                <a class="page-link" href="javascript:void(0)">3</a>
                            </li>
                            <li class="page-item">
                                <a class="page-link" href="javascript:void(0)">Next</a>
                            </li>
                        </ul>
                    </nav>
                </div>
                <!-- end Pagination with Active and Disabled States -->
                
                
                
	<!-- 수정 모달창 START -->
	<div id="scheduleUpdate" class="modal fade" tabindex="-1" aria-hidden="true">
	    <div class="modal-dialog modal-dialog-scrollable modal-lg">
	        <div class="modal-content">
	            <div class="modal-body">
	                <div class="text-center mt-2 mb-4">
	                    <a href="https://example.com" class="text-success">
	                        <span>
	                            <img src="${pageContext.request.contextPath}/resources/assets/images/logos/favicon.png" class="me-3 img-fluid" alt="modernize-img" />
	                        </span>
	                    </a>
	                </div>
	                <form action="#" class="ps-3 pr-3">
	                    <div class="mb-3">
	                        <label for="schedule">일정</label>
	                        <div class="row">
	                            <div class="col-6">
	                                <input type="date" class="form-control" value="2018-05-13">
	                            </div>
	                            <div class="col-3">
	                                <input type="time" class="form-control" value="22:33:00">
	                            </div>
	                            <div class="col-3">
	                                <input type="time" class="form-control" value="22:33:00">
	                            </div>
	                        </div>
	                    </div>
	                    <div class="mb-3">
	                        <label for="location">위치</label>
	                        <select class="select2 form-control">
				                <option>위치 선택</option>
				                <optgroup label="A구역">
				                  <option value="101">101</option>
				                  <option value="102">102</option>
				                  <option value="102">103</option>
				                </optgroup>
				                <optgroup label="B구역">
				                  <option value="101">101</option>
				                  <option value="102">102</option>
				                  <option value="102">103</option>
				                </optgroup>
				                <optgroup label="C구역">
				                  <option value="101">101</option>
				                  <option value="102">102</option>
				                  <option value="102">103</option>
				                </optgroup>
			                </select>
	                    </div>
	                    <div class="mb-3">
	                        <label for="personnel">배치 인원</label>
	                        <input class="form-control" type="text" placeholder="5명" />
	                    </div>
	                    <div class="mb-3">
	                        <label for="purpose">점검 목적</label>
	                        <select class="select2 form-control">
				                <option>점검 목적 선택</option>
				                  <option value="101">보안 검색</option>
				                  <option value="102">항공 경비</option>
			                </select>
	                    </div>
	                    <div class="mb-3">
	                        <label for="status">상태</label>
	                        <select class="select2 form-control">
				                <option>상태 선택</option>
				                  <option value="101">보안 검색</option>
				                  <option value="102">항공 경비</option>
			                </select>
	                    </div>
	                    <div class="mb-3 text-center">
	                        <button class="btn btn-rounded bg-info-subtle text-info" type="submit">저장</button>
	                    </div>
	                </form>
	            </div>
	        </div>
	    </div>
	</div>
	<!-- 수정 모달창 END -->


            </div>
        </div>
    </div>
</div>
