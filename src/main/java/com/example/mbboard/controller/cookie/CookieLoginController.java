package com.example.mbboard.controller.cookie;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.mbboard.dto.Member;
import com.example.mbboard.service.ILoginService;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@Controller
public class CookieLoginController {
	@Autowired
	ILoginService loginService;

	@GetMapping("cookieLogin")
	public String cookieLogin() {
		return "/cookie/cookieLogin";
	}


	@GetMapping("/cookieLogout") 
	public String logout( HttpServletResponse response) {;
	Cookie loginMemberId = new Cookie("loginMemberId",null);
	response.addCookie(loginMemberId);
	return "/cookie/cookieLogin";
	}

	@PostMapping("/cookieLogin")
	public String login(HttpSession session, @ModelAttribute Member member, HttpServletResponse response, Model model) {
		Member loginMember = loginService.login(member);
		if (loginMember != null) {

			Cookie loginMemberId = new Cookie("loginMemberId", member.getMemberId());
			response.addCookie(loginMemberId);
			return "/cookie/cookieSuccess";		
		}
		return "redirect:/cookieLogin";
	}

	@GetMapping("/cookieSuccess")
	public String cookieSuccess(@CookieValue(value ="loginMemberId", required = false) String login) {
		//로그인 전이라면 cookieLogin

		return "/cookie/cookieSuccess";
	}
}
