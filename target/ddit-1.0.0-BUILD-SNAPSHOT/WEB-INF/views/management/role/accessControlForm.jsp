<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <div class="body-wrapper">
        <div class="container-fluid">
          <div class="card bg-info-subtle shadow-none position-relative overflow-hidden mb-4">
            <div class="card-body px-4 py-3">
              <div class="row align-items-center">
                <div class="col-9">
                  <h4 class="fw-semibold mb-8">접근 권한 수정</h4>
                  <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                      <li class="breadcrumb-item">
                        <a class="text-muted text-decoration-none" href="../main/index.html">Home</a>
                      </li>
                      <li class="breadcrumb-item" aria-current="page">접근 권한 수정</li>
                    </ol>
                  </nav>
                </div>
                <div class="col-3">
                 
                </div>
              </div>
            </div>
          </div>
          <!-- start Form with view only -->
          <div class="card">
            <div class="card-header text-bg-primary">
              <h5 class="mb-0 text-white"></h5>
            </div>
            <form class="form-horizontal">
              <div class="form-body">
                
                <div class="card-body">
                  <h5 class="card-title mb-0">기본 정보</h5>
                </div>
                
                <hr class="m-0">
                <div class="card-body">
                
                 <div class="d-flex align-items-center gap-3" style="display: flex; justify-content: flex-start; align-items: center; margin-left: 80px; margin-top: 20px;">
                   <img src="${pageContext.request.contextPath }/resources/assets/images/profile/user-3.jpg" alt="user4" width="250" height="250" class="rounded-circle">
                 </div><br/><br/>
                
                  <div class="row">
                    <div class="col-md-6">
                      <div class="form-group row">
                        <label class="form-label text-end col-md-3">이름: </label>
                        <div class="col-md-9">
                          <p>임효정</p>
                        </div>
                      </div>
                    </div>
                    <!--/span-->
                    <div class="col-md-6">
                      <div class="form-group row">
                        <label class="form-label text-end col-md-3">사번: </label>
                        <div class="col-md-9">
                          <p>234234</p>
                        </div>
                      </div>
                    </div>
                    <!--/span-->
                  </div>
                  <!--/row-->
                  <div class="row">
                    <div class="col-md-6">
                      <div class="form-group row">
                        <label class="form-label text-end col-md-3">부서: </label>
                        <div class="col-md-9">
                          <p>인사 부서</p>
                        </div>
                      </div>
                    </div>
                    <!--/span-->
                    <div class="col-md-6">
                      <div class="form-group row">
                        <label class="form-label text-end col-md-3">직위: </label>
                        <div class="col-md-9">
                          <p>사원</p>
                        </div>
                      </div>
                    </div>
                    <!--/span-->
                  </div>
                  <!--/row-->
                  <div class="row">
                    <div class="col-md-6">
                      <div class="form-group row">
                        <label class="form-label text-end col-md-3">이메일: </label>
                        <div class="col-md-9">
                          <p>abcd@gmail.com</p>
                        </div>
                      </div>
                    </div>
                    <!--/span-->
                    <div class="col-md-6">
                      <div class="form-group row">
                        <label class="form-label text-end col-md-3">생년월일: </label>
                        <div class="col-md-9">
                          <p>1997.02.12</p>
                        </div>
                      </div>
                    </div>
                    <!--/span-->
                  </div>
                  <!--/row-->
                  
                  <!--/row-->
                  <div class="row">
                    <div class="col-md-6">
                      <div class="form-group row">
                        <label class="form-label text-end col-md-3">근로형태: </label>
                        <div class="col-md-9">
                          <p>정규직</p>
                        </div>
                      </div>
                    </div>
                    <!--/span-->
                    <div class="col-md-6">
                      <div class="form-group row">
                        <label class="form-label text-end col-md-3">휴대전화: </label>
                        <div class="col-md-9">
                          <p>01023452345</p>
                        </div>
                      </div>
                    </div>
                    <!--/span-->
                  </div>
                  <!--/row-->

                </div>
                <hr class="m-0">
                <div class="card-body">
                  <h5 class="card-title mb-0">접근 권한</h5>
                </div>
                <hr class="m-0">
                <div class="card-body">
                  
                  <div class="row">
                    <div class="col-md-6">
                      <div class="form-group row">
                        <label class="form-label text-end col-md-3">접근권한 </label>
                        <div class="col-md-9">
                       		<div class="form-check">
					          <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
					          <label class="form-check-label" for="flexCheckDefault">인사 부서</label>
				        	</div>
				        	<div class="form-check">
					          <input class="form-check-input" type="checkbox" value="" id="flexCheckChecked" checked>
					          <label class="form-check-label" for="flexCheckChecked">전산 부서</label>
				        	</div>
				        	<div class="form-check">
					          <input class="form-check-input" type="checkbox" value="" id="flexCheckChecked">
					          <label class="form-check-label" for="flexCheckChecked">협력업체 부서</label>
				        	</div>
				        	<div class="form-check">
					          <input class="form-check-input" type="checkbox" value="" id="flexCheckChecked">
					          <label class="form-check-label" for="flexCheckChecked">공항서비스 부서</label>
				        	</div>
                        </div>
                      </div>
                    </div>
                  </div>
                 
                </div>
                <div class="form-actions border-top">
                  <div class="card-body" >
                    <div class="row">
                      <div class="col-md-6">
                        <div class="row">
                          <div class="col-md-offset-3 col-md-9">
                            <button type="submit" class="btn btn-primary">
                              <i class="ti ti-edit fs-5"></i>
                              수정
                            </button>
                            <button type="button" class="btn bg-danger-subtle text-danger">
                              <i class="ti ti-x fs-5"></i>
                              취소
                            </button>
                          </div>
                        </div>
                      </div>
                      <div class="col-md-6"></div>
                    </div>
                  </div>
                </div>
              </div>
            </form>
          </div>
          <!-- start Form with view only -->
        </div>
      </div>