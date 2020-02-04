package oracle.java.note.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import oracle.java.note.model.Note;
import oracle.java.note.model.WY_Pagination;
import oracle.java.note.model.WY_Search;


@Repository
public class WY_ShareNoteListDaoImpl implements WY_ShareNoteListDao {
	
	
	@Autowired
	private SqlSession session;
	
	@Override
	public List<Note> getBoardList(WY_Search search) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList("getBoardList", search);
	}

	@Override
	public Note getBoardContent(int note_id) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertBoard(Note note) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateBoard(Note note) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteBoard(int note_id) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateViewCnt(int note_id) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}
	//총 게시글 개수 확인

	@Override
	public int getBoardListCnt(WY_Search search) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne("getBoardListCnt", search);
	}

	
}
