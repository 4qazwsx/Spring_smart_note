package oracle.java.note.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class JM_Controller {

	@RequestMapping(value="schedule")
	public String schedule(Model model) {
		
		return "schedule";
	}
	
}
