package oracle.java.note.dao;


import java.util.List;

import oracle.java.note.model.Subject;

public interface JM_SubjectDao {
	List<Subject> dayListSelect(String mem_id);
	void updateSubject(Subject sub);
	Subject subSelect(String sub_id);
	void insertSubject(Subject sub);
	void deleteSubject(String sub_id);
}
