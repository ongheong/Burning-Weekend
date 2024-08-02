package com.ureca.task.dto;

import java.sql.Date;

public class Task {
	private Integer tid;
	private String title;
	private String content;
	private Boolean isCompleted;
	private Boolean isPostponed;
	private Date createdAt;
	private String userId; // 어떤 사용자에게 속해 있는지 관계를 명확하게 하기 위함

	public Task() {

	}

	public Task(String title, String content, String userId) {
		super();
		this.title = title;
		this.content = content;
		this.userId = userId;
	}

	public Task(Integer tid, String title, String content, Boolean isCompleted, Boolean isPostponed, Date createdAt,
			String userId) {
		super();
		this.tid = tid;
		this.title = title;
		this.content = content;
		this.isCompleted = isCompleted;
		this.isPostponed = isPostponed;
		this.createdAt = createdAt;
		this.userId = userId;
	}

	public Integer getTid() {
		return tid;
	}

	public void setTid(Integer tid) {
		this.tid = tid;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Boolean getIsCompleted() {
		return isCompleted;
	}

	public void setIsCompleted(Boolean isCompleted) {
		this.isCompleted = isCompleted;
	}

	public Boolean getIsPostponed() {
		return isPostponed;
	}

	public void setIsPostponed(Boolean isPostponed) {
		this.isPostponed = isPostponed;
	}

	public Date getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	@Override
	public String toString() {
		return "Task [tid=" + tid + ", title=" + title + ", content=" + content + ", isCompleted=" + isCompleted
				+ ", isPostponed=" + isPostponed + ", createdAt=" + createdAt + ", userId=" + userId + "]";
	}
}
