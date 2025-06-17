<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
.custom-height {
	height: 250px; 
	display: flex;
	align-items: center; 
	justify-content: center; 
}
.body-wrapper {
  padding: 0 15px; /* 좌우 여백 추가 */
}

.shop-detail {
  max-width: 800px; /* 최대 너비 설정 */
  margin: 0 auto; /* 가운데 정렬 */
}
</style>

<div class="main-wrapper overflow-hidden">
	<!-- ------------------------------------- -->
	<!-- banner Start -->
	<!-- ------------------------------------- -->
	<section class="bg-primary-subtle custom-height">
		<div class="container-fluid">
			<div class="text-center">
				<p class="text-primary fs-4 fw-bolder">rounge</p>
				<h1 class="fw-bolder fs-12">라운지</h1>
			</div>
		</div>
	</section>
</div>

<div class="body-wrapper">
        <div class="container-fluid">
          <div class="shop-detail">
            <div class="card shadow-none border">
              <div class="card-body p-4">
                <div class="row">
                
                <c:choose>
                <c:when test="${roungeVO.rgName eq '더 라운지' }">
                  <div class="col-lg-6">
                    <div id="sync1" class="owl-carousel owl-theme">
                      <div class="item rounded-4 overflow-hidden">
                        <img src="${pageContext.request.contextPath }/resources/assets/images/products/the01.png" alt="modernize-img" class="img-fluid">
                      </div>
                      <div class="item rounded-4 overflow-hidden">
                        <img src="${pageContext.request.contextPath }/resources/assets/images/products/the02.png" alt="modernize-img" class="img-fluid">
                      </div>
                      <div class="item rounded-4 overflow-hidden">
                        <img src="${pageContext.request.contextPath }/resources/assets/images/products/the03.png" alt="modernize-img" class="img-fluid">
                      </div>
                      <div class="item rounded-4 overflow-hidden">
                        <img src="${pageContext.request.contextPath }/resources/assets/images/products/the04.png" alt="modernize-img" class="img-fluid">
                      </div>
                      <div class="item rounded-4 overflow-hidden">
                        <img src="${pageContext.request.contextPath }/resources/assets/images/products/the05.png" alt="modernize-img" class="img-fluid">
                      </div>
                      <div class="item rounded-4 overflow-hidden">
                        <img src="${pageContext.request.contextPath }/resources/assets/images/products/the06.png" alt="modernize-img" class="img-fluid">
                      </div>
                     
                    </div>

                    <div id="sync2" class="owl-carousel owl-theme">
                      <div class="item rounded-4 overflow-hidden">
                        <img src="${pageContext.request.contextPath }/resources/assets/images/products/the01.png" alt="modernize-img" class="img-fluid">
                      </div>
                      <div class="item rounded-4 overflow-hidden">
                        <img src="${pageContext.request.contextPath }/resources/assets/images/products/the02.png" alt="modernize-img" class="img-fluid">
                      </div>
                      <div class="item rounded-4 overflow-hidden">
                        <img src="${pageContext.request.contextPath }/resources/assets/images/products/the03.png" alt="modernize-img" class="img-fluid">
                      </div>
                      <div class="item rounded-4 overflow-hidden">
                        <img src="${pageContext.request.contextPath }/resources/assets/images/products/the04.png" alt="modernize-img" class="img-fluid">
                      </div>
                      <div class="item rounded-4 overflow-hidden">
                        <img src="${pageContext.request.contextPath }/resources/assets/images/products/the05.png" alt="modernize-img" class="img-fluid">
                      </div>
                      <div class="item rounded-4 overflow-hidden">
                        <img src="${pageContext.request.contextPath }/resources/assets/images/products/the06.png" alt="modernize-img" class="img-fluid">
                      </div>
                      
                    </div>
                  </div>
                  </c:when>
                  <c:when test="${roungeVO.rgName eq '마티나 라운지' }">
                  <div class="col-lg-6">
                    <div id="sync1" class="owl-carousel owl-theme">
                      <div class="item rounded-4 overflow-hidden">
                        <img src="${pageContext.request.contextPath }/resources/assets/images/products/matina01.png" alt="modernize-img" class="img-fluid">
                      </div>
                      <div class="item rounded-4 overflow-hidden">
                        <img src="${pageContext.request.contextPath }/resources/assets/images/products/matina02.png" alt="modernize-img" class="img-fluid">
                      </div>
                      <div class="item rounded-4 overflow-hidden">
                        <img src="${pageContext.request.contextPath }/resources/assets/images/products/matina03.png" alt="modernize-img" class="img-fluid">
                      </div>
                      <div class="item rounded-4 overflow-hidden">
                        <img src="${pageContext.request.contextPath }/resources/assets/images/products/matina04.png" alt="modernize-img" class="img-fluid">
                      </div>
                      <div class="item rounded-4 overflow-hidden">
                        <img src="${pageContext.request.contextPath }/resources/assets/images/products/matina05.png" alt="modernize-img" class="img-fluid">
                      </div>
                      <div class="item rounded-4 overflow-hidden">
                        <img src="${pageContext.request.contextPath }/resources/assets/images/products/matina06.png" alt="modernize-img" class="img-fluid">
                      </div>
                    </div>

                    <div id="sync2" class="owl-carousel owl-theme">
                      <div class="item rounded-4 overflow-hidden">
                        <img src="${pageContext.request.contextPath }/resources/assets/images/products/matina01.png" alt="modernize-img" class="img-fluid">
                      </div>
                      <div class="item rounded-4 overflow-hidden">
                        <img src="${pageContext.request.contextPath }/resources/assets/images/products/matina02.png" alt="modernize-img" class="img-fluid">
                      </div>
                      <div class="item rounded-4 overflow-hidden">
                        <img src="${pageContext.request.contextPath }/resources/assets/images/products/matina03.png" alt="modernize-img" class="img-fluid">
                      </div>
                      <div class="item rounded-4 overflow-hidden">
                        <img src="${pageContext.request.contextPath }/resources/assets/images/products/matina04.png" alt="modernize-img" class="img-fluid">
                      </div>
                      <div class="item rounded-4 overflow-hidden">
                        <img src="${pageContext.request.contextPath }/resources/assets/images/products/matina05.png" alt="modernize-img" class="img-fluid">
                      </div>
                      <div class="item rounded-4 overflow-hidden">
                        <img src="${pageContext.request.contextPath }/resources/assets/images/products/matina06.png" alt="modernize-img" class="img-fluid">
                      </div>
                    </div>
                  </div>
                  </c:when>
                  <c:otherwise>
                  	<div class="col-lg-6">
                    <div id="sync1" class="owl-carousel owl-theme">
                      <div class="item rounded-4 overflow-hidden">
                        <img src="${pageContext.request.contextPath }/resources/assets/images/products/hub01.png" alt="modernize-img" class="img-fluid">
                      </div>
                      <div class="item rounded-4 overflow-hidden">
                        <img src="${pageContext.request.contextPath }/resources/assets/images/products/hub02.png" alt="modernize-img" class="img-fluid">
                      </div>
                      <div class="item rounded-4 overflow-hidden">
                        <img src="${pageContext.request.contextPath }/resources/assets/images/products/hub03.png" alt="modernize-img" class="img-fluid">
                      </div>
                      <div class="item rounded-4 overflow-hidden">
                        <img src="${pageContext.request.contextPath }/resources/assets/images/products/hub04.png" alt="modernize-img" class="img-fluid">
                      </div>
                      <div class="item rounded-4 overflow-hidden">
                        <img src="${pageContext.request.contextPath }/resources/assets/images/products/hub05.png" alt="modernize-img" class="img-fluid">
                      </div>
                      <div class="item rounded-4 overflow-hidden">
                        <img src="${pageContext.request.contextPath }/resources/assets/images/products/hub06.png" alt="modernize-img" class="img-fluid">
                      </div>
                    </div>

                    <div id="sync2" class="owl-carousel owl-theme">
                      <div class="item rounded-4 overflow-hidden">
                        <img src="${pageContext.request.contextPath }/resources/assets/images/products/hub01.png" alt="modernize-img" class="img-fluid">
                      </div>
                      <div class="item rounded-4 overflow-hidden">
                        <img src="${pageContext.request.contextPath }/resources/assets/images/products/hub02.png" alt="modernize-img" class="img-fluid">
                      </div>
                      <div class="item rounded-4 overflow-hidden">
                        <img src="${pageContext.request.contextPath }/resources/assets/images/products/hub03.png" alt="modernize-img" class="img-fluid">
                      </div>
                      <div class="item rounded-4 overflow-hidden">
                        <img src="${pageContext.request.contextPath }/resources/assets/images/products/hub04.png" alt="modernize-img" class="img-fluid">
                      </div>
                      <div class="item rounded-4 overflow-hidden">
                        <img src="${pageContext.request.contextPath }/resources/assets/images/products/hub05.png" alt="modernize-img" class="img-fluid">
                      </div>
                      <div class="item rounded-4 overflow-hidden">
                        <img src="${pageContext.request.contextPath }/resources/assets/images/products/hub06.png" alt="modernize-img" class="img-fluid">
                      </div>
                    </div>
                  </div>
                  </c:otherwise>
                  </c:choose>
                  
                  <div class="col-lg-6">
                    <div class="shop-content">
<!--                       <div class="d-flex align-items-center gap-2 mb-2"> -->
<!--                         <span class="badge text-bg-success fs-2 fw-semibold">rounge</span> -->
<!--                         <span class="fs-2">ticket</span> -->
<!--                       </div> -->
<!--                       <hr> -->
                      <h4><strong>${roungeVO.rgName } 이용권</strong></h4>
                      <p class="mb-3">오늘부터 이용가능.</p>
                      <h4 class="mb-3">
                        ${roungeVO.rgCost } 원
                      </h4>
                      <div class="d-flex align-items-center gap-8 pb-4 border-bottom">
                        <ul class="list-unstyled d-flex align-items-center mb-0">
                          <li>
                            <a class="me-1" href="javascript:void(0)">
                              <i class="ti ti-star text-warning fs-4"></i>
                            </a>
                          </li>
                          <li>
                            <a class="me-1" href="javascript:void(0)">
                              <i class="ti ti-star text-warning fs-4"></i>
                            </a>
                          </li>
                          <li>
                            <a class="me-1" href="javascript:void(0)">
                              <i class="ti ti-star text-warning fs-4"></i>
                            </a>
                          </li>
                          <li>
                            <a class="me-1" href="javascript:void(0)">
                              <i class="ti ti-star text-warning fs-4"></i>
                            </a>
                          </li>
                          <li>
                            <a href="javascript:void(0)">
                              <i class="ti ti-star text-warning fs-4"></i>
                            </a>
                          </li>
                        </ul>
                        <a href="javascript:void(0)">(${roungeVO.rgReview } reviews)</a>
                      </div>
						<form action="/user/reserve/rounge/registerForm" id="rgForm" method="post">
						  <div class="d-flex align-items-center gap-7 pb-7 mb-7 border-bottom">
						    <h6 class="mb-0 fs-4">QTY:</h6>
						    <div class="input-group input-group-sm rounded">
						      <button class="btn minus min-width-40 py-0 border-end border-muted fs-5 border-end-0 text-muted" type="button" id="add1">
						        <i class="ti ti-minus"></i>
						      </button>
						      <input type="text" name="rrCount" class="min-width-40 flex-grow-0 border border-muted text-muted fs-4 fw-semibold form-control text-center qty" placeholder="" aria-label="Example text with button addon" aria-describedby="add1" value="1">
						      <button class="btn min-width-40 py-0 border border-muted fs-5 border-start-0 text-muted add" type="button" id="addo2">
						        <i class="ti ti-plus"></i>
						      </button>
						    </div>
						    <input type="hidden" name="rgNo" class="min-width-40 flex-grow-0 border border-muted text-muted fs-4 fw-semibold form-control text-center qty" aria-label="Example text with button addon" aria-describedby="add1" value="${roungeVO.rgNo}">
						    <input type="hidden" name="rgName" class="min-width-40 flex-grow-0 border border-muted text-muted fs-4 fw-semibold form-control text-center qty" aria-label="Example text with button addon" aria-describedby="add1" value="${roungeVO.rgName}">
						    <input type="hidden" name="rgCost" class="min-width-40 flex-grow-0 border border-muted text-muted fs-4 fw-semibold form-control text-center qty" aria-label="Example text with button addon" aria-describedby="add1" value="${roungeVO.rgCost}">
						  </div>
						  <div class="d-sm-flex align-items-center gap-6 pt-8 mb-7">
						    <button type="submit" class="btn d-block btn-primary px-5 py-8 mb-6 mb-sm-0">Buy Now</button>
						  </div>
						</form>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="card shadow-none border">
              <div class="card-body p-4">
                <ul class="nav nav-pills user-profile-tab border-bottom" id="pills-tab" role="tablist">
                  <li class="nav-item" role="presentation">
                    <button class="nav-link position-relative rounded-0 active d-flex align-items-center justify-content-center bg-transparent fs-3 py-6" id="pills-description-tab" data-bs-toggle="pill" data-bs-target="#pills-description" type="button" role="tab" aria-controls="pills-description" aria-selected="true">
                      Description
                    </button>
                  </li>
                  <li class="nav-item" role="presentation">
                    <button class="nav-link position-relative rounded-0 d-flex align-items-center justify-content-center bg-transparent fs-3 py-6" id="pills-reviews-tab" data-bs-toggle="pill" data-bs-target="#pills-reviews" type="button" role="tab" aria-controls="pills-reviews" aria-selected="false">
                      Reviews
                    </button>
                  </li>
                </ul>
                <div class="tab-content pt-4" id="pills-tabContent">
                  <div class="tab-pane fade show active" id="pills-description" role="tabpanel" aria-labelledby="pills-description-tab" tabindex="0">
                    <h5 class="fs-5 mb-7">
                      	여행의 시작을 여유롭고 편안하게, 국내 공항 ${roungeVO.rgName } 이용권
                    </h5>
                    ${roungeVO.rgContent }
                  </div>
                  <div class="tab-pane fade" id="pills-reviews" role="tabpanel" aria-labelledby="pills-reviews-tab" tabindex="0">
                    <div class="row">
                      <div class="col-lg-4 d-flex align-items-stretch">
                        <div class="card shadow-none border w-100 mb-7 mb-lg-0">
                          <div class="card-body text-center p-4 d-flex flex-column justify-content-center">
                            <h6 class="mb-3">Average Rating</h6>
                            <h2 class="text-primary mb-3 fw-semibold fs-9">4/5</h2>
                            <ul class="list-unstyled d-flex align-items-center justify-content-center mb-0">
                              <li>
                                <a class="me-1" href="javascript:void(0)">
                                  <i class="ti ti-star text-warning fs-6"></i>
                                </a>
                              </li>
                              <li>
                                <a class="me-1" href="javascript:void(0)">
                                  <i class="ti ti-star text-warning fs-6"></i>
                                </a>
                              </li>
                              <li>
                                <a class="me-1" href="javascript:void(0)">
                                  <i class="ti ti-star text-warning fs-6"></i>
                                </a>
                              </li>
                              <li>
                                <a class="me-1" href="javascript:void(0)">
                                  <i class="ti ti-star text-warning fs-6"></i>
                                </a>
                              </li>
                              <li>
                                <a href="javascript:void(0)">
                                  <i class="ti ti-star text-warning fs-6"></i>
                                </a>
                              </li>
                            </ul>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-4 d-flex align-items-stretch">
                        <div class="card shadow-none border w-100 mb-7 mb-lg-0">
                          <div class="card-body p-4 d-flex flex-column justify-content-center">
                            <div class="d-flex align-items-center gap-9 mb-3">
                              <span class="flex-shrink-0 fs-2">1 Stars</span>
                              <div class="progress bg-primary-subtle w-100 h-4">
                                <div class="progress-bar" role="progressbar" aria-valuenow="45" aria-valuemin="0" aria-valuemax="100" style="width: 45%;"></div>
                              </div>
                              <h6 class="mb-0">(485)</h6>
                            </div>
                            <div class="d-flex align-items-center gap-9 mb-3">
                              <span class="flex-shrink-0 fs-2">2 Stars</span>
                              <div class="progress bg-primary-subtle w-100 h-4">
                                <div class="progress-bar" role="progressbar" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100" style="width: 25%;"></div>
                              </div>
                              <h6 class="mb-0">(215)</h6>
                            </div>
                            <div class="d-flex align-items-center gap-9 mb-3">
                              <span class="flex-shrink-0 fs-2">3 Stars</span>
                              <div class="progress bg-primary-subtle w-100 h-4">
                                <div class="progress-bar" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width: 20%;"></div>
                              </div>
                              <h6 class="mb-0">(110)</h6>
                            </div>
                            <div class="d-flex align-items-center gap-9 mb-3">
                              <span class="flex-shrink-0 fs-2">4 Stars</span>
                              <div class="progress bg-primary-subtle w-100 h-4">
                                <div class="progress-bar" role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" style="width: 80%;"></div>
                              </div>
                              <h6 class="mb-0">(620)</h6>
                            </div>
                            <div class="d-flex align-items-center gap-9">
                              <span class="flex-shrink-0 fs-2">5 Stars</span>
                              <div class="progress bg-primary-subtle w-100 h-4">
                                <div class="progress-bar" role="progressbar" aria-valuenow="12" aria-valuemin="0" aria-valuemax="100" style="width: 12%;"></div>
                              </div>
                              <h6 class="mb-0">(160)</h6>
                            </div>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-4 d-flex align-items-stretch">
                        <div class="card shadow-none border w-100 mb-7 mb-lg-0">
                          <div class="card-body p-4 d-flex flex-column justify-content-center">
                            <button type="button" class="btn btn-outline-primary d-flex align-items-center gap-2 mx-auto">
                              <i class="ti ti-pencil fs-7"></i>Write an Review
                            </button>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
     

