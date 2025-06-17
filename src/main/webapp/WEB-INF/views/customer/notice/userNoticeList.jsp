<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/libs/quill/dist/quill.snow.css">
<script src="${pageContext.request.contextPath}/resources/assets/libs/quill/dist/quill.js"></script>
<style>
#UNnotice{
	font-size: 27px;
	margin: 12px;
	cursor: pointer;
}
#UNfaq, #UNqna{
	color : gray;
	font-size: 27px;
	margin: 12px;
	cursor: pointer;
}
#UNFaQArea, #UNqnaArea{
	display: none;
}
.serviceCenterBar{
	font-size: 27px;
}
.custom-height {
	height: 250px; 
	display: flex;
	align-items: center; 
	justify-content: center; 
}

ul{
	text-align: center;
}
.selNoticenoNo{
	cursor: pointer;
}
</style>

 <div class="main-wrapper overflow-hidden">
	<!-- ------------------------------------- -->
	<!-- banner Start -->
	<!-- ------------------------------------- -->
	<section class="bg-primary-subtle custom-height">
		<div class="container-fluid">
			<div class="text-center">
				<p class="text-primary fs-4 fw-bolder">service center</p>
				<h1 class="fw-bolder fs-12">고객 센터</h1>
			</div>
		</div>
	</section>
</div>
<div align="center">
<div align="center">
        <div class="card" style="width: 80%; margin: 20px;">
        	<div class="card-body">
        		<span id="UNqna">문의사항</span> <span class="serviceCenterBar"> | </span> <span style="color: black; text-decoration: underline; font-weight:bold; text-underline-offset: 5px;" id="UNnotice">공지사항</span> <span class="serviceCenterBar"> | </span> <span id="UNfaq">FAQ</span>
        	</div>
        </div>
        </div>
        
        <!-- notice 영역 시작 -->
       <div id="UNqnaAre a">
			<div class="row justify-content-end" style="width: 80%;">
		    <div class="col-md-4 col-xl-6 d-flex align-items-center">
		        <form action="" method="get" class="w-100 d-flex">
		            <select class="form-select me-2" name="searchType" style="width: 160px;">    
		                <option>검색 유형 선택</option>
		                <option value="title" <c:if test="${searchType eq 'title' }">selected</c:if> >제목</option>
		                <option value="content" <c:if test="${searchType eq 'content' }">selected</c:if> >내용</option>
		            </select>
		            <div class="input-group position-relative">
		                <input type="text" class="form-control product-search ps-5 pe-5" id="input-search" name="searchWord" placeholder="Search Contacts..." value="${searchWord}" />
		                <i class="ti ti-search position-absolute top-50 start-0 translate-middle-y fs-6 text-dark ms-3"></i>
		                <button type="submit" class="btn btn-primary" style="padding: 0.25rem 0.5rem;">검색</button>
		            </div>
		        </form>
		    </div>
		</div><br/>
	<div id="UNnoticeArea">
        	<div class="table-responsive mb-4 border rounded-1" style="width: 80%">
                <table class="table table-hover text-nowrap mb-0 align-middle" style="table-layout: fixed; width: 100%">
                  <thead class="text-dark fs-4">
                    <tr align="center">
                      <th style="width: 15%">
                        <h6 class="fs-4 fw-semibold mb-0">번호</h6>
                      </th>
                      <th style="width: 25%">
                        <h6 class="fs-4 fw-semibold mb-0">제목</h6>
                      </th>
                      <th style="width: 15%">
                        <h6 class="fs-4 fw-semibold mb-0">첨부파일</h6>
                      </th>
                      <th style="width: 15%">
                        <h6 class="fs-4 fw-semibold mb-0">작성자</h6>
                      </th>
                      <th style="width: 15%">
                        <h6 class="fs-4 fw-semibold mb-0">등록일</h6>
                      </th>
                      <th style="width: 15%">
                        <h6 class="fs-4 fw-semibold mb-0">조회수</h6>
                      </th>
                    </tr>
                  </thead>
                  <tbody>
                    <c:choose>
					    <c:when test="${empty pagingVO.dataList}">
					        <tr>
					            <td colspan="5">공지사항이 없습니다.</td>
					        </tr>
					    </c:when>
					    <c:otherwise>
					        <c:forEach items="${pagingVO.dataList}" var="notice">
					            <tr class="selNoticenoNo" onclick="location.href='/customer/notice/detail?noNo=${notice.noNo}'" align="center">
					                <td>
					                    <p class="mb-0 fw-normal fs-4">${notice.noNo }</p>
					                </td>
					                <td align="left">
					                	<p class="mb-0 fw-normal fs-4" align="left" class="noNo">${notice.noTitle }</p>
					                </td>
					                <td>
					                	<c:if test="${notice.noFilecode eq 02}">
					                        <a class="d-flex align-items-center justify-content-center gap-6 list-group-item-action text-dark px-3 py-0 mb-0 rounded-1" href="javascript:void(0)">
											    <i class="ti ti-file-text fs-5"></i>
											</a>
					                	</c:if>
					                </td>
					                <td>
					                    <p class="mb-0 fw-normal fs-4">${notice.empDept }</p>
					                </td>
					                <td>
					                    <h6 class="fs-4 fw-semibold mb-0">${notice.noDate }</h6>
					                </td>
					                <td>
					                    <h6 class="fs-4 fw-semibold mb-0">${notice.noCount }</h6>
					                </td>
					            </tr>
					        </c:forEach>
					    </c:otherwise>
					</c:choose>
                  </tbody>
                </table>
              </div>
              <!-- Pagination 시작 -->
				<div class="d-flex justify-content-center" style="margin-top: 20px;">
					<nav aria-label="...">
						<ul class="pagination">
							<li
								class="page-item <c:if test='${pagingVO.currentPage == 1}'>disabled</c:if>">
								<a class="page-link" href="?page=${pagingVO.currentPage - 1}"
								tabindex="-1" aria-disabled="true">Prev</a>
							</li>
							<c:forEach begin="1" end="${pagingVO.totalPage}" var="pageNum">
								<li
									class="page-item <c:if test='${pagingVO.currentPage == pageNum}'>active</c:if>">
									<a class="page-link" href="?page=${pageNum}">${pageNum}</a>
								</li>
							</c:forEach>
							<li
								class="page-item <c:if test='${pagingVO.currentPage == pagingVO.totalPage}'>disabled</c:if>">
								<a class="page-link" href="?page=${pagingVO.currentPage + 1}">Next</a>
							</li>
						</ul>
					</nav>
				</div>
        </div>
        <!-- notice 영역 끝 -->
        </div>
</div>
<script type="text/javascript">
$(function(){
	var faq = $("#UNfaq");
	var notice = $("#UNnotice");
	var qna = $("#UNqna");
	var faqArea = $("#UNfaqArea");
	var noticeArea = $("#UNnoticeArea");
	var qnaArea = $("#UNqnaArea");
	
	faq.on("click", function(){
		location.href = '/customer/faq/list';
	});
	
	qna.on("click", function(){
		location.href = '/customer/qna/list';
	});
	
});

</script>