package main.service;

public interface MemberService {
	
	// 회원 등록 처리 (SAVE)
	public String insertMember(MemberVO vo) throws Exception;
	
}
