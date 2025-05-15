package com.example.mbboard.service;

import java.util.List;

import com.example.mbboard.dto.Member;

public interface ILoginService {
	Member login(Member member); 	//로그인
	Member joinMember(Member member); //회원가입
	Member findById(String memberId); //아이디 중복체크
	void updatePassword(Member memberFromDb); //비밀번호 변경 
	List<Member> getMemberList(Member member); //멤버리스트 출력
	int updateMemberRole(Member member);
}
