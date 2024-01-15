package main.service;

import java.util.List;

public interface BoardService {
	
	// 게시판 저장 처리 
	public String insertNBoard(BoardVO vo) throws Exception;
	
	// 게시판 화면 목록
	public List<?> selectNBoardList(BoardVO vo) throws Exception;
	
	// 게시판 totla 갯수 ( 페이징 사용 )
	public int selectNBoardTotal(BoardVO vo) throws Exception;
	
	// 상세화면
	public BoardVO selectNBoardDetail(int unq) throws Exception; 
	
	// 조회수 증가
	public int updateNBoardHits(int unq) throws Exception;
	
	// 수정 ( 업데이트 ) 처리
	public int updateNBoard(BoardVO vo) throws Exception;
	
	// 수정 패스워드 체크
	public int selectNBoardPass(BoardVO vo) throws Exception;
	
	// 삭제처리
	public int deleteNBoard(BoardVO vo) throws Exception;
	
	// 
	
}
