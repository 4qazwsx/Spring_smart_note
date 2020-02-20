package oracle.java.note.service;

import java.util.List;

import oracle.java.note.model.Note;
import oracle.java.note.model.WY_Pagination;
import oracle.java.note.model.WY_Search;


public interface WY_ShareNoteListService {
	
	public List<Note> getBoardList(WY_Search searchn) throws Exception;
	public Note getBoardContent(int note_id) throws Exception;
	public int getBoardListCnt(WY_Search search) throws Exception;

}
