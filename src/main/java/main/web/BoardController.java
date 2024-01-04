package main.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
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
	public String insertNBoard(BoardVO vo) throws Exception {
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
	
	@RequestMapping("/boardList.do")
	public String selectNBoardList(BoardVO vo, ModelMap model) throws Exception{
		
		int total = boardService.selectNBoardTotal(vo);
		
		// (double)12/10 -> ceil(1.2) -> Integer(2.0) -> 2
		// ceil => 1.2, 1.1 이던 전부 2.0으로 변환
		int totalPage = (int) Math.ceil((double)total / 10);
		
		int viewPage = vo.getViewPage();
		// 1-> 1,10 // 2-> 11,20 // 3-> 21,30
		
		int startIndex = (viewPage-1)* 10 + 1 ;
		int endIndex = startIndex + (10-1);
		// startIndex : (1-1)*10 + 1 -> 1
		// startIndex : (2-1)*10 + 1 -> 11
		
		// vo에 담기
		vo.setStartIndex(startIndex);
		vo.setEndIndex(endIndex);
		
		List<?> list = boardService.selectNBoardList(vo);
		
		System.out.println("list = " + list);
		
		model.addAttribute("resultList", list);
		
		model.addAttribute("total", total);
		model.addAttribute("totalPage", totalPage);
		
		return "board/boardList";
	}
	
}
