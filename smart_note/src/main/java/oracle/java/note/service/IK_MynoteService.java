package oracle.java.note.service;

import java.util.List;
import oracle.java.note.model.Subject;





public interface IK_MynoteService {
	List<Subject> dayListSelect(String mem_id);
    List<Subject> select(String mem_id);
    int confirm(Subject subject);
    void insert(Subject subject);
    void delete(Subject subject);
}
