package com.naver.listener;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.springframework.web.context.ContextLoader;
import org.springframework.web.context.WebApplicationContext;

import com.naver.dao.VisitDAO;




@WebListener
public class Visit implements HttpSessionListener {

	@Override
	public void sessionCreated(HttpSessionEvent se) {
		if(se.getSession().isNew()) {
			execute(se);
		}
	}
	
	public void execute(HttpSessionEvent se) {
		WebApplicationContext context = ContextLoader.getCurrentWebApplicationContext();
		VisitDAO vs = (VisitDAO)context.getBean("VisitDAO");

		
		try {
			vs.setTotalCount();
			int totalCount = vs.getTotalCount();
			
			HttpSession session = se.getSession();
			
			session.setAttribute("totalCount", totalCount);
			session.setMaxInactiveInterval(60*10);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	
	@Override
	public void sessionDestroyed(HttpSessionEvent se) {
		
	}

}
