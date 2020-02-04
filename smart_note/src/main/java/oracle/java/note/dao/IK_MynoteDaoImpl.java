package oracle.java.note.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import oracle.java.note.model.Subject;


@Repository
public class IK_MynoteDaoImpl implements IK_MynoteDao {

	 @Autowired
		private SqlSession session; 
	
	
	@Override
	public void addFavSub() {
		System.out.println("IK_MynoteDaoImpl  addFavSub Start...");
		
		session.insert("insert");
		
	}

	@Override
	public void deleteFavSubject(String mem_id, String sub_id, String note_id) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int total() {
		System.out.println("IK_MynoteDaoImpl total Start...");
		// emp.xml-> id(total)  , return int 
		return session.selectOne("total");
	}

	@Override
	public List<String> list(String sub_name) {
		System.out.println("IK_MynoteDaoImpl  list Start...");
		List<String> list = null;
		try {
			list = session.selectList("listAll", sub_name);
		} catch (Exception e) {
			System.out.println("Exception->"+e.getMessage());
		}
		return list;
	}

	@Override
	public String confirmSub() {
		System.out.println("IK_MynoteDaoImpl updateCnt Start...");
		// emp.xml-> id(total)  , return int 
		return session.selectOne("confirmSub");
	}

	

	@Override
	public List<Subject> select() {
		// TODO Auto-generated method stub
		return session.selectList("TKselectDept");
	}

}
