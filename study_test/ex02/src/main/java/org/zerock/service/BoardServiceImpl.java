package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.mapper.BoardMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor // 모든 파라미터의 생성자를 만든다.
public class BoardServiceImpl implements BoardService {

	@Setter(onMethod_ = @Autowired)
	private BoardMapper mapper;

	@Override
	public void register(BoardVO board) {
		log.info("register......" + board);

		// 게시물의 번호를 확인할 수 있도록 insertSelectKey 사용
		mapper.insertSelectKey(board);

	}

//	@Override
//	public List<BoardVO> getList(){
//		log.info("get List............");
//		
//		return mapper.getList();
//	}

	@Override
	public List<BoardVO> getList(Criteria cri) {

		log.info("get List with criteria : " + cri);

		return mapper.getListWithPaging(cri);
	}

	@Override
	public BoardVO get(Long bno) {
		log.info("get ......." + bno);
		log.info(mapper.read(bno));

		return mapper.read(bno);
	}

	@Override
	public boolean modify(BoardVO board) {
		log.info("modify ........" + board);

		return mapper.update(board) == 1;
	}

	@Override
	public boolean remove(Long bno) {
		log.info("remove .........");

		return mapper.delete(bno) == 1;
	}
	
	@Override
	public int getTotal(Criteria cri) {
		
		log.info("get total count");
		
		return mapper.getTotalCount(cri);
	}

}
