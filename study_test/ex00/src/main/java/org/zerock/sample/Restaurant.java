package org.zerock.sample;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import lombok.Data;
import lombok.Setter;

@Component
@Data
public class Restaurant {

	@Setter(onMethod_ = @Autowired)  // onMethod = setChef()에 @Autowired 어노테이션 추가
	private Chef chef;
	
	
}
