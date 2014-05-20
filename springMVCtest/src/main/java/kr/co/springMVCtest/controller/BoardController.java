package kr.co.springMVCtest.controller;

import java.security.Principal;

import javax.validation.Valid;

import kr.co.springMVCtest.domain.Board;
import kr.co.springMVCtest.service.BoardService;

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
@SessionAttributes("board")
public class BoardController {

	@Autowired BoardService boardService;
	
	@RequestMapping(value = "/board", method = RequestMethod.GET) // member list skeleton
	public String list(){
		System.out.println("board");
		return "board/list";
	}

	@RequestMapping(value = "/board", method = RequestMethod.POST) // member add
	public String formSubmit(@Valid Board board, BindingResult result, SessionStatus status, Principal principal){
		if(result.hasErrors()) {
			System.out.println(result.getAllErrors().toString());
			return "board/form";
		}
		System.out.println("principal.getName() : " + principal.getName());
		System.out.println("contents : " + board.getContents());
		board.setId(principal.getName());
		boardService.add(board);
		status.setComplete();
		return "redirect:/board";
	}

	@RequestMapping(value = "board/{seq}", method = RequestMethod.PUT) // member update
	public String updateSubmit(@Valid Board board, @PathVariable int seq, BindingResult result, SessionStatus status){
		if(result.hasErrors()) {
			return "/board/" + seq + "/form";
		}
		
		// TODO : 권한체크
		boardService.update(board);
		status.setComplete();
		return "redirect:/board";
	}

	@RequestMapping(value = "/board/{seq}", method = RequestMethod.GET) // member view skeleton
	public String view(@PathVariable int seq, Model model){
		model.addAttribute("seq", seq);
		return "board/view";
	}

	@RequestMapping("/board/form") // board add form
	public void form(Model model){
		model.addAttribute("board", new Board());
	}

	@RequestMapping("/board/{seq}/form") // board update form
	public String updateForm(@PathVariable int seq, Model model){
		model.addAttribute("board", boardService.get(seq));
		return "board/update";
	}

	/**
	 * json controllers
	 * return data name must be "data"
	 */
	@RequestMapping(value = "/board/{seq}.json", method = RequestMethod.GET) // member view
	public void jsonView(@PathVariable int seq, Model model){
		// 카운트 증가
		// TODO : 작성자가 아닌 경우에만
		boardService.incrementCount(seq);
				
		model.addAttribute("data", boardService.get(seq));
	}
	
	@RequestMapping(value = "/board.json", method = RequestMethod.GET) // member list
	public void jsonList(@RequestParam(required = false, defaultValue = "1") int page, Model model){
		System.out.println("board.json");
		System.out.println("page : " + page);
		model.addAttribute("data", boardService.list(page));
	}

	@RequestMapping(value = "/board/{seq}.json", method = RequestMethod.DELETE)
	public void ajaxDelete(@PathVariable int seq){ // only accessed by ajax & DELETE method
		// TODO : 권한체크
		System.out.println("board delete");
		boardService.delete(seq);
	}
}
