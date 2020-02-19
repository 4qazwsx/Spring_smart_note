package oracle.java.note.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import oracle.java.note.dao.JM_SubjectDao;
import oracle.java.note.model.Subject;

@Service
public class JM_ScheduleServiceImpl implements JM_ScheduleService {

	@Autowired
	private JM_SubjectDao subDao;
	
	@Override
	public List<Subject> dayListSelect(String mem_id) {
		
		return subDao.dayListSelect(mem_id);
	}

	@Override
	public void updateSubject(Subject sub) {
		subDao.updateSubject(sub);
	}

	@Override
	public Subject subSelect(String sub_id) {
		return subDao.subSelect(sub_id);
	}

	@Override
	public void insertSubject(Subject sub) {
		
		subDao.insertSubject(sub);
		
	}

	@Override
	public void deleteSubject(String sub_id) {
		subDao.deleteSubject(sub_id);
	}

}
