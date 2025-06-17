<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<style>
    .table th {
        text-align: center;
    }
    .table td {
        text-align: center;
    }
    .container {
    width: 100%; /* 여백을 줄이기 위해 값을 줄임 */
    max-width: 4000px; /* 최대 너비를 줄임 */
    margin-left: auto;
    margin-right: auto;
     padding: 0 20px;
}
    
</style>
<div class="body-wrapper">
    <div class="container-fluid">
         <div class="card bg-info-subtle shadow-none position-relative overflow-hidden mb-4">
	           <div class="card-body px-4 py-3">
	             <div class="row align-items-center" style="margin-top:20px;">
	               <div class="col-9">
	                 <h4 class="fw-semibold mb-8">항공편 스케줄 정보</h4>
	                 <nav aria-label="breadcrumb">
	                   <ol class="breadcrumb">
	                     <li class="breadcrumb-item">
	                       <a class="text-muted text-decoration-none" href="../main/index.html">DashBoard</a>
	                     </li>
	                     <li class="breadcrumb-item" aria-current="page">항공편 스케줄 정보</li>
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
    </div>
</div>

    <div class="container">
    <div class="row mb-4 align-items-center">
        <div class="col-md-3">
            <form action="/partner/airline/schedule" method="get" class="position-relative me-2" id="searchForm">
                <div class="d-flex">
                    <input type="hidden" name="page" id="page" value=""/>
                    <input type="datetime-local" class="form-control time" name="scStdate" max="2034-12-31T00:00" min="2020-01-01T00:00" value="" style="margin-right:10px;"/>                   
                    <input type="datetime-local" class="form-control time" name="scStd" max="2034-12-31T00:00" min="2020-01-01T00:00" value=""/>
                </div>
                <c:if test="${not empty searchWord}">
                    <a href="/partner/airline/schedule" class="btn btn-outline-primary me-3">목록</a>
                </c:if>
            </form>
        </div>
        <div class="col-md-9 d-flex justify-content-end align-items-center">
            <input type="text" class="form-control product-search ps-5 pe-5 me-2" id="input-search" name="searchWord" placeholder="항공사 또는 출/도착지 검색" value="${searchWord}" style="width:280px;" />
            <i class="ti ti-search position-absolute top-50 start-0 translate-middle-y fs-6 text-dark ms-3"></i>
            <button type="button" class="btn btn-primary" id="searchBtn">검색</button>
        </div>
    </div>

    <div class="table-responsive mb-4 border rounded-1 mt-3">
        <table class="table table-hover text-nowrap mb-0 align-middle" style="table-layout: fixed;">
            <colgroup>
                <col style="width: 15%;">
                <col style="width: 15%;">
                <col style="width: 15%;">
                <col style="width: 10%;">
                <col style="width: 10%;">
                <col style="width: 15%;">
            </colgroup>
            <thead class="text-dark fs-4">
                <tr>
                    <th><h6 class="fs-4 fw-semibold mb-0">노선</h6></th>
                    <th><h6 class="fs-4 fw-semibold mb-0">출발일</h6></th>
                    <th><h6 class="fs-4 fw-semibold mb-0">도착일</h6></th>
                    <th><h6 class="fs-4 fw-semibold mb-0">게이트위치</h6></th>
                    <th><h6 class="fs-4 fw-semibold mb-0">체크인위치</h6></th>
                    <th><h6 class="fs-4 fw-semibold mb-0">가격</h6></th>
                </tr>
            </thead>
            <tbody>
                <c:choose>
                    <c:when test="${empty pagingVO.dataList}">
                        <tr>
                            <td colspan="6">입력하신 정보에 부합하는 정보가 없습니다.</td>
                        </tr>
                    </c:when>
                    <c:otherwise>
                        <c:forEach items="${pagingVO.dataList }" var="plane">
                            <tr>
                                <td><p class="mb-0 fw-normal fs-4">${plane.scBoarding } - ${plane.scArrived }</p></td>                                
                                <fmt:formatDate value="${plane.scStdate }" var="scStdate" pattern="yyyy-MM-dd HH:MM" />
                                <td><p class="mb-0 fw-normal fs-4">${scStdate }</p></td>                                
                                <fmt:formatDate value="${plane.scStd }" var="scStd" pattern="yyyy-MM-dd HH:MM" />
                                <td><p class="mb-0 fw-normal fs-4">${scStd }</p></td>                                
                                <td><p class="mb-0 fw-normal fs-4">${plane.scGate }</p></td>                                
                                <td><p class="mb-0 fw-normal fs-4">${plane.scCheckin }</p></td>                                
                                <td><p class="mb-0 fw-normal fs-4">
                                    <fmt:formatNumber value="${plane.scPrice}" type="number" maxFractionDigits="0" pattern="#,##0"/>
                                </p></td>                               
                            </tr>
                        </c:forEach>
                    </c:otherwise>
                </c:choose>
            </tbody>
        </table>
    </div>
</div>

            
            <div class="text-end mb-3">
                    <c:if test="${not empty searchWord}">
                        <a href="/management/airport/schedule" class="btn btn-outline-primary me-3">목록</a>
                    </c:if>
                </div>
            <!-- Pagination 시작 -->
            <div class="d-flex justify-content-center" style="margin-top: 20px;" id="pagingArea">
                <nav aria-label="...">
                    ${pagingVO.pagingHTML }
                </nav>
            </div>
         <!-- Pagination 끝 -->

   
<script>
$(function(){
   let query = window.location.search;         
   let param = new URLSearchParams(query);     
   
   $('.time').eq(0).val(param.get('scStdate').replace('T',' '));   
   $('.time').eq(1).val(param.get('scStd').replace('T',' '));   
   

   
   $('.time').on('change',function(){
      console.log($(this).val());
      
   });

   
   $('#searchBtn').on('click',function(){
      var valo = $('#input-search').val().toUpperCase();
      
      $('#input-search').val(valo);
      $('#searchForm').submit();
   });
   
   //paging처리
   $('#pagingArea').on('click','a',function(e){
      e.preventDefault();
      var pNo = $(this).data('page');
      
      $('#searchForm').find('#page').val(pNo);
      $('#searchForm').submit();
      
   });
   
   
});
</script>