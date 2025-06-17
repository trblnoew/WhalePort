<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/libs/quill/dist/quill.snow.css">
<script src="${pageContext.request.contextPath}/resources/assets/libs/quill/dist/quill.js"></script>

<style>
.table th {
   text-align: center;
}

.table td {
   text-align: center;
}

.hoverEffect {
    cursor: pointer; /* 커서가 포인터로 변경됩니다. */
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

<div class="body-wrapper">
   <div class="container-fluid">
      <div class="card bg-info-subtle shadow-none position-relative overflow-hidden mb-4">
         <div class="card-body px-4 py-3">
           <div class="row align-items-center" style="margin-top:20px;">
             <div class="col-9">
               <h4 class="fw-semibold mb-8">QnA / FAQ</h4>
               <nav aria-label="breadcrumb">
                 <ol class="breadcrumb">
                   <li class="breadcrumb-item">
                     <a class="text-muted text-decoration-none" href="../main/index.html">DashBoard</a>
                   </li>
                   <li class="breadcrumb-item" aria-current="page">QnA / FAQ</li>
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
      
		<div class="card">
		    <div class="card-body text-center">
		        <span class="hoverEffect" id="ptQna" style="margin-right: 15px;">QnA</span>
		        <span class="serviceCenterBar " style="margin-right: 15px;"> | </span>
		        <span class="hoverEffect" style="color: black; text-decoration: underline; font-weight: bold; text-underline-offset: 5px;" id="ptFaq">FAQ</span>
		    </div>
		</div>
      
        <div class="card w-100 position-relative overflow-hidden">
            <div class="card-body p-4">
				<!-- FAQ 영역 시작 -->
			    <div class="row justify-content-center" id="UNfaqArea">
			      <div class="text-center mb-7"></div>
			      <div class="col-lg-10">
			        <div class="accordion accordion-flush mb-5 card position-relative overflow-hidden" id="accordionFlushExample">
			          <c:choose>
			            <c:when test="${empty faqList}">등록된 FAQ 내역이 존재하지 않습니다.</c:when>
			            <c:otherwise>
			              <c:forEach items="${faqList}" var="faq" varStatus="status">
			                <c:set var="numWord" value="${numberWords[status.index]}"/>
			                <div class="accordion-item">
			                  <h2 class="accordion-header" id="flush-heading${numWord}">
			                    <button class="accordion-button collapsed fs-4 fw-semibold shadow-none" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapse${numWord}" aria-expanded="false" aria-controls="flush-collapse${numWord}">
			                      [${faq.faqCategory}] ${faq.faqTitle}
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
            </div>
        </div>
   </div>
</div>


<script>
$(function(){
	var qna = $("#ptQna");
	var faq = $("#ptFaq");
	
	
	qna.on("click", function(){
		location.href="/partner/qna/list"
	});
	
	faq.on("click", function(){
		location.href="/partner/qna/faqList";
	});
});
</script>

