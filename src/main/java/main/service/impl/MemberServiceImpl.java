package main.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import main.service.MemberService;
import main.service.MemberVO;

//컨트롤러와 연결되는 설정 ( 인터페이스 지목 )
@Service("memberService")
public class MemberServiceImpl implements MemberService {
	
	@Resource(name = "memberDAO")
	public MemberDAO memberDAO;
	
	@Override
	public String insertMember(MemberVO vo) throws Exception {
		// TODO Auto-generated method stub
		return memberDAO.insertMember(vo);
	}

	@Override
	public int selectMemberIdCheck(String userid) throws Exception {
		// TODO Auto-generated method stub
		return memberDAO.selectMemberIdCheck(userid);
	}

	@Override
	public List<?> selectPostList(String dong) throws Exception {
		// TODO Auto-generated method stub
		return memberDAO.selectPostList(dong);
	}

}
