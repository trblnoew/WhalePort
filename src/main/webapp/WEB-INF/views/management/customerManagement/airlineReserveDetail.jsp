<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<style>
    .table th {
        text-align: center;
    }
    .table td {
        text-align: center;
    }
    
    #preThisRes {
    width: 100%;
    height: 300px; /* 원하는 높이 설정 */
	}

    
</style>



<div class="body-wrapper">
    <div class="container-fluid">
    
        <div class="card bg-info-subtle shadow-none position-relative overflow-hidden mb-4">
            <div class="card-body px-4 py-3">
              <div class="row align-items-center" style="margin-top:20px;">
                <div class="col-9">
                  <h4 class="fw-semibold mb-8">항공편 예약 상세</h4>
                  <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                      <li class="breadcrumb-item">
                        <a class="text-muted text-decoration-none" href="/common/home">DashBoard</a>
                      </li>
                      <li class="breadcrumb-item" aria-current="page">항공편 예약 상세</li>
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
        
        
        
                  <!-- start Form with view only -->
          <div class="card">
            <div class="card-header text-bg-primary">
              <h5 class="mb-0 text-white">항공편 예약 상세</h5>
            </div>
            <form class="form-horizontal">
              <div class="form-body">
                <div class="card-body">
                  <h5 class="card-title mb-0">예약 정보</h5>
                </div>
                <hr class="m-0" />
                <div class="card-body">
                  <div class="row">
                    <div class="col-md-6">
                      <div class="form-group row">
                        <label class="form-label text-end col-md-3">예약 번호:</label>
                        <div class="col-md-9">
                          <p>
                          	${fn:toUpperCase(ticketingVO.tkGroup)}
                          </p>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-md-6">
                      <div class="form-group row">
                        <label class="form-label text-end col-md-3">영문 이름:</label>
                        <div class="col-md-9">
                          <p>${ticketingVO.tkLastname }</p>
                        </div>
                      </div>
                    </div>
                    <!--/span-->
                    <div class="col-md-6">
                      <div class="form-group row">
                        <label class="form-label text-end col-md-3">영문 성:</label>
                        <div class="col-md-9">
                          <p>${ticketingVO.tkEngfirst  }</p>
                        </div>
                      </div>
                    </div>
                    <!--/span-->
                  </div>
                  <!--/row-->
                  <div class="row">
                    <div class="col-md-6">
                      <div class="form-group row">
                        <label class="form-label text-end col-md-3">이름:</label>
                        <div class="col-md-9">
                          <p>${ticketingVO.tkKrname }</p>
								<!-- 한글이름 아직 구현 안됨 -->
                        </div>
                      </div>
                    </div>
                    <!--/span-->
                    <div class="col-md-6">
                      <div class="form-group row">
                        <label class="form-label text-end col-md-3">생년월일:</label>
                        <div class="col-md-9">
                          <p>${fn:split(ticketingVO.tkBirth, ' ')[0] }</p>
                        </div>
                      </div>
                    </div>
                    <!--/span-->
                  </div>
                  <!--/row-->
                  <div class="row">
                    <div class="col-md-6">
                      <div class="form-group row">
                        <label class="form-label text-end col-md-3">이메일:</label>
                        <div class="col-md-9">
                          <p>${ticketingVO.tkEmail }</p>
                        </div>
                      </div>
                    </div>
                    <!--/span-->
                    <div class="col-md-6">
                      <div class="form-group row">
                        <label class="form-label text-end col-md-3">전화번호:</label>
                        <div class="col-md-9">
                          <p>${ticketingVO.tkTel }</p>
                        </div>
                      </div>
                    </div>
                    <!--/span-->
                  </div>
                  <!--/row-->
                  <div class="row">
                    <div class="col-md-6">
                      <div class="form-group row">
                        <label class="form-label text-end col-md-3">출발일시:</label>
                        <div class="col-md-9">
                          <p>${ticketingVO.tkDepartdate}</p>
                        </div>
                      </div>
                    </div>
                    <!--/span-->
                    <div class="col-md-6">
                      <div class="form-group row">
                        <label class="form-label text-end col-md-3">도착일시:</label>
                        <div class="col-md-9">
                          <p>${ticketingVO.tkArridate}</p>
                        </div>
                      </div>
                    </div>
                    <!--/span-->
                  </div>
                  <!--/row-->
                  <div class="row">
                    <div class="col-md-6">
                      <div class="form-group row">
                        <label class="form-label text-end col-md-3">성별:</label>
                        <div class="col-md-9">
                          <p>${ticketingVO.tkGender eq 'M' ? '남자' : '여자'}</p>
                        </div>
                      </div>
                    </div>
                    <!--/span-->
                    <div class="col-md-6">
                      <div class="form-group row">
                        <label class="form-label text-end col-md-3">결제금액:</label>
                        <div class="col-md-9">
                          <p> <fmt:formatNumber value="${ticketingVO.tkPrice}" pattern="#,###" /></p>
                        </div>
                      </div>
                    </div>
                    <!--/span-->
                  </div>
                  <!--/row-->

                </div>
                <hr class="m-0" />
                <div class="card-body">
                  <h5 class="card-title mb-0">고객 정보</h5>
                </div>
                <hr class="m-0" />
                <div class="card-body">
                  <div class="row">
                    <div class="col-md-6">
                      <div class="form-group row">
                        <label class="form-label text-end col-md-3">이름:</label>
                        <div class="col-md-9">
                          <p>${customerVO.cusName }</p>
                        </div>
                      </div>
                    </div>
                    <div class="col-md-6">
                      <div class="form-group row">
                        <label class="form-label text-end col-md-3">성별:</label>
                        <div class="col-md-9">
                          <p>${customerVO.cusGender eq 'M' ? '남자':'여자' }</p>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-md-6">
                      <div class="form-group row">
                        <label class="form-label text-end col-md-3">아이디:</label>
                        <div class="col-md-9">
                          <p>${customerVO.cusId }</p>
                        </div>
                      </div>
                    </div>
                    <!--/span-->
                    <div class="col-md-6">
                      <div class="form-group row">
                        <label class="form-label text-end col-md-3">전화번호:</label>
                        <div class="col-md-9">
                          <p>${customerVO.cusTel }</p>
                        </div>
                      </div>
                    </div>
                    <!--/span-->
                  </div>
                  <!--/row-->
                  <div class="row">
                    <div class="col-md-6">
                      <div class="form-group row">
                        <label class="form-label text-end col-md-3">이메일:</label>
                        <div class="col-md-9">
                          <p>${customerVO.cusEmail }</p>
                        </div>
                      </div>
                    </div>
                    <!--/span-->
                    <div class="col-md-6">
                      <div class="form-group row">
                        <label class="form-label text-end col-md-3">생년월일:</label>
                        <div class="col-md-9">
                          <p>${fn:split(customerVO.cusBirth, ' ')[0] }</p>
                        </div>
                      </div>
                    </div>
                    <!--/span-->
                  </div>
                </div>
                
						<div class="col-12">
							<div class="d-flex align-items-center justify-content-end mt-4 gap-6">
								<button type="button" class="btn btn-danger" id="cancelBtn">예약취소</button>
                       			<a href="/management/customer/airlineReserveList" class="btn btn-outline-primary me-3">이전</a>
							</div>
						</div>
                
              </div>
            </form>
          </div>
          <!-- start Form with view only -->
        
        <form action="/management/customer/airlineReserveCancel" id="formCancel">
			<input type="hidden" name="tkNo" id="tkNo" value="${ticketingVO.tkNo }" />
        </form>



              
              
            </div>
          </div>
        
        
<script>
$(function(){
	$("#cancelBtn").on("click", function(){
		$("#formCancel").submit();
		
	});
});


</script>