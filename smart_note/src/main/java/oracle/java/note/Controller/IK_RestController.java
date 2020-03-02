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
		String sub_id = createSubId(mem_id);
		
		System.out.println("mem_id-------->" + mem_id);
		System.out.println("sub_name-------->" + sub_name);
		System.out.println("sub_id-------->" + sub_id);
		
		
		
		Subject subject = new Subject();
		subject.setMem_id(mem_id);
		subject.setSub_name(sub_name);
		subject.setSub_id(sub_id);
		// model.addAttribute("mem_id", mem_id);
		// model.addAttribute("sub_name", sub_name);
		System.out.println("confirm 호출전 mem_id-------->" + subject.getMem_id());
		System.out.println("생성된 sub_id-------->" + subject.getSub_id());
	    int total = ms.confirm(subject);
		System.out.println("total--->" + total);
		if(total == 0) {
			insert(request, model);
		}
		
		return total;
	
	
	
	
	
	}

	
	public void insert(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		String mem_id = (String) session.getAttribute("mem_id");
		String sub_name = request.getParameter("sub_name");
		
		String sub_id = createSubId(mem_id);
		
		
		System.out.println("insert mem_id-------->" + mem_id);
		System.out.println("insert sub_name-------->" + sub_name);
		System.out.println("insert sub_id-------->" + sub_id);
		Subject subject = new Subject();
		subject.setMem_id(mem_id);
		subject.setSub_name(sub_name);
		subject.setSub_id(sub_id);;
		// model.addAttribute("mem_id", mem_id);
		// model.addAttribute("sub_name", sub_name);
		System.out.println("confirm 호출전 mem_id-------->" + subject.getMem_id());
		System.out.println("sub_id-------->" + subject.getSub_id());
		ms.insert(subject);
		/*System.out.println("total--->" + total);*/
		
	}

	@RequestMapping("/sub_delete")
	public void delete(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		String mem_id = (String) session.getAttribute("mem_id");
		String sub_name = request.getParameter("sub_name");
		
		System.out.println("sub_delete mem_id-------->" + mem_id);
		System.out.println("sub_delete sub_name-------->" + sub_name);
		/*System.out.println("insert sub_id-------->" + sub_id);*/
		Subject subject = new Subject();
		subject.setMem_id(mem_id);
		subject.setSub_name(sub_name);
		/*subject.setSub_id(sub_id);;*/
		// model.addAttribute("mem_id", mem_id);
		// model.addAttribute("sub_name", sub_name);
		System.out.println("sub_delete mem_id-------->" + subject.getMem_id());
		System.out.println("sub_delete Sub_name-------->" + subject.getSub_name());
		ms.delete(subject);
	
	
	}
	
	
	
	private String createSubId(String mem_id) {

		List<Subject> subList = ms.dayListSelect(mem_id);

		int sub_num = 0;

		for (int i = 0; i < subList.size(); i++) {
			// 과목 번호
			sub_num = Integer.parseInt(subList.get(i).getSub_id().split("_")[2]);
			System.out.println(subList.get(i).getSub_id());
			// 중간에 빈 과목 번호가 있으면 채워넣는 ID를 반환한다.
			if (i != sub_num) {
				System.out.println("빈자리 확인");
				return "sub_" + mem_id + "_" + Integer.toString(i);
			}
		}
		// 마지막 인덱스까지 빈 번호가 없을 경우
		return "sub_" + mem_id + "_" + Integer.toString(sub_num + 1);
	}

}
