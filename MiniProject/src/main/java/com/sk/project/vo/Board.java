package com.sk.project.vo;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Board {

	public int idx;
	public String title;
	public String memo;
	public String uname;
	public String password;
	public Date time;
	public int hit;

	public Board() {

	}

	public Board(int idx, String title, String memo, String uname, String password, Date time, int hit) {
		super();
		this.idx = idx;
		this.title = title;
		this.memo = memo;
		this.uname = uname;
		this.password = password;
		this.time = time;
		this.hit = hit;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Date getTime() {
		return time;
	}

	public void setTime(Date time) {
		this.time = time;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

}
