package egovframework.example.sample.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.example.sample.service.DeptService;
import egovframework.example.sample.service.DeptVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("deptService")
public class DeptServiceImpl extends EgovAbstractServiceImpl implements DeptService {
	
	@Resource(name="deptDAO")
	private DeptDAO deptDAO;
	
	@Override
	public String InsertDept(DeptVO vo) throws Exception {
		// TODO Auto-generated method stub
		return deptDAO.InsertDept(vo);
	}

	@Override
	public List<?> selectList(DeptVO vo) throws Exception {
		// TODO Auto-generated method stub
		return deptDAO.selectList(vo);
	}

}
