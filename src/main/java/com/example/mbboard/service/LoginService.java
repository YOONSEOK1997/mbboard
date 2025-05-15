package com.example.mbboard.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
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
   
@Override
        public int updateMemberRole(Member member) {
            return loginMapper.updateMemberRole(member);
        }
    }


