package oracle.java.note.service;
import java.util.List;
import java.util.Map;


import oracle.java.note.model.Note;

public interface HJ_BoardService {
	List<Note> list(Note note);
	int     total();
	Note 	detail(String note_id);
	void    insertNote();
	int 	update(Note note);
	List<Note> listManager();
	
	int 	insert(Note note);
	int 	delete(String note_id);


	int     memCount(String id); 

	void    SelListDept(Map<String,Object> map); 
	
//	int 	insert2(Crawling crawl);
//	// Member1
////	DeptVO 	insertDept(DeptVO deptVO);
	
	
	
	
	
	
	
	
}