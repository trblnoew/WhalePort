<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/libs/quill/dist/quill.snow.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/ckeditor/ckeditor.js"></script>

<style>
.cke_notification.cke_notification_warning { display: none; }
</style>

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
                <h5 class="mb-0 text-white">보고서 작성</h5>
            </div>
            <!-- start Default Form Elements -->
            <div class="card-body">
            <div class="col-12">
				<form class="form-horizontal" id="reportForm" action="/partner/facilities/reportRegister" method="post" style="text-align: center;">
					<br>
					<select class="form-select" id="inNo" name="inNo">
				            <option value="">접수 내역을 선택하세요.</option>
				            <c:forEach var="schedule" items="${inspectionVO}">
				                <option value="${schedule.inNo}">${schedule.inNo}.${schedule.inReception}</option>
				            </c:forEach>
				    </select>
					<br>
					<div class="form-group d-flex align-items-center">
					    <input type="text" id="inTitle" name="inTitle" class="form-control" value="" placeholder="제목을 입력해주세요.">
					    <input type="hidden" name="ptNo" value="${ptNo}">
					</div>
				    <br>
				    <div class="form-group">
						<textarea class="form-control" id="inContent" name="inContent" style="width: 30%; height: 800px; ">
						    <div style="border: 1px solid #000; padding: 80px; margin-top: 20px;">
						        <h2 style="text-align: center; font-weight: bold;"><strong>시설 점검 보고서</strong></h2>
								<div style="margin-top: 40px;">
								    <table style="width: 100%; border-collapse: collapse; border: 1px solid #000;">
								        <tr style="height: 50px;">
								            <td style="border: 1px solid #000; padding: 10px; text-align: center; background-color: #f2f2f2; font-weight: bold; width: 25%; color: #000;">점검자 소속</td>
								            <td style="border: 1px solid #000; padding: 10px; text-align: center; width: 25%; color: #000;"></td>
								            <td style="border: 1px solid #000; padding: 10px; text-align: center; background-color: #f2f2f2; font-weight: bold; width: 25%; color: #000;">점검자 성명</td>
								            <td style="border: 1px solid #000; padding: 10px; text-align: center; width: 25%; color: #000;"></td>
								        </tr>
								        <tr style="height: 50px;">
								            <td style="border: 1px solid #000; padding: 10px; text-align: center; background-color: #f2f2f2; font-weight: bold; width: 25%; color: #000;">점검일자</td>
								            <td colspan="3" style="border: 1px solid #000; padding: 10px; text-align: center; width: 100%; color: #000;"></td>
								        </tr>
								        <tr style="height: 50px;">
								            <td style="border: 1px solid #000; padding: 10px; text-align: center; background-color: #f2f2f2; font-weight: bold; width: 25%; color: #000;">점검목적</td>
								            <td style="border: 1px solid #000; padding: 10px; text-align: center; width: 25%; color: #000;"></td>
								            <td style="border: 1px solid #000; padding: 10px; text-align: center; background-color: #f2f2f2; font-weight: bold; width: 25%; color: #000;">점검상태</td>
								            <td style="border: 1px solid #000; padding: 10px; text-align: center; width: 25%; color: #000;"></td>
								        </tr>
								        <tr style="height: 50px;">
								            <td style="border: 1px solid #000; padding: 10px; text-align: center; background-color: #f2f2f2; font-weight: bold; width: 25%; color: #000;">점검위치</td>
								            <td style="border: 1px solid #000; padding: 10px; text-align: center; width: 25%; color: #000;"></td>
								            <td style="border: 1px solid #000; padding: 10px; text-align: center; background-color: #f2f2f2; font-weight: bold; width: 25%; color: #000;">점검인원</td>
								            <td style="border: 1px solid #000; padding: 10px; text-align: center; width: 25%; color: #000;"></td>
								        </tr>
								        <tr style="height: 50px;">
								            <td style="border: 1px solid #000; padding: 10px; text-align: center; background-color: #f2f2f2; font-weight: bold; width: 25%; color: #000;">제목</td>
								            <td colspan="3" style="border: 1px solid #000; padding: 10px; text-align: center; width: 100%; color: #000;"></td>
								        </tr>
										<tr style="height: 50px;">
										    <td colspan="4" style="border: 1px solid #000; padding: 5px; text-align: center; background-color: #f2f2f2; font-weight: bold; color: #000;">점검내용</td>
										</tr>
								        <tr style="height: 400px;">
								            <td colspan="4" style="border: 1px solid #000; padding: 20px; color: #000;">${partner.content}</td>
								        </tr>
								    </table>
								</div>

						    </div>
						</textarea>
					</div>
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

      