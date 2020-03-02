package oracle.java.note.Controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.annotation.JsonFormat.Value;

import oracle.java.note.model.Subject;

@Controller
public class HJController {

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
		return "HJ_Main";
	}

	


}
