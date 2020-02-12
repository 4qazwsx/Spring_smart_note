package oracle.java.note.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TH_Controller {
	@RequestMapping(value="ocr_test")
	public String ocr_test() {
		
		return "ocr_test";
	}
}
