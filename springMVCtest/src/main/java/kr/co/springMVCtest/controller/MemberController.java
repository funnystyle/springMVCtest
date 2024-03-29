package kr.co.springMVCtest.controller;

import javax.validation.Valid;

import kr.co.springMVCtest.domain.Member;
import kr.co.springMVCtest.service.MemberService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

@Controller
@SessionAttributes("member")
public class MemberController {

	@Autowired MemberService memberService;
	
	@RequestMapping(value = "/member", method = RequestMethod.GET) // member list skeleton
	public String list(){
		System.out.println("member");
		return "member/list";
	}

	@RequestMapping(value = "/member", method = RequestMethod.POST) // member add
	public String formSubmit(@Valid Member member, BindingResult result, SessionStatus status){
		if(result.hasErrors()) {
			System.out.println(result.getAllErrors().toString());
			return "member/form";
		}
		memberService.add(member);
		status.setComplete();
		return "redirect:/member";
	}

	@RequestMapping(value = "member/{id}", method = RequestMethod.PUT) // member update
	public String updateSubmit(@Valid Member member, @PathVariable String id, BindingResult result, SessionStatus status){
		if(result.hasErrors()) {
			return "/member/" + id + "/form";
		}
		
		// TODO : 권한체크
		memberService.update(member);
		status.setComplete();
		return "redirect:/member";
	}

	@RequestMapping(value = "/member/{id}", method = RequestMethod.GET) // member view skeleton
	public String view(@PathVariable String id, Model model){
		model.addAttribute("id", id);
		return "member/view";
	}

	@RequestMapping("/member/form") // member add form
	public void form(Model model){
		model.addAttribute("member", new Member());
	}

	@RequestMapping("/member/{id}/form") // member update form
	public String updateForm(@PathVariable String id, Model model){
		model.addAttribute("member", memberService.get(id));
		return "member/update";
	}

	/**
	 * json controllers
	 * return data name must be "data"
	 */
	@RequestMapping(value = "/member.json", method = RequestMethod.GET) // member list
	public void jsonList(@RequestParam(required = false, defaultValue = "1") int page, Model model){
		System.out.println("member.json");
		model.addAttribute("data", memberService.list(page));
	}

	@RequestMapping(value = "/member/{id}.json", method = RequestMethod.GET) // member view
	public void jsonView(@PathVariable String id, Model model){
		model.addAttribute("data", memberService.get(id));
	}
	
	@RequestMapping(value = "/member/{id}.json", method = RequestMethod.DELETE)
	public void jsonDelete(@PathVariable String id){ // only accessed by ajax & DELETE method
		// TODO : 권한체크
		System.out.println("member delete");
		memberService.delete(id);
	}
}
