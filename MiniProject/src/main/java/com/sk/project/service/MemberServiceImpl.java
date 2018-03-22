package com.sk.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sk.project.dao.MemberDAO;
import com.sk.project.vo.Member;

@Service
public class MemberServiceImpl implements MemberService {
	
	// private static final String NAMESPACE = "membermapper";
	
	@Autowired
	private MemberDAO memberDAO;

	@Override
	public int isExist(String mem_id, String mem_pwd) throws Exception {
		return memberDAO.isExist(mem_id, mem_pwd);
	}

	@Override
	public List<Member> select() throws Exception {
		return memberDAO.select();
	}

	@Override
	public Member selectById(String mem_id) throws Exception {
		return memberDAO.selectById(mem_id);
	}

	@Override
	public int update(Member member) throws Exception {
		return memberDAO.update(member);
	}

	@Override
	public int delete(String mem_id) throws Exception {
		return memberDAO.delete(mem_id);
	}

	@Override
	public int insert(Member member) throws Exception {
		return memberDAO.insert(member);
	}

}
