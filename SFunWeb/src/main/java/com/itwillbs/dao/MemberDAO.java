package com.itwillbs.dao;

import java.util.List;
import java.util.Map;

import com.itwillbs.domain.MemberDTO;

public interface MemberDAO {
	//추상메서드
	public void insertMember(MemberDTO memberDTO);
	
	public MemberDTO userCheck(MemberDTO memberDTO);
	
	public MemberDTO getMember(String id);
	
	public void updateMember(MemberDTO memberDTO);
	
	//map
	public List<Map<String, Object>> getMemberListMap();
}
