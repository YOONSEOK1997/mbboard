package com.example.mbboard.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.mbboard.dto.ConnectCount;
import com.example.mbboard.dto.Member;
import com.example.mbboard.service.ILoginService;
import com.example.mbboard.service.IRootService;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class LoginController {



	@Autowired IRootService irootService;
	@Autowired ILoginService loginService;



	
	
	@GetMapping("/findMemberPw")
	public String findMemberPwForm() {
		return "/findMemberPw";
	}
	@PostMapping("/findMemberPw")
	public String findMemberPw(Member member) {
		//비밀번호 변경
		loginService.changeMemberPwByAdmin(member);
		
		//비밀번호 변경 페이지로 이동
		return "redirect:/reChangeMemberPw";
	}
	@GetMapping("/reChangeMemberPw")
	public String reChangeMemberPwForm() {
		return "/reChangeMemberPw";
	}
	@PostMapping("/reChangeMemberPw")
		public String reChangeMemberPw(Member member){
		loginService.reChangeMemberPw(member);
			return "redirect:/login";
		}
		//비밀번호 변경
		
		//
		
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/login";
	}

	@GetMapping("/login")
	public String loginForm() {
	    return "member/login";
	}

	@PostMapping("/login")
	public String login(
	        HttpSession session,
	        @ModelAttribute Member member,
	        HttpServletResponse response,
	        Model model
	) {
	    Member loginMember = loginService.login(member);

	    if (loginMember == null) {
	        model.addAttribute("error", "아이디 또는 비밀번호가 일치하지 않습니다.");
	        return "member/login"; // 실패 시 다시 로그인 페이지로
	    }

	    // 로그인 성공 시
	    session.setAttribute("loginMember", loginMember);
	    log.info("로그인 성공: {}", loginMember.getMemberId());

	    // 아이디 저장 쿠키
	    Cookie cookie = new Cookie("saveId", member.getSaveIdCk() != null ? member.getMemberId() : "");
	    cookie.setPath("/");
	    cookie.setMaxAge(member.getSaveIdCk() != null ? 60 * 60 * 24 * 30 : 0); // 30일 or 삭제
	    response.addCookie(cookie);

	    // 접속 통계 처리
	    ConnectCount cc = new ConnectCount();
	    cc.setMemberRole(loginMember.getMemberRole());

	    if (irootService.getConnectDateByKey(cc) == null) {
	        irootService.addConnectCount(cc);
	    } else {
	        irootService.modifyConnectCount(cc);
	    }

	    return "redirect:/member/memberHome"; // 성공 시 홈으로 이동
	}

	@GetMapping("/checkId")
	@ResponseBody
	public String checkId(@RequestParam String memberId) {
		Member member = loginService.findById(memberId);
		return (member == null) ? "OK" : "DUPLICATE";
	}

	@GetMapping("/joinMember")
	public String joinMemberForm() {
		return "member/joinMember";
	}
	@PostMapping("/joinMember")
	public String joinMember(@ModelAttribute Member member) {
		loginService.joinMember(member);
		return "redirect:/login";
	}
	// 세션안의 상세정보를 보여주는 요청 -> 로그인 상태에서 요청가능 -> 필터1)
	@GetMapping("/member/info") 
	public String info(HttpSession session, Model model) {
		Member loginMember = (Member) session.getAttribute("loginMember");
		model.addAttribute("loginMember", loginMember);
		return "/member/info";
	}
	//비밀번호 변경 
	@PostMapping("/member/updatePassword")
	public String updatePassword(HttpSession session,
			@RequestParam String newPw,
			@RequestParam String confirmPw,
			Model model) {
		Member loginMember = (Member) session.getAttribute("loginMember");

		if (loginMember == null) {
			return "redirect:/login";  
		}

		// 
		if (!newPw.equals(confirmPw)) {
			model.addAttribute("error", "새 비밀번호와 확인이 일치하지 않습니다.");
			return "/member/info"; 
		}

		Member member = loginService.findById(loginMember.getMemberId());

		// 비밀번호 변경
		member.setMemberPw(newPw);
		loginService.updatePassword(member);

		session.setAttribute("loginMember", member);

		model.addAttribute("msg", "비밀번호가 성공적으로 변경되었습니다.");
		return "redirect:/member/info";
	}



	@GetMapping("/member/memberHome")
	public String memberHome(HttpSession session, Model model) {
		Member loginMember = (Member) session.getAttribute("loginMember");
		model.addAttribute("loginMember", loginMember);
		return "member/memberHome";   
	}

	// 관리자 페이지 요청 -> 로그인 상태이고 role이 'ADMIN'요청가능 -> 필터2)
	@GetMapping("/admin/adminHome") 
	public String adminHome(@ModelAttribute Member member, Model model) {
		List<Member> memberList = loginService.getMemberList(member);
		model.addAttribute("memberList", memberList);
		return "/admin/adminHome";
	}

	@PostMapping("/admin/updateMemberRole")
	@ResponseBody
	public String updateMemberRoles(@RequestBody List<Member> members) {
		for (Member member : members) {
			int result = loginService.updateMemberRole(member);
			if (result > 0 ) {
				return "success";
			}
		}
		return "fail";
	}



}

