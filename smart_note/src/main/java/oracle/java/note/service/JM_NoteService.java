package oracle.java.note.service;

import oracle.java.note.model.Note;
import oracle.java.note.model.Subject_Note_Mapping;

public interface JM_NoteService {
	void insertNote(Note note, Subject_Note_Mapping subNoteMapping);
}
