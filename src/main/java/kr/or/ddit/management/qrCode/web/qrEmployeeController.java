package kr.or.ddit.management.qrCode.web;

import java.io.File;
import java.io.IOException;
import java.nio.file.FileSystems;
import java.nio.file.Path;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpStatus;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.zxing.BarcodeFormat;
import com.google.zxing.WriterException;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.QRCodeWriter;

import kr.or.ddit.management.human.management.vo.EmployeeVO;


@Controller
@RequestMapping("/management/qrCode")
public class qrEmployeeController {

	private static final Logger log = LoggerFactory.getLogger(qrEmployeeController.class);
	
	@GetMapping("/createQRCode")
	public String signup() {
		return "qrCode/empInsertDetail";
	}
	
	@GetMapping("/employeeQRCode")
	public String employeeQRCode() {
		return "qrCode/employeeQRCode";
	}
	
	@GetMapping("/qrqrqr")
	public String qrqrqr() {
		return "qrCode/qrqrqr";
	}
	
    @PostMapping("/createQRCode")
    @ResponseBody
    public ResponseEntity<EmployeeVO> createQRCode(@RequestBody EmployeeVO employeeVO, HttpServletRequest req) 
    		throws WriterException, IOException {
    	
    	// JSON을 EmployeeVO 객체로 변환
        ObjectMapper mapper = new ObjectMapper();
        String json = mapper.writeValueAsString(employeeVO);

        String uploadDir = req.getServletContext().getRealPath("") + File.separator + "qrCode";
        String filePath = uploadDir + File.separator + "memberQrCode.png";
        
        File directory = new File(uploadDir);
		if (!directory.exists()) {
			directory.mkdirs();
		}
		
        QRCodeWriter qrCodeWriter = new QRCodeWriter();
        // UTF-8을 ISO-8859-1로 디코딩
        BitMatrix bitMatrix = qrCodeWriter.encode(new String(json.getBytes("UTF-8"), "ISO-8859-1"), BarcodeFormat.QR_CODE, 350, 350);

        Path path = FileSystems.getDefault().getPath(filePath);
        MatrixToImageWriter.writeToPath(bitMatrix, "PNG", path);

        return new ResponseEntity<EmployeeVO>(employeeVO, HttpStatus.OK);  
    }
    
//    
//	@ResponseBody
//	@GetMapping("/employeeQrCodeImage")
//	public ResponseEntity<byte[]> qrCodeImage(HttpServletRequest req) throws IOException{
//		InputStream in = null;
//		ResponseEntity<byte[]> entity = null;
//		String path = req.getServletContext().getRealPath("/qrCode/memberQrCode.png");
//		log.info("path :: " + path);
//		in = new FileInputStream(path);
//		entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), HttpStatus.OK);
//		
//		return entity;
//	}
//	
//	@ResponseBody
//	@GetMapping(value = "/employeeQrCodeValue", produces = "text/plain; charset=UTF-8") // ISO-8859-1로 디코딩 된 데이터를 UTF-8로 인코딩
//	public ResponseEntity<String> qrCodeValue(HttpServletRequest req){
//		ResponseEntity<String> entity = null;
//		String path = req.getServletContext().getRealPath("/qrCode/memberQrCode.png");
//        try {
//        	BufferedImage bufferedImage = ImageIO.read(new File(path));
//
//        	// 이미지를 LuminanceSource로 변환하여 밝기 정보 추출
//        	LuminanceSource luminanceSource = new BufferedImageLuminanceSource(bufferedImage);
//
//        	// 밝기 정보를 이진화(Binarization)하여 BinaryBitmap에 저장
//        	BinaryBitmap binaryBitmap = new BinaryBitmap(new HybridBinarizer(luminanceSource));
//
//        	// BinaryBitmap의 이진 데이터를 분석하여 QR 코드를 디코딩하여 Result 객체에 저장
//        	Result result = new MultiFormatReader().decode(binaryBitmap);
//        	
//        	entity = new ResponseEntity<String>(result.getText(), HttpStatus.OK);
//
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        return entity;
//	}
}
