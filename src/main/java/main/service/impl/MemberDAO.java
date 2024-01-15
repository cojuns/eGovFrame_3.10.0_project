package main.service.impl;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractDAO;
import main.service.MemberVO;

// @Repository 다른 클래스에서 사용할 때 필요함
@Repository("memberDAO")
public class MemberDAO extends EgovAbstractDAO {

	public String insertMember(MemberVO vo) {
		// TODO Auto-generated method stub
		return (String) insert("memberDAO.insertMember", vo);
	}

	public int selectMemberIdCheck(String userid) {
		// TODO Auto-generated method stub
		return (int) select("memberDAO.selectMemberIdCheck", userid);
	}
	
}
