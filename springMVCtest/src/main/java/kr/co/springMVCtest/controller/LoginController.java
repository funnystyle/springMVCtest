package kr.co.springMVCtest.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class LoginController {
//	@RequestMapping(value="/welcome", method = RequestMethod.GET)
//	public String printWelcome(ModelMap model, Principal principal ) {
//		String name = principal.getName();
//		model.addAttribute("username", name);
//		model.addAttribute("message", "Spring Security Custom Form example");
//		return "hello";
// 
//	}
 
	@RequestMapping(value="/login", method = RequestMethod.GET)
	public String login(Model model) {
		return "login/login";
	}
 
	/**
	 * accessdenied
	 * @param model
	 * @return nexturl
	 */
	@RequestMapping(value="/accessdenied", method = RequestMethod.GET)
	public String loginerror(Model model) {
		model.addAttribute("error", "true");
		return "login/login";
	}
 
	@RequestMapping(value="/logout", method = RequestMethod.GET)
	public String logout(Model model) {
		return "login/logout";
	}

}
