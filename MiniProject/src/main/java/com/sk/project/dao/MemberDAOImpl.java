package com.sk.project.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sk.project.vo.Member;

@Repository
public class MemberDAOImpl implements MemberDAO {
	
	private static final String NAMESPACE = "membermapper";
	
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	public MemberDAOImpl(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public int isExist(String mem_id, String mem_pwd) throws Exception {
		HashMap<String, String> map = new HashMap<>();
		map.put("mem_id", mem_id);
		map.put("mem_pwd", mem_pwd);
		
		System.out.println(mem_id + " : " + mem_pwd);
		int result = sqlSession.selectOne(NAMESPACE + ".memberCheck", map);
	
		return result;
	}

	@Override
	public List<Member> select() throws Exception {
		List<Member> list = sqlSession.selectList(NAMESPACE + ".select");
		return list;
	}

	@Override
	public Member selectById(String mem_id) throws Exception {
		Member member = sqlSession.selectOne(NAMESPACE + ".selectById", mem_id);
		return member;
	}

	@Override
	public int update(Member member) throws Exception {
		int result = sqlSession.update(NAMESPACE + ".update", member);
		return result;
	}

	@Override
	public int delete(String mem_id) throws Exception {
		int result = sqlSession.delete(NAMESPACE + ".delete", mem_id);
		return result;
	}

	@Override
	public int insert(Member member) throws Exception {
		return sqlSession.insert(NAMESPACE + ".insert", member);
	}

}
