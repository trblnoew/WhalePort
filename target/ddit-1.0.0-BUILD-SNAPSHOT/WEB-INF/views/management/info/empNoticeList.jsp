 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<style>
    .table th {
        text-align: center;
    }
    .table td {
        text-align: center;
    }
</style>
<div class="body-wrapper">
    <div class="container-fluid">
	<div class="card bg-info-subtle shadow-none position-relative overflow-hidden mb-4">
	        <div class="card-body px-4 py-3">
	          <div class="row align-items-center">
	            <div class="col-9">
	              <h4 class="fw-semibold mb-8">공지사항</h4>
	              <nav aria-label="breadcrumb">
	                <ol class="breadcrumb">
	                  <li class="breadcrumb-item">
	                    <a class="text-muted text-decoration-none" href="/common/home">DashBoard</a>
	                  </li>
	                  <li class="breadcrumb-item" aria-current="page">공지사항</li>
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
        <div class="card w-100 position-relative overflow-hidden">
            <div class="card-body p-4">
                <!-- 검색창 시작 -->
				<div class="row justify-content-end">
				    <div class="col-md-4 col-xl-6 d-flex justify-content-end align-items-center">
				        <div class="d-flex align-items-center custom-align">
				            <form action="/info/notice/list" method="get" class="d-flex" id="searchForm">
				                <select class="form-select me-2" name="searchType" style="width: 160px;">
				                	<option value="all" <c:if test="${searchType eq 'all' }">selected</c:if> >검색 유형 선택</option>
				                    <option value="title" <c:if test="${searchType eq 'title'}">selected</c:if>>제목</option>
				                    <option value="content" <c:if test="${searchType eq 'content'}">selected</c:if>>내용</option>
				                </select>
					            <div class="input-group position-relative">
					                <input type="text" class="form-control product-search ps-5 pe-5" id="input-search" name="searchWord" placeholder="Search Contacts..." value="${searchWord}" />
					                <i class="ti ti-search position-absolute top-50 start-0 translate-middle-y fs-6 text-dark ms-3"></i>
					                <input type="hidden" name="page" id="page"/>
					                <button type="submit" class="btn btn-primary" style="padding: 0.25rem 0.5rem;">검색</button>
					            </div>
				            </form>
				        </div>
				    </div>
				</div>
                <!-- 검색창 끝 -->
                
                <div class="table-responsive mb-4 border rounded-1 mt-3">
<!--                     <table class="table text-nowrap mb-0 align-middle" style="table-layout: fixed;"> -->
                    <table class="table table-hover text-nowrap mb-0 align-middle" style="table-layout: fixed;">
                        <thead class="text-dark fs-4">
                            <tr>
                                <th width="10%"><h6 class="fs-4 fw-semibold mb-0">게시글번호</h6></th>
                                <th width="30%"><h6 class="fs-4 fw-semibold mb-0">제목</h6></th>
                                <th width="10%"><h6 class="fs-4 fw-semibold mb-0">첨부파일</h6></th>
                                <th width="15%"><h6 class="fs-4 fw-semibold mb-0">작성자</h6></th>
                                <th width="15%"><h6 class="fs-4 fw-semibold mb-0">등록일</h6></th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:choose>
                                <c:when test="${empty pagingVO.dataList}">
                                    <tr>
                                        <td colspan="5">조회하신 게시글이 존재하지 않습니다.</td>
                                    </tr>
                                </c:when>
                                <c:otherwise>
                                    <c:forEach items="${pagingVO.dataList}" var="notice" begin="0" step="1" end="9" varStatus="i">
                                    
									<tr onclick="location.href='/info/notice/detail?noNo=${notice.noNo}';" style="cursor: pointer;">                                            
											<td><p class="mb-0 fw-normal fs-4"><c:out value="${totalCnt  - (i.index + ((pagingVO.currentPage - 1 )* 10)) }"/> </p></td>
											<td class="text-start"><p class="mb-0 fw-normal fs-4" style="margin-left:100px;">${notice.noTitle}</p></td>
                                            <td>
                                         <c:if test="${notice.noFilecode eq 02}">
									        <a class="d-flex align-items-center justify-content-center gap-6 list-group-item-action text-dark px-3 py-0 mb-0 rounded-1" href="javascript:void(0)">
											    <i class="ti ti-file-text fs-5"></i>
											</a>
					                	</c:if>
                                            </td>
                                            <td><p class="mb-0 fw-normal fs-4">${notice.empName}</p></td>
                                            <td><p class="mb-0 fw-normal fs-4">${notice.noDate}</p></td>
                                        </tr>
                                    </c:forEach>
                                </c:otherwise>
                            </c:choose>	
                        </tbody>
                    </table>
                </div>

				<div class="text-end mb-3">
				    <a href="/info/notice/register" class="btn btn-primary me-2">공지사항 등록</a>
				    <c:if test="${not empty searchWord}">
				        <a href="/info/notice/list" class="btn btn-outline-primary">이전</a>
				    </c:if>
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
<script type="text/javascript">
$(function(){
	$("#pagingArea").on("click", "a", function(e){
		e.preventDefault();
		console.log("여기");
		console.log(this);
		var pageNo = $(this).data("page");
		$("#searchForm").find("#page").val(pageNo);
		$("#searchForm").submit();
	});
});
</script>

