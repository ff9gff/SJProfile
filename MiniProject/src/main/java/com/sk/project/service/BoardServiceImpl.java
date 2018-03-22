package com.sk.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sk.project.dao.BoardDAO;
import com.sk.project.vo.Board;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private BoardDAO boardDAO;

	@Override
	public List<Board> select() throws Exception {
		System.out.println("보드검색");
		return boardDAO.select();
	}

	@Override
	public Board selectByIdx(int idx) throws Exception {
		return boardDAO.selectByIdx(idx);
	}

	@Override
	public int insert(Board board) throws Exception {
		return boardDAO.insert(board);
	}

	@Override
	public int update(Board board) throws Exception {
		return boardDAO.update(board);
	}

	@Override
	public int delete(int idx) throws Exception {
		return boardDAO.delete(idx);
	}

	@Override
	public boolean check(int idx, String password) throws Exception {
		return boardDAO.check(idx, password);
	}

	@Override
	public boolean increse(int idx) throws Exception {
		return boardDAO.increse(idx);
	}

}
