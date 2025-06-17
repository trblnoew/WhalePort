<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
   
    
   <div class="container-fluid" style="padding-top: calc(var(--bs-gutter-x)* .5);">
          <div class="card bg-info-subtle shadow-none position-relative overflow-hidden mb-4">
            <div class="card-body px-4 py-3">
              <div class="row align-items-center" style="margin-top:20px;">
                <div class="col-9">
                  <h4 class="fw-semibold mb-8">접근 권한 관리</h4>
                  <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                      <li class="breadcrumb-item">
                        <a class="text-muted text-decoration-none" href="../main/index.html">Home</a>
                      </li>
                      <li class="breadcrumb-item" aria-current="page">접근 권한 관리</li>
                    </ol>
                  </nav>
                </div>
                <div class="col-3">
                  <div class="text-center mb-n5">
                    <img src="${pageContext.request.contextPath }/resources/assets/images/breadcrumb/ChatBc.png" alt="modernize-img" class="img-fluid mb-n4">
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="widget-content searchable-container list">
            <div class="card card-body">
              <div class="row">
                <div class="col-md-4 col-xl-3">
                  <form class="position-relative" action="/search" method="GET"> <!-- action 속성 추가함 -->
                    <input type="text" class="form-control product-search ps-5" id="input-search" placeholder="Search...">
                    <i class="ti ti-search position-absolute top-50 start-0 translate-middle-y fs-6 text-dark ms-3"></i>
                  </form>
                </div>
               
              </div>
            </div>
            <!-- Modal -->
            <div class="modal fade" id="addContactModal" tabindex="-1" role="dialog" aria-labelledby="addContactModalTitle" aria-hidden="true">
              <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                  <div class="modal-header d-flex align-items-center">
                    <h5 class="modal-title">Contact</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                  </div>
                  <div class="modal-body">
                    <div class="add-contact-box">
                      <div class="add-contact-content">
                        <form id="addContactModalTitle">
                          <div class="row">
                            <div class="col-md-6">
                              <div class="mb-3 contact-name">
                                <input type="text" id="c-name" class="form-control" placeholder="Name">
                                <span class="validation-text text-danger"></span>
                              </div>
                            </div>
                            <div class="col-md-6">
                              <div class="mb-3 contact-email">
                                <input type="text" id="c-email" class="form-control" placeholder="Email">
                                <span class="validation-text text-danger"></span>
                              </div>
                            </div>
                          </div>
                          <div class="row">
                            <div class="col-md-6">
                              <div class="mb-3 contact-occupation">
                                <input type="text" id="c-occupation" class="form-control" placeholder="Occupation">
                              </div>
                            </div>
                            <div class="col-md-6">
                              <div class="mb-3 contact-phone">
                                <input type="text" id="c-phone" class="form-control" placeholder="Phone">
                                <span class="validation-text text-danger"></span>
                              </div>
                            </div>
                          </div>
                          <div class="row">
                            <div class="col-md-12">
                              <div class="mb-3 contact-location">
                                <input type="text" id="c-location" class="form-control" placeholder="Location">
                              </div>
                            </div>
                          </div>
                        </form>
                      </div>
                    </div>
                  </div>
                  <div class="modal-footer">
                    <div class="d-flex gap-6 m-0">
                      <button id="btn-add" class="btn btn-success">Add</button>
                      <button id="btn-edit" class="btn btn-success">Save</button>
                      <button class="btn bg-danger-subtle text-danger" data-bs-dismiss="modal"> Discard
                      </button>
                    </div>

                  </div>
                </div>
              </div>
            </div>
            <div class="card card-body">
              <div class="table-responsive">
                <table class="table search-table align-middle text-nowrap">
                  <thead class="header-item">
                    <tr><th>
                      <div class="n-chk align-self-center text-center">
                        <div class="form-check">
                          <input type="checkbox" class="form-check-input primary" id="contact-check-all">
                          <label class="form-check-label" for="contact-check-all"></label>
                          <span class="new-control-indicator"></span>
                        </div>
                      </div>
                    </th>
                    <th>이름</th>
                    <th>사번</th>
                    <th>접근 권한</th>
                    <th>수정</th>
                  </tr></thead>
                  <tbody>
                    <!-- start row -->
                    <tr class="search-items">
                      <td>
                        <div class="n-chk align-self-center text-center">
                          <div class="form-check">
                            <input type="checkbox" class="form-check-input contact-chkbox primary" id="checkbox1">
                            <label class="form-check-label" for="checkbox1"></label>
                          </div>
                        </div>
                      </td>
                      <td>
                        <div class="d-flex align-items-center">
                          <img src="${pageContext.request.contextPath }/resources/assets/images/profile/user-2.jpg" alt="avatar" class="rounded-circle" width="35">
                          <div class="ms-3">
                            <div class="user-meta-info">
                              <h6 class="user-name mb-0" data-name="Emma Adams">임효정</h6>
                            </div>
                          </div>
                        </div>
                      </td>
                      <td>
                        <span class="usr-emplNo" data-emplNo="234234">234234</span>
                      </td>
                      <td>
                        <span class="usr-department" data-department="인사부서">인사 부서</span>
                      </td>
                      <td>
                        <div class="action-btn" style="display: flex; justify-content: center; align-items: center;">
                          <a href="javascript:void(0)" class="text-primary edit">
                            <i class="ti ti-edit fs-5"></i>
                          </a>
                         <!--  <a href="javascript:void(0)" class="text-dark delete ms-2">
                            <i class="ti ti-trash fs-5"></i>
                          </a> -->
                        </div>
                      </td>
                    </tr>
                    <!-- end row -->
                  </tbody>
                </table>
                
                <!-- 페이징처리 시작-->
                <div class="pagination" style="display: flex; justify-content: center;">
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
                 </div>
                 <!-- 페이징처리 끝-->
                 
              </div>
            </div>
          </div>
        </div>