package com.example.mbboard.service;


import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.example.mbboard.dto.Member;
import com.example.mbboard.mapper.LoginMapper;

import lombok.extern.slf4j.Slf4j;

@Service
@Transactional
@Slf4j
public class LoginService implements ILoginService {

	@Autowired
	private JavaMailSender javaMailSender;

	@Autowired
	private LoginMapper loginMapper;



	//로그인
	@Override
	public Member login(Member member) {
		return loginMapper.login(member);
	}
	//아이디 중복체크
	public Member findById(String memberId) {
		return loginMapper.findById(memberId);
	}
	//회원가입
	@Override
	public Member joinMember(Member member) {
		int result = loginMapper.joinMember(member);
		if (result > 0) {
			return member;  
		} else {
			return null; 
		}
	}
	//비밀번호 변경 
	@Override
	public void updatePassword(Member member) {
		loginMapper.updatePassword(member);
	}
	//멤버리스트 출력
	@Override
	public List<Member> getMemberList(Member member){
		return loginMapper.selectMembers(member);
	}
	//역할 변경
	@Override
	public int updateMemberRole(Member member) {
		return loginMapper.updateMemberRole(member);
	}
	//비밀번호 찾기( 관리자에 의한 변경)
	@Override
	public void changeMemberPwByAdmin(Member member) {
		String randomwPw = UUID.randomUUID().toString().replace("-", "").substring(0,8);
		member.setMemberPw(randomwPw);
		loginMapper.changeMemberPwByAdmin(member);
		SimpleMailMessage msg = new SimpleMailMessage();
		msg.setFrom("admin@localhost.com");
		msg.setTo(member.getEmail());
		msg.setSubject("비밀번호 변경을 위한 인증번호입니다" );
		msg.setText( "인증번호는 "+member.getMemberPw() + "입니다 " 
				+ "10분안에 로그인하여 수정하셔야 합니다");
	
		javaMailSender.send(msg);
	}
	//비밀번호 찾기 ( 메일로 전송받은 후 변경)
	@Override
	public void reChangeMemberPw(Member member) {
		loginMapper.reChangeMemberPw(member);
	}
}


