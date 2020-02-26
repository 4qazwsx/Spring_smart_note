package oracle.java.note.service;

import java.util.List;

import oracle.java.note.model.Note;
import oracle.java.note.model.Subject;
import oracle.java.note.model.Subject_Note_Mapping;

public interface JM_NoteService {
	void insertNote(Note note, Subject_Note_Mapping subNoteMapping);
	List<Note> selectNote(Subject sub);
	Note selectNote(String note_id);
}
