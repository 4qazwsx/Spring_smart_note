package oracle.java.note.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import oracle.java.note.Controller.VO.BoardVO;
import oracle.java.note.model.Note;
import oracle.java.note.model.Subject;
import oracle.java.note.service.HJ_BoardService;

@Repository
public class HJ_BoardDaopl implements HJ_BoardDao {
	@Autowired
	private SqlSession session;
	
	public List<Note> list(Note note) {
		// emp.xml->id(listALL), parameterType(emp), return List
		return session.selectList("listAll", note);
		
	}
	public int total() {
		// emp.xml->id(total), return int
		return session.selectOne("total");
	}

	 
	public Note detail(String note_id) {
		return session.selectOne("detail",note_id);
	}

	public int update(Note note) {
		return session.update("TKempUpdate",note);
	}


	public List<Note> listManager() {
		return session.selectList("selectManager");
	}	

	public int insert(Note note) {
		return session.insert("insert",note);
	}
	
	
	public List<BoardVO> listAll(String searchOption, String keyword) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public void insertEmp() {
		// TODO Auto-generated method stub
		
	}
	@Override
	public String delete(int note_id) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public void addFavSub() {
		// TODO Auto-generated method stub
		
	}
	@Override
	public void deleteFavSubject(String mem_id, String sub_id, String note_id) {
		// TODO Auto-generated method stub
		
	}
	@Override
	public List<String> list(String sub_name) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public String confirmSub() {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public List<Subject> select() {
		// TODO Auto-generated method stub
		return null;
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
