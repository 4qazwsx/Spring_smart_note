package oracle.java.note.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import oracle.java.note.dao.JM_NoteDao;
import oracle.java.note.model.Note;
import oracle.java.note.model.Subject_Note_Mapping;

@Service
public class JM_NoteServiceImpl implements JM_NoteService {

	@Autowired
	private JM_NoteDao noteDao;
	
	@Override
	public void insertNote(Note note, Subject_Note_Mapping subNoteMapping) {
		noteDao.insertNote(note, subNoteMapping);
	}

}
