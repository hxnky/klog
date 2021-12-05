package org.zerock.domain;

import java.util.Date;

import lombok.Data;

@Data
public class BoardVO {

	// 테이블 구성에 맞춰 작성
	private Long bno;
	private String title;
	private String content;
	private String writer;
	private Date regdate;
	private Date updateDate;

}
