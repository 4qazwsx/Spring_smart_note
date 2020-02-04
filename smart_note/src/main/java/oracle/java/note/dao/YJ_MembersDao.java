package oracle.java.note.dao;

import java.lang.reflect.Member;
import java.util.List;

import oracle.java.note.model.YJ_Members;

public interface YJ_MembersDao {

	int insert(YJ_Members members);

	YJ_Members confirm1(String mem_id);

	YJ_Members SrhId(YJ_Members members);

	YJ_Members SrhPw(YJ_Members members);

	YJ_Members confirmUser(YJ_Members members);

	int update(YJ_Members member);

	YJ_Members getMemberDate(String mem_id);

	YJ_Members check(YJ_Members member);

	int update1(YJ_Members member);


	}
