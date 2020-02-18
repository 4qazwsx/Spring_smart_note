package oracle.java.note.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;

import oracle.java.note.dao.IK_MynoteDao;
import oracle.java.note.model.Subject;

@Repository
public class IK_MynoteServiceImpl implements IK_MynoteService {

	@Autowired
	private IK_MynoteDao md;

	@Override
	public List<Subject> select(String mem_id) {
		// TODO Auto-generated method stub
		return md.select(mem_id);
	}

	@Override
	public int confirm(Subject subject) {
		// TODO Auto-generated method stub
		return md.confirm(subject);
	}
	
	@Override
	public void insert(Subject subject) {
		// TODO Auto-generated method stub
		 md.insert(subject);
	}

	@Override
	public List<Subject> dayListSelect(String mem_id) {
		// TODO Auto-generated method stub
		return md.dayListSelect(mem_id);
	}

	@Override
	public void delete(Subject subject) {
		md.delete(subject);
		
	}

}
