package kr.co.springMVCtest.domain;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class FileUpload {
	private CommonsMultipartFile file;

	public CommonsMultipartFile getFile() {
		return file;
	}

	public void setFile(CommonsMultipartFile file) {
		this.file = file;
	}
}