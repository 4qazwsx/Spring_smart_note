package oracle.java.note.dao;

import java.lang.reflect.Member;
import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import oracle.java.note.model.YJ_Members;


@Repository
public class YJ_MembersDaoImpl implements YJ_MembersDao {
	@Autowired
	private SqlSession session;

	@Override
	public int insert(YJ_Members members) {
		return session.insert("YJ_insert",members);
	}

	@Override
	public YJ_Members confirm1(String mem_id) {
		// TODO Auto-generated method stub
		return session.selectOne("YJ_confirm",mem_id);
	}

	@Override
	public YJ_Members SrhId(YJ_Members members) {
		System.out.println("SrhId members name->"+members.getMem_name());
		System.out.println("SrhId members phone->"+members.getMem_phone());
		System.out.println("SrhId members email->"+members.getMem_email());
		return session.selectOne("YJ_SrhId",members);
	}

	@Override
	public YJ_Members SrhPw(YJ_Members members) {

		System.out.println("SrhId Pw members name->"+members.getMem_name());
		System.out.println("SrhId Pw members email->"+members.getMem_email());
		// TODO Auto-generated method stub
		return session.selectOne("YJ_SrhPw",members);
	}

	@Override
	public YJ_Members confirmUser(YJ_Members members) {
		// TODO Auto-generated method stub
		return session.selectOne("YJ_confirmUser",members);
	}

	@Override
	public int update(YJ_Members member) {
		// TODO Auto-generated method stub
		return session.update("YJ_update",member);
	}

	@Override
	public YJ_Members getMemberDate(String mem_id) {
		
		System.out.println("getMemberDate members name->"+mem_id);
		return session.selectOne("YJ_getMemberDate",mem_id);
	}

	@Override
	public int update1(YJ_Members member) {
		int result = 0;// TODO Auto-generated method stub
	try {
		result =  session.delete("YJ_delete1",member);
	} catch (Exception e) {
		System.out.println("update1 eee->"+e.getMessage());
	}
		return result;
	}

	@Override
	public YJ_Members check(YJ_Members member) {
		// TODO Auto-generated method stub
		try {
		
		
		session.selectOne("YJ_check",member);
		}
		catch(Exception e) {
			System.out.println("check Start..."+e.getMessage());
		}
		return member;
		}

	}
