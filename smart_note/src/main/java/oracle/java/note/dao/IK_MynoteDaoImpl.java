package oracle.java.note.dao;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;

import oracle.java.note.model.Subject;

@Repository
public class IK_MynoteDaoImpl implements IK_MynoteDao {

	@Autowired
	private SqlSession session;

	@Override
	public List<Subject> select(String mem_id) {
		// TODO Auto-generated method stub
		System.out.println("IK_MynoteDaoImpl select()  Start...");

		return session.selectList("sub_select", mem_id);
	}

	@Override
	public int confirm(Subject subject) {
		System.out.println("IK_MynoteDaoImpl confirm  Start...");
		System.out.println("IK_MynoteDaoImpl confirm  "+subject.getMem_id());
		System.out.println("IK_MynoteDaoImpl confirm  "+subject.getSub_name());
		return session.selectOne("sub_confirm",subject);
	}
		
	@Override
	public int insert(Subject subject) {
		System.out.println("IK_MynoteDaoImpl insert  Start...");
		System.out.println("IK_MynoteDaoImpl insert  "+subject.getMem_id());
		System.out.println("IK_MynoteDaoImpl insert  "+subject.getSub_name());
		return session.insert("sub_insert",subject);
	}
	
	
	
}
