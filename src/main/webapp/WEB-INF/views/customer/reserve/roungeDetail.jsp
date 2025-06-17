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
        <div class="row justify-content-center"> <!-- 가운데 정렬을 위한 클래스 추가 -->
             <div class="col-lg-4">
		  <!-- start With controls -->
		  <div class="card">
		    <div class="card-body" style="height: 480px;">
		      <div id="carouselExampleControls" class="carousel slide carousel-dark" data-bs-ride="carousel" style="margin-top: 30px;">
		        <div class="carousel-inner">
			    <c:choose>
			        <c:when test="${roungeVO.rgName eq '더 라운지'}">
			            <div class="carousel-item active">
			                <img src="${pageContext.request.contextPath }/resources/assets/images/products/the01.png" class="d-block w-100" alt="modernize-img" style="max-height: 350px; object-fit: cover;" />
			            </div>
			            <div class="carousel-item ">
			                <img src="${pageContext.request.contextPath }/resources/assets/images/products/the02.png" class="d-block w-100" alt="modernize-img" style="max-height: 350px; object-fit: cover;" />
			            </div>
			            <div class="carousel-item ">
			                <img src="${pageContext.request.contextPath }/resources/assets/images/products/the03.png" class="d-block w-100" alt="modernize-img" style="max-height: 350px; object-fit: cover;" />
			            </div>
			            <div class="carousel-item ">
			                <img src="${pageContext.request.contextPath }/resources/assets/images/products/the04.png" class="d-block w-100" alt="modernize-img" style="max-height: 350px; object-fit: cover;" />
			            </div>
			            <div class="carousel-item ">
			                <img src="${pageContext.request.contextPath }/resources/assets/images/products/the05.png" class="d-block w-100" alt="modernize-img" style="max-height: 350px; object-fit: cover;" />
			            </div>
			            <div class="carousel-item ">
			                <img src="${pageContext.request.contextPath }/resources/assets/images/products/the06.png" class="d-block w-100" alt="modernize-img" style="max-height: 350px; object-fit: cover;" />
			            </div>
			        </c:when>
			        <c:when test="${roungeVO.rgName eq '마티나 라운지'}">
			            <div class="carousel-item active">
			                <img src="${pageContext.request.contextPath }/resources/assets/images/products/matina01.png" class="d-block w-100" alt="modernize-img" style="max-height: 350px; object-fit: cover;" />
			            </div>
			            <div class="carousel-item ">
			                <img src="${pageContext.request.contextPath }/resources/assets/images/products/matina02.png" class="d-block w-100" alt="modernize-img" style="max-height: 350px; object-fit: cover;" />
			            </div>
			            <div class="carousel-item ">
			                <img src="${pageContext.request.contextPath }/resources/assets/images/products/matina03.png" class="d-block w-100" alt="modernize-img" style="max-height: 350px; object-fit: cover;" />
			            </div>
			            <div class="carousel-item ">
			                <img src="${pageContext.request.contextPath }/resources/assets/images/products/matina04.png" class="d-block w-100" alt="modernize-img" style="max-height: 350px; object-fit: cover;" />
			            </div>
			            <div class="carousel-item ">
			                <img src="${pageContext.request.contextPath }/resources/assets/images/products/matina05.png" class="d-block w-100" alt="modernize-img" style="max-height: 350px; object-fit: cover;" />
			            </div>
			            <div class="carousel-item ">
			                <img src="${pageContext.request.contextPath }/resources/assets/images/products/matina06.png" class="d-block w-100" alt="modernize-img" style="max-height: 350px; object-fit: cover;" />
			            </div>
			        </c:when>
			        <c:otherwise>
			            <div class="carousel-item active">
			                <img src="${pageContext.request.contextPath }/resources/assets/images/products/hub01.png" class="d-block w-100" alt="modernize-img" style="max-height: 350px; object-fit: cover;" />
			            </div>
			            <div class="carousel-item ">
			                <img src="${pageContext.request.contextPath }/resources/assets/images/products/hub02.png" class="d-block w-100" alt="modernize-img" style="max-height: 350px; object-fit: cover;" />
			            </div>
			            <div class="carousel-item ">
			                <img src="${pageContext.request.contextPath }/resources/assets/images/products/hub03.png" class="d-block w-100" alt="modernize-img" style="max-height: 350px; object-fit: cover;" />
			            </div>
			            <div class="carousel-item ">
			                <img src="${pageContext.request.contextPath }/resources/assets/images/products/hub04.png" class="d-block w-100" alt="modernize-img" style="max-height: 350px; object-fit: cover;" />
			            </div>
			            <div class="carousel-item ">
			                <img src="${pageContext.request.contextPath }/resources/assets/images/products/hub05.png" class="d-block w-100" alt="modernize-img" style="max-height: 350px; object-fit: cover;" />
			            </div>
			            <div class="carousel-item ">
			                <img src="${pageContext.request.contextPath }/resources/assets/images/products/hub06.png" class="d-block w-100" alt="modernize-img" style="max-height: 350px; object-fit: cover;" />
			            </div>
			        </c:otherwise>
			    </c:choose>
			</div>
		        <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-bs-slide="prev">
		          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
		          <span class="visually-hidden">Previous</span>
		        </a>
		        <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-bs-slide="next">
		          <span class="carousel-control-next-icon" aria-hidden="true"></span>
		          <span class="visually-hidden">Next</span>
		        </a>
		      </div>
		    </div>
		  </div>
		  <!-- end With controls -->
		</div>

            <div class="col-lg-4 d-flex align-items-stretch"> 
                <!-- start Issue Tracking -->
                
               <div class="card w-100" > 
   			 
	        <div class="card-body border-top">
	            <h3 class="title"><strong>라운지 이용권</strong></h3>
	            <hr>
	             <div class="row">
                    <div class="col-12">
                        <div class="mb-3">
                            <label for="open" class="form-label">라운지 명</label>
                            <input type="text" name="rgName" class="form-control" id="open" placeholder="${roungeVO.rgName }" readonly="readonly"/>
                        </div>
                    </div>
                </div>
	             <div class="row">
                    <div class="col-12">
                        <div class="mb-3">
                            <label for="open" class="form-label">가격</label>
                            <input type="text" name="rgCost" class="form-control" id="open" placeholder="${roungeVO.rgCost } 원" readonly="readonly"/>
                        </div>
                    </div>
                </div>
                <form action="/customer/reserve/rounge/registerForm" id="rgForm" method="post">
                 <div class="row">
                    <div class="col-12">
                        <div class="mb-3">
                            <label for="open" class="form-label">수량</label>
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
						    <input type="hidden" name="rgName" class="mincjtqjs-width-40 flex-grow-0 border border-muted text-muted fs-4 fw-semibold form-control text-center qty" aria-label="Example text with button addon" aria-describedby="add1" value="${roungeVO.rgName}">
						    <input type="hidden" name="rgCost" class="min-width-40 flex-grow-0 border border-muted text-muted fs-4 fw-semibold form-control text-center qty" aria-label="Example text with button addon" aria-describedby="add1" value="${roungeVO.rgCost}">
                        </div>
                    </div>
                </div>
	            <div class="text-end">
				    <button type="submit" class="btn btn-primary" id="submitBtn">
				        확인
				    </button>
				</div>
			    </form>
	        </div>
	</div>


                <!-- end Issue Tracking -->
            </div>
        </div>
        <!-- End row -->
        <div class="container my-4"> <!-- 추가된 container -->
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
                <div class="d-flex align-items-center">
		                    <img src="${pageContext.request.contextPath}/resources/assets/images/alert/alert11.png" alt="아이콘" style="width: 30px; height: 30px; margin-right: 10px;">
		                    <h2 class="mb-0"><strong>사용 방법</strong></h2>
		                </div><br><br>
                <h5><strong>여행의 시작을 여유롭고 편안하게, 국내 공항 ${roungeVO.rgName } 이용권</strong></h5>
                <hr>${roungeVO.rgContent }<br><br>
                
                
							・이용권 구매 <strong>(유효기간 내 이용가능)</strong><br>
							・이메일로 바우처 발송 앱 모바일 바우처 수신<br>
							・라운지 위치 확인<br>
							・이용하는 라운지에 성명 , 휴대번호 확인 후 입장.<br>
							・유효기간 : ~ 2025.12.31.<br>
            </div>
            <div class="tab-pane fade" id="pills-reviews" role="tabpanel" aria-labelledby="pills-reviews-tab" tabindex="0">
                <div class="row justify-content-center"> <!-- 가운데 정렬을 위한 클래스 추가 -->
                    <div class="col-lg-4 d-flex align-items-stretch"> <!-- 너비 조정 -->
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
                    <div class="col-lg-4 d-flex align-items-stretch"> <!-- 너비 조정 -->
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
                    <div class="col-lg-4 d-flex align-items-stretch"> <!-- 너비 조정 -->
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




