package hera.cules.three.yeon.dto;

import org.springframework.stereotype.Component;

import lombok.Getter;
import lombok.Setter;
@Component
@Getter
@Setter

public class NoticeDTO extends Criteria {
//커밋테스트 입니다....
	private int num;
	private String name;
	private String subject;
	private String content;
	private String writeday;

}
