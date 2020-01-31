package oracle.java.note.Controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import oracle.java.note.model.Subject;
import oracle.java.note.service.JM_ScheduleService;

@Controller
public class JM_Controller {
	
	@Autowired
	private JM_ScheduleService ScheculeServ;

	@RequestMapping(value="schedule")
	public String schedule(Model model, HttpServletRequest request) {
		
		//세션의 mem_id 불러오기
		HttpSession session = request.getSession();
		String mem_id = (String) session.getAttribute("mem_id");
		
		//List<Subject> subList = ScheculeServ.dayListSelect(mem_id);
		List<Subject> subList = ScheculeServ.dayListSelect("0");
		
		Subject[][] daysSubList = new Subject[7][15];
		int index = 0;
		int sub_time = 0;
		int start_time = 0;
		
		//과목 전체 확장 for 문
		for(Subject sub : subList) {
			//과목의 요일 마다 for 문
			index = 0;
			if(sub.getSub_day() != null) {//day가 null값이 아닐경우 실행 / 시간표에 등록된 과목만 실행
				for(String day : sub.getSub_day().split(",")) {
					//switch문으로 해당 요일의 과목 리스트에 집어넣기
					switch(Integer.parseInt(day)) {
						case 0 :
							//해당 요일에 맞는 수업시간 값들(index를 통해 구분)
							sub_time = Integer.parseInt(sub.getSub_time().split(",")[index]);
							start_time = Integer.parseInt(sub.getSub_start().split(",")[index]);
							//수업시작시간부터 수업끝시간(시작시간+진행시간)까지 for 루프로 배열에 Subject 저장 
							for(int i=start_time ; i < start_time+sub_time ; i++ ) {
								daysSubList[0][i] = sub;
							}
							break;
						case 1 :
							sub_time = Integer.parseInt(sub.getSub_time().split(",")[index]);
							start_time = Integer.parseInt(sub.getSub_start().split(",")[index]);
							for(int i=start_time ; i < start_time+sub_time ; i++ ) {
								daysSubList[1][i] = sub;
							}
							break;
						case 2 :
							sub_time = Integer.parseInt(sub.getSub_time().split(",")[index]);
							start_time = Integer.parseInt(sub.getSub_start().split(",")[index]);
							for(int i=start_time ; i < start_time+sub_time ; i++ ) {
								daysSubList[2][i] = sub;
							}
							break;
						case 3 :
							sub_time = Integer.parseInt(sub.getSub_time().split(",")[index]);
							start_time = Integer.parseInt(sub.getSub_start().split(",")[index]);
							for(int i=start_time ; i < start_time+sub_time ; i++ ) {
								daysSubList[3][i] = sub;
							}
							break;
						case 4 :
							sub_time = Integer.parseInt(sub.getSub_time().split(",")[index]);
							start_time = Integer.parseInt(sub.getSub_start().split(",")[index]);
							for(int i=start_time ; i < start_time+sub_time ; i++ ) {
								daysSubList[4][i] = sub;
							}
							break;
						case 5 :
							sub_time = Integer.parseInt(sub.getSub_time().split(",")[index]);
							start_time = Integer.parseInt(sub.getSub_start().split(",")[index]);
							for(int i=start_time ; i < start_time+sub_time ; i++ ) {
								daysSubList[5][i] = sub;
							}
							break;
						case 6 :
							sub_time = Integer.parseInt(sub.getSub_time().split(",")[index]);
							start_time = Integer.parseInt(sub.getSub_start().split(",")[index]);
							for(int i=start_time ; i < start_time+sub_time ; i++ ) {
								daysSubList[6][i] = sub;
							}
							break;
						default :
							System.out.println("없는 요일입니다.");
					}
					//for문을 끝내면서 index값 증가
					index++;
				}
			}
			
		}
		
		model.addAttribute("daysSubList", daysSubList);
		
		return "schedule";
	}
	
	@RequestMapping(value="schduleAddSub")
	public String schduleAddSub(Model model) {
		
		//List<Subject> subList = ScheculeServ.dayListSelect(mem_id);
		List<Subject> subList = ScheculeServ.dayListSelect("0");

		model.addAttribute("subList", subList);
		
		return "schduleAddSub";

	}
	
	@RequestMapping(value="addSchduleTime")
	@ResponseBody
	public String addSchduleTime(Model model, String sub_id, String day, String start_time, String end_time) {
		
		String add_sub_day = day;
		String add_sub_start = start_time;
		String add_sub_time = Integer.toString(Integer.parseInt(end_time)-Integer.parseInt(start_time)+1);
		
		//Dao에 매개변수로 전달할 Subject 객체 생성
		Subject newSubTime = new Subject();
		
		//기존 시간표 등록 정보를 가져오기 위해 데이터베이스에 접속
		Subject oldSubTime = ScheculeServ.subSelect(sub_id);
		
		if(oldSubTime.getSub_day() != null) {//기존에 시간표에 등록된 과목일 경우 / 기존 데이터가 null값이 아닌 경우
			//데이터를 분해하여 배열로 만듦
			String[] old_sub_dayList = oldSubTime.getSub_day().split(",");
			String[] old_sub_startList = oldSubTime.getSub_start().split(",");
			String[] old_sub_timeList = oldSubTime.getSub_time().split(",");
			
			//새 데이터가 들어갈 배열 선언
			String[] new_sub_dayList = new String[old_sub_dayList.length+1];
			String[] new_sub_startList = new String[old_sub_dayList.length+1];
			String[] new_sub_timeList = new String[old_sub_dayList.length+1];

			//새로 만든 배열에 모든 요소를 추가해준다.
			for (int i = 0 ; i < old_sub_dayList.length ; i++) {
				new_sub_dayList[i] = old_sub_dayList[i];
				new_sub_startList[i] = old_sub_startList[i];
				new_sub_timeList[i] = old_sub_timeList[i];
			}
			new_sub_dayList[old_sub_dayList.length] = add_sub_day;
			new_sub_startList[old_sub_dayList.length] = add_sub_start;
			new_sub_timeList[old_sub_dayList.length] = add_sub_time;
			
			//요일 순서대로 index를 재정렬해준다.
			for (int i = 0 ; i < old_sub_dayList.length+1 ; i++) {
				String str = null;
				for(int j = 0 ; j < old_sub_dayList.length ; j++) {
					if(Integer.parseInt(new_sub_dayList[i]) < Integer.parseInt(new_sub_dayList[j])) {
						str = new_sub_dayList[i];
						new_sub_dayList[i] = new_sub_dayList[j];
						new_sub_dayList[j] = str;
						
						str = new_sub_startList[i];
						new_sub_startList[i] = new_sub_startList[j];
						new_sub_startList[j] = str;
						
						str = new_sub_timeList[i];
						new_sub_timeList[i] = new_sub_timeList[j];
						new_sub_timeList[j] = str;
					}
				}
			}

			System.out.println(mergeStringList(new_sub_dayList));
			System.out.println(mergeStringList(new_sub_startList));
			System.out.println(mergeStringList(new_sub_timeList));
			
			//파싱한 데이터를 Subject에 넣는다.
			newSubTime.setSub_id(sub_id);
			newSubTime.setSub_day(mergeStringList(new_sub_dayList));
			newSubTime.setSub_start(mergeStringList(new_sub_startList));
			newSubTime.setSub_time(mergeStringList(new_sub_timeList));
			
		}else {//처음 시간표를 등록하는 과목인 경우
			newSubTime.setSub_id(sub_id);
			newSubTime.setSub_day(add_sub_day);
			newSubTime.setSub_start(add_sub_start);
			newSubTime.setSub_time(add_sub_time);
		}
		
		ScheculeServ.updateSchduleTime(newSubTime);
		
		return "";
	}
	
	@RequestMapping(value="newSubject")
	@ResponseBody
	public String newSubject(Model model, String subName, HttpServletRequest request) {
		//세션의 mem_id 불러오기
		HttpSession session = request.getSession();
		String mem_id = (String) session.getAttribute("mem_id");
		
		
		
		
		return "";
	}
	
	//String[]을 받아서 ,를 찍어 String으로 반환해주는 메소드
	private String mergeStringList(String[] list) {
		String mergedString = "";
		for(int i = 0 ; i < list.length ; i++) {
			//첫번째 문자만 그냥 추가 이후로는 ,문자를 추가
			if(i != 0) {
				mergedString += ","+list[i];
			}else {
				mergedString = list[i];
			}
		}
		return mergedString;
	}
}
