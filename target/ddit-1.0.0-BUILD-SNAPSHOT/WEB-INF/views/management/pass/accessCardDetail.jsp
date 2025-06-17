<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<style>
.chat-box{
	border:1px solid #87CEFA;
	border-radius: 10px;
	max-height: calc(100vh - 150px); /* 헤더 높이를 고려하여 최대 높이 설정 */
    overflow-y: auto; /* 세로 스크롤 가능 */
}

.email-box {
    width: 40%!important;
    margin: 0 auto;
}

.card11 {
	width: 350px;
	height: 350px;
	perspective: 1100px;
	position: relative;
	margin: 10px;
	transition: transform 1.0s;
	transform-style: preserve-3d;
	cursor: pointer;
	transform: rotateY(0deg);
}

.front, .back {
	position: absolute;
	width: 100%;
	height: 100%;
}

.front {
	background: teal;
}

.back {
	background: white;
	display: flex; /* Flexbox를 사용하여 내용 중앙 정렬 */
	justify-content: center;
	align-items: center;
	text-align: center; /* 텍스트 중앙 정렬 */
	transform: rotateY(180deg);
}
</style>


<div class="body-wrapper">
    <div class="container-fluid">
        <div class="card bg-info-subtle shadow-none position-relative overflow-hidden mb-4">
           <div class="card-body px-4 py-3">
             <div class="row align-items-center" style="margin-top:20px;">
               <div class="col-9">
                 <h4 class="fw-semibold mb-8">온라인 출입증 상세 보기</h4>
                 <nav aria-label="breadcrumb">
                   <ol class="breadcrumb">
                     <li class="breadcrumb-item">
                       <a class="text-muted text-decoration-none" href="../main/index.html">home</a>
                     </li>
                     <li class="breadcrumb-item" aria-current="page">온라인 출입증 상세 보기</li>
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
            <div class="card-header text-bg-primary">
                <h5 class="mb-0 text-white">직원 출입증</h5>
            </div>
                  <div style="height:50px;"></div>
                  <div class="d-flex justify-content-center">
			        <div class="col-lg-3 d-flex justify-content-center align-items-stretch">
                <div class="card11 w-100" style="border-radius: 15px; overflow: hidden; height: 500px;">
                    <div class="front" style="background-image: url('${pageContext.request.contextPath}/resources/assets/images/profile/pass.png'); background-size: cover; background-position: center; padding: 20px;z-index:2000">
                        <div class="chat-list chat active-chat" style="margin-top:100px;">
                            <div style="text-align: center;">
                                <img src="${employeeVO.empImage }" alt="user4" width="150" height="180" class="rounded-circle"><br>
                                <p class="mb-1 fs-3"><strong>Name</strong></p>
                                <h6 class="fs-4 mb-0" style="font-size: 30px !important;"><strong>${employeeVO.empName }</strong></h6><br>
                                <div class="row" style="text-align: center;">
                                    <div class="col-6 mb-9">
                                        <p class="mb-1 fs-3"><strong>Department</strong></p>
                                        <h6 class="fw-semibold mb-0" style="font-size: 15px;">${employeeVO.empDept }</h6>
                                    </div>
                                    <div class="col-6 mb-9">
                                        <p class="mb-1 fs-3"><strong>Position</strong></p>
                                        <h6 class="fw-semibold mb-0" style="font-size: 15px;">${employeeVO.empPosition }</h6>
                                    </div>
                                </div>
                            </div>
                            <br/>
                        </div>
                    </div>
                    <div class="back" style="background-image: url('${pageContext.request.contextPath}/resources/assets/images/profile/pass2.png'); background-size: cover; background-position: center; padding: 20px;">
                        <div class="row" style="text-align: center;">
                            <div class="col-12 mb-7">
                                <h6 class="fw-semibold mb-0" style="font-size: 15px;">${employeeVO.empId }</h6>
                                <img src="${pageContext.request.contextPath}/resources/assets/images/svgs/QR.png" alt="QR Code" style="width: 150px; height: 150px; margin-top: 10px;">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
			    </div>
			    <div ></div>
			    </div>
                         
                         
                        </div>
                       </div>
					 <div class="card card-body">
		              <div class="row">
		                <div class="col-md-4 col-xl-3">
		                 
		                </div>
		                <div class="col-md-8 col-xl-9 text-end d-flex justify-content-md-end justify-content-center mt-3 mt-md-0">
		                  <div class="action-btn" style="display: flex; justify-content: center; align-items: center;" -btn="" show-btn"="">
		                  </div>
		                  <input type="hidden" name="empId" value="${employeeVO.empId }"/>
		                  <a href="/management/empDetail?empId=${employeeVO.empId }" class="btn btn-outline-primary d-flex align-items-center">
		                     이전
		                  </a>
		                </div>
		              </div>
		            </div>
                              
<script>
document.addEventListener('DOMContentLoaded', () => {
    const cards = document.querySelectorAll(".card11");
    for (const card of cards) {
        card.addEventListener("click", flipper);
    }
    
//     $(".front").on("click", function () {
// 		$(this).css("transform","rotateY(90deg)");
// 	});
    
    function flipper(event) {
        const target = event.currentTarget;
        // 현재 회전 상태에 따라 회전
        if (target.style.transform === "rotateY(0deg)" || target.style.transform === "") {
            target.style.transform = "rotateY(180deg)";
        	setTimeout(() => {
	        	$(".front").css("z-index", "0");
	        	$(".back").css("z-index", "1000");
			}, 250);
        } else {
        	setTimeout(() => {
	        	$(".back").css("z-index", "0");
	        	$(".front").css("z-index", "1000");
			}, 250);
        	target.style.transform = "rotateY(0deg)";
        }
    }
});
</script>        
 