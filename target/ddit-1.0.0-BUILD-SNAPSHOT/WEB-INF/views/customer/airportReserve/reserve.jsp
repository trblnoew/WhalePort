<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<style>
.flight-container:hover{
	background-color: #f0f8ff; /* 배경색을 연한 파란색으로 변경 */
    border: 1px solid #333; /* 테두리 추가 */
    cursor: pointer; /* 마우스 커서를 포인터로 변경 */
}

.banner-section {
       background-color: #eef2ff; 
        padding: 50px; /* 내부 여백 추가 */ 
        border-radius: 15px; /* 각을 둥글게*/ 
/*         box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1); /* 그림자 추가 (선택 사항) */  */
         
   }
.flight-container {
    display: flex;
    justify-content: space-between;
    align-items: center;
    border: 1px solid #ddd;  /* 이 줄을 주석 처리하거나 삭제하세요 */
    padding: 20px;
    border-radius: 8px;
    margin: 20px;
/*     background-image: url('${pageContext.request.contextPath}/resources/assets/images/airport/ticket.png'); /* 여기에 원하는 이미지의 URL을 넣으세요 */ */
/*     background-size: cover; /* 배경 이미지가 요소를 가득 채우도록 설정 */ */
/*     background-position: center; /* 배경 이미지의 위치를 중앙으로 설정 */ */
}

.badge-container {
    position: inherit; /* 배지를 고정시키기 위해 절대 위치 지정 */
    top: 10px; /* 위에서의 거리 */
    left: 10px; /* 왼쪽에서의 거리 */
    z-index: 10; /* 다른 요소들보다 위에 보이도록 설정 */
}

.flight-info {
     display: flex; 
      margin: 30px 0; /* 위아래 여백 추가 */
/*     flex-direction: row; */
/*     align-items: center; */
/* /*     border-right: 1px solid #ddd;  */ */
/*     padding-right: 20px; */
/*     margin-right: 20px; */
/*     padding-top: 40px; /* 배지와 겹치지 않도록 위쪽 패딩 추가 */ */
}

        .flight-detail {
            margin-left: 10px;
        }

        .flight-times {
            margin-left: 30px;
        }

        .price-section {
            text-align: right;
            font-size: 20px;
            color: #f55;
        }

         .flight-times div { 
             margin-bottom: 10px; 
        } 

         .recommend-badge { 
            background-color: #f55; 
             color: white; 
             padding: 5px 10px; 
             border-radius: 5px; 
             font-size: 14px; 
             margin-right: 10px; 
        } 

        .seat-left {
            background-color: #fdd7c4;
            color: #f55;
            padding: 5px 10px;
            border-radius: 5px;
            font-size: 14px;
        }

        .flight-logo img {
            width: 25px;
            height: 25px;
        }

        .flight-price {
            font-size: 24px;
            color: #f55;
            font-weight: bold;
        }

        .details-link {
            display: block;
            color: #666;
            text-decoration: none;
            margin-top: 10px;
        }

        .details-link:hover {
            text-decoration: underline;
        }
        .custom-height {
	height: 250px; 
	display: flex;
	align-items: center; 
	justify-content: center; 
}
.shop-part {
    max-width: 1200px; /* 원하는 최대 너비 설정 */
    margin: 0 auto; /* 중앙 정렬을 위한 자동 마진 */
    padding: 0 15px; /* 양쪽 여백 추가 */
    
}

.shop-filters {
    width: 200px; /* 필터 영역의 너비 설정 */
}

.card {
    margin-bottom: 20px; /* 카드 간의 간격 추가 */
}
.ticket {
height: 500px; /* 높이를 설정하여 스크롤이 가능하도록 함 */
    overflow-y: auto; /* 세로 스크롤 추가 */

}
.form-control {
    background-color: white; /* 배경색을 흰색으로 설정 */
}
</style>
<div class="main-wrapper overflow-hidden">
	<!-- ------------------------------------- -->
	<!-- banner Start -->
	<!-- ------------------------------------- -->
	<section class="bg-primary-subtle custom-height">
		<div class="container-fluid">
			<div class="text-center">
				<p class="text-primary fs-4 fw-bolder">airplane</p>
				<h1 class="fw-bolder fs-12">항공권</h1>
			</div>
		</div>
	</section>
          <div class="banner-section mt-0"> <!-- 상단 마진을 0으로 설정 -->
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-lg-12">
                            <div class="banner-content text-center">
                                <form class="d-flex justify-content-between mt-4" action="/customer/reserve" method="get">
<!--                                     <div class="form-group me-2"> -->
<!--                                         <input type="text" class="form-control" placeholder="출발지" name="scBoarding"/> -->
<!--                                     </div> -->
<!--                                     <div class="form-group me-2"> -->
<!--                                         <input type="text" class="form-control" placeholder="도착지" name="scArrived"/> -->
<!--                                     </div> -->
	                                <div class="form-group me-2" style="width:200px;">
                                        <select name="scBoarding" class="form-control scBoarding">
                                            <option value="">출발지</option>
                                            <option value="ICN">서울</option>
                                            <option value="CGK">자카르타</option>
                                            <option value="PKX">베이징</option>
                                            <option value="PEK">베이징</option>
                                            <option value="FCO">로마</option>
                                            <option value="LHR">런던</option>
                                            <option value="IAD">워싱턴</option>
                                            <option value="HND">도쿄(하네다)</option>
                                            <option value="JFK">뉴욕</option>
                                            <option value="CDG">파리</option>
                                            <option value="YYZ">토론토</option>
                                            <option value="NRT">도쿄(나리타)</option>
                                            <option value="ORD">시카고</option>
                                        </select>
                                    </div>
	                                <div class="form-group me-2" style="width:200px;">
                                        <select name="scArrived" class="form-control scArrived">
                                            <option value="">도착지</option>
                                            <option value="ICN">서울</option>
                                            <option value="CGK">자카르타</option>
                                            <option value="PKX">베이징(다싱)</option>
                                            <option value="PEK">베이징(서우두)</option>
                                            <option value="FCO">로마</option>
                                            <option value="LHR">런던</option>
                                            <option value="IAD">워싱턴</option>
                                            <option value="HND">도쿄(하네다)</option>
                                            <option value="JFK">뉴욕</option>
                                            <option value="CDG">파리</option>
                                            <option value="YYZ">토론토</option>
                                            <option value="NRT">도쿄(나리타)</option>
                                            <option value="ORD">시카고</option>
                                        </select>
                                    </div>
                                    <div class="d-flex align-items-center me-6"> <!-- Flexbox를 사용하여 나란히 배치 -->
                                        <input type="date" class="form-control me-2 scStdate" name="scStdate" value=""/>
                                        <span>~</span>
                                        <input type="date" class="form-control ms-2 scStd" name="scStd" value="${scStd }"/>
                                    </div>
                                    <div class="form-group me-2" style="width:150px;">
                                        <select class="form-control">
                                            <option value="adult">성인</option>
                                            <option value="child">어린이</option>
                                            <option value="baby">유아</option>
                                        </select>  
                                    </div>
                                    <div class="form-group me-2">
                                        <select class="form-control cusCnt" name="cusCnt">
                                            <option value="0">인원</option>
                                            <option value="1">1</option>
                                            <option value="2">2</option>
                                            <option value="3">3</option>
                                            <option value="4">4</option>
                                            <option value="5">5</option>
                                        </select>
                                    </div>
                                    <button type="submit" class="btn btn-primary">항공권 검색</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
</div>
<div class="col-8 mx-auto" style="margin-top:30px;" >
<p style="text-align: right;">※ 본 데이터는 <span style="color: blue;">공공 데이터 API</span>를 참조하였습니다.</p>
              <!-- start Person Info -->
              <c:if test="${searchList != null }">
              <div class="card">
                <div class="card-header text-bg-primary">
                  <h4 class="mb-0 text-white">항공편 조회</h4>
                </div>
	<div class="container-fluid">
	          <div class="card position-relative overflow-hidden">
	            <div class="shop-part d-flex w-100">
	              <div class="shop-filters flex-shrink-0 border-end d-none d-lg-block">
	                
	                <ul class="list-group pt-2 border-bottom rounded-0">
	                  <h6 class="my-3 mx-4">Sort By</h6>
	                  <li class="list-group-item border-0 p-0 mx-4 mb-2">
	                    <a class="d-flex align-items-center gap-6 list-group-item-action text-dark px-3 py-6 rounded-1" href="javascript:void(0)" data-type="latest">
	                      <i class="ti ti-ad-2 fs-5"></i>최신순
	                    </a>
	                  </li>
	                  <li class="list-group-item border-0 p-0 mx-4 mb-2">
	                    <a class="d-flex align-items-center gap-6 list-group-item-action text-dark px-3 py-6 rounded-1" href="javascript:void(0)" data-type="high">
	                      <i class="ti ti-sort-ascending-2 fs-5"></i>가격 : 높은 순
	                    </a>
	                  </li>
	                  <li class="list-group-item border-0 p-0 mx-4 mb-2">
	                    <a class="d-flex align-items-center gap-6 list-group-item-action text-dark px-3 py-6 rounded-1" href="javascript:void(0)" data-type="low">
	                      <i class="ti ti-sort-descending-2 fs-5"></i>
	                      </i>가격 : 낮은 순
	                    </a>
	                  </li>
	                  <li class="list-group-item border-0 p-0 mx-4 mb-2">
	                    <a class="d-flex align-items-center gap-6 list-group-item-action text-dark px-3 py-6 rounded-1" href="javascript:void(0)" data-type="sale">
	                      <i class="ti ti-ad-2 fs-5"></i>할인 항공권
	                    </a>
	                  </li>
	                </ul>
	                
	                <div class="by-pricing border-bottom rounded-0">
	                  <h6 class="mt-4 mb-3 mx-4 fw-semibold">By Pricing</h6>
	                  <div class="pb-4 px-4">
	                    <div class="form-check py-2 mb-0">
	                      <input class="form-check-input p-2" type="radio" name="exampleRadios" id="exampleRadios5" value="option1" checked>
	                      <label class="form-check-label d-flex align-items-center ps-2" for="exampleRadios5">
	                         	전체
	                      </label>
	                    </div>
	                    <div class="form-check py-2 mb-0">
	                      <input class="form-check-input p-2" type="radio" name="exampleRadios" id="exampleRadios6" value="option1">
	                      <label class="form-check-label d-flex align-items-center ps-2" for="exampleRadios6">
	                        50,000 ~ 100,000
	                      </label>
	                    </div>
	                    <div class="form-check py-2 mb-0">
	                      <input class="form-check-input p-2" type="radio" name="exampleRadios" id="exampleRadios7" value="option1">
	                      <label class="form-check-label d-flex align-items-center ps-2" for="exampleRadios7">
	                        100,000 ~ 200,000
	                      </label>
	                    </div>
	                    <div class="form-check py-2 mb-0">
	                      <input class="form-check-input p-2" type="radio" name="exampleRadios" id="exampleRadios8" value="option1">
	                      <label class="form-check-label d-flex align-items-center ps-2" for="exampleRadios8">
	                        200,000 ~ 300,000
	                      </label>
	                    </div>
	                    <div class="form-check py-2 mb-0">
	                      <input class="form-check-input p-2" type="radio" name="exampleRadios" id="exampleRadios9" value="option1">
	                      <label class="form-check-label d-flex align-items-center ps-2" for="exampleRadios9">
	                         300,000 이상
	                      </label>
	                    </div>
	                  </div>
	                </div>
	                
	                <div class="p-4">
	                  <a href="javascript:void(0)" class="btn btn-primary w-100">초기화</a>
	                </div>
	              </div>
	              <div class="card-body p-4 pb-0">
	                <div class="d-flex justify-content-between align-items-center gap-6 mb-4">
	                  <a class="btn btn-primary d-lg-none d-flex" data-bs-toggle="offcanvas" href="#filtercategory" role="button" aria-controls="filtercategory">
	                    <i class="ti ti-menu-2 fs-6"></i>
	                  </a>
	                  <h5 class="fs-7 mb-0 d-none d-lg-block"> 
	                  <c:choose>
	                  	<c:when test="${level == '1' }">출국 항공편</c:when>
	                  	<c:otherwise>입국 항공편</c:otherwise>
	                  </c:choose>
	                  
	                  </h5>
	                  <form class="position-relative">
	                    <input type="text" class="form-control search-chat py-2 ps-5" id="text-srh" placeholder="항공권 조회 ">
	                    <i class="ti ti-search position-absolute top-50 start-0 translate-middle-y fs-6 text-dark ms-3"></i>
	                  </form>
	                </div>
	                <div class="row">
	                
	                <!-- 티켓 -->
	                
	                <div class="ticket">
	                  <div class="col-12">
	                    <div class="card hover-img overflow-hidden">
<!-- 	                      <div class="position-relative"> -->
<!-- 	                        <a href="../rtl/eco-shop-detail.html"> -->
<!-- 	                          <img src="../assets/images/products/s11.jpg" class="card-img-top" alt="modernize-img"> -->
<!-- 	                        </a> -->
<!-- 	                        <a href="javascript:void(0)" class="text-bg-primary rounded-circle p-2 text-white d-inline-flex position-absolute bottom-0 end-0 mb-n3 me-3" data-bs-toggle="tooltip" data-bs-placement="top" data-bs-title="Add To Cart"> -->
<!-- 	                          <i class="ti ti-basket fs-4"></i> -->
<!-- 	                        </a> -->
<!-- 	                      </div> -->

					     	<c:set value="${level }" var="level"/>
					     	
					        <c:if test="${searchList ne null }">
					     
					        	<c:forEach items="${searchList }" var="data">
					        	
						       <div class="col-12 mx-auto">
									<div class="flight-container" data-scno="${data.scNo} ">
									    
									    <div class="flight-info">
<!-- 									    <div class="badge-container"> 새롭게 추가된 div -->
					<!-- 				        <span class="recommend-badge">추천</span> -->
<!-- 									        <span class="mb-1 badge rounded-pill bg-primary ms-auto">추천</span> -->
					<%-- 				        <span class="seat-left">잔여 ${data.scSeatqty}석</span> --%>
<%-- 									        <span class="mb-1 badge rounded-pill bg-primary-subtle text-primary ms-auto">잔여 ${data.scSeatqty}석</span> --%>
<!-- 									    </div> -->
									        <div class="flight-logo">
					<%-- 				            <img src="${pageContext.request.contextPath }/resources/assets/images/breadcrumb/ChatBc.png" alt="대한항공"> ➔--%>
									            <img src="${data.scImage }" alt="" >
									        </div>
									        <div class="flight-detail">
									            <strong>${data.scAirline }</strong>
									        </div>
									        <div class="flight-times">
									            <div>
									                <strong>
													    <fmt:formatDate value="${data.scStdate}" pattern="yyyy-MM-dd"/>
													</strong>
														<fmt:formatDate value="${data.scStdate}" pattern="a hh:mm"/>
														<span>${data.scBoarding}</span> ➔ 
<%-- 														<img src="${pageContext.request.contextPath}/resources/assets/images/airport/fly.gif" alt="화살표" style="width: 200px; height: 200PX;"/>  --%>
														<fmt:formatDate value="${data.scStd}" pattern="a hh:mm"/> 
														<span>${data.scArrived}</span> 
<!-- 														<span>1PC</span> -->
									            </div>
									        </div>
									    </div>
									    <div class="price-section" style=" color: #5D87FF;">
					<!-- 				        <div class="flight-price">368,500원~</div> -->
											
									        <div class="flight-price" style=" color: #5D87FF;"><fmt:formatNumber value="${data.scPrice }"/>원</div>
									        
									    </div>
									</div>
								</div>
								</c:forEach>
					        </c:if>
					        <form hidden="hidden" method="post" action="/customer/reserve/detail" class="detailForm">
					        	
					        </form>
							</div>
	                    </div>
	                  </div>
	               </div>
	            </div>
	          </div>
	        </div>
		  </div>
		  </div>
		  </c:if>
		  </div>
		  
		  <script type="text/javascript">
$(function(){
	var level = '${level}';
	let query = window.location.search;         // http://localhost:8080/notice?id=1&name=하나
	let param = new URLSearchParams(query);     // ?id=1&name=하나
	
	$('.scBoarding').val(param.get('scBoarding'));
	$('.scArrived').val(param.get('scArrived'));
	$('.scStdate').val(param.get('scStdate'));
	$('.scStd').val(param.get('scStd'));
	$('.cusCnt').val(param.get('cusCnt'));
			
	$(this).on('click','.flight-container',function(){
		if(level == "1"){
			var scNo = $(this).data('scno');
			console.log('scNo1 ::: '+scNo);

// 			window.location.href='/customer/reserveArrive?scBoarding='+param.get('scBoarding')+
// 																	'&scArrived='+param.get('scArrived')+
// 																	'&scStdate='+param.get('scStdate')+
// 																	'&scStd='+param.get('scStd')+
// 																	'&cusCnt='+param.get('cusCnt')+
// 																	'&scNo='+scNo;
			var fir = '<input type="text" name="scBoarding" value="' + param.get('scBoarding') + '" />';
			fir += '<input type="text" name="scArrived" value="' + param.get('scArrived') + '" />';
			fir += '<input type="text" name="scStdate" value="' + param.get('scStdate') + '" />';
			if(param.get('scStd') != null){
				fir += '<input type="text" name="scStd" value="' + param.get('scStd') + '" />';	
			}
			fir += '<input type="text" name="cusCnt" value="' + param.get('cusCnt') + '" />';
			fir += '<input type="text" name="scNo" value="' + scNo + '" />';
			
			$('.detailForm').append(fir);
			$('.detailForm').attr('method','get');
			$('.detailForm').attr('action','/customer/reserveArrive');
			$('.detailForm').submit();
			
			
		} else if(level == "2"){
			var scNo = $(this).data('scno');
			console.log('scNo ::: '+ scNo);
			
			var sec = '<input type="text" name="scNo" value="' + param.get('scNo') + '" />';
			sec += '<input type="text" name="scNo2" value="' + scNo + '" />';
			sec += '<input type="text" name="cusCnt" value="' + param.get('cusCnt') + '" />';
			
			$('.detailForm').append(sec);
			$('.detailForm').submit();
		}
		
	});	
		
		
// 	$('.rounded-1').on('click',function(){
// 		console.log($(this).data('type'));
		
// 		var type = '<input type="text" name="type" value="' + $(this).data('type') +'" />';
// 		$('.detailForm').append(type);
// 		$('.detailForm').attr('method','get');
// 		$('.detailForm').attr('action','/customer/reserveArrive');
// 		$('.detailForm').submit();
// 	});
	
	
});
</script>