package com.example.mbboard.filter;

import java.io.IOException;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;

@WebFilter("/admin/*")
public class MyFilter implements Filter {
	@Override
	public void doFilter(ServletRequest request , ServletResponse response, FilterChain chain)
		throws IOException, ServletException {
		
		chain.doFilter(request, response);
	}

}
