package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.domain.BoardAttachVO;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.mapper.BoardAttachMapper;
import org.zerock.mapper.BoardMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

// BoardService 인터페이스를 구현하기 위한 클래스
@Log4j
@Service // 계층 구조 상 비즈니스 영역을 담당하는 객체임을 표시하기 위해 사용
@AllArgsConstructor // 모든 파라미터를 이용하는 생성자
public class BoardServiceImpl implements BoardService {

	// spring 4.3 이상에서는 자동으로 처리된다.
	//@Setter(onMethod_ = { @Autowired })
	@Autowired
	private BoardMapper mapper;
	
	@Autowired
	private BoardAttachMapper attachMapper;

	@Transactional
	@Override
	public void register(BoardVO board) {
		log.info("register....." + board);

		// 필요 시 int 타입을 이용하여 사용 가능
		mapper.insertSelectKey(board);
		
		if(board.getAttachList() == null || board.getAttachList().size() <= 0) {
			return;
		}
		
		board.getAttachList().forEach(attach -> {
			attach.setBno(board.getBno());
			attachMapper.insertAttach(attach);
		});
	}

	@Override
	public BoardVO get(Long bno) {
		log.info("get 메서드 작동");
		
		

		return mapper.read(bno);
	}

	// 삭제와 수정의 경우 void로 설계할 수도 있지만 좀 더 완벽한 처리를 위해 boolean 타입으로 처리한다.
	@Transactional
	@Override
	public boolean modify(BoardVO board) {

		log.info("modify 동작");
		
		// 기존의 첨부파일 관련 데이터를 삭제한 후에 다시 저장하는 방식 사용
		attachMapper.deleteAll(board.getBno());
		
		boolean modifyResult = mapper.update(board) == 1;
		
		if(modifyResult && board.getAttachList() != null && board.getAttachList().size() > 0) {
			board.getAttachList().forEach(attach -> {
				attach.setBno(board.getBno());
				attachMapper.insertAttach(attach);
			});
		}

		return modifyResult;

	}

	@Transactional
	@Override
	public boolean remove(Long bno) {

		log.info("delete 동작");
		
		// 글 삭제 시 첨부파일도 같이 삭제
		attachMapper.deleteAll(bno);

		return mapper.delete(bno) == 1;

	}

	// 현재 테이블에 저장된 모등 데이터를 가져온다
//	@Override
//	public List<BoardVO> getList() {
//
//		log.info("getList 메서드 작동");
//
//		log.info(mapper.getList());
//		
//		return mapper.getList();
//	}

	@Override
	public List<BoardVO> getList(Criteria cri){
		
		log.info("페이징 서비스 시작 : " + cri);
		
		return mapper.getListWithPaging(cri);
	}
	
	@Override
	public int getTotal(Criteria cri) {
		
		log.info(cri);
		
		return mapper.getTotalCount(cri);
	}

	@Override
	public List<BoardAttachVO> getAttachList(Long bno) {
		log.info("게시물 번호 : "+ bno);
		
		return attachMapper.findByBno(bno);
	}
	
}
