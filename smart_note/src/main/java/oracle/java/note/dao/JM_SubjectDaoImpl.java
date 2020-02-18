package oracle.java.note.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import oracle.java.note.model.Subject;

@Repository
public class JM_SubjectDaoImpl implements JM_SubjectDao {

	@Autowired
	private SqlSession session;
	
	@Override
	public List<Subject> dayListSelect(String mem_id) {
		return session.selectList("jm_subject_selectSubList", mem_id);
		//return session.selectList("jm_subject_selectSubList", "0");
	}

	@Override
	public void updateSchduleTime(Subject newSubTime) {
		session.update("jm_subject_updateTime", newSubTime);
	}

	@Override
	public Subject subSelect(String sub_id) {
		return session.selectOne("jm_subject_selectSub", sub_id);
	}

	@Override
	public void insertSubject(Subject sub) {
		session.insert("jm_subject_insert", sub);
	}

}
