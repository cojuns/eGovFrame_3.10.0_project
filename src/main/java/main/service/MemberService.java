package main.service;

import java.util.List;

public interface MemberService {
	
	// 회원 등록 처리 (SAVE)
	public String insertMember(MemberVO vo) throws Exception;
	
	// 아이디 중복 체크 
	public int selectMemberIdCheck(String userid) throws Exception;
	
	// 우편번호(주소) 검색
	public List<?> selectPostList(String dong) throws Exception;
	
}
