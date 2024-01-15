package main.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import main.service.MemberService;
import main.service.MemberVO;

@Controller
public class MemberController {
	
	@Resource(name = "memberService")
	public MemberService memberService;
	
	/*회원 등록 화면*/
	@RequestMapping("/memberWrite.do")
	public String memberWrite() {
		
		
		return "member/memberWrite";
	}
	
	/* 회원 등록 처리 SAVE */
	@RequestMapping("/memberWriteSave.do")
	@ResponseBody
	public String insertMember(MemberVO vo) throws Exception{
		
		String message = "";
		
		String result = memberService.insertMember(vo);
		
		// result = null; (성공)
		if(result == null) {
			message = "ok";
		}
		
		return message;
	}
	
}
