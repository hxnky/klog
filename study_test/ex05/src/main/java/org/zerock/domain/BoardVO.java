package org.zerock.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class BoardVO {

	private Long bno;
	private String title;
	private String content;
	private String writer;
	private Date regdate;
	private Date updateDate;
	
	// 22.01.13 트랜잭션 관련 추가
	private int replyCnt;
	
	//22.01.15 첨부파일 관련 추가
	private List<BoardAttachVO> attachList;
	
}
