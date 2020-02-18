package oracle.java.note.dao;

import java.util.List;

import oracle.java.note.Controller.VO.BoardVO;
import oracle.java.note.model.Note;
import oracle.java.note.model.Subject;

public interface HJ_BoardDao {
		List<Note> list(Note note);
		int total();
	   void insertEmp();
	   Note detail(String note_id);
	   int update(Note note);   
		List<Note> listManager();
		int insert(Note note);
		String delete(int note_id);


	public List<BoardVO> listAll(String searchOption, String keyword) throws Exception;
		void addFavSub();
		void deleteFavSubject(String mem_id, String sub_id, String note_id );
		List<String> list(String sub_name);
		String confirmSub();
		List<Subject> select();

}