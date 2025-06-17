<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
.custom-height {
	height: 300px; 
	display: flex;
	align-items: center; 
	justify-content: center; 
}
   .btn-full-width {
        width: 100%;
    }

 .btn.active {
            background-color: #007bff; /* 원하는 색상으로 변경 */
            color: white; /* 텍스트 색상 */
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
				<p class="text-primary fs-4 fw-bolder">meeting room</p>
				<h1 class="fw-bolder fs-12">회의실</h1>
			</div>
		</div>
	</section>
</div>

<div class="body-wrapper">
    <div class="container-fluid">
        <div class="row justify-content-center"> <!-- 가운데 정렬을 위한 클래스 추가 -->
             <div class="col-lg-4">
		  <!-- start With controls -->
		  <div class="card" style="height: 650px;">
                <div class="card-body">
                  <!-- Nav tabs -->
                  <ul class="nav nav-pills nav-fill mt-4" role="tablist">
                    <li class="nav-item">
                      <a class="nav-link active" data-bs-toggle="tab" href="#navpill-111" role="tab">
                        <span>미팅룸A</span>
                      </a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" data-bs-toggle="tab" href="#navpill-222" role="tab">
                        <span>미팅룸B</span>
                      </a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" data-bs-toggle="tab" href="#navpill-333" role="tab">
                        <span>소회의실</span>
                      </a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" data-bs-toggle="tab" href="#navpill-444" role="tab">
                        <span>대회의실</span>
                      </a>
                    </li>
                  </ul>
                  <!-- Tab panes -->
                  <div class="tab-content border mt-2">
                    <div class="tab-pane active p-3" id="navpill-111" role="tabpanel">
                      <div class="row">
                        <div class="col-md-12">
                          <img src="${pageContext.request.contextPath}/resources/assets/images/meeting/meeting1.jpg" alt="modernize-img" class="img-fluid" />
                        </div>
                      </div>
                    </div>
                    <div class="tab-pane p-3" id="navpill-222" role="tabpanel">
                      <div class="row">
                        <div class="col-md-12">
                          <img src="${pageContext.request.contextPath}/resources/assets/images/meeting/meeting2.jpg" alt="modernize-img" class="img-fluid" />
                        </div>
                      </div>
                    </div>
                    <div class="tab-pane p-3" id="navpill-333" role="tabpanel">
                      <div class="row">
                        <div class="col-md-12">
                          <img src="${pageContext.request.contextPath}/resources/assets/images/meeting/meeting3.jpg" alt="modernize-img" class="img-fluid" />
                        </div>
                      </div>
                    </div>
                    <div class="tab-pane p-3" id="navpill-444" role="tabpanel">
                      <div class="row">
                        <div class="col-md-12">
                          <img src="${pageContext.request.contextPath}/resources/assets/images/meeting/meeting4.jpg" alt="modernize-img" class="img-fluid" />
                        </div>
                      </div>
                    </div>
                  </div>
		  <div class="text-center mt-4">
			    <a href="${pageContext.request.contextPath}/resources/assets/images/meeting/회의실 메뉴얼.pdf" class="btn btn-primary btn-full-width" download>
			        회의실 메뉴얼
			    </a>
			</div>
                </div>
              </div>
		  <!-- end With controls -->
		</div>

            <div class="col-lg-4 d-flex align-items-stretch"> 
                <!-- start Issue Tracking -->
                
               <div class="card w-100" > 
   			 <form action="/customer/reserve/meeting/registerForm" id="mrForm" method="post">
	        <div class="card-body border-top">
	            <h3 class="title"><strong>회의실 예약</strong></h3>
	            <hr>
	            <div class="row">
	                <div class="col-12">
	                    <div class="mb-3">
	                        <label for="meetingType" class="form-label">회의실 명</label>
	                        <select name="mrNo" class="form-control" id="meetingType">
	                            <option value="default" id="typeNum">회의실을 선택해주세요</option>
	                            <c:forEach var="meetingVO" items="${meetingList}">
	                                <option value="${meetingVO.mrNo}" class="typeNum">${meetingVO.mrName}</option>
	                            </c:forEach>
	                        </select>
	                    </div>
	                </div>
	            </div>
	            <div class="row">
	                <div class="col-12">
	                    <div class="mb-3">
	                        <label for="dateopen" class="form-label">회의일자</label>
	                        <input type="date" name="mrrDate" class="form-control" id="dateopen" required />
	                    </div>
	                </div>
	            </div>
	           <div class="row">
				    <div class="col-12">
				        <div class="mb-3">
				            <label class="form-label">오전</label>
				            <div class="row">
				                <div class="col-3">
				                    <input type="button" name="mrrTime" class="btn btn-outline-primary btn-full-width" value="09:00"/>
				                </div>
				                <div class="col-3">
				                    <input type="button" name="mrrTime" class="btn btn-outline-primary btn-full-width" value="10:00"/>
				                </div>
				                <div class="col-3">
				                    <input type="button" name="mrrTime" class="btn btn-outline-primary btn-full-width" value="11:00"/>
				                </div>
				                <div class="col-3">
				                    <input type="button" name="mrrTime" class="btn btn-outline-primary btn-full-width" value="12:00"/>
				                </div>
				            </div>
				        </div>
				    </div>
				</div>
				<div class="row">
				    <div class="col-12">
				        <div class="mb-3">
				            <label class="form-label">오후</label>
				            <div class="row">
				                <div class="col-3">
				                    <input type="button" name="mrrTime" class="btn btn-outline-primary btn-full-width" value="13:00"/>
				                </div>
				                <div class="col-3">
				                    <input type="button" name="mrrTime" class="btn btn-outline-primary btn-full-width" value="14:00"/>
				                </div>
				                <div class="col-3">
				                    <input type="button" name="mrrTime" class="btn btn-outline-primary btn-full-width" value="15:00"/>
				                </div>
				                <div class="col-3">
				                    <input type="button" name="mrrTime" class="btn btn-outline-primary btn-full-width" value="16:00"/>
				                </div>
				                <div class="col-3">
				                    <input type="button" name="mrrTime" class="btn btn-outline-primary btn-full-width" value="17:00" style="margin-top:10px;"/>
				                </div>
				                <div class="col-3">
				                    <input type="button" name="mrrTime" class="btn btn-outline-primary btn-full-width" value="18:00" style="margin-top:10px;"/>
				                </div>
				            </div>
				        </div>
				    </div>
				</div>
	            <div class="text-end">
				    <button type="button" class="btn btn-primary" id="confirmButton" disabled>
				        확인
				    </button>
				</div>
	        </div>
	    </form>
	</div>
            </div>
        </div>
        <!-- End row -->
    </div>
</div>

<script type="text/javascript">
$(function() {
    var today = new Date();
    var dd = String(today.getDate()).padStart(2, '0');
    var mm = String(today.getMonth() + 1).padStart(2, '0'); // January is 0!
    var yyyy = today.getFullYear();

    today = yyyy + '-' + mm + '-' + dd; // YYYY-MM-DD 형식

    // 체크인 날짜 입력 필드의 최소값을 오늘 날짜로 설정
    $('#dateopen').attr('min', today);

    var type = $('#typeNum').val(); // 초기값 설정
    var meetingDate = '';
    var meetingTime = '';

    $('#dateopen').on('change', function() {
        changed();
    });
    $('#meetingType').on('change', function() {
        changed();
    });

    var i = 0;
    $('input[name="mrrTime"]').on('click', function() {
        if ($(this).hasClass('active')) {
            $(this).removeClass('active'); // 버튼이 활성화된 경우 추가
            i--;
        } else {
            $(this).addClass('active');
            i++;
        }

        checkConfirmButton();
    });

    $('#confirmButton').on('click', function() {
        var activeTexts = $('input.active').map(function() {
            return $(this).val();
        }).get(); // .get()을 사용하여 jQuery 객체를 배열로 변환

        console.log('texts ::: ' + activeTexts);
        var html = "<input type='hidden' value='" + activeTexts + "' name='mrrTime' />";
        $('#mrForm').append(html);
        $('#mrForm').submit();
    });

    function changed() {
        if ($('#meetingType').val() === "default") return false;
        if ($('#dateopen').val() === "") return false;

        var datas = {
            mrrDate: $('#dateopen').val(),
            mrNo: $('#meetingType').val()
        }
        console.log('datas :: ' + JSON.stringify(datas));

        $.ajax({
            type: 'post',
            url: '/customer/reserve/meeting/checkin',
            data: JSON.stringify(datas),
            contentType: 'application/json; charset=utf-8',
            success: function(res) {
                console.log('res ::: ' + res);
                var inputMrrTime = $('input[name="mrrTime"]');
                if (res.length > 0) {
                    for (var i = 0; i < res.length; i++) {
                        for (var j = 0; j < inputMrrTime.length; j++) {
                            if (inputMrrTime.eq(j).val() == res[i].mrrTime) {
                                inputMrrTime.eq(j).prop('disabled', true);
                                continue;
                            }
                        }
                    }
                } else {
                    inputMrrTime.prop('disabled', false);
                }
                inputMrrTime.removeClass('active');
                checkConfirmButton();
            }
        });
    }

    function checkConfirmButton() {
        // 회의실명, 회의일자, 시간 모두 선택되었는지 확인
        var isMeetingTypeSelected = $('#meetingType').val() !== "default";
        var isDateSelected = $('#dateopen').val() !== "";
        var isTimeSelected = $('input[name="mrrTime"].active').length > 0;

        if (isMeetingTypeSelected && isDateSelected && isTimeSelected) {
            $('#confirmButton').prop('disabled', false);
        } else {
            $('#confirmButton').prop('disabled', true);
        }
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
