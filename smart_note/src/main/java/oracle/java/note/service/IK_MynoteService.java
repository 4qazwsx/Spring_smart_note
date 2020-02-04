package oracle.java.note.service;

import java.util.List;

import oracle.java.note.model.Subject;





public interface IK_MynoteService {
	
	void addFavSub();
	void delFavSubject(String mem_id, String sub_id, String note_id );
    int total();
    List<String> list(String sub_name);
    String confirmSub();
    List<Subject> select();
<<<<<<< HEAD

=======
   
>>>>>>> refs/remotes/origin/merge
}
