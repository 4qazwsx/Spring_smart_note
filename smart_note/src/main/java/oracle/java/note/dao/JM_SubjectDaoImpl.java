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
	public List<Subject> dayListSelect() {
		return session.selectList("jm_dept_selectDept");
	}

}
