package kr.co.springMVCtest.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.validation.Valid;

import kr.co.springMVCtest.domain.FileUpload;
import kr.co.springMVCtest.domain.UploadTest;
import kr.co.springMVCtest.validator.FileUploadValidator;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

@Controller
@RequestMapping(value = "/fileUpload")
@SessionAttributes("fileUpload")
public class FileUploadController {
	@InitBinder("fileUpload")
	void initBinder(WebDataBinder binder) {
		binder.setValidator(new FileUploadValidator());
	}

	@RequestMapping(method = RequestMethod.GET)
	public String getUploadForm(Model model) {
		model.addAttribute(new FileUpload());
		return "fileUpload/form";
	}

	@RequestMapping(method = RequestMethod.POST, produces="text/plain;charset=UTF-8")
	public @ResponseBody String fileUpload(HttpServletRequest request, @Valid FileUpload fileUpload, BindingResult result, SessionStatus status, Model model) throws IllegalStateException, IOException {
		if (result.hasErrors()) {
			for (ObjectError error : result.getAllErrors()) {
				System.err.println("Error: " + error.getCode() + " - "
						+ error.getDefaultMessage());
			}
			return "{\"success\" : false}";
		}
		
		// file upload
		CommonsMultipartFile file = fileUpload.getFile();  
	
		String uploadPath = "/resources"; // 마지막에 "/" 붙여줘야 함
		String contextRoot = new HttpServletRequestWrapper(request).getRealPath(uploadPath); // file path
		String fileName = file.getOriginalFilename(); // file name
		
		System.out.println("contextRoot : " + contextRoot);
		System.out.println("fileName : " + fileName);
		//String filepath = "D:/Dev/workspaces/springMVCtest/src/main/webapp/resources/" + fileName;
//		String filepath = "D:/Dev/Tomcat 7.0/everydaychurch/springMVCtest/resources/" + fileName;
		
		String filepath = contextRoot + "/" + fileName;
		System.out.println("filepath : " + filepath);
		
        File destination = new File(filepath);
        file.transferTo(destination);

		// end
		status.setComplete();
		
		// Some type of file processing...
		System.err.println("-------------------------------------------");
		System.err.println("Test upload: "
				+ fileUpload.getFile().getOriginalFilename());
		System.err.println("-------------------------------------------");
		
		//response.setContentType("text/xml; charset=UTF-8");
		// TODO : json 응답으로 바꿔야 함
		return "{\"success\" : true, \"fileinfo\" : { \"filepath\" : \"" + uploadPath + "\", \"filename\" : \"" + fileUpload.getFile().getOriginalFilename() + "\"} }";
	}
	
	@RequestMapping(value = "/{filename}", method = RequestMethod.GET)
	public String view(Model model, @PathVariable String filename) {
		model.addAttribute("filename", filename);
		return "fileUpload/view";
	}
	
	@RequestMapping(value = "/test", method = RequestMethod.POST) // member add
	public void formSubmit(Model model, @ModelAttribute("uploadTest") UploadTest uploadTest){
		for(String s : uploadTest.getFileinput()) {
			System.out.println("filename : " + s);
		}
		model.addAttribute("filelist", uploadTest.getFileinput());
	}
	
}
