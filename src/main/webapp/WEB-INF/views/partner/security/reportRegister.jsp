<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/libs/quill/dist/quill.snow.css">

<div class="body-wrapper">
        <div class="container-fluid">
          <div class="card bg-info-subtle shadow-none position-relative overflow-hidden mb-4">
            <div class="card-body px-4 py-3">
              <div class="row align-items-center">
                <div class="col-9">
                  <h4 class="fw-semibold mb-0">보안 점검 보고서 관리</h4>
                </div>
              </div>
            </div>
          </div>
          
          <div class="card">
            <div class="border-bottom title-part-padding">
              <h4 class="card-title mb-0">보고서 작성</h4>
            </div>
            <!-- start Default Form Elements -->
            <div class="card-body">
            <div class="col-12">
                <h4 class="card-title"><strong>보안 점검 보고서</strong></h4>
                <br>
                <form class="form-horizontal">
			  	  <div class="mb-3">
				    <label class="form-label">점검자</label>
				    <div class="d-flex">
				      <input type="text" class="form-control me-2" placeholder="소속" style="flex: 1; margin-right: 10px;" />
				      <input type="text" class="form-control me-2" placeholder="성명" style="flex: 1; margin-right: 10px;" />
				      <input type="text" class="form-control" placeholder="작성일자" style="flex: 1;" />
				    </div>
				  </div>
                  <div class="mb-3">
                    <label class="form-label">점검일자</label>
 					<input type="text" class="form-control" placeholder="점검 시작일자 ~ 점검 종료일자" />
                  </div>
                  <div class="mb-3">
                    <label class="form-label">점검위치</label>
 					<input type="text" class="form-control" placeholder="점검위치" />
                  </div>
                  <div class="mb-3">
                    <label class="form-label">점검구분</label>
 					<input type="text" class="form-control" placeholder="점검구분" />
                  </div>
                  <div class="mb-3">
                    <label class="form-label">점검내용</label>
 					<textarea class="form-control" rows="3" placeholder="점검내용"></textarea>
                  </div>
                  <div class="mb-0">
                    <label class="form-label">점검결과</label>
 					<textarea class="form-control" rows="3" placeholder="점검결과"></textarea>
                  </div>
                </form>
              </div>
             </div>
             <!-- end Default Form Elements -->
			 <div class="d-flex justify-content-end" style="padding-right: 30px; padding-bottom: 35px;">
			   <a href="/partner/report/list" class="btn btn-outline-primary me-3">이전</a>
			   <a href="${pageContext.request.contextPath}/resources/main/authentication-login.html" class="btn btn-primary">등록</a>
			 </div>
            </div>
          </div>
        </div>
      </div>
      