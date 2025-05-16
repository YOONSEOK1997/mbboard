package com.example.mbboard.listener;





import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.example.mbboard.dto.ConnectCount;
import com.example.mbboard.service.IRootService;

import jakarta.servlet.http.HttpSessionEvent;
import jakarta.servlet.http.HttpSessionListener;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class ConnectCountListner implements HttpSessionListener {
	@Autowired IRootService rootService;
	
    public void sessionCreated(HttpSessionEvent se)  { 
    	log.info("새로운 세션 생성");
    	se.getSession().getServletContext().setAttribute("currentConnectCount", 
    			(Integer)(se.getSession().getServletContext().getAttribute("currentConnectCount"))+1);
    	
        ConnectCount cc = new ConnectCount();
        cc.setMemberRole("ANONYMOUS");
        if(rootService.getConnectDateByKey(cc) == null) {
        	rootService.addConnectCount(cc);
        }else {
        	rootService.modifyConnectCount(cc);
        }
       
    }

    public void sessionDestroyed(HttpSessionEvent se)  { 
    	se.getSession().getServletContext().setAttribute("currentConnectCount"
				, (Integer)(se.getSession().getServletContext().getAttribute("currentConnectCount")) - 1);

    }
	
}
