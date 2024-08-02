package com.ureca.user.dto;

public class User {
	private String id;
	private String password;

	public User() {

	}

	public User(String id, String password) {
		super();
		this.id = id;
		this.password = password;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getpassword() {
		return password;
	}

	public void setpassword(String password) {
		this.password = password;
	}

	@Override
	public String toString() {
		return "반가워요 + User [name=" + id + "] 님!";
	}

}
