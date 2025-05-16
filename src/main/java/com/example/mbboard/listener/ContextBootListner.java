package com.example.mbboard.listener;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;
import jakarta.servlet.http.HttpSessionEvent;
import jakarta.servlet.http.HttpSessionListener;

@WebListener
public class ContextBootListner implements ServletContextListener {

  
    public ContextBootListner() {
        
    }


    public void contextInialized(ServletContextEvent sce) {
    ServletContext sc = sce.getServletContext();
    sc.setAttribute("currentConnectCount", 0);
    }
    
    public void contextDestoryed(ServletContextEvent sce) {
   
    }
	
}
