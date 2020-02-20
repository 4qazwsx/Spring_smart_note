package oracle.java.note.Controller;

import java.io.File;
import java.util.Iterator;
import java.util.List;

import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

import oracle.java.note.service.TH_OcrService;
import oracle.java.note.service.TH_OcrServiceImpl;

@Controller
public class TH_Controller {

	private static final Logger logger = LoggerFactory.getLogger(TH_Controller.class);

	private final String PATH = "C:/Pycharmproject/Sources/smartnote/polls/resource/orc_ori_image/";

	@Autowired
	MappingJackson2JsonView jsonView;
	@Autowired
	private TH_OcrService ocrService;
	@RequestMapping(value = "/uploadForm.do")
	public String uploadForm() throws Exception {
		return "uploadForm";
	}

	@RequestMapping(value = "/upload.do", method = RequestMethod.POST, produces = "text/plain")
	public ModelAndView upload(MultipartHttpServletRequest request) throws Exception {
		int number = ocrService.maxNoteId()+1;
		ModelAndView model = new ModelAndView();
		model.setView(jsonView);
		String folder = ""+number+"/";
		Iterator<String> itr = request.getFileNames();
		System.out.println("파일이름->" + itr);
		String folderPATH = PATH+folder;
		
		File Folder = new File(folderPATH);

		// 해당 디렉토리가 없을경우 디렉토리를 생성합니다.
		if (!Folder.exists()) {
			try{
			    Folder.mkdir(); //폴더 생성합니다.
			    System.out.println("폴더가 생성되었습니다.");
		    } 
		    catch(Exception e){
			    e.getStackTrace();
		    }        
	    }else {
		System.out.println("이미 폴더가 생성되어 있습니다.");
	    }
		
		if (itr.hasNext()) {
			List<MultipartFile> mpf = request.getFiles(itr.next());

			// 임시 파일을 복사한다.
			for (int i = 0; i < mpf.size(); i++) {

				File file = new File(folderPATH + mpf.get(i).getOriginalFilename());
				System.out.println("파일이름2" + mpf.get(i).getOriginalFilename());
				logger.info(file.getAbsolutePath());
				mpf.get(i).transferTo(file);
				model.addObject("filename", mpf.get(i).getOriginalFilename());
			}

			JSONObject json = new JSONObject();
			json.put("code", "true");
			return model;

		} else {

			JSONObject json = new JSONObject();
			json.put("code", "false");
			model.addObject("result", json);
			return model;

		}
	}

}