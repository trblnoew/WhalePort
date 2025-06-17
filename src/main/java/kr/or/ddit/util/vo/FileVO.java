package kr.or.ddit.util.vo;

import org.apache.commons.io.FileUtils;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class FileVO {
	private MultipartFile item; 
	private int fileNo;
	private String fileOwner;
	private String fileSavepath;
	private long fileSize;
	private String fileMime;
	private String fileRealname;
	private String fileSavename;
	private String fileSavedate;
	private String fileDelyn;
	private int fileDowncount;
	private String fileFancysize;
	
	// 기본 생성자
	public FileVO() {
	}
	
	//커스텀 생성자
	public FileVO(MultipartFile item) {
		this.item = item;
		this.fileRealname = item.getOriginalFilename();
		this.fileSize = item.getSize();
		this.fileMime = item.getContentType();
		this.fileFancysize = FileUtils.byteCountToDisplaySize(fileSize);

	}
}
