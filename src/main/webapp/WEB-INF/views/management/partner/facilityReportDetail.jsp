<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/libs/quill/dist/quill.snow.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/ckeditor/ckeditor.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/1.4.1/html2canvas.min.js"></script>

<div class="body-wrapper">
    <div class="container-fluid">
        <!-- 상단 카드 시작 -->
        <div class="card bg-info-subtle shadow-none position-relative overflow-hidden mb-4">
            <div class="card-body px-4 py-3">
                <div class="row align-items-center" style="margin-top:20px;">
                    <div class="col-9">
                        <h4 class="fw-semibold mb-8">보고서 관리</h4>
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item">
                                    <a class="text-muted text-decoration-none" href="../main/index.html">DashBoard</a>
                                </li>
                                <li class="breadcrumb-item" aria-current="page">보고서 관리</li>
                            </ol>
                        </nav>
                    </div>
                    <div class="col-3">
                        <div class="text-center mb-n4">
                            <img src="${pageContext.request.contextPath}/resources/assets/images/logos/symbol-01.png" alt="modernize-img" class="img-fluid" style="width: 120px; height: auto;">
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- 상단 카드 끝 -->
        <div class="card">
            <div class="card-header text-bg-primary">
                <h5 class="mb-0 text-white">보고서 상세</h5>
            </div>
         
            <div class="card-body">
	            <div class="card overflow-hidden">
		            <div class="card-body p-4">
		              	<div id="reportTitle" class="form-control-plaintext" style="font-size: 1.0rem;">${inspectionVO.inTitle}</div>
		            </div>
		            <div class="card-body border-top p-4">
						<div id="reportContent" class="form-control-plaintext">${inspectionVO.inContent}</div>
		            </div>
	            </div>
			    <div class="d-flex justify-content-end">
			        <button type="button" id="submitBtn" class="btn btn-primary btn-pdf me-3" onclick="generatePDF()">PDF 다운로드</button>
				    <a href="/management/facility/reportList" class="btn btn-outline-primary">이전</a>
			    </div>
            </div>
        </div>
    </div>
</div>

<script>
    async function generatePDF() { // PDF 생성 함수를 정의합니다.
        const { jsPDF } = window.jspdf; // jsPDF 라이브러리에서 jsPDF 객체를 가져옵니다.
        const content = document.getElementById("reportContent"); // PDF로 변환할 HTML 요소를 가져옵니다.

        const canvas = await html2canvas(content); // html2canvas를 사용하여 HTML 요소를 캡처하고 캔버스를 생성합니다.
        const imgData = canvas.toDataURL('image/png'); // 캔버스를 이미지 데이터 URL로 변환합니다.
        
        const pdf = new jsPDF(); // 새로운 jsPDF 인스턴스를 생성합니다.
        const imgWidth = 190; // 이미지의 너비를 설정합니다.
        const pageHeight = pdf.internal.pageSize.height; // PDF 페이지의 높이를 가져옵니다.
        const imgHeight = (canvas.height * imgWidth) / canvas.width; // 이미지의 높이를 계산합니다.
        let heightLeft = imgHeight; // 남은 높이 변수 초기화

        let position = 0; // 위치 변수 초기화

        pdf.addImage(imgData, 'PNG', 10, position, imgWidth, imgHeight); // 첫 페이지에 이미지를 추가합니다.
        heightLeft -= pageHeight; // 남은 높이를 업데이트합니다.

        while (heightLeft >= 0) { // 남은 높이가 0 이상인 동안 반복하여 페이지에 이미지를 추가합니다.
            position = heightLeft - imgHeight; // 새로운 페이지의 위치를 계산합니다.
            pdf.addPage(); // 새로운 페이지를 추가합니다.
            pdf.addImage(imgData, 'PNG', 10, position, imgWidth, imgHeight); // 새 페이지에 이미지를 추가합니다.
            heightLeft -= pageHeight; // 남은 높이를 업데이트합니다.
        }

        pdf.save('시설 점검 보고서.pdf'); // 생성된 PDF 파일을 'document.pdf'라는 이름으로 저장합니다.
    }
</script>
