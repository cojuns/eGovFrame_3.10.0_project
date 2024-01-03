package main.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import main.service.BoardService;
import main.service.BoardVO;

@Controller
public class BoardController {
	
	// Impl @Service("boardService") 이름이 같아야됨
	@Resource(name = "boardService")
	private BoardService boardService;

	@RequestMapping("/boardWrite.do")
	public String boardWrite() {
		
		
		return "board/boardWrite";
		
	}
	
	@RequestMapping("/boardWriteSave.do")
	@ResponseBody
	public String insertBoard(BoardVO vo) throws Exception {
		// result == null; 정상처리 된 거
		String result = boardService.insertNBoard(vo);
		
		String msg = "";
		
		if(result == null) {
			msg = "ok";
		}else {
			msg = "fail";
		}
		
		
		return msg;
	}
	
}
