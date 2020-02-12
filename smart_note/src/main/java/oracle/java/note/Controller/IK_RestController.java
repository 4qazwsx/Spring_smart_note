package oracle.java.note.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import oracle.java.note.model.Note;
import oracle.java.note.model.Subject;
import oracle.java.note.service.IK_MynoteService;
import oracle.java.note.service.Paging;


@RestController
public class IK_RestController {
	
	@Autowired
	private IK_MynoteService ms;

	
	
	
	@RequestMapping("/sendVO3") 
	public List<Subject> noteList() {
		
		System.out.println("IK_Mynote RestController noteList->" );
		
		List<Subject> noteList = ms.select();

		
		
		return noteList;
	}


}
