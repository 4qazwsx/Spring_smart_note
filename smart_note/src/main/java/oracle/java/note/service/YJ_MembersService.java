package oracle.java.note.service;

import java.lang.reflect.Member;
import java.util.List;
import java.util.Map;

import oracle.java.note.model.YJ_Members;

public interface YJ_MembersService {
	int insert(YJ_Members members);
	YJ_Members detail(String mem_id);
	YJ_Members SrhId(YJ_Members members);
	YJ_Members SrhPw(YJ_Members members);
	YJ_Members confirmUser(YJ_Members members);
	int update(YJ_Members member);
	YJ_Members getMemberDate(String mem_id);
	YJ_Members check(YJ_Members member);
	int update1(YJ_Members member);
	}
