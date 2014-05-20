package kr.co.springMVCtest.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

import net.coobird.thumbnailator.Thumbnails;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/thumbnail")
public class ThumbnailController {
	
	@RequestMapping(method = RequestMethod.GET)
	public String thumbnail(HttpServletRequest request, Model model) throws IOException {
		
		String uploadPath = "/resources"; // 마지막에 "/" 붙여줘야 함
		String contextRoot = new HttpServletRequestWrapper(request).getRealPath(uploadPath);
		String filename = "20140105_153353.jpg";
		Thumbnails.of(contextRoot + "/" + filename)
			.size(100,100)
			.toFile(contextRoot + "/thumbnail/" + filename);
		
		model.addAttribute("original", uploadPath + "/" + filename);
		model.addAttribute("thumbnail", uploadPath + "/thumbnail/" + filename);
		
		return "thumbnail/result";
	}

}
