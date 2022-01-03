package org.zerock.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.BoardVO;
import org.zerock.service.BoardService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/board/*") // 이 주소로 시작하는 모든 처리를 BoardController에서 맡는다
@AllArgsConstructor // BoardService 타입의 객체와 연동해야 하므로 의존성에 대한 처리를 해준다
public class BoardController {

	private BoardService service;

	@GetMapping("/list")
	public void list(Model model) {

		log.info("리스트 불러오기");

		model.addAttribute("list", service.getList());
		
		
	}
	
	@GetMapping("/register")
	public void register() {
		
	}

	@PostMapping("/register")
	public String register(BoardVO board, RedirectAttributes rttr) {

		log.info("등록 컨트롤러 실행");

		service.register(board);

		rttr.addFlashAttribute("result", board.getBno());

		return "redirect:/board/list"; // 등록 후 다시 리스트 페이지로 돌아간다

	}

	@GetMapping("/get")
	public void get(@RequestParam("bno") Long bno, Model model) {

		log.info("책 정보 불러오기 컨트롤러");

		model.addAttribute("board", service.get(bno));

	}

	@PostMapping("/modify")
	public String modify(BoardVO board, RedirectAttributes rttr) {

		log.info("수정 컨트롤러 작동 ~!!!!" + board);

		if (service.modify(board)) {
			rttr.addFlashAttribute("modify", "success");
		}
		return "redirect:/board/list";
	}
	
	@PostMapping("/remove")
	public String remove(@RequestParam("bno") Long bno, RedirectAttributes rttr) {
		
		log.info("삭제 컨트롤러 진입 ::" + bno);
		
		if(service.remove(bno)) {
			rttr.addFlashAttribute("remove", "success");
		}
		return "redirect:/board/list";
	}
}
