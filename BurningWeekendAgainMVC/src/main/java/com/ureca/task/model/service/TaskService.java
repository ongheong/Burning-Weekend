package com.ureca.task.model.service;

import java.sql.SQLException;
import java.util.List;

import com.ureca.task.dto.Task;

public interface TaskService {

	public int insert(Task task) throws SQLException;

	public int updateContext(Task task) throws SQLException;

	public int updateToComplete(Integer tid) throws SQLException;

	public int updateAllToPostponed() throws SQLException;

	public int delete(Integer tid) throws SQLException;

	public List<Task> selectUserAll(String userId) throws SQLException;

	public List<Task> selectUserUncompletedAll(String userId) throws SQLException;

	public List<Task> selectUserPostponedAll(String userId) throws SQLException;

	public List<Task> selectAll() throws SQLException;

	public Task select(Integer tid);
	
	public List<Task> selectUserCompletedAll(String userId) throws SQLException;

}
