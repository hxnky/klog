package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.domain.Criteria;
import org.zerock.domain.ReplyPageDTO;
import org.zerock.domain.ReplyVO;
import org.zerock.mapper.BoardMapper;
import org.zerock.mapper.ReplyMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class ReplyServiceImpl implements ReplyService {

	//@Setter(onMethod_ = { @Autowired })
	@Autowired
	private ReplyMapper mapper;
	
	//@Setter(onMethod_ = { @Autowired })
	@Autowired
	private BoardMapper BoardMapper;

	@Transactional
	@Override
	public int register(ReplyVO vo) {

		log.info("댓글 등록 서비스 시작 ::::" + vo);
		
		
		BoardMapper.updateReplyCnt(vo.getBno(), 1);

		return mapper.insert(vo);
	}

	@Override
	public ReplyVO get(Long rno) {

		log.info("댓글 출력 서비스 시작 ::::" + rno);

		return mapper.read(rno);
	}

	@Override
	public int modify(ReplyVO vo) {
		log.info("댓글 수정 서비스 시작 ::::" + vo);

		return mapper.update(vo);
	}

	@Transactional
	@Override
	public int remove(Long rno) {
		log.info("댓글 삭제 서비스 시작 ::::" + rno);
		
		// 댓글 삭제는 전달되는 파라미터가 댓글의 번호인 rno만을 받기때문에 해당 댓글의 게시물을 알아내는 과정 필요
		ReplyVO vo = mapper.read(rno);
		
		BoardMapper.updateReplyCnt(vo.getBno(), -1);

		return mapper.delete(rno);
	}

	@Override
	public List<ReplyVO> getList(Criteria cri, Long bno) {
		log.info("댓글 리스트 출력 서비스 시작 ::::" + bno);

		return mapper.getListWithPaging(cri, bno);
	}

	@Override
	public ReplyPageDTO getListPage(Criteria cri, Long bno) {
		
		return new ReplyPageDTO(mapper.getCountByBno(bno), mapper.getListWithPaging(cri, bno));
	}
	
	

}
