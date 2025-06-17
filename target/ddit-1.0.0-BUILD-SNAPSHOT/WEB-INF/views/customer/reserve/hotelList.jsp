<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
.custom-height {
	height: 250px; 
	display: flex;
	align-items: center; 
	justify-content: center; 
}


</style>
<%
	// list.jsp에서 알림을 표시하기 위한 조건
String msg = (String) request.getAttribute("msg");
String message = (String) request.getAttribute("message");
%>


<div class="main-wrapper overflow-hidden">
	<!-- ------------------------------------- -->
	<!-- banner Start -->
	<!-- ------------------------------------- -->
	<section class="bg-primary-subtle custom-height">
		<div class="container-fluid">
			<div class="text-center">
				<p class="text-primary fs-4 fw-bolder">hotel</p>
				<h1 class="fw-bolder fs-12">캡슐호텔</h1>
			</div>
		</div>
	</section>
</div>

<div class="body-wrapper">
    <div class="container-fluid">
        <div class="row justify-content-center"> <!-- 가운데 정렬을 위한 클래스 추가 -->
             <div class="col-lg-4">
		  <!-- start With controls -->
		  <div class="card" >
		    <div class="card-body" style="height: 500px;">
		      <div id="carouselExampleControls" class="carousel slide carousel-dark" data-bs-ride="carousel" style="margin-top: 30px;">
		        <div class="carousel-inner">
		          <div class="carousel-item active">
		            <img src="${pageContext.request.contextPath}/resources/assets/images/hotel/hotel1.png" class="d-block w-100" alt="modernize-img" />
		          </div>
		          <div class="carousel-item">
		            <img src="${pageContext.request.contextPath}/resources/assets/images/hotel/hotel2.png" class="d-block w-100" alt="modernize-img" />
		          </div>
		          <div class="carousel-item">
		            <img src="${pageContext.request.contextPath}/resources/assets/images/hotel/hotel3.jpg" class="d-block w-100" alt="modernize-img" />
		          </div>
		        </div>
		        <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-bs-slide="prev">
		          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
		          <span class="visually-hidden">Previous</span>
		        </a>
		        <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-bs-slide="next">
		          <span class="carousel-control-next-icon" aria-hidden="true"></span>
		          <span class="visually-hidden">Next</span>
		        </a>
		      </div>
		    </div>
		  </div>
		  <!-- end With controls -->
		</div>

            <div class="col-lg-4 d-flex align-items-stretch"> 
                <!-- start Issue Tracking -->
                
               <div class="card w-100" > 
   			 <form action="/customer/reserve/hotel/registerForm" id="htForm" method="post">
	        <div class="card-body border-top">
	            <h3 class="title"><strong>호텔 예약</strong></h3>
	            <hr>
	            <div class="row">
	                <div class="col-12">
	                    <div class="mb-3">
	                        <label for="roomType" class="form-label">호텔 객실</label>
	                        <select name="htNo" class="form-control" id="roomType">
	                            <option value="default" id="typeNum">객실을 선택해주세요</option>
	                            <c:forEach var="hotelVO" items="${hotelList}">
	                                <option value="${hotelVO.htNo}" class="typeNum">${hotelVO.htName}</option>
	                            </c:forEach>
	                        </select>
	                    </div>
	                </div>
	            </div>
	            <div class="row">
	                <div class="col-12">
	                    <div class="mb-3">
	                        <label for="dateopen" class="form-label">체크인 - 체크아웃 (1박2일 기준)</label>
	                        <input type="date" name="hrCheckin" class="form-control" id="dateopen" required />
	                    </div>
	                </div>
	            </div>
	            <div class="row">
	                <div class="col-12">
	                    <div class="mb-3">
	                        <label for="open" class="form-label">객실 수</label>
	                        <input type="text" name="htCount" class="form-control" id="open" placeholder="1" readonly="readonly"/>
	                    </div>
	                </div>
	            </div>
	            <div class="row">
	                <div class="col-12">
	                    <div class="mb-3">
	                        <label for="open" class="form-label">예약가능여부</label>
	                        <input type="text" name="result" class="form-control" id="result" placeholder="" readonly="readonly"/>
	                    </div>
	                </div>
	            </div>
	            <div class="text-end">
				    <button type="submit" class="btn btn-primary" id="confirmButton" disabled>
				        확인
				    </button>
				</div>
	        </div>
	    </form>
	    <div class="modal fade" id="al-warning-alert" tabindex="-1" aria-labelledby="vertical-center-modal" aria-hidden="true">
    <div class="modal-dialog modal-sm">
        <div class="modal-content modal-filled bg-warning-subtle">
            <div class="modal-body p-4">
                <div class="text-center text-warning">
                    <i class="ti ti-alert-octagon fs-7"></i>
                    <h4 class="mt-2">Warning</h4>
                    <p class="mt-3">객실을 선택해주세요.</p>
                    <button type="button" class="btn btn-light my-2" data-bs-dismiss="modal">확인</button>
                </div>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
</div>
	</div>


                <!-- end Issue Tracking -->
            </div>
        </div>
        <!-- End row -->
        <div class="container my-4"> <!-- 추가된 container -->
    <div class="card-body p-4">
        <ul class="nav nav-pills user-profile-tab border-bottom" id="pills-tab" role="tablist">
            <li class="nav-item" role="presentation">
                <button class="nav-link position-relative rounded-0 active d-flex align-items-center justify-content-center bg-transparent fs-3 py-6" id="pills-description-tab" data-bs-toggle="pill" data-bs-target="#pills-description" type="button" role="tab" aria-controls="pills-description" aria-selected="true">
                    Description
                </button>
            </li>
            <li class="nav-item" role="presentation">
                <button class="nav-link position-relative rounded-0 d-flex align-items-center justify-content-center bg-transparent fs-3 py-6" id="pills-reviews-tab" data-bs-toggle="pill" data-bs-target="#pills-reviews" type="button" role="tab" aria-controls="pills-reviews" aria-selected="false">
                    Reviews
                </button>
            </li>
        </ul>
        <div class="tab-content pt-4" id="pills-tabContent">
            <div class="tab-pane fade show active" id="pills-description" role="tabpanel" aria-labelledby="pills-description-tab" tabindex="0">
                <div class="d-flex align-items-center">
		                    <img src="${pageContext.request.contextPath}/resources/assets/images/alert/alert11.png" alt="아이콘" style="width: 30px; height: 30px; margin-right: 10px;">
		                    <h2 class="mb-0"><strong>객실 소개</strong></h2>
		                </div>
		                <div class="row mb-4">
    <div class="container mb-4">
    <div class="row">
        <div class="col-6 text-center">
            <img src="${pageContext.request.contextPath}/resources/assets/images/hotel/hotel22.png" alt="주차장1" style="max-width: 100%; height: auto; margin: 20px 0; border-radius: 15px;">
            <h3>Lobby Lounge</h3>
            <p>Lobby Lounge에서는 Business Corner, 휴식 공간, 24시간 안내 리셉션 운영으로 <br>비즈니스와 스마트한 여행자를 위한 공간을 제공합니다.</p>
            <p><strong>위치:</strong> 3층 로비</p>
            <p><strong>운영시간:</strong> 리셉션: 24시간, Business Corner: 07:00 - 24:00</p>
            <p><strong>시설:</strong> 인터넷, 프린터, 팩스, 스캔, 휴식 공간</p>
        </div>
        <div class="col-6 text-center">
            <img src="${pageContext.request.contextPath}/resources/assets/images/hotel/hotel11.png" alt="주차장2" style="max-width: 100%; height: auto; margin: 20px 0; border-radius: 15px;">
            <h3>Shower</h3>
            <p>객실 내 샤워시설이 없는 경우 공용 샤워실 이용이 가능합니다.</p>
            <p><strong>위치:</strong> 동편 객실 222호 부근, 서편 객실 122호 부근</p>
            <p><strong>운영시간:</strong> 24시간</p>
            <p><strong>이용안내:</strong> 타올 - 객실 내 구비, 샤워용품 - 샤워실 내 구비</p>
        </div>
    </div>
</div>
                <hr>
                
                <h5><strong>여행의 설렘을 안고 잠시 머물 수 있는 캡슐호텔에 오신 것을 환영합니다.</strong></h5><br><br>
                캡슐호텔은 공간의 효율성을 극대화하여, 필요한 모든 편의 시설을 갖추고 있습니다. <br>
                작고 아늑한 공간에서 편안한 휴식을 취하며 여행의 피로를 풀어보세요.<br>
                깔끔하고 세련된 인테리어와 함께, 개인의 프라이버시를 보장하는 설계로 안락한 숙면을 제공합니다.
                짧은 시간 동안의 휴식이지만, 특별한 경험이 될 것입니다. <br>
                여행의 시작과 끝을 이곳에서 함께하세요!<br><br>
                ◈ PM 20 : 00 ~ AM 10 : 00 이용 가능 <br>
                ◈ 층별 룸 랜덤배정<br>
      <strong>◈ 예약 문의 : Tel 042.272.1004</strong> 
            </div>
            <div class="tab-pane fade" id="pills-reviews" role="tabpanel" aria-labelledby="pills-reviews-tab" tabindex="0">
                <div class="row justify-content-center"> <!-- 가운데 정렬을 위한 클래스 추가 -->
                    <div class="col-lg-4 d-flex align-items-stretch"> <!-- 너비 조정 -->
                        <div class="card shadow-none border w-100 mb-7 mb-lg-0">
                            <div class="card-body text-center p-4 d-flex flex-column justify-content-center">
                                <h6 class="mb-3">Average Rating</h6>
                                <h2 class="text-primary mb-3 fw-semibold fs-9">4/5</h2>
                                <ul class="list-unstyled d-flex align-items-center justify-content-center mb-0">
                                    <li>
                                        <a class="me-1" href="javascript:void(0)">
                                            <i class="ti ti-star text-warning fs-6"></i>
                                        </a>
                                    </li>
                                    <li>
                                        <a class="me-1" href="javascript:void(0)">
                                            <i class="ti ti-star text-warning fs-6"></i>
                                        </a>
                                    </li>
                                    <li>
                                        <a class="me-1" href="javascript:void(0)">
                                            <i class="ti ti-star text-warning fs-6"></i>
                                        </a>
                                    </li>
                                    <li>
                                        <a class="me-1" href="javascript:void(0)">
                                            <i class="ti ti-star text-warning fs-6"></i>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="javascript:void(0)">
                                            <i class="ti ti-star text-warning fs-6"></i>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 d-flex align-items-stretch"> <!-- 너비 조정 -->
                        <div class="card shadow-none border w-100 mb-7 mb-lg-0">
                            <div class="card-body p-4 d-flex flex-column justify-content-center">
                                <div class="d-flex align-items-center gap-9 mb-3">
                                    <span class="flex-shrink-0 fs-2">1 Stars</span>
                                    <div class="progress bg-primary-subtle w-100 h-4">
                                        <div class="progress-bar" role="progressbar" aria-valuenow="45" aria-valuemin="0" aria-valuemax="100" style="width: 45%;"></div>
                                    </div>
                                    <h6 class="mb-0">(485)</h6>
                                </div>
                                <div class="d-flex align-items-center gap-9 mb-3">
                                    <span class="flex-shrink-0 fs-2">2 Stars</span>
                                    <div class="progress bg-primary-subtle w-100 h-4">
                                        <div class="progress-bar" role="progressbar" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100" style="width: 25%;"></div>
                                    </div>
                                    <h6 class="mb-0">(215)</h6>
                                </div>
                                <div class="d-flex align-items-center gap-9 mb-3">
                                    <span class="flex-shrink-0 fs-2">3 Stars</span>
                                    <div class="progress bg-primary-subtle w-100 h-4">
                                        <div class="progress-bar" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width: 20%;"></div>
                                    </div>
                                    <h6 class="mb-0">(110)</h6>
                                </div>
                                <div class="d-flex align-items-center gap-9 mb-3">
                                    <span class="flex-shrink-0 fs-2">4 Stars</span>
                                    <div class="progress bg-primary-subtle w-100 h-4">
                                        <div class="progress-bar" role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" style="width: 80%;"></div>
                                    </div>
                                    <h6 class="mb-0">(620)</h6>
                                </div>
                                <div class="d-flex align-items-center gap-9">
                                    <span class="flex-shrink-0 fs-2">5 Stars</span>
                                    <div class="progress bg-primary-subtle w-100 h-4">
                                        <div class="progress-bar" role="progressbar" aria-valuenow="12" aria-valuemin="0" aria-valuemax="100" style="width: 12%;"></div>
                                    </div>
                                    <h6 class="mb-0">(160)</h6>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 d-flex align-items-stretch"> <!-- 너비 조정 -->
                        <div class="card shadow-none border w-100 mb-7 mb-lg-0">
                            <div class="card-body p-4 d-flex flex-column justify-content-center">
                                <button type="button" class="btn btn-outline-primary d-flex align-items-center gap-2 mx-auto">
                                    <i class="ti ti-pencil fs-7"></i>Write an Review
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

    </div>
</div>

 <script>
//         $(document).ready(function() {
$(function() {
    var today = new Date();
    var dd = String(today.getDate()).padStart(2, '0');
    var mm = String(today.getMonth() + 1).padStart(2, '0'); // January is 0!
    var yyyy = today.getFullYear();

    today = yyyy + '-' + mm + '-' + dd; // YYYY-MM-DD 형식

    // 체크인 날짜 입력 필드의 최소값을 오늘 날짜로 설정
    $('#dateopen').attr('min', today);

    var type = $('#typeNum').val();
    var checkinDate = '';

    $('#roomType').on('change', function() {
        type = $(this).val();
        if (checkinDate) {
            checkAvailability(type, checkinDate);
        }
    });

    $('#dateopen').on('change', function() {
        checkinDate = $(this).val();
        console.log('checkinDate :: ' + checkinDate);

        if (type === 'default') {
            $('#confirmButton').prop('disabled', true); // 기본 상태에서 비활성화
//             $('#al-warning-alert').modal('show'); // 경고 모달 띄우기
        } else {
            checkAvailability(type, checkinDate);
        }
    });

    function checkAvailability(type, checkinDate) {
        if (type === 'default') {
            $('#al-warning-alert').modal('show'); // 경고 모달 띄우기
            $('#confirmButton').prop('disabled', true);
            return;
        }
        
        $.ajax({
            url: '/customer/reserve/hotel/checkin',
            type: 'post',
            data: JSON.stringify({
                htNo: type,
                hrCheckin: checkinDate
            }),
            contentType: 'application/json; charset=utf-8',
            success: function(res) {
            		console.log('res :: '+ res);
                if (parseInt(res) >= 1) {
                    $('#result').css('color', 'green');
                    $('#result').val('예약 가능합니다. (잔여 객실 :' + res + ')');
                    $('#confirmButton').prop('disabled', false); // 확인 버튼 활성화
                } else {
                    $('#result').css('color', 'red');
                    $('#result').val('예약 불가능합니다.');
                    $('#confirmButton').prop('disabled', true); // 확인 버튼 비활성화
                }
            },
            error: function(xhr) {
                console.error('xhr :: ' + xhr);
            }
        });
    }
	<% if (msg != null) { %>
	Swal.fire({
		title: '${msg} 완료',
		text: '${message}',
		icon: 'success',
		confirmButtonText: '확인'
	});
<% } %>

// Enter 키를 눌렀을 때 모달 닫기
$(document).on('keypress', function(e) {
	if (e.which === 13) { // Enter 키 코드
		$('.swal2-modal').hide(); // SweetAlert 모달 닫기
	}
});
});

    </script>
      