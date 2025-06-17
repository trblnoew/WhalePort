<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>

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
             <h4 class="fw-semibold mb-0">보안 점검 보고서 관리</h4>
            </div>
          </div>
          <div class="card w-100 position-relative overflow-hidden">
            <div class="card-body p-4">
             <div class="table-responsive mb-4 border rounded-1 mt-3">
                <table class="table text-nowrap mb-0 align-middle" style="table-layout: fixed;">
                  <colgroup>
                      <col style="width: 10%;">
                      <col style="width: 30%;">
                      <col style="width: 30%;">
                      <col style="width: 30%;">
                  </colgroup>
                  <thead class="text-dark fs-4">
                    <tr>
                      <th>
                        <h6 class="fs-4 fw-semibold mb-0"></h6>
                      </th>
                      <th>
                        <h6 class="fs-4 fw-semibold mb-0">문서번호</h6>
                      </th>
                      <th>
                        <h6 class="fs-4 fw-semibold mb-0">보고일자</h6>
                      </th>
                      <th>
                        <h6 class="fs-4 fw-semibold mb-0">보고서 검토 결과</h6>
                      </th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td>
                        <p class="mb-0 fw-normal fs-4">1</p>
                      </td>
                      <td>
                        <p class="mb-0 fw-normal fs-4">제 2024-09011617호</p>
                      </td>
                      <td>
                        <p class="mb-0 fw-normal fs-4">2024-09-01</p>
                      </td>
                      <td>
                        <span class="badge bg-primary-subtle text-primary" data-bs-toggle="modal" data-bs-target="#feedback">결과 확인</span>
                      </td>
                      </tr>
                    <tr>
                      <td>
                        <p class="mb-0 fw-normal fs-4">2</p>
                      </td>
                      <td>
                        <p class="mb-0 fw-normal fs-4">제 2024-09011618호</p>
                      </td>
                      <td>
                        <p class="mb-0 fw-normal fs-4">2024-09-01</p>
                      </td>
                      <td>
                        <p class="mb-0 fw-normal fs-4">-</p>
                      </td>
                      </tr>
                    <tr>
                      <td>
                        <p class="mb-0 fw-normal fs-4">3</p>
                      </td>
                      <td>
                        <p class="mb-0 fw-normal fs-4">제 2024-09011619호</p>
                      </td>
                      <td>
                        <p class="mb-0 fw-normal fs-4">2024-09-01</p>
                      </td>
                      <td>
                        <span class="badge bg-primary-subtle text-primary" data-bs-toggle="modal" data-bs-target="#feedback">결과 확인</span>
                      </td>
                      </tr>
                  </tbody>
                </table>
              </div>
              
		      <div class="text-end mb-3">
                <a href="/partner/report/register" class="btn btn-primary">보고서 작성</a>
              </div>
              
              
              
              
              
                    <!-- Primary header modal start -->
                    <!-- Primary Header Modal -->
                    <div id="feedback" class="modal fade" tabindex="-1" aria-labelledby="primary-header-modalLabel" aria-hidden="true">
                      <div class="modal-dialog modal-dialog-scrollable modal-lg">
                        <div class="modal-content">
                          <div class="modal-header modal-colored-header bg-primary text-white">
                            <h4 class="modal-title text-white" id="primary-header-modalLabel">보고서 검토 결과</h4>
                            <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                          </div>
                          <div class="modal-body">
                            <h5 class="mt-0">제 2024-09011617호 검토 결과</h5>
                            <p>
                              Cras mattis consectetur purus sit amet
                              fermentum. Cras justo odio, dapibus ac facilisis
                              in, egestas eget quam. Morbi leo risus, porta ac
                              consectetur ac, vestibulum at eros.
                            </p>
                            <p>
                              Praesent commodo cursus magna, vel scelerisque
                              nisl consectetur et. Vivamus sagittis lacus vel
                              augue laoreet rutrum faucibus dolor auctor.
                            </p>
                          </div>
                          <div class="modal-footer">
                            <button type="button" class="btn btn-light" data-bs-dismiss="modal">닫기</button>
                          </div>
                        </div>
                        <!-- /.modal-content -->
                      </div>
                      <!-- /.modal-dialog -->
                    </div>
                       <!-- Primary header modal end -->
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
				<!-- 3. Pagination with Active and Disabled States -->
				<!-- ------------------------------------------------ -->
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

            </div>
          </div>
        </div>
      </div>