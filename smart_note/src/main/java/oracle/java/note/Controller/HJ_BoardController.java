package oracle.java.note.Controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.authentication.encoding.ShaPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import oracle.java.note.service.HJ_BoardService;
import oracle.java.note.model.Note;
import oracle.java.note.service.Paging;
import oracle.java.note.model.Subject;
import oracle.java.note.service.HJ_BoardService;
 


@Controller
public class HJ_BoardController {
	
	@Autowired
	private HJ_BoardService ns;
	
	//계시글 목록
	@RequestMapping(value="HJ_list")
	public String list(Note note, String currentPage, Model model) {
		System.out.println("concNoteView Start...");
		int total = ns.total();
		System.out.println("total=>" + total);
		System.out.println("currentPage=>" + currentPage);
		//                     14     NULL(0,1....)
		Paging pg = new Paging(total, currentPage);
		List<Note> list = ns.list(note);
//		String status = es.idCompare(id1,id2);
		
	//	model.addAttribute("k33","k33333");
		model.addAttribute("list",list);
		model.addAttribute("pg",pg);
		return "HJ_list";
	}
	@RequestMapping(value = "conc")
	public String concNoteView(HttpServletRequest request,Model model) {
		System.out.println("concNoteView Start...");
		HttpSession session = request.getSession();
		String mem_id = (String) session.getAttribute("mem_id");
		String sub_name = request.getParameter("furuitSrc");
		Subject subject = new Subject();
		subject.setMem_id(mem_id);
		subject.setSub_name(sub_name);
		
			
		
		System.out.println("kk3 HJ_conc mem_id-------->" + subject.getMem_id());
		System.out.println("kk3 HJ_conc sub_name-------->" + sub_name);
		model.addAttribute("sub_name",sub_name);
		
		/*System.out.println("sub_name-------->" + sub_name);*/
		return "HJ_list";
	}
}
