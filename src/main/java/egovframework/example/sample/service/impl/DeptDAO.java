package egovframework.example.sample.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.example.sample.service.DeptVO;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

@Repository("deptDAO")
public class DeptDAO extends EgovAbstractDAO {

	public String InsertDept(DeptVO vo) {
		
		return (String) insert("deptDao.InsertDept", vo);// "deptDao.InsertDept" => SQL.XML ID값
	}

	public List<?> selectList(DeptVO vo) {
		
		return list("deptDAO.selectList", vo);
	}

}
