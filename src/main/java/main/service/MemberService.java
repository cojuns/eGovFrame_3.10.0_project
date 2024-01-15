package main.service;

public interface MemberService {
	
	// 회원 등록 처리 (SAVE)
	public String insertMember(MemberVO vo) throws Exception;
	
	// 아이디 중복 체크 
	public int selectMemberIdCheck(String userid) throws Exception;
}
