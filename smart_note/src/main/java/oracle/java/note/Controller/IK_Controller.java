package oracle.java.note.Controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.annotation.JsonFormat.Value;

import oracle.java.note.service.IK_MynoteService;

@Controller
public class IK_Controller {

	@Autowired
	private IK_MynoteService ms;

	@RequestMapping(value = "list")
	public String list(String sub_name, Model model) {
		List<String> list = ms.list(sub_name);
		model.addAttribute("list", list);
		return "note_Search";
	}

	@RequestMapping(value = "myNoteView")
	public String myNoteView() {
		return "myNoteView";
	}

}
