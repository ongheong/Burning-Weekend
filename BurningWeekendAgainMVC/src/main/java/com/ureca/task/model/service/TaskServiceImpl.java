package com.ureca.task.model.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ureca.task.dto.Task;
import com.ureca.task.model.dao.TaskDAO;

@Service
public class TaskServiceImpl implements TaskService {

	@Autowired
	TaskDAO dao;

	@Override
	public int insert(Task task) throws SQLException {
		// TODO Auto-generated method stub
		return dao.insert(task);
	}

	@Override
	public int updateContext(Task task) throws SQLException {
		// TODO Auto-generated method stub
		return dao.updateContext(task);
	}

	@Override
	public int updateToComplete(Integer tid) throws SQLException {
		// TODO Auto-generated method stub
		return dao.updateToComplete(tid);
	}

	@Override
	public int updateAllToPostponed() throws SQLException { // 파라미터로 userId 받기
		// TODO Auto-generated method stub
		return dao.updateAllToPostponed();
	}

	@Override
	public int delete(Integer tid) throws SQLException {
		// TODO Auto-generated method stub
		return dao.delete(tid);
	}

	@Override
	public List<Task> selectUserAll(String userId) throws SQLException {
		// TODO Auto-generated method stub
		return dao.selectUserAll(userId);
	}

	@Override
	public List<Task> selectUserUncompletedAll(String userId) throws SQLException {
		// TODO Auto-generated method stub
		return dao.selectUserUncompletedAll(userId);
	}

	@Override
	public List<Task> selectUserPostponedAll(String userId) throws SQLException {
		// TODO Auto-generated method stub
		return dao.selectUserPostponedAll(userId);
	}

	@Override
	public List<Task> selectAll() throws SQLException {
		// TODO Auto-generated method stub
		return dao.selectAll();
	}

	@Override
	public Task select(Integer tid) {
		// TODO Auto-generated method stub
		return dao.select(tid);
	}
	
	public List<Task> selectUserCompletedAll(String userId) throws SQLException {
		return dao.selectUserCompletedAll(userId);
	}

}
