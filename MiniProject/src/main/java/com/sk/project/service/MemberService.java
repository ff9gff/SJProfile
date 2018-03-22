package com.sk.project.service;

import java.util.List;

import com.sk.project.vo.Member;


public interface MemberService {
	
	// public abstract가 기본으로 붙어있다.
	// public abstract를 직접 선언해주지 않아도 상관없다.

	public abstract int isExist(String mem_id, String mem_pwd) throws Exception;

	public List<Member> select() throws Exception;

	public Member selectById(String mem_id) throws Exception;

	public int update(Member member) throws Exception;

	public int delete(String mem_id) throws Exception;

	public int insert(Member member) throws Exception;

}
