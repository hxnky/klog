package org.zerock.domain;

import org.springframework.web.util.UriComponentsBuilder;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Criteria {

	private int pageNum;
	private int amount;

	// 검색 처리를 위한 추가
	private String type;
	private String keyword;

	// 기본값 설정 , 1페이지 당 10개
	public Criteria() {
		this(1, 10);
	}

	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}

	public String[] getTypeArr() {

		return type == null ? new String[] {} : type.split("");
	}

	public String getListLink() {

		// 웹페이지에서 매번 파라미터를 유지하는 일이 번거로우므로 UriComponentBuilder 클래스 사용
		// 여러 개의 파라미터들을 연결해서 URL 형태로 만들어준다.
		// 리다이렉트를 하거나 from 태그를 사용하는 상황을 많이 줄일 수 있다.
		// 한글처리에 신경 쓰지 않아도 됨
		UriComponentsBuilder builder = UriComponentsBuilder.fromPath("").queryParam("pageNum", this.pageNum)
				.queryParam("amount", this.getAmount()).queryParam("type", this.getType())
				.queryParam("keyword", this.getKeyword());

		return builder.toUriString();
	}

}
