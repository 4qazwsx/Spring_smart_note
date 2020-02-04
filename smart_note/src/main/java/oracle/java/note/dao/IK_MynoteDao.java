package oracle.java.note.dao;

import java.util.List;

import oracle.java.note.model.Subject;

public interface IK_MynoteDao {

	void addFavSub();
	void deleteFavSubject(String mem_id, String sub_id, String note_id );
	int total();
	List<String> list(String sub_name);
	String confirmSub();
	List<Subject> select();
}
