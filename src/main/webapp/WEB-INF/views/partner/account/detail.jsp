<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>


<div class="body-wrapper">
    <div class="container-fluid">
        <div class="card bg-info-subtle shadow-none position-relative overflow-hidden mb-4">
            <div class="card-body px-4 py-3">
                <h4 class="fw-semibold mb-0">협력업체 관리</h4>
            </div>
        </div>
	        <!-- start Form with view only -->
	        <div class="card">
	            <div class="card-header text-bg-primary">
	                <h5 class="mb-0 text-white">업체 상세 정보</h5>
	            </div>
                <div class="card-body">
                  <h5 class="card-title mb-0">${partnerVO.ptName }</h5>
                </div>
                <hr class="m-0">
                <!--card-body-->
                <div class="card-body">
                 <div class="d-flex align-items-center gap-3" style="display: flex; justify-content: flex-start; align-items: center; margin-left: 80px; margin-top: 20px;">
                   <img src="${pageContext.request.contextPath }/resources/assets/images/profile/user-3.jpg" alt="user4" width="250" height="250" class="rounded-circle">
                 </div>
                 <div class="card-body" style="margin-top:50px;">
                  <!--row-->
                  <div class="row">
                    <div class="col-md-6">
                      <div class="form-group row">
                        <label class="form-label text-end col-md-3">업체 관리번호</label>
                        <div class="col-md-9">
                          <p>${partnerVO.ptNo }</p>
                        </div>
                      </div>
                    </div>
                    <!--/span-->
                    <div class="col-md-6">
                      <div class="form-group row">
                        <label class="form-label text-end col-md-3">개업연월일</label>
                        <div class="col-md-9">
                          <p>${fn:split(partnerVO.ptOpendate, " ")[0] }</p>
                        </div>
                      </div>
                    </div>
                  </div>
                  <!--/row-->
                  <!--row-->
                  <div class="row">
                    <div class="col-md-6">
                      <div class="form-group row">
                        <label class="form-label text-end col-md-3">업체 구분</label>
                        <div class="col-md-9">
                          <p>${partnerVO.comdName }</p>
                        </div>
                      </div>
                    </div>
                    <!--/span-->
                    <div class="col-md-6">
                      <div class="form-group row">
                        <label class="form-label text-end col-md-3">담당자</label>
                        <div class="col-md-9">
                          <p>${partnerVO.ptMgrname }</p>
                        </div>
                      </div>
                    </div>
                  </div>
                  <!--/row-->
                  <!--row-->
                  <div class="row">
                    <div class="col-md-6">
                      <div class="form-group row">
                        <label class="form-label text-end col-md-3">업체명</label>
                        <div class="col-md-9">
                          <p>${partnerVO.ptName }</p>
                        </div>
                      </div>
                    </div>
                    <!--/span-->
                    <div class="col-md-6">
                      <div class="form-group row">
                        <label class="form-label text-end col-md-3">담당자 이메일</label>
                        <div class="col-md-9">
                          <p>${partnerVO.ptMgremail }</p>
                        </div>
                      </div>
                    </div>
                  </div>
                  <!--/row-->
                  <!--row-->
                  <div class="row">
                    <div class="col-md-6">
                      <div class="form-group row">
                        <label class="form-label text-end col-md-3">사업자등록번호</label>
                        <div class="col-md-9">
                          <p>${partnerVO.ptBusnum }</p>
                        </div>
                      </div>
                    </div>
                    <!--/span-->
                    <div class="col-md-6">
                      <div class="form-group row">
                        <label class="form-label text-end col-md-3">담당자 연락처</label>
                        <div class="col-md-9">
                          <p>${partnerVO.ptMgrtel }</p>
                        </div>
                      </div>
                    </div>
                  </div>
                  <!--/row-->
                  <!--row-->
                  <div class="row">
                    <div class="col-md-6">
                      <div class="form-group row">
                        <label class="form-label text-end col-md-3">대표자</label>
                        <div class="col-md-9">
                          <p>${partnerVO.ptCeo }</p>
                        </div>
                      </div>
                    </div>
                    <!--/span-->
                    <div class="col-md-6">
                      <div class="form-group row">
                        <label class="form-label text-end col-md-3">아이디</label>
                        <div class="col-md-9">
                          <p>${partnerVO.ptId }</p>
                        </div>
                      </div>
                    </div>
                  </div>
                  <!--/row-->
                  <!--row-->
                  <div class="row">
                    <div class="col-md-6">
                      <div class="form-group row">
                        <label class="form-label text-end col-md-3">사업장 소재지</label>
                        <div class="col-md-9">
                          <p>${partnerVO.ptAdd } ${partnerVO.ptAdd2 }</p>
                        </div>
                      </div>
                    </div>
                  </div>
                  <!--/row-->
                  <!--row-->
                  <div class="row">
                    <div class="col-md-6">
                      <div class="form-group row">
                        <label class="form-label text-end col-md-3">계약일자</label>
                        <div class="col-md-9">
                          <p>${partnerVO.ptStartdate } ~ ${partnerVO.ptEnddate }</p>
                        </div>
                      </div>
                    </div>
                  </div>
                  <!--/row-->
                  <!--row-->
                  <div class="row">
                    <div class="col-md-6">
                      <div class="form-group row">
                        <label class="form-label text-end col-md-3">파일</label>
                        <div class="col-md-9">
                          <p>${partnerVO.ptFilecode }</p>
                        </div>
                      </div>
                    </div>
                  </div>
                  <!--/row-->
      			</div>
      			</div>
      			<hr class="m-0">
      		    <!--/card-body-->
	   		     <div class="card-body">
	                <div class="d-flex justify-content-end">
	                    <a href="/partner/qna/list" class="btn btn-outline-primary me-3">이전</a>
	                    <a href="/partner/qna/update?qnaNo=${partnerQnaVO.qnaNo}" class="btn btn-primary me-3">수정</a>
	                    <form action="/partner/qna/delete" method="post" class="me-3" id="delForm">
	                        <input type="hidden" name="qnaNo" value="${partnerQnaVO.qnaNo}">
	                        <sec:csrfInput/>
	                        <button type="button" class="btn btn-danger" id="delBtn">삭제</button>
	                    </form>
	                </div>
	             </div>
   		 </div>
	</div>
</div>

