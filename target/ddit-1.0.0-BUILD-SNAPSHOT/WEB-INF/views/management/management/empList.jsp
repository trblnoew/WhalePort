<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>


<style>
.table th {
	text-align: center;
}

.table td {
	text-align: center;
}
</style>
   
<div class="body-wrapper">    
   <div class="container-fluid" style="padding-top: calc(var(--bs-gutter-x)* .5);">
          <div class="card bg-info-subtle shadow-none position-relative overflow-hidden mb-4">
            <div class="card-body px-4 py-3">
              <div class="row align-items-center" style="margin-top:20px;">
                <div class="col-9">
                  <h4 class="fw-semibold mb-8">직원 정보</h4>
                  <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                      <li class="breadcrumb-item">
                        <a class="text-muted text-decoration-none" href="../main/index.html">DashBoard</a>
                      </li>
                      <li class="breadcrumb-item" aria-current="page">직원 정보</li>
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
          <div class="widget-content searchable-container list">
            <div class="card card-body">
            
            
            <!-- 상태별 카운트 위젯 시작 -->
    	<form id="filter-form" action="/management/list" method="get">
			<div class="row d-flex align-items-center justify-content-center g-4">
			        <div style="width: 17%" onclick="selectFilter('')" class="filter-card">
			            <div class="card border-bottom border-info card-hover">
			                <div class="card-body p-4" style="height: 125px">
			                <div class="d-flex align-items-center">
			                    <div>
			                        <h4 class="card-title fs-5">${countVO.totalCount }</h4>
			                        <p class="card-subtitle text-info">직원 총원</p>
			                    </div>
			                    <div class="ms-auto">
			                        <span class="text-info display-6">
			                            <i class="ti ti-users"></i>
			                        </span>
			                    </div>
			                </div>
			            </div>
			        </div>
			    </div>
			        <div style="width: 17%" onclick="selectFilter('Y')" class="filter-card">
			            <div class="card border-bottom border-primary card-hover">
			                <div class="card-body p-4" style="height: 125px">
			                <div class="d-flex align-items-center">
			                    <div>
			                        <h4 class="card-title fs-5">${countVO.countY }</h4>
			                        <p class="card-subtitle text-info">승인된 직원</p>
			                    </div>
			                    <div class="ms-auto">
			                        <span class="text-primary display-6">
			                            <span class="badge bg-primary-subtle text-primary" style="font-size: 1rem; padding: 0.5rem 0.5rem;">승인</span>
			                        </span>
			                    </div>
			                </div>
			            </div>
			        </div>
			    </div>
			        <div style="width: 17%" onclick="selectFilter('N')" class="filter-card">
			            <div class="card border-bottom border-success card-hover">
			                <div class="card-body p-4" style="height: 125px">
			                <div class="d-flex align-items-center">
			                    <div>
			                        <h4 class="card-title fs-5">${countVO.countN }</h4>
			                        <p class="card-subtitle text-success">승인 대기 중인<br>직원</p>
			                    </div>
			                    <div class="ms-auto">
			                        <span class="text-success display-6">
			                            <span class="badge bg-success-subtle text-success" style="font-size: 1rem; padding: 0.5rem 0.5rem;">승인대기</span>
			                        </span>
			                    </div>
			                </div>
			            </div>
			        </div>
			    </div>
			        <div style="width: 17%" onclick="selectFilter('R')" class="filter-card">
			            <div class="card border-bottom border-danger card-hover">
			                <div class="card-body p-4" style="height: 125px">
			                <div class="d-flex align-items-center">
			                    <div>
			                        <h4 class="card-title fs-5">${countVO.countR }</h4>
			                        <p class="card-subtitle text-danger">반려된 직원</p>
			                    </div>
			                    <div class="ms-auto">
			                        <span class="text-danger display-6">
			                            <span class="badge bg-danger-subtle text-danger" style="font-size: 1rem; padding: 0.5rem 0.5rem;">반려</span>
			                        </span>
			                    </div>
			                </div>
			            </div>
			        </div>
			    </div>
			        <div style="width: 17%" onclick="selectFilter('X')" class="filter-card">
			            <div class="card border-bottom border-dark card-hover">
			                <div class="card-body p-4" style="height: 125px">
			                <div class="d-flex align-items-center">
			                    <div>
			                        <h4 class="card-title fs-5">${countVO.countX }</h4>
			                        <p class="card-subtitle text-gray">퇴사한 직원</p> 
			                    </div>
			                    <div class="ms-auto">
			                        <span class="text-warning display-6">
			                            <span class="badge text-bg-light" style="color: gray !important; font-size: 1rem; padding: 0.5rem 0.5rem;">퇴사</span>
			                        </span>
			                    </div>
			                </div>
			            </div>
			        </div>
			    </div>
			</div>
			<input type="hidden" name="selectedItem" id="selectedItem" value="">
			</form>
			<br/>
			<!-- 상태별 카운트 위젯 끝 -->
            <!-- 검색창 시작 -->
			<div class="row justify-content-start">
				    <div class="col-md-6 d-flex justify-content-end align-items-center ms-auto">
				        <form action="/management/list" method="get" class="w-90 d-flex" id="searchForm">
				        	<input type="hidden" name="page" id="page"/>
	                		<input type="hidden" name="selectedItem" value="${pagingVO.selectedItem }">
				            <select class="form-select me-2" name="searchType" style="width: 160px;">    
				                <option value="all" <c:if test="${searchType eq 'all' }">selected</c:if> >검색 유형 선택</option>
				                <option value="name" <c:if test="${searchType eq 'name' }">selected</c:if> >이름</option>
				                <option value="dept" <c:if test="${searchType eq 'dept' }">selected</c:if> >부서</option>
				                <option value="position" <c:if test="${searchType eq 'position' }">selected</c:if>>직위</option>
				            </select>
			            	<div class="input-group position-relative">
				                <input type="text" class="form-control product-search ps-5 pe-5" id="input-search" name="searchWord" placeholder="Search Contacts..." value="${searchWord}" />
				                <i class="ti ti-search position-absolute top-50 start-0 translate-middle-y fs-6 text-dark ms-3"></i>
				                <button type="submit" class="btn btn-primary" style="padding: 0.25rem 0.5rem;">검색</button>
				            </div>
				        </form>
				    </div>
				</div>
			<!-- 검색창 끝 -->
			<br/>
			
                
            
            <div class="card card-body">
			<form action="/management/excelDown" method="post" id="excelDownForm">
                	<input type="hidden" name="searchType" value=""  id="searchType2" />
                	<input type="hidden" name="searchWord" value="" id="searchWord2" />
              <div class="table-responsive">
                <table class="table table-hover text-nowrap align-middle">
                <colgroup>
                        <col style="width: 5%;">
                        <col style="width: 5%;">
                        <col style="width: 5%;">
                        <col style="width: 5%;">
                        <col style="width: 5%;">
                        <col style="width: 5%;">
                        <col style="width: 5%;">
                    </colgroup>
                  <thead class="header-item">
                    <tr>
                    <th>이름</th>
                    <th>사번</th>
                    <th>입사일</th>
                    <th>부서</th>
                    <th>직위</th>
                    <th>승인여부</th>
                    <th>상세보기</th>
                  </tr></thead>
                  <tbody>
                  	
                    <!-- start row -->
                  	<c:choose>
                  		<c:when test="${empty pagingVO.dataList }">
                  			<tr>
                  				<td colspan="6">조회하신 직원 유형이 존재하지 않습니다.</td>
                  			</tr>
                  		</c:when>
                  	
                  	<c:otherwise>
                  	<c:forEach items="${pagingVO.dataList }" var="emp">
<!--                     <tr class="search-items"> -->
                    <tr class="search-items" onclick="location.href='/management/empDetail?empId=${emp.empId }';" style="cursor: pointer;">                                            
                  
              		
                      <td>
                        <div class="d-flex align-items-center" style="margin-left: 30%;">
                          <img src="${emp.empImage}" alt="avatar" class="rounded-circle" width="35">
                          <div class="ms-3">
                            <div class="user-meta-info">
                              <h6 class="user-name mb-0" >${emp.empName }</h6>
                            </div>
                          </div>
                        </div>
                      </td>
                      <td>
                        <span class="usr-empId">${emp.empId }</span>
                      </td>
                      <td>
                        <span class="usr-empStartdate">${fn:split(emp.empStartdate, " ")[0]}</span>
                      </td>
                      <td>
                        <span class="usr-department">${emp.empDept }</span>
                      </td>
                      <td>
                        <span class="usr-position">${emp.empPosition }</span>
                      </td>
                      <td>
                    	<c:choose>
						    <c:when test="${emp.empApproval == 'Y'}">
						        <span class="badge bg-primary-subtle text-primary" data-emplNo="승인여부">승인</span>
						    </c:when>
						    <c:when test="${emp.empApproval == 'R'}">
						        <span class="badge bg-danger-subtle text-danger" data-emplNo="승인여부">반려</span>
						    </c:when>
						    <c:when test="${emp.empApproval == 'N'}">
						        <span class="badge bg-success-subtle text-success" data-emplNo="승인여부">승인대기</span>
						    </c:when>
						    <c:when test="${emp.empDel == 'Y' }">
						        <span class="badge text-bg-light" style="color: gray !important;" data-emplNo="승인여부">퇴사</span>
						    </c:when>
						</c:choose>
                  	</td>
                      <td>
                        <div class="action-btn" >
                          <a href="/management/empDetail?empId=${emp.empId }" class="text-primary edit">
                            <i class="ti ti-eye fs-5"></i>
                          </a>
                         <!--  <a href="javascript:void(0)" class="text-dark delete ms-2">
                            <i class="ti ti-trash fs-5"></i>
                          </a> -->
                        </div>
                      </td>
                    </tr>
                    <!-- end row -->
                    	</c:forEach>
                  	</c:otherwise>
                  	</c:choose>
                  </tbody>
                </table>
                </div>
              <input type="button" class="btn btn-primary" value="엑셀 다운로드" id="excelDownBtn" />
            </form>
                
                <div class="row">
                <div class="col-md-4 col-xl-3">
                  <form class="position-relative" action="/search" method="GET"> 
                    
                  </form>
                </div>
                <div class="col-md-8 col-xl-9 text-end d-flex justify-content-md-end justify-content-center mt-3 mt-md-0">
                  <a href="/management/registerForm" id="btn-add-contact" class="btn btn-primary d-flex align-items-center">
                    직원 추가
                  </a>
                </div>
              </div> 
                
                
				<!-- Pagination 시작 -->
				<div class="d-flex justify-content-center" style="margin-top: 20px;" id="pagingArea">
				    <nav aria-label="...">
				        ${pagingVO.pagingHTML }
				    </nav>
				</div>
				<!-- Pagination 끝 -->
                 
              </div>
            </div>
          </div>
        </div>
        </div>
<script type="text/javascript">

function selectFilter(value) {
	
    document.getElementById('selectedItem').value = value; // 전체 선택일 경우 값이 없게 설정
    document.getElementById('filter-form').submit();
}

$(function(){
	$("#pagingArea").on("click", "a", function(e){
		e.preventDefault();
		var pageNo = $(this).data("page");
		$("#searchForm").find("#page").val(pageNo);
		$("#searchForm").submit();
	});
});

$(function(){
	var excelDownBtn = $("#excelDownBtn");	//엑셀 다운 버튼
	var excelDownForm = $("#excelDownForm"); // 엑셀 보내는 form
	
	excelDownBtn.on("click", function(){
		 $("#searchType2").val($("#searchType").val());
		 $("#searchWord2").val($("#searchWord").val());
		 
		 excelDownForm.submit();
	})
	
});
</script>