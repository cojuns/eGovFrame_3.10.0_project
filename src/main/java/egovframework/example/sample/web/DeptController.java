package egovframework.example.sample.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.example.sample.service.DeptService;
import egovframework.example.sample.service.DeptVO;

@Controller
public class DeptController {
	
	@Resource(name="deptService")
	private DeptService deptService;
	
	@RequestMapping(value = "/deptWrite.do")
	public String deptWrite() {
			
		
		return "dept/deptWrite";
	}
	
	@RequestMapping(value = "/deptWriteSave.do")
	public String deptWriteSave(DeptVO vo) throws Exception {
		
		System.out.println("부서번호 : " + vo.getDeptno());
		System.out.println("부서이름 : " + vo.getDname());
		System.out.println("부서위치 : " + vo.getLoc());
		
		String result = deptService.InsertDept(vo);
		
		if(result == null) { // 저장 됨 
			System.out.println("저장완료");
		}else {
			System.out.println("저정실패");
		}
		
		
		return "";
	}
	
	@RequestMapping(value = "/deptList.do")
	public String selectDeptList(DeptVO vo, ModelMap model) throws Exception {
		
		List<?> list = deptService.selectList(vo);
		model.addAttribute("resultList", list);
		
		
		return "dept/deptList";
	}
	
}
