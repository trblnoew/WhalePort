<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en" dir="ltr" data-bs-theme="light" data-color-theme="Blue_Theme" data-layout="vertical">
<style>
.fc-event-title.fc-sticky {
    color: black;
}
</style>
<link href="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/5.10.1/main.min.css" rel="stylesheet" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/5.10.1/main.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<div class="body-wrapper">
    <div class="container-fluid">
        <div class="card bg-info-subtle shadow-none position-relative overflow-hidden mb-4">
            <div class="card-body px-4 py-3">
                <div class="row align-items-center">
                    <div class="col-9">
                        <h4 class="fw-semibold mb-8">부서 일정 관리</h4>
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item">
                                    <a class="text-muted text-decoration-none" href="/common/home">DashBoard</a>
                                </li>
                                <li class="breadcrumb-item" aria-current="page">부서 일정 관리</li>
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
		<div class="d-sm-flex d-block align-items-center justify-content-between mb-9">
			<div class="mb-3 mb-sm-0"></div>
			<div>
<!-- 				<select class="form-select" id="calSelect"> -->
<!-- 					<option value="calAll">전체</option> -->
<!-- 					<option value="calDept">부서별</option> -->
<!-- 					<option value="calOwn">개인별</option> -->
<!-- 				</select> -->
				<select class="form-select" id="calSelect">
					<option value="calDept">전체</option>
					<option value="calHuman">인사</option>
					<option value="calInfo">전산</option>
					<option value="calPartner">협력업체</option>
					<option value="calService">공항서비스</option>
				</select>
			</div>
		</div>
		<div class="card">
            <div id="calendar"></div>
        </div>
        
        <!-- 일정 모달 START -->
        <div class="modal fade" id="eventModal" tabindex="-1" aria-labelledby="eventModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-scrollable modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="eventModalLabel">일정 등록</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <form>
	                    <div class="modal-body">
	                        <div class="row">
	                            <div class="col-md-12">
	                                <div>
	                                    <label class="form-label">일정 내용</label>
	                                    <input type="text" class="form-control" id="calTitle" name="calTitle"/>
	                                </div>
	                            </div>
	                            <div class="col-md-12 mt-6">
	                                <div>
	                                    <label class="form-label">타입</label>
	                                </div>
	                                <div class="d-flex">
	                                    <div class="n-chk">
	                                        <div class="form-check form-check-primary form-check-inline">
	                                            <input class="form-check-input" type="radio" name="event-level" value="Danger" id="modalDanger" />
	                                            <label class="form-check-label" for="modalDanger">Danger</label>
	                                        </div>
	                                    </div>
	                                    <div class="n-chk">
	                                        <div class="form-check form-check-warning form-check-inline">
	                                            <input class="form-check-input" type="radio" name="event-level" value="Success" id="modalSuccess" />
	                                            <label class="form-check-label" for="modalSuccess">Success</label>
	                                        </div>
	                                    </div>
	                                    <div class="n-chk">
	                                        <div class="form-check form-check-success form-check-inline">
	                                            <input class="form-check-input" type="radio" name="event-level" value="Primary" id="modalPrimary" />
	                                            <label class="form-check-label" for="modalPrimary">Primary</label>
	                                        </div>
	                                    </div>
	                                    <div class="n-chk">
	                                        <div class="form-check form-check-danger form-check-inline">
	                                            <input class="form-check-input" type="radio" name="event-level" value="Warning" id="modalWarning" />
	                                            <label class="form-check-label" for="modalWarning">Warning</label>
	                                        </div>
	                                    </div>
	                                </div>
	                            </div>
	                            <div class="col-md-12 mt-6">
	                               <div>
	                                   <label class="form-label">구분</label>
	                                   <div class="form-check form-switch">
					                   		<input class="form-check-input" type="checkbox" id="calDiv"/>
					                   		<label class="form-check-label" for="color-primary">부서일정</label>
					                   </div>
	                               </div>
	                            </div>
	                            <div class="col-md-12 mt-6">
	                                <div>
	                                    <label class="form-label">시작일</label>
	                                    <input type="date" class="form-control" id="calStartdate" name="calStartdate"/>
	                                </div>
	                            </div>
	
	                            <div class="col-md-12 mt-6">
	                                <div>
	                                    <label class="form-label">종료일</label>
	                                    <input type="date" class="form-control" id="calEnddate" name="calEnddate"/>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                    <sec:csrfInput/>
                    </form>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary btn-add-event" id="calRegBtn">등록</button>
                        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">취소</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- 일정 모달 END -->
        
        <!-- 수정 모달 START -->
        <div class="modal fade" id="scheduleModal" tabindex="-1" aria-labelledby="eventModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-scrollable modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="eventModalLabel">상세조회</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <form>
	                    <div class="modal-body">
	                        <div class="row">
	                            <div class="col-md-12">
	                                <div>
	                                    <label class="form-label">일정 내용</label>
	                                    <input type="hidden" class="form-control" id="calNo" name="calNo"/>
	                                    <input type="text" class="form-control" id="calTitle2" name="calTitle"/>
	                                </div>
	                            </div>
	                            <div class="col-md-12 mt-6">
	                                <div>
	                                    <label class="form-label">타입</label>
	                                </div>
	                                <div class="d-flex">
	                                    <div class="n-chk">
	                                        <div class="form-check form-check-primary form-check-inline">
	                                            <input class="form-check-input" type="radio" name="event-level2" value="Danger" id="modalDanger2" />
	                                            <label class="form-check-label" for="modalDanger">Danger</label>
	                                        </div>
	                                    </div>
	                                    <div class="n-chk">
	                                        <div class="form-check form-check-warning form-check-inline">
	                                            <input class="form-check-input" type="radio" name="event-level2" value="Success" id="modalSuccess2" />
	                                            <label class="form-check-label" for="modalSuccess">Success</label>
	                                        </div>
	                                    </div>
	                                    <div class="n-chk">
	                                        <div class="form-check form-check-success form-check-inline">
	                                            <input class="form-check-input" type="radio" name="event-level2" value="Primary" id="modalPrimary2" />
	                                            <label class="form-check-label" for="modalPrimary">Primary</label>
	                                        </div>
	                                    </div>
	                                    <div class="n-chk">
	                                        <div class="form-check form-check-danger form-check-inline">
	                                            <input class="form-check-input" type="radio" name="event-level2" value="Warning" id="modalWarning2" />
	                                            <label class="form-check-label" for="modalWarning">Warning</label>
	                                        </div>
	                                    </div>
	                                </div>
	                            </div>
	                            <div class="col-md-12 mt-6">
	                               <div>
	                                   <label class="form-label">구분</label>
	                                   <div class="form-check form-switch">
					                   		<input class="form-check-input" type="checkbox" id="calDiv2"/>
					                   		<label class="form-check-label" for="color-primary">부서일정</label>
					                   </div>
	                               </div>
	                            </div>
	                            <div class="col-md-12 mt-6">
	                                <div>
	                                    <label class="form-label">시작일</label>
	                                    <input type="date" class="form-control" id="calStartdate2" name="calStartdate"/>
	                                </div>
	                            </div>
	
	                            <div class="col-md-12 mt-6">
	                                <div>
	                                    <label class="form-label">종료일</label>
	                                    <input type="date" class="form-control" id="calEnddate2" name="calEnddate"/>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                    <sec:csrfInput/>
                    </form>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary btn-add-event" id="calUpdtBtn">수정</button>
                        <button type="button" class="btn btn-danger" id="calDelBtn">삭제</button>
                        <button type="button" class="btn btn-outline-primary" data-bs-dismiss="modal">취소</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- 수정 모달 END -->
    </div>
</div>
<script>
var calendar;
var selectedVal = "";
var calDiv = ""; // 변수 이름 수정
$(function() {
    // 일정 조회 select 옵션 변경 이벤트
    $("#calSelect").on("change", function() {
        selectedVal = $(this).val();

        if (selectedVal == "calDept") {
            calDiv = "D";
        } else if (selectedVal == "calOwn") {
            calDiv = "O";
        } else {
            calDiv = "";
        }

        // Ajax를 통해 선택한 calDiv 값을 서버로 전송
        $.ajax({
            type: "GET",
            url: "/common/calendarInfo",
            data: {
                calDiv: calDiv
            },
            success: function(response) {
                console.log("서버 응답:", response);

                // 기존 캘린더 인스턴스 제거 후 새로 생성
                calendar.removeAllEvents();

                response.data.map(function(v,i){
					calendar.addEvent({
						id: v.id,
						title: v.title,
						start: v.start,
						end: v.end,
						color: v.color,
						calDiv: v.calDiv,
						extendedProps: {
					        calType: v.calType // v.calType이 올바르게 설정되어 있는지 확인
					    }
					});
                });
                calendar.render();
            },
            error: function(xhr, status, error) {
                console.error("AJAX 에러:", error);
            }
        });
    });

    // 수정 모달창 수정 버튼 클릭 이벤트
    $("#calUpdtBtn").on("click", function() {
        var calNo = $("#calNo").val();
        var calTitle = $("#calTitle2").val();
        var calStartdate = $("#calStartdate2").val();
        var calEnddate = $("#calEnddate2").val();
        var calType = $("input[name='event-level2']:checked").val();
        var calDiv = $("#calDiv2").is(":checked") ? "D" : "O";

        var data = {
            calNo: calNo,
            calTitle: calTitle,
            calStartdate: calStartdate,
            calEnddate: calEnddate,
            calType: calType,
            calDiv: calDiv
        };
        
        Swal.fire({
            title: '이벤트 수정',
            text: '수정 하시겠습니까?',
            icon: 'info',
            showCancelButton: true,
            confirmButtonText: '확인',
            cancelButtonText: '취소',
            customClass: {
                cancelButton: 'btn btn-outline-primary',
                confirmButton: 'btn btn-primary me-2'
            },
            buttonsStyling: false
        }).then((result) => {
            if (result.isConfirmed) {
                $.ajax({
                    url: '/common/calendarUpdate',
                    type: 'POST',
                    data: JSON.stringify(data),
                    contentType: "application/json; charset=utf-8",
                    success: function(rsp) {
                        Swal.fire({
                            title: '수정이 완료되었습니다.',
                            confirmButtonText: '확인'
                        });
                        location.href = location.href;
                    },
                    error: function(xhr, status, error) {
                        console.error('Error updating event:', error);
                    }
                });
            }
        });
    });

    // 수정 모달창 삭제 버튼 클릭 이벤트
    $("#calDelBtn").on("click", function() {
        var calNo = $("#calNo").val();
        console.log("삭제할 일정 번호: ", calNo);
        var data = {
            calNo: calNo
        };

        Swal.fire({
            title: '이벤트 삭제',
            text: '삭제 하시겠습니까?',
            icon: 'warning',
            showCancelButton: true,
            confirmButtonText: '확인',
            cancelButtonText: '취소',
            customClass: {
                cancelButton: 'btn btn-outline-primary',
                confirmButton: 'btn btn-primary me-2'
            },
            buttonsStyling: false
        }).then((result) => {
            if (result.isConfirmed) {
                $.ajax({
                    url: '/common/calendarDelete',
                    type: 'POST',
                    data: JSON.stringify(data),
                    contentType: "application/json; charset=utf-8",
                    success: function(rsp) {
                        Swal.fire({
                            title: '삭제가 완료되었습니다.',
                            confirmButtonText: '확인'
                        });
                        $('#scheduleModal').modal('hide');
                        var event = calendar.getEventById(calNo);
                        if (event) {
                            event.remove();
                        }
                    },
                    error: function(xhr, status, error) {
                        console.error('Error deleting event:', error);
                    }
                });
            }
        });
    });

    // 모달창 등록 버튼 클릭 이벤트
    $("#calRegBtn").on("click", function() {
        var calNo = $("#calNo").val();
        var title = $("#calTitle").val();
        var calStartdate = $("#calStartdate").val();
        var calEnddate = $("#calEnddate").val();
        var calType = $("input[name='event-level']:checked").val();
        var calDiv = $("#calDiv").is(":checked") ? "D" : "O";

        var data = {
            calNo: calNo,
            calTitle: title,
            calStartdate: calStartdate,
            calEnddate: calEnddate,
            calType: calType,
            calDiv: calDiv
        };

        console.log("data ::: ", data);

        $.ajax({
            url: '/common/addEvent',
            type: 'POST',
            data: JSON.stringify(data),
            contentType: "application/json; charset=utf-8",
            success: function(rsp) {
				location.href = location.href;
            },
            error: function(xhr, status, error) {
                console.error('Error adding event:', error);
            }
        });
    });
});

// 일정 조회 및 각종 기능 초기화
document.addEventListener('DOMContentLoaded', function() {
    var request = $.ajax({
        url: "/info/calendarInfo",
        type: "GET",
        dataType: "JSON"
    });

    request.done(function(data) {
        var calendarEl = document.getElementById('calendar');
        initializeCalendar(data); // 서버에서 받은 데이터를 통해 캘린더 초기화
    });

    request.fail(function(jqXHR, textStatus) {
        alert("Request failed: " + textStatus);
    });
});

// 캘린더 초기화 함수
function initializeCalendar(events) {
    var calendarEl = document.getElementById('calendar');
    calendar = new FullCalendar.Calendar(calendarEl, {
    	locale: 'ko',
        initialView: 'dayGridMonth',
        displayEventTime: false,
        headerToolbar: {
            left: 'dayGridMonth,timeGridWeek,dayGridDay',
            center: 'title',
            right: 'today prev,next'
        },
        selectable: true,
        events: events.data, // 서버에서 받은 이벤트 데이터 사용
        dateClick: function(info) {
            $("#eventModal").modal("show");
            $("#calStartdate").val(info.dateStr);
            $("#calEnddate").val(info.dateStr);
        },
        select: function(info) {
            $("#eventModal").modal("show");
            $("#calStartdate").val(info.startStr);
            let endDate = new Date(info.end);
            endDate.setDate(endDate.getDate());
            $("#calEnddate").val(endDate.toISOString().split('T')[0]);
        },
        eventClick: function(info) {
        	$("#calNo").val(info.event.id); // 이벤트 번호
            $("#calTitle2").val(info.event.title); // 이벤트 제목
            $("#calStartdate2").val(info.event.start.toISOString().slice(0, 10)); // 시작일
            $("#calEnddate2").val(info.event.end ? info.event.end.toISOString().slice(0, 10) : ""); // 종료일

            let calType = info.event.extendedProps.calType; // calType 값을 가져옵니다.
            console.log("Cal Type:", calType); // calType 값 확인 (디버깅용)
            if (calType) {
                $("input[name='event-level2'][value='" + calType + "']").prop("checked", true);
            } else {
                console.warn("calType X.");
            }

            let calDiv = info.event.extendedProps.calDiv;
            if (calDiv === 'D') {
                $("#calDiv2").prop("checked", true);
            } else if (calDiv === 'O') {
                $("#calDiv2").prop("checked", false);
            }
            
            $("#scheduleModal").modal("show");
        }
    });
    calendar.render(); // 캘린더 렌더링
}
</script>
</html>