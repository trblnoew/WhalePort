<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
.card {
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
        <div class="row">
            <div class="col-lg-3 d-flex justify-content-center align-items-stretch">
                <div class="card w-100" style="border-radius: 15px; overflow: hidden; height: 500px;">
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
                                <img src="${pageContext.request.contextPath}/resources/assets/images/svgs/qrTest.png" alt="QR Code" style="width: 150px; height: 150px; margin-top: 10px;">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

                   
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/html5-qrcode/2.3.8/html5-qrcode.min.js"></script>
<script type="text/javascript">
document.addEventListener('DOMContentLoaded', () => {
    const cards = document.querySelectorAll(".card");
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
