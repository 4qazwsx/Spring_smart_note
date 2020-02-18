package oracle.java.note.service;
import java.util.List;
import java.util.Map;
 
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import oracle.java.note.dao.HJ_BoardDao;
import oracle.java.note.model.Note;


@Service
public class HJ_BoardServiceImpl implements HJ_BoardService{
	@Autowired
	private HJ_BoardDao bd;

	
		// bd->EmpDaoImpl 
	public List<Note> list(Note note) {
		return bd.list(note);
	}
	// bd->EmpDaoImpl 
	public int total() {
		return bd.total();
	}
	// bd->EmpDaoImpl 
	public Note detail(String note_id) {
		return bd.detail(note_id);
	}
	
	// bd->EmpDaoImpl 
		public void insertEmp() {
			bd.insertEmp();
	}	
	


	// bd->EmpDaoImpl 
	public int update(Note note) {
		return bd.update(note);
	}

	// bd->EmpDaoImpl 
	@Override
	public List<Note> listManager() {
		// TODO Auto-generated method stub
		return bd.listManager();
	}		
	public int insert(Note note) {
		return bd.insert(note);
	}	

	// bd->EmpDaoImpl 
	
	@Override
	public void insertNote() {
		// TODO Auto-generated method stub
		
	}
	@Override
	public int memCount(String id) {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public void SelListDept(Map<String, Object> map) {
		// TODO Auto-generated method stub
		
	}
	@Override
	public int delete(String note_id) {
		// TODO Auto-generated method stub
		return 0;
	}

	
}