package com.sk.project.service;

import java.util.List;

import com.sk.project.vo.Board;

public interface BoardService {

	public List<Board> select() throws Exception;

	public Board selectByIdx(int idx) throws Exception;

	public int insert(Board board) throws Exception;

	public int update(Board board) throws Exception;

	public int delete(int idx) throws Exception;

	public boolean check(int idx, String password) throws Exception;

	public boolean increse(int idx) throws Exception;
	
}
