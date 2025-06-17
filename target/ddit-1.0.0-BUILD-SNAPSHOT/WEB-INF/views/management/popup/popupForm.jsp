 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:set value="등록" var="name"  />
<c:if test="${status eq 'u' }">
	<c:set value="수정" var="name"  />
</c:if>
<div class="body-wrapper">
	<div class="container-fluid">
	
	<div class="card bg-info-subtle shadow-none position-relative overflow-hidden mb-4">
            <div class="card-body px-4 py-3">
              <div class="row align-items-center">
                <div class="col-9">
                  <h4 class="fw-semibold mb-8">팝업 ${name }</h4>
                  <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                      <li class="breadcrumb-item">
                        <a class="text-muted text-decoration-none" href="/common/home">DashBoard</a>
                      </li>
                      <li class="breadcrumb-item" aria-current="page">Popup</li>
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
			<div class="card-body">
				<form action="/management/popup/register" class="mt-0" method="post" id="eventForm" enctype="multipart/form-data" novalidate>
				
					<c:if test="${status eq 'u' }">
						<input type="hidden" name="popNo" value="${eventVO.popNo }"   />
					</c:if>

					<div class="mb-3 form-group">
						<label class="form-label">제목 <span class="text-danger">*</span>
						</label>
						<div class="controls">
							<input type="text" name="popTitle" id="popTitle" class="form-control" placeholder="제목을 입력하세요." value="${eventVO.popTitle }"
							 required data-validation-required-message="필수입력 사항입니다." />
						</div>
					</div>

					<div class="mb-3 form-group">
						<label class="form-label">내용 <span class="text-danger">*</span>
						</label>
						<div class="controls">
							<input type="text" name="popContent" id="popContent" class="form-control" placeholder="내용을 입력하세요." value="${eventVO.popContent }"
							 required data-validation-required-message="필수입력 사항입니다." />
						</div>
					</div>


			   <div class="mb-3 form-group">
                  <label class="form-label">게시 목적 <span class="text-danger">*</span>
                  </label>
                  <div class="controls">
                    <select name="popGoal" id="popGoal" required data-validation-required-message="필수입력 사항입니다." class="form-select form-control">
                      <option value="">게시 목적을 선택해주세요</option>
                      <option value="공지사항" <c:if test="${eventVO.popGoal eq '공지사항' }">selected</c:if>  >공지사항</option>
                      <option value="이벤트" <c:if test="${eventVO.popGoal eq '이벤트' }">selected</c:if>  >이벤트</option>
                    </select>
                  </div>
                </div>

			   <div class="mb-3 form-group">
                  <label class="form-label">게시 상태<span class="text-danger">*</span>
                  </label>
                  <div class="controls">
                    <select name="popApproval" id="popApproval" required data-validation-required-message="필수입력 사항입니다." class="form-select form-control">
                      <option value="">게시 상태를 선택해주세요</option>
                      <option value="게시중" <c:if test="${eventVO.popApproval eq '게시중' }">selected</c:if> >게시중</option>
                      <option value="게시종료" <c:if test="${eventVO.popApproval eq '게시종료' }">selected</c:if> >게시종료</option>
                    </select>
                    
                    
                  </div>
                </div>

				<div class="mb-3 form-group">
                  <label class="form-label">게시 시작일 <span class="text-danger">*</span>
                  </label>
                  <div class="controls">
			        <div class="input-group border rounded-1">
	                <input type="date" name="popStartdate" class="form-control border-0 ps-2" id="popStartdate" value="" required data-validation-required-message="필수입력 사항입니다." />
                  </div>
                  </div>
                </div>

				<div class="mb-3 form-group">
                  <label class="form-label">게시 종료일 <span class="text-danger">*</span>
                  </label>
                  <div class="controls">
			        <div class="input-group border rounded-1">
	                <input type="date" name="popEnddate" class="form-control border-0 ps-2" id="popEnddate" value="" required data-validation-required-message="필수입력 사항입니다."  />
                  </div>
                  </div>
                </div>

                
                
                <c:choose>
                	<c:when test="${ empty eventVO.popImg }">
						<div class="mb-3 form-group">
		                  <label class="form-label">파일선택 <span class="text-danger">*</span>
		                  </label>
		                  <div class="controls">
		                    <input type="file" name="popupImgFile" id="popupImgFile" class="form-control" required data-validation-required-message="필수입력 사항입니다." />
		                  </div>
		                </div>
                	</c:when>
                	<c:otherwise>
						<div class="mb-4 row align-items-center">
							<label for="exampleInputText33" class="form-label">파일선택</label>
							<div class="col-sm-9">
								<div class="input-group border rounded-1">
									<input type="file" name="popupImgFile" id="popupImgFile" class="form-control border-0 ps-2" value="" />
								</div>
							</div>
						</div>
                	</c:otherwise>
                </c:choose>

						<div class="mb-3 form-group">
					            <label class="form-label">이미지</label>
					              <div class="input-group border rounded-1">
					              <img alt="" src="${eventVO.popImg}" id="imgArea" style="width: 50px;" class="form-control border-0 ps-2">
					              </div>
					    </div>
			          
					<sec:csrfInput />
				</form>
				<br />
				<div class="d-flex justify-content-end">
					<a href="/management/popup/list" class="btn btn-outline-primary me-3">이전</a>
					<input type="button" value="${name=='수정'? '저장':'등록' }" id="addBtn" class="btn btn-primary" /> 
				</div>
			</div>
		</div>
		
	</div>
</div>

<script type="text/javascript">
$(function(){
	var popupImgFile = $("#popupImgFile"); //이미지 선택하기 위한 input element
	var eventForm = $("#eventForm"); // 등록 Form 
	var addBtn = $("#addBtn"); // 등록 버튼
	
	
	popupImgFile.on("change",function(){
		var file = event.target.files[0]; 	
		
		if(isImageFile(file)){	// 이미지라면
			
			///FileReader 객체 생성
			/// FileReader를 통해 해당 파일의 url을 읽어준다.
			var reader = new FileReader();
		
			/// reader 시작시 함수 구현 
			/// 파일의 url을 읽혀지게 되면 내부 함수가 실행되고 이미지로 변환하는 소스이다.
			reader.onload = function(e){
				console.log("e2",e);
				
				/// e.target.result : base64 인코딩 된 스트링 데이터
				$("#imgArea").attr("src", e.target.result);
			}
			
			/// readAsDataURL : 지정된 Blob이나 File의 콘텐츠를 읽기 위해 사용하고 base64 인코딩 된 String Data를 리턴
			reader.readAsDataURL(file);
		}else{					// 이미지 파일이 아닐 때
			alert("이미지 파일을 선택해 주세요!");
		}
		
	});
	
	addBtn.on("click", function(){
// 		alert("되나")
		
		if($(this).val()=="저장"){
			eventForm.attr("action", "/management/popup/update");
		}
		eventForm.submit();
	});
	
});

function isImageFile(file){
	var ext = file.name.split(".").pop().toLowerCase();	// 파일명에서 확장자를 추출
	return ($.inArray(ext, ["jpg", "jpeg", "png", "gif"]) === -1) ? false : true;
}


</script>


