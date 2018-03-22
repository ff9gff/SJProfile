package com.sk.project.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sk.project.vo.Board;

@Repository
public class BoardDAOImpl implements BoardDAO {

	private static final String NAMESPACE = "boardmapper";

	private SqlSessionTemplate sqlSession;

	@Autowired
	public BoardDAOImpl(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public List<Board> select() throws Exception {
		System.out.println("gggg");
		List<Board> list = sqlSession.selectList(NAMESPACE + ".select");
		return list;
	}

	@Override
	public Board selectByIdx(int idx) throws Exception {
		Board board = sqlSession.selectOne(NAMESPACE + ".selectByIdx", idx);
		return board;
	}

	@Override
	public int insert(Board board) throws Exception {
		int result = sqlSession.insert(NAMESPACE + ".insert", board);
		return result;
	}

	@Override
	public int update(Board board) throws Exception {
		return sqlSession.update(NAMESPACE + ".update", board);
	}

	@Override
	public int delete(int idx) throws Exception {
		return sqlSession.delete(NAMESPACE + ".delete", idx);
	}

	@Override
	public boolean check(int idx, String password) throws Exception {

		HashMap<String, String> map = new HashMap<>();
		map.put("idx", String.valueOf(idx));
		map.put("password", password);

		return sqlSession.selectOne(NAMESPACE + ".selectByIdxAndPwd", map);
	}

	@Override
	public boolean increse(int idx) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

}
