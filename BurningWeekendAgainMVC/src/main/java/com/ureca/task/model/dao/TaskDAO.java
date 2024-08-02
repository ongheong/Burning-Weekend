package com.ureca.task.model.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ureca.task.dto.Task;

@Mapper
public interface TaskDAO {

	public int insert(Task task) throws SQLException;// 테스크 삽입

	public int updateContext(Task task) throws SQLException;// 제목내용수정

	public int updateToComplete(Integer tid) throws SQLException;// 미완료->완료로 수정
	// 전날에 미완료된 테스크 미루기로 업데이트

	public int updateAllToPostponed() throws SQLException;

	public int delete(Integer tid) throws SQLException;// 삭제

	// 조회할 때 사용자 아이디로 조회해야함
	public List<Task> selectUserAll(String userId) throws SQLException;

	public List<Task> selectUserUncompletedAll(String userId) throws SQLException;

	public List<Task> selectUserPostponedAll(String userId) throws SQLException;

	public List<Task> selectAll() throws SQLException;

	public Task select(Integer tid);
	
	public List<Task> selectUserCompletedAll(String userId) throws SQLException;

}
