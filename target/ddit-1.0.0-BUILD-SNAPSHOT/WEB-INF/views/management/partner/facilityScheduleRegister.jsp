<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/libs/quill/dist/quill.snow.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/ckeditor/ckeditor.js"></script>

<div class="body-wrapper">
        <div class="container-fluid">
    	<!-- 상단 카드 시작-->
        <div class="card bg-info-subtle shadow-none position-relative overflow-hidden mb-4">
           <div class="card-body px-4 py-3">
             <div class="row align-items-center" style="margin-top:20px;">
               <div class="col-9">
                 <h4 class="fw-semibold mb-8">시설 보고서 관리</h4>
                 <nav aria-label="breadcrumb">
                   <ol class="breadcrumb">
                     <li class="breadcrumb-item">
                       <a class="text-muted text-decoration-none" href="../main/index.html">DashBoard</a>
                     </li>
                     <li class="breadcrumb-item" aria-current="page">시설 보고서 관리</li>
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
        <!-- 상단 카드 끝 -->
          
          <div class="card">
            <div class="card-header text-bg-primary">
                <h5 class="mb-0 text-white">일정 등록</h5>
            </div>
            <!-- start Default Form Elements -->
            <div class="card-body">
            <div class="col-12">
				<form class="form-horizontal" id="reportForm" action="/partner/facilities/reportRegister" method="post" style="text-align: center;">
					<div class="d-flex justify-content-center">
					        <div class="d-flex" style="flex-wrap: wrap; justify-content: center; width: 100%;">
					            <div class="form-group me-5" style="margin-right: 10px;">
					                <label class="form-label" style="margin-right: 5px;">요청 구분</label>
					                <select class="form-select" id="inGoal" name="inGoal">
					                    <option value="">요청 구분</option>
					                    <option value="정기점검">정기점검</option>
					                    <option value="점검요청">점검요청</option>
					                    <option value="보수요청">보수요청</option>
					                    <option value="청소요청">청소요청</option>
					                    <option value="설치요청">설치요청</option>
					                    <option value="개선요청">개선요청</option>
					                </select>
					            </div>
					            <div class="form-group me-5" style="margin-right: 10px;">
					                <label class="form-label" style="margin-right: 5px;">점검 시작일시</label>
					                <input type="datetime-local" id="inStartdate" name="inStartdate" class="form-control" value="">
					            </div>
					            <div class="form-group me-5" style="margin-right: 10px;">
					                <label class="form-label" style="margin-right: 5px;">점검 종료일시</label>
					                <input type="datetime-local" id="inEnddate" name="inEnddate" class="form-control" value="">
					            </div>
					            <div class="form-group me-5" style="margin-right: 10px;">
					                <label class="form-label" style="margin-right: 5px;">점검 위치</label>
					                <select class="form-select" id="inPlace" name="inPlace">
					                    <option value="">점검 위치</option>
					                    <option value="탑승구">탑승구</option>
					                    <option value="체크인 구역">체크인 구역</option>
					                    <option value="보안 검색대">보안 검색대</option>
					                    <option value="출국 심사 구역">출국 심사 구역</option>
					                    <option value="도착 구역">도착 구역</option>
					                    <option value="수하물 찾는 곳">수하물 찾는 곳</option>
					                    <option value="상업 구역">상업 구역</option>
					                    <option value="라운지">라운지</option>
					                    <option value="주차장">주차장</option>
					                    <option value="공항 서비스 센터">공항 서비스 센터</option>
					                </select>
					            </div>
					            <div class="form-group me-5" style="margin-right: 10px;">
					                <label class="form-label" style="margin-right: 5px;">점검 인원</label>
					                <input type="text" id="inStaff" name="inStaff" class="form-control" value="" placeholder="인원을 입력해주세요.">
					            </div>
					        </div>
					</div>
					<br>
					<div class="form-group d-flex align-items-center">
					    <input type="text" id="inTitle" name="inTitle" class="form-control" value="" placeholder="제목을 입력해주세요.">
					    <input type="hidden" name="ptNo" value="${ptNo}">
					</div>
				    <br>
				</form>
              </div>
             </div>
			<div class="d-flex justify-content-end" style="padding-right: 30px; padding-bottom: 35px;">
			    <button id="submitBtn" class="btn btn-primary me-3">등록</button>
			    <a href="/partner/facilities/reportList" class="btn btn-outline-primary">이전</a>
			</div>	
            </div>
          </div>
        </div>

<script type="text/javascript">
$(function(){
    CKEDITOR.replace("inContent", {  // textarea의 id를 "inContent"로 수정
        filebrowserUploadUrl: "/imageUpload?${_csrf.parameterName}=${_csrf.token}"
    });
    CKEDITOR.config.height = "600px";   // CKEDITOR 높이 설정

    var reportForm = $("#reportForm");   // 등록 Form
    var addBtn = $("#submitBtn");  // 버튼의 id를 추가해야 합니다.

    addBtn.on("click", function(){
        var title = $("#inTitle").val();  // 제목을 가져옵니다.
        var content = CKEDITOR.instances.inContent.getData();   // CKEDITOR를 이용한 내용 가져오기
        
        if(title == null || title.trim() === ''){
            alert("제목을 입력해주세요.");
            return false;
        }
        
        if(content == null || content.trim() === ''){
            alert("내용을 입력해주세요.");
            return false;
        }
        
        reportForm.submit();  // 폼 제출
    });
});
</script>

      