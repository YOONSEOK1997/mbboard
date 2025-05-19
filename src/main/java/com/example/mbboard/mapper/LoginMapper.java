package com.example.mbboard.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.mbboard.dto.Member;
@Mapper
public interface LoginMapper {
	Member login(Member Member);
	
	int joinMember(Member Member);

	Member findById(String memberId);

	void updatePassword(Member member);
	
	List<Member> selectMembers(Member member);

	int updateMember(Member member);

	int updateMemberRole(Member member);

	void changeMemberPwByAdmin(Member member);
}
