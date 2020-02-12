package oracle.java.note.dao;

import java.util.List;

import oracle.java.note.model.Note;
import oracle.java.note.model.WY_Pagination;
import oracle.java.note.model.WY_Search;


public interface WY_ShareNoteListDao {
	
public List<Note> getBoardList(WY_Search search) throws Exception;

	public Note getBoardContent(int note_id) throws Exception;
	public int getBoardListCnt(WY_Search search) throws Exception;
	public int insertBoard(Note note) throws Exception;
	public int updateBoard(Note note) throws Exception;
	public int deleteBoard(int note_id) throws Exception;
	public int updateViewCnt(int note_id) throws Exception;
}
