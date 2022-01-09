package org.zerock.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.zerock.domain.SampleVO;
import org.zerock.domain.Ticket;

import lombok.extern.log4j.Log4j;

@RestController // JSP와 달리 순수한 데이터를 반환하는 형태이므로 다양한 포맷의 데이터를 전송(일반 문자열, JSON, XML ...)
@RequestMapping("/sample")
@Log4j
public class SampleController {

	@GetMapping(value = "/getText", produces = "text/plain; charset=UTF-8")
	public String getText() {

		log.info("MIME TYPE : " + MediaType.TEXT_PLAIN_VALUE);

		return "안녕하세요!";
	}

	@GetMapping(value = "/getSample", produces = { MediaType.APPLICATION_JSON_UTF8_VALUE,
			MediaType.APPLICATION_XML_VALUE })
	public SampleVO getSample() {

		return new SampleVO(112, "한", "갱");

	}

	@GetMapping("/getSample2")
	public SampleVO getSample2() {

		return new SampleVO(113, "한갱", "2차");
	}

	// 컬렉션 타입
	@GetMapping("/getList")
	public List<SampleVO> getList() {

		// i가 1부터 10까지 증가하면서 출력됨
		return IntStream.range(1, 10).mapToObj(i -> new SampleVO(i, i + "First", i + "Last	"))
				.collect(Collectors.toList());
	}
	
	// 맵 타입
	// 키에 속하는 데이터는 XML로 변환되는 경우에 태그의 이름이 된다
	@GetMapping("/getMap")
	public Map<String, SampleVO> getMap(){
		
		Map<String, SampleVO> map = new HashMap<>();
		map.put("First", new SampleVO(111, "한갱", "맵 타입"));
		
		return map;
	}
	
	@GetMapping(value = "/check", params = {"height", "weight"})
	public ResponseEntity<SampleVO> check(Double height,Double weight){
		
		SampleVO vo = new SampleVO(0, "" + height, "" + weight);
		
		ResponseEntity<SampleVO> result = null;
		
		if(height < 150) {
			result = ResponseEntity.status(HttpStatus.BAD_GATEWAY).body(vo);
		} else {
			result = ResponseEntity.status(HttpStatus.OK).body(vo);
		}
		
		return result;
	}
	
	// URL의 {}부분은 메서드에서 변수로 처리 가능 --> @PathVariable은 {}의 이름을 처리할 때 사용
	// int나 double같은 기본 자료형은 사용할 수 없다.
	@GetMapping("/product/{cat}/{pid}")
	public String[] getPath(@PathVariable("cat") String cat, @PathVariable("pid") Integer pid) {
		
		return new String[] { "category : " + cat, "productid : " + pid };
	}
	
	// @ResponseBody
	// 요청된 내용을 이용해서 해당 파라미터의 타입으로 변환을 요구한다
	// 보통은 JSON 데이터를 서버에 보내서 원하는 타입의 객체로 변환하는 용도로 사용
	@PostMapping("/ticket")
	public Ticket convert(@RequestBody Ticket ticket) {
		
		log.info("convert .............. ticket" + ticket);
		
		return ticket;
	}

}
