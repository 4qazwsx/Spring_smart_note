package oracle.java.note.Controller;

import javax.inject.Inject;
 
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import oracle.java.note.model.WY_Pagination;
import oracle.java.note.model.WY_Search;
import oracle.java.note.service.WY_ShareNoteListService;
 
 
@Controller //현재 클래스를 스프링에서 관리하는 Controller Bean으로 설정함
 //공통적인 url 맵핑
public class WY_ShareNoteList_Controller {
 
    @Inject //의존관계 주입 (DI)
    private WY_ShareNoteListService shareNoteListSevice; //스프링에서 만든 서비스 객체를 연결시킴
    
    @RequestMapping(value = "getBoardList", method = RequestMethod.GET) //세부적인 url mapping
    public String getBoardList(Model model
    		, @RequestParam(required = false, defaultValue = "1") int page
			, @RequestParam(required = false, defaultValue = "1") int range
			, @RequestParam(required = false, defaultValue = "note_title") String searchType
			, @RequestParam(required = false) String keyword
    		) throws Exception {
    	
    	WY_Search search = new WY_Search();
		search.setSearchType(searchType);
		search.setKeyword(keyword);
    	
		//전체 게시글 개수
		int listCnt = shareNoteListSevice.getBoardListCnt(search);
		search.pageInfo(page, range, listCnt);
   	    //Pagination 객체생성

   		model.addAttribute("pagination", search);
    	model.addAttribute("shareNoteList", shareNoteListSevice.getBoardList(search));
    	return "shareNoteList";
    }
    
    @RequestMapping(value = "getBoardContent", method = RequestMethod.GET)
	public String getBoardContent(Model model, @RequestParam("note_id") int note_id) throws Exception {
		model.addAttribute("boardContent", shareNoteListSevice.getBoardContent(note_id));
		System.out.println("들어갔나?" + shareNoteListSevice.getBoardContent(note_id));
		return "boardContent";
	}

}

