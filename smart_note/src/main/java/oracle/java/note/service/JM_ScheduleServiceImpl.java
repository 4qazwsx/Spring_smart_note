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
	public List<Subject> dayListSelect() {
		
		return subDao.dayListSelect();
	}

}
