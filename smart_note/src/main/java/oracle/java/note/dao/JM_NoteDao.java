package oracle.java.note.dao;

import oracle.java.note.model.Note;
import oracle.java.note.model.Subject_Note_Mapping;

public interface JM_NoteDao {
	void insertNote(Note note, Subject_Note_Mapping subNoteMapping);
}
