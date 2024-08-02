package com.ureca.task.controller;

import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ureca.task.dto.Task;
import com.ureca.task.model.service.TaskService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/task")
public class TaskController {

	@Autowired
	TaskService taskService;

	@GetMapping("/list")
	public String list(HttpSession session, Model model) {
		int now = Calendar.getInstance().get(Calendar.DAY_OF_WEEK);
		List<Task> taskList;

		try {
			if (now != 1 && now != 7) {// 일요일이나 토요일이 아니면
				System.out.println(">>> Get list");
				taskList = taskService.selectUserUncompletedAll((String) session.getAttribute("id"));
			} else {
				System.out.println(">>> Get listBurning");
				taskList = taskService.selectUserPostponedAll((String) session.getAttribute("id"));
				taskList.addAll(taskService.selectUserUncompletedAll((String) session.getAttribute("id")));
				System.out.println("taskList >>" + taskList);
				model.addAttribute("taskList", taskList);
				return "listBurning";
			}
			System.out.println("taskList >>" + taskList);
			model.addAttribute("taskList", taskList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "list";
	}

	@GetMapping("/updateToCompleted")
	public String updateToCompleted(@RequestParam("tid") int tid) {
		System.out.println(">>> Get Completed");
		System.out.println("tid>>" + tid);

		try {
			taskService.updateToComplete(tid);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return "list";
		}
		return "redirect:list";
	}

	@GetMapping("/createForm")
	public String createForm() {
		System.out.println(">>> GET createForm");
		return "createForm";
	}

	@PostMapping("/createForm")
	public String createForm(Task task, Model model) {
		System.out.println(">>> POST createForm");
		System.out.println("task>>" + task);
		if (task.getTitle() == "") {
			model.addAttribute("error", "할 일 제목에 한 글자 이상 입력해주세요.");
			return "createForm";
		}
		try {
			taskService.insert(task);
		} catch (Exception e) {
			// TODO: handle exception
			model.addAttribute("error", "에러가 발생했습니다.");
			return "createForm";
		}
		return "redirect:list";
	}

	@GetMapping("/updateForm")
	public String updateForm(@RequestParam("tid") int tid, Model model) {
		try {
			model.addAttribute("task", taskService.select(tid));
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return "updateForm";
	}

	@PostMapping("/updateForm")
	public String updateForm(Task task) {
		System.out.println(">>> POST updateForm");
		System.out.println("task>>" + task);
		try {
			taskService.updateContext(task);
			return "redirect:list";
		} catch (Exception e) {
			e.printStackTrace();
			return "list";
		}
	}

	@GetMapping("/delete")
	public String deleteTask(@RequestParam("tid") int tid) {
		System.out.println(">>> Get delete");
		System.out.println("tid>>" + tid);
		try {
			taskService.delete(tid);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return "list";
		}
		return "redirect:list";
	}

	@GetMapping("/listBurning")
	public String listBurning() {
		System.out.println(">>> GET listBurning");
		return "listBurning";
	}
	
	@GetMapping("/listDone")
	public String listDone(HttpSession session, Model model) {
		System.out.println(">>> Get listDone");
		List<Task> taskList;
		try {
			taskList = taskService.selectUserCompletedAll((String) session.getAttribute("id"));
			model.addAttribute("taskList", taskList);
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return "listDone";
	}
}
