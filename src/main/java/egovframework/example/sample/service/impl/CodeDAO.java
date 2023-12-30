package egovframework.example.sample.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.example.sample.service.CodeVO;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

@Repository("codeDAO")
public class CodeDAO extends EgovAbstractDAO{

	public String insertCodes(CodeVO vo) {
		// TODO Auto-generated method stub
		return (String) insert("codeDAO.insertCodes", vo);
	}

	public List<?> selectCodesList(CodeVO vo) {
		// TODO Auto-generated method stub
		return list("codeDAO.selectCodesList", vo);
	}

	public int selectCodesCount(CodeVO vo) {
		// TODO Auto-generated method stub
		return (int)select("codeDAO.selectCodesCount", vo);
	}

}
