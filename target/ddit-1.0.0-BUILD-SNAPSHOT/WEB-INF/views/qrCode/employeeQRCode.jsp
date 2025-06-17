<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!--     <h1>QR CODE IMAGE</h1> -->
    <img alt="" src="/management/qrCode/employeeQrCodeImage">
<!--     <h1>QR CODE 값 추출</h1> -->
<!--     <h4>1. ZXing-javase 방법</h4> -->
    <button type="button" id="btn1">값 추출하기</button><br>
    <div id="result1"></div>
    <h4>2. html5-qrcode 방법</h4>
    <button type="button" id="btn2">값 추출하기</button><br>
    <div id="reader" style="width:500px; display:none;"></div>
    <div id="result2"></div>
    <div id="result3"></div>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/html5-qrcode/2.3.8/html5-qrcode.min.js"></script>
<script type="text/javascript">
$(function(){
	var btn1 = $("#btn1");
	var btn2 = $("#btn2");
	
	btn1.on("click", function() {
		$.ajax({
			url : "/management/qrCode/employeeQrCodeValue",
			method : "get",
			contentType : "application/json; charset=UTF-8",
			success : function (result) {
				var html = "";
				html = "<h3>값 : " + result + "</h3>";
				$("#result1").html(html);
			}
		});
	});
	
	btn2.on("click", function() {
		startQrScanner();
	});
	
});
function startQrScanner() {
    $('#reader').show(); // 스캐너 영역을 표시

    // Html5QrCode 객체를 생성하여 QR 코드 스캔 기능을 활성화
    // "reader"는 QR 코드를 스캔할 영역의 ID로, 이 영역애서 실시간으로 QR 코드를 스캔
    let html5QrCode = new Html5Qrcode("reader");

    // html5QrCode.start(...) : QR 코드 스캔을 시작하는 메서드
    html5QrCode.start(
    		
    	// "user" : 전면 카메라 사용
    	// "environment : 후면 카메라 사용"
        { facingMode: "environment" },
        {
        	// 초당 프레임 수
            fps: 10,  
            // QR 코드 인식 영역 크기
            // qrbox: {width: 250, height: 250} -> 가로, 세로 각각 설정 가능
            qrbox: 250
            
        },
        
        // QR 코드 스캔을 성공하면 qrCodeMessage에 QR 코드의 데이터가 들어가고 콜백함수 실행
        function (qrCodeMessage) {
        	
        	
			var html = "";
			html = "<h3>값 : " + qrCodeMessage + "</h3>";
			$("#result2").html(html);

            // QR 코드 데이터에서 JSON을 추출
            $.ajax({
                url: '/management/qrCode/employeeQrCodeValue',
                type: 'GET',
                success: function(result) {
                	
                    // JSON 데이터를 처리
					html = "<h3>값 : " + result + "</h3>";
					$("#result3").html(html);
					
					// QR 코드 스캔을 중지하고 카메라를 끕니다.
					// 중지 성공 시 then() 실행, 실패 시 catch() 실행
                    html5QrCode.stop().then(() => {
                        console.log('QR code scanning stopped.');
                        $('#reader').hide();
                    }).catch((err) => {
                        console.error('Failed to stop QR code scanning:', err);
                    });
                },
                error: function(xhr, status, error) {
                    console.error('Error fetching member data:', error);
                }
            });
        },
        // 스캔 실패 시
        function (error) {
            
            console.warn(`QR 코드 스캔 실패: ${error}`);
        }
     // 시작 실패 시
    ).catch(err => {
        console.log(`QR 스캐너 시작 중 오류: ${err}`);
    });
}
</script>
</html>