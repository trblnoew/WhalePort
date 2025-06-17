<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/libs/quill/dist/quill.snow.css">
<script src="${pageContext.request.contextPath}/resources/assets/libs/quill/dist/quill.js"></script>
<style>
#UNfaq{
	font-size: 27px;
	margin: 12px;
	cursor: pointer;
}
#UNnotice, #UNqna{
	color : gray;
	font-size: 27px;
	margin: 12px;
	cursor: pointer;
}
#UNnoticeArea, #UNqnaArea{
	display: none;
}
.custom-height {
	height: 250px; 
	display: flex;
	align-items: center; 
	justify-content: center; 
}
.serviceCenterBar{
	font-size: 27px;
}
ul{
	text-align: center;
}
</style>


<%!
    // 숫자를 영어 단어로 변환하는 메서드 (1-50)
    public String numberToWords(int num) {
        String[] belowTwenty = {"", "one", "two", "three", "four", "five", "six", "seven", "eight",
                                "nine", "ten", "eleven", "twelve", "thirteen", "fourteen",
                                "fifteen", "sixteen", "seventeen", "eighteen", "nineteen"};
        String[] tens = {"", "", "twenty", "thirty", "forty", "fifty"};

        if (num <= 0 || num > 50) {
            return "";
        } else if (num < 20) {
            return belowTwenty[num];
        } else {
            int tenPlace = num / 10;
            int unitPlace = num % 10;
            return tens[tenPlace] + (unitPlace != 0 ? belowTwenty[unitPlace] : "");
        }
    }
%>

<%
    // numberWords 배열 생성 (1부터 50까지)
    String[] numberWords = new String[50];
    for (int i = 0; i < 50; i++) {
        numberWords[i] = numberToWords(i + 1);
    }

    // 배열을 페이지 컨텍스트에 설정
    pageContext.setAttribute("numberWords", numberWords);
%>

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
        <div class="card" style="width: 80%; margin: 20px;">
        	<div class="card-body">
        		<span id="UNqna">문의사항</span> <span class="serviceCenterBar"> | </span> <span id="UNnotice">공지사항</span> <span class="serviceCenterBar"> | </span> <span style="color: black; text-decoration: underline; font-weight:bold; text-underline-offset: 5px;" id="UNqna">FAQ</span>
        	</div>
        </div>
        </div>
        <!-- FAQ 영역 시작 -->
        <div class="row justify-content-center" id="UNfaqArea">
            <div class="text-center mb-7">
            </div>
            <div class="col-lg-9">
                <div class="accordion accordion-flush mb-5 card position-relative overflow-hidden" id="accordionFlushExample">
                    <c:choose>
                        <c:when test="${empty faqList}">
                            empty
                        </c:when>
                        <c:otherwise>
                            <c:forEach items="${faqList}" var="faq" varStatus="status">
                                <c:set var="numWord" value="${numberWords[status.index]}"/>
                                <div class="accordion-item">
                                    <h2 class="accordion-header" id="flush-heading${numWord}">
                                        <button class="accordion-button collapsed fs-4 fw-semibold shadow-none" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapse${numWord}" aria-expanded="false" aria-controls="flush-collapse${numWord}">
                                            [${faq.faqCategory }] ${faq.faqTitle}
                                        </button>
                                    </h2>
                                    <div id="flush-collapse${numWord}" class="accordion-collapse collapse" aria-labelledby="flush-heading${numWord}" data-bs-parent="#accordionFlushExample">
                                        <div class="accordion-body fw-normal">
                                            ${faq.faqAns}
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>
        <!-- FAQ 영역 끝 -->
        
        <!-- notice 영역 시작 -->
        <div id="UNnoticeArea" style="width:80%">
        	<div class="table-responsive mb-4 border rounded-1">
                <table class="table text-nowrap mb-0 align-middle" style="table-layout: fixed; width: 100%">
                  <thead class="text-dark fs-4">
                    <tr>
                      <th style="width: 10%">
                        <h6 class="fs-4 fw-semibold mb-0">번호</h6>
                      </th>
                      <th style="width: 45%">
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
                    </tr>
                  </thead>
                  <tbody>
                    <c:choose>
                    	<c:when test="${empty noticeList }">
                    	 <tr>
                    	 	<td colspan="5">공지사항이 없습니다.</td>
                    	 </tr>
                    	</c:when>
                    	<c:otherwise>
                    		<c:forEach items="${noticeList }" var="notice">
			                    <tr>
			                      <td>
			                        <p class="mb-0 fw-normal fs-4">${notice.noNo }</p>
			                      </td>
			                      <td>
			                        <p class="mb-0 fw-normal fs-4">${notice.noTitle }</p>
			                      </td>
			                      <td>
			                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="icon icon-tabler icons-tabler-outline icon-tabler-download">
									  <path stroke="none" d="M0 0h24v24H0z" fill="none" />
									  <path d="M4 17v2a2 2 0 0 0 2 2h12a2 2 0 0 0 2 -2v-2" />
									  <path d="M7 11l5 5l5 -5" />
									  <path d="M12 4l0 12" />
									</svg>
			                      </td>
			                      <td>
			                        <p class="mb-0 fw-normal fs-4">${notice.empNo }</p>
			                      </td>
			                      <td>
			                        <h6 class="fs-4 fw-semibold mb-0">${notice.noDate }</h6>
			                      </td>
			                    </tr>
                    		</c:forEach>
                    	</c:otherwise>
                    </c:choose>
                  </tbody>
                </table>
              </div>
        </div>
        <!-- notice 영역 끝 -->
        
        <!-- QNA 영역 시작 -->
        <div id="UNqnaArea">
			<div class="row justify-content-end">
		<div class="col-md-4 col-xl-3">
			<form action="/management/userNotice/list" method="get"
				class="position-relative w-100">
				<input type="text" class="form-control product-search ps-5 pe-5"
					id="input-search" name="searchWord"
					placeholder="Search Contacts..." value="${searchWord}" /> <i
					class="ti ti-search position-absolute top-50 start-0 translate-middle-y fs-6 text-dark ms-3"></i>
				<button type="submit"
					class="btn btn-primary position-absolute top-50 end-0 translate-middle-y"
					style="padding: 0.25rem 0.5rem; margin-right: 0.5rem;">검색</button>
				<input type="hidden" name="searchType" value="${searchType}" />
			</form>
		</div>
	</div>
	<div id="UNnoticeArea">
        	<div class="table-responsive mb-4 border rounded-1">
                <table class="table text-nowrap mb-0 align-middle" style="table-layout: fixed; width: 100%">
                  <thead class="text-dark fs-4">
                    <tr>
                      <th style="width: 10%">
                        <h6 class="fs-4 fw-semibold mb-0">번호</h6>
                      </th>
                      <th style="width: 45%">
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
					            <tr>
					                <td>
					                    <p class="mb-0 fw-normal fs-4">${notice.noNo }</p>
					                </td>
					                <td>
					                    <a href="/management/userNotice/detail?noNo=${notice.noNo }">${notice.noTitle }</a>
					                </td>
					                <td>
					                	<c:if test="${notice.noFilecode eq 02}">
					                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="icon icon-tabler icons-tabler-outline icon-tabler-download">
											  <path stroke="none" d="M0 0h24v24H0z" fill="none" />
											  <path d="M4 17v2a2 2 0 0 0 2 2h12a2 2 0 0 0 2 -2v-2" />
											  <path d="M7 11l5 5l5 -5" />
											  <path d="M12 4l0 12" />
											</svg>
					                	</c:if>
					                </td>
					                <td>
					                    <p class="mb-0 fw-normal fs-4">${notice.empNo }</p>
					                </td>
					                <td>
					                    <h6 class="fs-4 fw-semibold mb-0">${notice.noDate }</h6>
					                </td>
					            </tr>
					        </c:forEach>
					    </c:otherwise>
					</c:choose>
                  </tbody>
                </table>
              </div>
              <div align="right">
	              <a href="/management/userNotice/register" class="btn btn-primary">공지사항 작성</a>
              </div>
              <!-- Pagination 시작 -->
				<div class="d-flex justify-content-center" style="margin-top: 20px;">
					<nav aria-label="...">
						<ul class="pagination">
							<li
								class="page-item <c:if test='${pagingVO.currentPage == 1}'>disabled</c:if>">
								<a class="page-link" href="?page=${pagingVO.currentPage - 1}"
								tabindex="-1" aria-disabled="true">Previous</a>
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
        <!-- QNA 영역 끝 -->
        </div>

<script type="text/javascript">
$(function(){
	var faq = $("#UNfaq");
	var notice = $("#UNnotice");
	var qna = $("#UNqna");
	var faqArea = $("#UNfaqArea");
	var noticeArea = $("#UNnoticeArea");
	var qnaArea = $("#UNqnaArea");
	
	notice.on("click", function(){
		location.href = '/customer/notice/list';
	});
	
	qna.on("click", function(){
		location.href = '/customer/qna/list';
	});
	
});

</script>