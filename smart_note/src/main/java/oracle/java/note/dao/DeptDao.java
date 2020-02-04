package oracle.java.note.dao;
import java.util.List;
import java.util.Map;

import oracle.java.note.model.Dept;
import oracle.java.note.model.DeptVO;

public interface DeptDao {
	List<Dept> deptSelect();
	
	void insertDept(DeptVO deptVO);             // Procedure VO
	void SelListDept(Map<String,Object> map);  // Procedure Cursor

}