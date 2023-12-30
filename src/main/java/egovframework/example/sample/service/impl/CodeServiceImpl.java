package egovframework.example.sample.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.example.sample.service.CodeService;
import egovframework.example.sample.service.CodeVO;

@Service("codeService")
public class CodeServiceImpl implements CodeService {
	
	@Resource(name = "codeDAO")
	private CodeDAO codeDAO;
	
	@Override
	public String insertCodes(CodeVO vo) throws Exception {
		// TODO Auto-generated method stub
		return codeDAO.insertCodes(vo);
	}

	@Override
	public List<?> selectCodesList(CodeVO vo) throws Exception {
		// TODO Auto-generated method stub
		return codeDAO.selectCodesList(vo);
	}

	@Override
	public int selectCodesCount(CodeVO vo) throws Exception {
		// TODO Auto-generated method stub
		return codeDAO.selectCodesCount(vo);
	}

	@Override
	public int deleteCodes(int code) throws Exception {
		// TODO Auto-generated method stub
		return codeDAO.deleteCodes(code);
	}

	@Override
	public CodeVO selectCodesDetail(int code) throws Exception {
		// TODO Auto-generated method stub
		return codeDAO.selectCodesDetail(code);
	}

	@Override
	public int updateCodes(CodeVO code) throws Exception {
		// TODO Auto-generated method stub
		return codeDAO.updateCodes(code);
	}
	
	

}
