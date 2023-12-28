package egovframework.example.sample.service;

import java.util.List;

public interface DeptService {
	
	public String InsertDept(DeptVO vo) throws Exception;
	
	public List<?> selectList(DeptVO vo) throws Exception;
	
}
