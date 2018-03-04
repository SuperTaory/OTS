package com.ttc.ssm.po;

import java.sql.Timestamp;

public class History {
	private Integer hid;
	
	private Integer eid;
	
	private String username;
	
	private String ename;
	
	private String analysis;
	
	private Integer hscore;
	
	private Timestamp testtime;
	
	public Integer getHid() {
		return hid;
	}

	public void setHid(Integer hid) {
		this.hid = hid;
	}

	public Integer getEid() {
		return eid;
	}

	public void setEid(Integer eid) {
		this.eid = eid;
	}

	
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public Integer getHscore() {
		return hscore;
	}

	public void setHscore(Integer hscore) {
		this.hscore = hscore;
	}


	public String getEname() {
		return ename;
	}

	public void setEname(String ename) {
		this.ename = ename;
	}

	
	public String getAnalysis() {
		return analysis;
	}

	public void setAnalysis(String analysis) {
		this.analysis = analysis;
	}

	
	public Timestamp getTesttime() {
		return testtime;
	}

	
	public void setTesttime(Timestamp testtime) {
		this.testtime = testtime;
	}
	
	
	

}
