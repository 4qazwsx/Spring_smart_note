package oracle.java.note.dao;

import java.util.List;
import oracle.java.note.model.Subject;

public interface IK_MynoteDao {
	
	List<Subject> select(String mem_id);
	int confirm(Subject subject);
	int insert(Subject subject);
}
