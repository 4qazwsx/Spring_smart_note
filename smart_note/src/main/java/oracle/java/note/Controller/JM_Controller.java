package oracle.java.note.Controller;


import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import oracle.java.note.model.Subject;
import oracle.java.note.service.JM_ScheduleService;

@Controller
public class JM_Controller {
	
	@Autowired
	private JM_ScheduleService ScheculeServ;

	@RequestMapping(value="schedule")
	public String schedule(Model model) {
		
		List<Subject> subList = ScheculeServ.dayListSelect();
		
		Subject[][] daysSubList = new Subject[6][15];
		int index = 0;
		int sub_time = 0;
		int start_time = 0;
		
		//과목 전체 확장 for 문
		for(Subject sub : subList) {
			//과목의 요일 마다 for 문
			index = 0;
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
		
		model.addAttribute("daysSubList", daysSubList);
		
		return "schedule";
	}
	
}
