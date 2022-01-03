package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.BoardVO;
import org.zerock.mapper.BoardMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

// BoardService 인터페이스를 구현하기 위한 클래스
@Log4j
@Service // 계층 구조 상 비즈니스 영역을 담당하는 객체임을 표시하기 위해 사용
@AllArgsConstructor // 모든 파라미터를 이용하는 생성자
public class BoardServiceImpl implements BoardService {

	// spring 4.3 이상에서는 자동으로 처리된다.
	@Setter(onMethod_ = { @Autowired })
	private BoardMapper mapper;

	@Override
	public void register(BoardVO board) {
		log.info("register....." + board);

		// 필요 시 int 타입을 이용하여 사용 가능
		mapper.insertSelectKey(board);
	}

	@Override
	public BoardVO get(Long bno) {
		log.info("get 메서드 작동");
		
		

		return mapper.read(bno);
	}

	// 삭제와 수정의 경우 void로 설계할 수도 있지만 좀 더 완벽한 처리를 위해 boolean 타입으로 처리한다.
	@Override
	public boolean modify(BoardVO board) {

		log.info("modify 동작");

		return mapper.update(board) == 1;

	}

	@Override
	public boolean remove(Long bno) {

		log.info("delete 동작");

		return mapper.delete(bno) == 1;

	}

	// 현재 테이블에 저장된 모등 데이터를 가져온다
	@Override
	public List<BoardVO> getList() {

		log.info("getList 메서드 작동");

		log.info(mapper.getList());
		
		return mapper.getList();
	}

}
