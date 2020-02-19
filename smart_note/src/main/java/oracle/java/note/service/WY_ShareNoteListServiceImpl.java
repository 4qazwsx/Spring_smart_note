package oracle.java.note.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import oracle.java.note.dao.WY_ShareNoteListDao;
import oracle.java.note.model.Note;
import oracle.java.note.model.WY_Pagination;
import oracle.java.note.model.WY_Search;


@Service
public class WY_ShareNoteListServiceImpl implements WY_ShareNoteListService {

	@Inject
	private WY_ShareNoteListDao shareNoteListDAO;
	
	@Override
	public List<Note> getBoardList(WY_Search search) throws Exception {
		// TODO Auto-generated method stub
		return shareNoteListDAO.getBoardList(search);
	}

	@Override
	public Note getBoardContent(int note_id) throws Exception {
		// TODO Auto-generated method stub
		shareNoteListDAO.updateViewCnt(note_id);
		return shareNoteListDAO.getBoardContent(note_id);
		/*Note note = new Note();
		shareNoteListDAO.updateViewCnt(note_id);
		note = shareNoteListDAO.getBoardContent(note_id);
		return note.getNote_contents(note_id);*/
	}

	@Override
	public int getBoardListCnt(WY_Search search) throws Exception {
		// TODO Auto-generated method stub
		return shareNoteListDAO.getBoardListCnt(search);
	}
	
}
