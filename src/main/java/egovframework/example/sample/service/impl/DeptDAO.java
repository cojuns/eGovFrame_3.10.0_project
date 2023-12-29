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

	public DeptVO selectDeptDetail(int deptno) {
		// TODO Auto-generated method stub
		return (DeptVO) select("deptDAO.selectDeptDetail", deptno);
	}

	public int deleteDept(int deptno) {
		// TODO Auto-generated method stub
		return delete("deptDAO.deleteDept", deptno);
	}

	public int updateDept(DeptVO vo) {
		// TODO Auto-generated method stub
		return update("deptDAO.updateDept", vo);
	}

}
