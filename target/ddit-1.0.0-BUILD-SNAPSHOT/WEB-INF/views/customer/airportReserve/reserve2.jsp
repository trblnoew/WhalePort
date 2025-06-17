<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en" dir="ltr" data-bs-theme="light"
	data-color-theme="Blue_Theme" data-layout="vertical">
<style>
.flight-container:hover{
	background-color: #f0f8ff; /* 배경색을 연한 파란색으로 변경 */
    border: 1px solid #333; /* 테두리 추가 */
    cursor: pointer; /* 마우스 커서를 포인터로 변경 */
}

.banner-section {
       background-color: #eef2ff; 
       padding: 50px; /* 내부 여백 추가 */
/*        border-radius: 15px; /* 각을 둥글게 */ */
/*        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1); /* 그림자 추가 (선택 사항) */ */
         
   }
.flight-container {
            display: flex;
            justify-content: space-between;
            align-items: center;
            border: 1px solid #ddd;
            padding: 20px;
            border-radius: 8px;
            margin: 20px;
        }

.badge-container {
    position: inherit; /* 배지를 고정시키기 위해 절대 위치 지정 */
    top: 10px; /* 위에서의 거리 */
    left: 10px; /* 왼쪽에서의 거리 */
    z-index: 10; /* 다른 요소들보다 위에 보이도록 설정 */
}

.flight-info {
    display: flex;
    flex-direction: row;
    align-items: center;
    border-right: 1px solid #ddd;
    padding-right: 20px;
    margin-right: 20px;
    padding-top: 40px; /* 배지와 겹치지 않도록 위쪽 패딩 추가 */
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
            width: 50px;
            height: 50px;
        }

        .flight-price {
            font-size: 24px;
            color: blue;
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
<!--                                         <input type="text" class="form-control" placeholder="출발지" name="scBoarding" value=""/> -->
<!--                                     </div> -->
<!--                                     <div class="form-group me-2"> -->
<!--                                         <input type="text" class="form-control" placeholder="도착지" name="scArrived"/> -->
<!--                                     </div> -->


	                                <div class="form-group me-2">
                                        <select name="scBoarding" class="form-control">
                                            <option value="">출발지</option>
                                            <option value="ICN">서울</option>
                                            <option value="CGK">자카르타</option>
                                            <option value="PKX">베이징</option>
                                            <option value="PEK">베이징</option>
                                            <option value="FCO">로마</option>
                                            <option value="LHR">런던</option>
                                            <option value="IAD">워싱턴</option>
                                            <option value="HND">도쿄</option>
                                            <option value="JFK">뉴욕</option>
                                            <option value="CDG">파리</option>
                                            <option value="YYZ">토론토</option>
                                            <option value="NRT">도쿄</option>
                                            <option value="ORD">시카고</option>
                                        </select>
                                    </div>
	                                <div class="form-group me-2">
                                        <select name="scArrived" class="form-control">
                                            <option value="">도착지</option>
                                            <option value="ICN">서울</option>
                                            <option value="CGK">자카르타</option>
                                            <option value="PKX">베이징</option>
                                            <option value="PEK">베이징</option>
                                            <option value="FCO">로마</option>
                                            <option value="LHR">런던</option>
                                            <option value="IAD">워싱턴</option>
                                            <option value="HND">도쿄</option>
                                            <option value="JFK">뉴욕</option>
                                            <option value="CDG">파리</option>
                                            <option value="YYZ">토론토</option>
                                            <option value="NRT">도쿄</option>
                                            <option value="ORD">시카고</option>
                                        </select>
                                    </div>
                                    <div class="d-flex align-items-center me-2"> <!-- Flexbox를 사용하여 나란히 배치 -->
                                        <input type="date" class="form-control me-1" name="scStdate"/>
                                        <span>~</span>
                                        <input type="date" class="form-control ms-1" name="scStd"/>
                                    </div>
                                    <div class="form-group me-2">
                                        <select class="form-control">
                                            <option value="adult">성인</option>
                                            <option value="child">어린이</option>
                                            <option value="baby">유아</option>
                                        </select>
                                    </div>
                                    <div class="form-group me-2">
                                        <select class="form-control" name="cusCnt">
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
<div class="body-wrapper">
        <div class="container-fluid">
     	<c:set value="${level }" var="level"/>
     	
        <c:if test="${searchList ne null }">
     
        	<c:forEach items="${searchList }" var="data">
        	
	       <div class="col-6 mx-auto">
				<div class="flight-container" data-scno="${data.scNo} ">
				    
				    <div class="flight-info">
				    <div class="badge-container"> <!-- 새롭게 추가된 div -->
<!-- 				        <span class="recommend-badge">추천</span> -->
				        <span class="mb-1 badge rounded-pill bg-primary ms-auto">추천</span>
<%-- 				        <span class="seat-left">잔여 ${data.scSeatqty}석</span> --%>
				        <span class="mb-1 badge rounded-pill bg-primary-subtle text-primary ms-auto">잔여 ${data.scSeatqty}석</span>
				    </div>
				        <div class="flight-logo">
<%-- 				            <img src="${pageContext.request.contextPath }/resources/assets/images/breadcrumb/ChatBc.png" alt="대한항공"> --%>
				            <img src="${pageContext.request.contextPath }/resources/assets/images/logos/whale-favi.png" alt="대한항공" >
				        </div>
				        <div class="flight-detail">
				            <strong>${data.scAirline }</strong>
				        </div>
				        <div class="flight-times">
				            <div>
				                <strong><fmt:formatDate value="${data.scStdate }" pattern="yyyy-MM-dd"/></strong><fmt:formatDate value="${data.scStdate }" pattern="a hh:mm"/><span>${data.scBoarding }</span> ➔<fmt:formatDate value="${data.scStd }" pattern="a hh:mm"/> <span>${data.scArrived }</span> <span>1PC</span>
				            </div>
				        </div>
				    </div>
				    <div class="price-section" style=" color: #5D87FF;">
<!-- 				        <div class="flight-price">368,500원~</div> -->
				        <div class="flight-price" style=" color: blue;">368,500원~</div>
				        상세스케줄
				    </div>
				</div>
			</div>
			</c:forEach>
        </c:if>
        <form hidden="hidden" method="post" action="/customer/reserve/detail" class="detailForm">
        	
        </form>
	</div>
</div>

<script type="text/javascript">
$(function(){
	var level = '${level}';
	let query = window.location.search;         // http://localhost:8080/notice?id=1&name=하나
	let param = new URLSearchParams(query);     // ?id=1&name=하나
	
	
	$(this).on('click','.flight-container',function(){
		if(level == "1"){
			var scNo = $(this).data('scno');
			console.log('scNo ::: '+scNo);

			window.location.href='/customer/reserveArrive?scBoarding='+param.get('scBoarding')+
																	'&scArrived='+param.get('scArrived')+
																	'&scStdate='+param.get('scStdate')+
																	'&scStd='+param.get('scStd')+
																	'&cusCnt='+param.get('cusCnt')+
																	'&scNo='+scNo;
		} else if(level == "2"){
			var scNo = $(this).data('scno');
			console.log('scNo ::: '+ scNo);
			
			var ext = '<input type="text" name="scNo" value="' + param.get('scNo') + '" />';
			ext += '<input type="text" name="scNo2" value="' + scNo + '" />';
			ext += '<input type="text" name="cusCnt" value="' + param.get('cusCnt') + '" />';
			
			$('.detailForm').append(ext);
			$('.detailForm').submit();
		}
		
	});	
		
		
	
	
	
});
</script>
</html>