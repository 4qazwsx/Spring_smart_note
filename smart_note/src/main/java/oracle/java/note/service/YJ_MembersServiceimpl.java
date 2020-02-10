package oracle.java.note.service;

import java.lang.reflect.Member;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import oracle.java.note.dao.YJ_MembersDao;
import oracle.java.note.model.YJ_Members;


@Service
public class YJ_MembersServiceimpl implements YJ_MembersService {
	
	@Autowired
	private YJ_MembersDao md;
	@Override
	public int insert(YJ_Members members) {
			System.out.println("insert....");
			return md.insert(members);
		}
	@Override
	public int detail(String mem_id) {
		// TODO Auto-generated method stub
		return md.confirm1(mem_id);
	}
	@Override
	public YJ_Members SrhId(YJ_Members members) {
		// TODO Auto-generated method stub
		return md.SrhId(members);
	}
	@Override
	public YJ_Members SrhPw(YJ_Members members) {
		// TODO Auto-generated method stub
		return md.SrhPw(members);
	}
	@Override
	public YJ_Members confirmUser(YJ_Members members) {
		// TODO Auto-generated method stub
		return md.confirmUser(members);
	}
	@Override
	public int update(YJ_Members member) {
		// TODO Auto-generated method stub
		return  md.update(member);
	}
	@Override
	public YJ_Members getMemberDate(String mem_id) {
		// TODO Auto-generated method stub
		return  md.getMemberDate(mem_id);
	}
	@Override
	public int update1(YJ_Members member) {
		// TODO Auto-generated method stub
		return  md.update1(member);
	}
	@Override
	public YJ_Members check(YJ_Members member) {
		// TODO Auto-generated method stub
		return md.check(member);
	}
	}



