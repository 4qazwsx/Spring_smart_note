package oracle.java.note.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import oracle.java.note.dao.IK_MynoteDao;
import oracle.java.note.model.Subject;



@Repository
public class IK_MynoteServiceImpl implements IK_MynoteService {

	@Autowired
    private IK_MynoteDao md;  
	
	
	
	@Override
	public void addFavSub() {
		System.out.println("EmpServiceImpl insertEmp Start...");
		md.addFavSub();

	}

	
	
	@Override
	public void delFavSubject(String mem_id, String sub_id, String note_id) {
		// TODO Auto-generated method stub

	}

	@Override
	public int total() {
		System.out.println(" IK_MynoteServiceImpl total Start...");
		return md.total();
	}

	@Override
	public List<String> list(String sub_name) {
		System.out.println(" IK_MynoteServiceImpl List Start....");
		 List<String> list = md.list(sub_name);
		return list;
	}



	@Override
	public List<Subject> select() {
		// TODO Auto-generated method stub
		return md.select();
	}



	@Override
	public Subject confirm(String sub_name) {
		System.out.println("Subject confirm Start...");
		
		return md.confirm(sub_name);
	}



	
	
	
}
