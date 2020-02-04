package oracle.java.note.service;

import java.lang.reflect.Method;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class SampleIntercepter extends HandlerInterceptorAdapter{
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response,
			Object handler, ModelAndView modelAndView) throws Exception {
		
		System.out.println("post handle...");
		
		String ID = (String) modelAndView.getModel().get("id");
		int memCnt = (Integer) modelAndView.getModel().get("memCnt");
		
		System.out.println("SampleIntercepter post handle memCnt : " + memCnt);
		
		if(memCnt < 1) {
			System.out.println("memCnt Not exists");
			request.getSession().setAttribute("ID", ID);
			response.sendRedirect("doMemberWrite.do");
		}else {
			System.out.println("memCnt exists");
			request.getSession().setAttribute("ID", ID);
			response.sendRedirect("doMemberList.do");
		}
		
	}
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
			Object handler) throws Exception {
		
		System.out.println("pre handle......");
		
		HandlerMethod method = (HandlerMethod) handler;
		Method methodObj = method.getMethod();
		
		System.out.println("Bean : " + method.getBean());
		System.out.println("Method : " + methodObj);
		
		return true;
		
	}

}
