package oracle.java.note.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class TH_OcrDaoImpl implements TH_OcrDao {
	@Autowired
	private SqlSession session;
	
	@Override
	public int maxNoteId() {
		
		return session.selectOne("th_note_selectmax");
	}

}
