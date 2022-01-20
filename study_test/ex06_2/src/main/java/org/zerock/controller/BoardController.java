package org.zerock.controller;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.BoardAttachVO;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.PageDTO;
import org.zerock.service.BoardService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/board/*") // 이 주소로 시작하는 모든 처리를 BoardController에서 맡는다
@AllArgsConstructor // BoardService 타입의 객체와 연동해야 하므로 의존성에 대한 처리를 해준다
public class BoardController {

	@Autowired
	private BoardService service;

//	@GetMapping("/list")
//	public void list(Model model) {
//
//		log.info("리스트 불러오기");
//
//		model.addAttribute("list", service.getList());
//		
//		
//	}
	
	@GetMapping("/list")
	public void list(Criteria cri, Model model) {
		
		log.info("리스트 불러오기");
		log.info("list" + cri);
		
		model.addAttribute("list", service.getList(cri));
		//model.addAttribute("pageMaker", new PageDTO(cri, 123));
		
		int total = service.getTotal(cri);
		
		log.info("페이지 번호 ::::" + cri);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}
	
	@GetMapping("/register")
	// 로그인한 사용자만 글을 작성하도록 설정
	@PreAuthorize("isAuthenticated()")
	public void register() {
		
	}

	@PostMapping("/register")
	@PreAuthorize("isAuthenticated()")
	public String register(BoardVO board, RedirectAttributes rttr) {

		log.info("등록 컨트롤러 실행");
		
		if(board.getAttachList() != null) {
			board.getAttachList().forEach(attach -> log.info(attach));
		}

		service.register(board);

		//rttr.addFlashAttribute("result", board.getBno());

		return "redirect:/board/list"; // 등록 후 다시 리스트 페이지로 돌아간다

	}

	@GetMapping({"/get", "/modify"})
	// @ModelAttribute는 데이터를 저장한 이름에 자동으로 담아준다. 좀 더 명시적으로 이름을 지정하기 위해 사용
	public void get(@RequestParam("bno") Long bno, Model model, @ModelAttribute("cri") Criteria cri) {

		log.info("책 정보 불러오기 / 수정 컨트롤러");
		log.info("페이징 정보 ::::"+cri);

		model.addAttribute("board", service.get(bno));

	}

	@PreAuthorize("principal.username == #board.writer")
	@PostMapping("/modify")
	public String modify(BoardVO board, RedirectAttributes rttr, Criteria cri) {

		log.info("수정 컨트롤러 작동 ~!!!!" + board);

		if (service.modify(board)) {
			rttr.addFlashAttribute("result", "success");
		}
		
//		rttr.addAttribute("pageNum", cri.getPageNum());
//		rttr.addAttribute("amount", cri.getAmount());
//		rttr.addAttribute("keyword", cri.getKeyword());
//		rttr.addAttribute("type", cri.getType());
		
		return "redirect:/board/list" + cri.getListLink();
	}
	
	@PreAuthorize("principal.username == #writer")
	@PostMapping("/remove")
	public String remove(@RequestParam("bno") Long bno, RedirectAttributes rttr, Criteria cri) {
		
		log.info("삭제 컨트롤러 진입 ::" + bno);
		
		List<BoardAttachVO> attachList = service.getAttachList(bno);
		
		if(service.remove(bno)) {
			deleteFiles(attachList);
			rttr.addFlashAttribute("result", "success");
		}
		
//		rttr.addAttribute("pageNum", cri.getPageNum());
//		rttr.addAttribute("amount", cri.getAmount());
//		rttr.addAttribute("keyword", cri.getKeyword());
//		rttr.addAttribute("type", cri.getType());
		
		return "redirect:/board/list" + cri.getListLink();
	}
	
	@GetMapping(value = "/getAttachList", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody	// JSON 데이터 반환
	public ResponseEntity<List<BoardAttachVO>> getAttachList(Long bno){
		
		log.info("게시물의 번호 : " + bno);
		
		return new ResponseEntity<>(service.getAttachList(bno), HttpStatus.OK);
	}
	
	private void deleteFiles(List<BoardAttachVO> attachList) {
		log.info("여기까지 들어옴");
		if(attachList == null || attachList.size() == 0) {
			log.info("attachList가 없습니다");
			return;
		}
		
		log.info("첨부된 파일 삭제");
		log.info(attachList);
		
		attachList.forEach(attach -> {
			try {
				Path file = Paths.get("C:\\upload\\" + attach.getUploadPath()+"\\"+attach.getUuid()+"_"+attach.getFileName());
				
				Files.deleteIfExists(file);
				
				// 이미지라면 썸네일도 같이 삭제
				if(Files.probeContentType(file).startsWith("image")){
					Path ThumbNail = Paths.get("C:\\upload\\" + attach.getUploadPath()+"\\"+attach.getUuid()+"_"+attach.getFileName());
				
					Files.delete(ThumbNail);
				}
			} catch (Exception e) {
				log.error("파일 삭제 중 에러 발생" + e.getMessage());
			}
		});
	}
	
}
