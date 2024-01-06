package main.web;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.Errors;
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
		
		int unit = 10;
		
		int total = boardService.selectNBoardTotal(vo);
		
		// (double)12/10 -> ceil(1.2) -> Integer(2.0) -> 2
		// ceil => 1.2, 1.1 이던 전부 2.0으로 변환
		int totalPage = (int) Math.ceil((double)total / unit);
		
		int viewPage = vo.getViewPage();
		// 1-> 1,10 // 2-> 11,20 // 3-> 21,30
		
		// 정상적이지 않는 경로로 들어왔을 때 viewpag = 1 설정
		if(viewPage > totalPage || viewPage < 1) {
			
			viewPage = 1;
			
		}
		
		int startIndex = (viewPage-1)* unit + 1 ;
		int endIndex = startIndex + (unit-1);
		// startIndex : (1-1)*10 + 1 -> 1
		// startIndex : (2-1)*10 + 1 -> 11
		
		// 행번호
		// 예 ) total -> 34 (4page)
		// 1(p) -> 34 ~ 25, 2(p) -> 24 ~ 15, 3(p) -> 14 ~ 5, 4(p) -> 4 ~ 1 
//		int p1 = total - 0;
//		int p2 = total - 10;
//		int p3 = total - 20;
//		int p4 = total - 30;
		
		// 1pge인 경우
		// int startRowNo = total - (1-1)*10;
		// 2pge인 경우
		// int startRowNo = total - (2-1)*10;
		int startRowNo = total - (viewPage - 1)*unit;
		
		
		// vo에 담기
		vo.setStartIndex(startIndex);
		vo.setEndIndex(endIndex);
		
		List<?> list = boardService.selectNBoardList(vo);
		
		System.out.println("list = " + list);
		
		model.addAttribute("resultList", list);
		
		model.addAttribute("total", total);
		model.addAttribute("totalPage", totalPage);
		
		model.addAttribute("rowNumber", startRowNo);
		
		return "board/boardList";
	}
	
	@RequestMapping("/boardDetail.do")
	public String selectNBoardDetail(BoardVO vo, ModelMap model) throws Exception {
		
		// 조회수 
		boardService.updateNBoardHits(vo.getUnq());
		
		// 상세보기
		BoardVO boardVO = boardService.selectNBoardDetail(vo.getUnq());
		
		String content = boardVO.getContent(); // \n
		boardVO.setContent(content.replace("\n", "<br>" ));
		
		
		model.addAttribute("boardVO", boardVO);
		
		return "board/boardDetail";
	}
	
}
