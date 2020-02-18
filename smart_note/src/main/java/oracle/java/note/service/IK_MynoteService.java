package oracle.java.note.service;

import java.util.List;
import oracle.java.note.model.Subject;





public interface IK_MynoteService {
	
    List<Subject> select(String mem_id);
    int confirm(Subject subject);
    int insert(Subject subject);
}
