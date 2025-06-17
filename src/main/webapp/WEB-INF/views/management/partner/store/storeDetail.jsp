<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set value="등록" var="name"  />
<c:if test="${not empty storeVO.ptCategory1 }">
	<c:set value="수정" var="name"  />
</c:if>


<div class="body-wrapper">
    <div class="container-fluid">
    
    <div class="card bg-info-subtle shadow-none position-relative overflow-hidden mb-4">
            <div class="card-body px-4 py-3">
              <div class="row align-items-center">
                <div class="col-9">
                  <h4 class="fw-semibold mb-8">입점업체 등록</h4>
                  <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                      <li class="breadcrumb-item">
                        <a class="text-muted text-decoration-none" href="/common/home">DashBoard</a>
                      </li>
                      <li class="breadcrumb-item" aria-current="page">Store Register</li>
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
                <h5 class="mb-0 text-white">입점 업체 입력 </h5>
            </div>
            <form action="/management/partner/store/register" id="storeForm" class="form-horizontal" method="post" >
                <div class="form-body">
                    <div class="card-body">
                        <h5 class="card-title mb-0">${storeVO.ptName}</h5>
                    </div>
                    <hr class="m-0" />
                <div class="card-body py-3">
                	<div class="row">
                	<input type="hidden" name="ptNo" value="${storeVO.ptNo}"  />
                      <div class="col-6">
                        <div class="mb-3">
                          <label class="form-label">대분류</label>
                          <select  name="ptCategory1" id="ptCategory1" onchange="categoryChange(this)"  class="form-select">
							  <option value="">대분류 선택</option>
		                      <option value="guide" <c:if test="${storeVO.ptCategory1 eq 'guide' }">selected</c:if>  >안내 및 서비스</option>
		                      <option value="shopping" <c:if test="${storeVO.ptCategory1 eq 'shopping' }">selected</c:if>  >쇼핑.면세점</option>
		                      <option value="restaurant" <c:if test="${storeVO.ptCategory1 eq 'restaurant' }">selected</c:if>  >식당</option>
                          </select>
                        </div>
                      </div>
                      <div class="col-6">
                        <div class="mb-3">
                          <label class="form-label">중분류</label>
                          <select  id="ptCategory2" name="ptCategory2" class="form-select">
							  <option value="">중분류 선택</option>
                          </select>
                        </div>
                      </div>
                      
                      <div class="col-md-6">
                        <div class="mb-3">
                          <label class="form-label">로고</label><br/>
                             <img alt="" src="${storeVO.ptImage}" id="imgArea" style="width: 100px;" >
                          </div>
                      </div>
                      <div class="col-md-6">
                              <label class="form-label">영업시간</label>
                          <div class="d-flex align-items-center">
                              <input type="time" name="ptTime1" class="form-control" value="${storeVO.ptTime1 }"  />
                              <input type="time" name="ptTime2" class="form-control" value="${storeVO.ptTime2 }"  />
                          </div>
                      </div>
                      <div class="col-md-6">
                        <div class="mb-3">
                              <label class="form-label">연락처</label>
                              <input type="text" class="form-control"  name="ptMgrtel" value="${storeVO.ptMgrtel}" readonly="readonly"  />
                          </div>
                      </div>
                      <div class="col-md-6">
                        <div class="mb-3">
                              <label class="form-label">업체소개</label>
                              <input type="text" class="form-control"  name="ptDetail" value="${storeVO.ptDetail}"  />
                          </div>
                      </div>
                    </div>
                 </div>
                </div>
                <div class="card-body">
                   <div class="d-flex justify-content-end">
                       <a href="/management/partner/store/list" class="btn btn-outline-primary me-3">이전</a>
                      	<input type="button" class="btn btn-primary me-3" id="addBtn" value="${name }" />
                   </div>
               </div>
                <sec:csrfInput/>
            	</form>
      		 </div>
        <!-- start Form with view only -->
    </div>
</div>





<script>
$(function(){
	var imgFile = $("#imgFile"); //이미지 선택하기 위한 input element
	var addBtn = $("#addBtn"); // 등록 버튼
	var storeForm = $("#storeForm"); // 스토어 form
	
	
	addBtn.on("click", function(){
		if($(this).val()=="수정"){
			storeForm.attr("action", "/management/partner/store/update");
		}
		storeForm.submit();
	});
	
	
	
	


});

function categoryChange(e){
	var good_no = ['중분류 선택'];
	var good_guide = ['금융/보험', '통신/인터넷', '택베/우편', '안내데스크', '민원행정 서비스', '라운지', '회의실', '의료/유아', '기타편의'];
	var good_shopping = ['화장품', '패션', '악세서리', '주류/담배', '전자제품', '기타'];
	var good_restaurant = ['한식', '양식', '아시안', '푸드코드', '패스트푸드', '카페/디저트'];
	var target = document.getElementById("ptCategory2");
	
	if(e.value == "") var options = good_no;
	else if(e.value == "shopping") var options = good_shopping;
	else if(e.value == "restaurant") var options = good_restaurant;
	else if(e.value == "guide") var options = good_guide;
	
	target.options.length = 0;
	
	for ( x in options) {
		var opt = document.createElement("option");
		opt.value = options[x];
		opt.innerHTML = options[x];
		target.appendChild(opt);
		
	}
	
}

</script>