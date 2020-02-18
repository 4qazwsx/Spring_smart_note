package oracle.java.note.Controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
	public List<Subject> noteList(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		String mem_id = (String) session.getAttribute("mem_id");
		System.out.println("mem_id-------->" + mem_id);
		model.addAttribute("mem_id", mem_id);

		System.out.println("IK_Mynote RestController noteList->");

		List<Subject> noteList = ms.select(mem_id);

		return noteList;
	}

	@RequestMapping("/confirm")
	public int confirm(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		String mem_id = (String) session.getAttribute("mem_id");
		String sub_name = request.getParameter("sub_name");
		System.out.println("mem_id-------->" + mem_id);
		System.out.println("sub_name-------->" + sub_name);
		Subject subject = new Subject();
		subject.setMem_id(mem_id);
		subject.setSub_name(sub_name);
//		model.addAttribute("mem_id", mem_id);
//		model.addAttribute("sub_name", sub_name);
		System.out.println("confirm 호출전 mem_id-------->" + subject.getMem_id());		
		int total = ms.confirm(subject);
		System.out.println("total--->"+total);
		return total;
	}
	
	@RequestMapping("/insert")
	public int insert(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		String mem_id = (String) session.getAttribute("mem_id");
		String sub_name = request.getParameter("sub_name");
		System.out.println("mem_id-------->" + mem_id);
		System.out.println("sub_name-------->" + sub_name);
		Subject subject = new Subject();
		subject.setMem_id(mem_id);
		subject.setSub_name(sub_name);
//		model.addAttribute("mem_id", mem_id);
//		model.addAttribute("sub_name", sub_name);
		System.out.println("confirm 호출전 mem_id-------->" + subject.getMem_id());		
		int total = ms.insert(subject);
		System.out.println("total--->"+total);
		return total;
	}
	
	
	
}
