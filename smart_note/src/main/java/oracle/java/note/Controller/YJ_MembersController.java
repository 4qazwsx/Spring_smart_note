package oracle.java.note.Controller;

import java.lang.reflect.Member;
import java.util.HashMap;
import java.util.List;

import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import oracle.java.note.model.YJ_Members;
import oracle.java.note.service.YJ_MembersService;

@Controller
public class YJ_MembersController {
	@Autowired
	private YJ_MembersService YM;
	
	
	



@RequestMapping(value="loginForm")
public String login(Model model) {
	System.out.println("Start Login Form"); //로그인 폼 스타트
	return "loginForm";
}


@RequestMapping(value="logout")
public String logout(HttpServletRequest request, Model model) {
	System.out.println("Start Logout Form");
	HttpSession session = request.getSession();
	session.invalidate(); //로그아웃시 세션정보 사라지게
	return "schedule";
}
@RequestMapping(value="memUpForm")
public String memUpForm(HttpServletRequest request, YJ_Members members, Model model) {
	System.out.println("Start memUpForm Form");
	HttpSession session = request.getSession();
	String mem_id= (String) session.getAttribute("mem_id"); //회원정보 수정시 멤 ID를 받아와 
	YJ_Members members2 = YM.getMemberDate(mem_id); //회원정보 JSP 테이블에 값을 뿌려줌
	
	model.addAttribute("members1",members2); //값을 뿌려줌
	
	return "memUpForm";
}

@RequestMapping(value="deleteForm")
public String deleteForm(YJ_Members member,Model model) {
	System.out.println("Start deleteForm Form");

	YJ_Members members2 = YM.getMemberDate(member.getMem_id()); //삭제하기 전에 memID를 받아와 조회

	model.addAttribute("mem_id",members2.getMem_id()); //mem_id를 보내줌
	model.addAttribute("mem_pw",members2.getMem_pw()); //mem_pw를 보내줌
	return "deleteForm";
}

@RequestMapping(value="deletePro")
public String deletePro(YJ_Members member, Model model) {
	System.out.println("Start deletePro Form");
		
			int member1 = YM.update1(member); //delete mybatis 호출 삭제해서
	
			int result = member1; //int 결과값에 따라서 0이면 뭐임 1이면 뭐임 이런식으로
			System.out.println("result"+result);
			model.addAttribute("result",result);//result로 보내줌
			
	return "deletePro";
}

@RequestMapping(value="memUpPro")
public String memUpPro(YJ_Members member,Model model) {
	
	System.out.println("Start memUpPro Form");
	System.out.println("memup"+member.getMem_id());
	int member1 = YM.update(member); //회원정보 수정을한다
	
	int result = member1; //결과값을 저장하고

	model.addAttribute("result",result); //결과값을 보내줌
	return "memUpPro";
}
@RequestMapping(value="loginForm2")
public String login2(Model model) {
	System.out.println("Start loginForm2 Form"); //로그인 폼
	return "loginForm2";
}
@RequestMapping(value="header")
public String header(Model model) {
	System.out.println("Start header Form"); //헤더
	return "header";
}

@RequestMapping(value="header1")
public String header1(Model model) {
	System.out.println("Start header Form"); //헤더
	return "header1";
}
@RequestMapping(value="WriteView")
public String WriteView(Model model) {
	System.out.println("Start header Form"); //헤더
	return "WriteView";
}


@RequestMapping(value="loginPro")
public String loginPro(HttpServletRequest request,YJ_Members members, Model model) {
	HttpSession session = request.getSession();
	YJ_Members members1 = YM.confirmUser(members); //로그인할시 PW 와 ID로 mem id를 체크함
	YJ_Members members2 = YM.getMemberDate(members.getMem_id()); //mem_id를 받아와서 모두 조회
	System.out.println("Start loginPro Form");
	int result = 0; //result 기본값은 0
	
	try { 
		members1.getMem_id(); //mem ID 가 있다면 결과값 1
		System.out.println("loginPro members1.getMem_id()"+members1.getMem_id());
		result =1; 

		session.setAttribute("mem_id", members1.getMem_id()); //세션에 mem ID를 넣어줌
	}
	catch (Exception e){
	
		System.out.println("e.getMessage()"+e.getMessage()); //결과 값이 없다면 0
		
	}
	model.addAttribute("members1",members2); //members1에 members2를 뿌려주고
	model.addAttribute("result",result); //result에 result를 뿌려줌
	return "loginPro";
}


@RequestMapping(value="joinForm")
public String join(Model model) {
	System.out.println("Start joinForm Form"); //회원가입폼
	
	return "joinForm";
}

@RequestMapping(value="joinPro")
public String writedo(YJ_Members members, Model model) {
	System.out.println("joinPro start");

	int result = YM.insert(members); //회원가입시 모든 정보를 Insert함
	return "joinPro";
}

@RequestMapping(value="confirm1")
public String confirm(String mem_id, Model model) {
	YJ_Members members = YM.detail(mem_id); //mem_id를 받아와서 중복된 id인지 조회한다.
	model.addAttribute("mem_id",mem_id); //mem_id를 넘겨준다
	if(members != null) {//만약 조회된 mem_id
		model.addAttribute("msg","중복된 아이디입니다.");
		model.addAttribute("tk",1);
	}else {
		model.addAttribute("msg","사용가능 아이디입니다");
		model.addAttribute("tk",2);
	}
	return "forward:joinForm.do";
}


@RequestMapping(value="idSrhForm")
public String idSrhForm(Model model) {
	System.out.println("Start idSrhForm Form");
	
	return "idSrhForm";
}


@RequestMapping(value="main")
public String main(Model model) {
	System.out.println("Start Main Form");
	
	return "main";
}
@RequestMapping(value="idSrhPro")
public String idSrhPro(YJ_Members members, Model model) {
	System.out.println("Start idSrhPro Form");
	
	try {
		
	YJ_Members members1 = YM.SrhId(members);
	
	System.out.println("mem_id->"+members1.getMem_id());
	model.addAttribute("mem_id",members1.getMem_id());

	}	catch(Exception e) {
		model.addAttribute("mem_id", null);
		System.out.println("e.getmessage()"+e.getMessage());
		
	}
	
	return "idSrhPro";
}

@RequestMapping(value="pwSrhForm")
public String pwSrhForm(Model model) {
	System.out.println("Start pwSrhForm Form");
	
	return "pwSrhForm";
}

@RequestMapping(value="pwSrhPro")
public String pwSrhPro(YJ_Members members, Model model) {
	
	System.out.println("Start pwSrhPro Form");
try {
	YJ_Members members1 = YM.SrhPw(members);
	System.out.println("pwSrhPro Form mem_pw->"+members1.getMem_pw());
	model.addAttribute("mem_pw",members1.getMem_pw());
} catch(Exception e) {
	model.addAttribute("mem_pw",null);	
	System.out.println("e.getmessage()"+e.getMessage());
}
return "pwSrhPro";
}

}

