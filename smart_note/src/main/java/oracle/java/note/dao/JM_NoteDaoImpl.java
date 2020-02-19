package oracle.java.note.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import oracle.java.note.model.Note;
import oracle.java.note.model.Subject_Note_Mapping;

@Repository
public class JM_NoteDaoImpl implements JM_NoteDao {

	@Autowired
	private SqlSession session;
	
	@Override
	public void insertNote(Note note, Subject_Note_Mapping subNoteMapping) {
		session.insert("jm_note_insert", note);//시퀀스 보존
		session.insert("jm_subNoteMapping_insert", subNoteMapping);//시퀀스 증가
	}

}
