package oracle.java.note.dao;
import java.util.List;

import oracle.java.note.Controller.VO.BoardVO;
import oracle.java.note.model.Emp;
import oracle.java.note.model.EmpDept;

public interface EmpDao {
	List<Emp> list(Emp emp);
	int total();
   void insertEmp();
   Emp detail(int empno);
   int update(Emp emp);   
	List<Emp> listManager();
	int insert(Emp emp);
	int delete(int empno);
	List<EmpDept> listEmp(EmpDept empDept);
	
	String	deptName(int deptNo);

public List<BoardVO> listAll(String searchOption, String keyword) throws Exception;

}