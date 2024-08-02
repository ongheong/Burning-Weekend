package com.ureca.user.controller;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ureca.user.dto.User;
import com.ureca.user.model.service.UserService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	UserService userService;// service=null;기본값

	@GetMapping("/register")
	public String registerForm() {
		return "register";
	}

	@PostMapping("/register")
	public String register(User user, Model model) {
		System.out.println(">>> POST register");
		System.out.println("user>>>" + user);
		if (user.getId() == "" || user.getpassword() == "") {
			model.addAttribute("error", "아이디와 비밀번호에 한 글자 이상 입력해주세요.");
			return "register";
		}

		try {
			userService.insert(user);
			model.addAttribute("user>>>" + user);
			return "redirect:login";
		} catch (DataIntegrityViolationException e) {
			System.out.println("회원가입 실패!");
			model.addAttribute("error", "이미 사용중인 ID입니다. 다른 ID를 사용해 주세요.");
			return "register";
		} catch (SQLException e) {
			System.out.println("db에러!");
			model.addAttribute("error", "이미 사용중인 ID입니다. 다른 ID를 사용해 주세요.");
			return "register";
		}
	}

	@GetMapping("/login")
	public String loginForm() {
		return "login";
	}

	@PostMapping("/login")
	public String login(User user, HttpSession session, Model model) throws SQLException {
		System.out.println(">>> POST login");
		User result;
		try {
			result = userService.login(user);
			if (result != null) {
				System.out.println("user>>>" + result);
				session.setAttribute("id", result.getId());
				return "redirect:/task/list";
			} else {
				System.out.println("로그인 실패!");
				model.addAttribute("error", "아이디 혹은 비밀번호가 틀렸습니다. 다시 입력해주세요.");
				return "login";
			}
		} catch (DataIntegrityViolationException e) {
			System.out.println("login 실패!");
			model.addAttribute("error", "아이디와 비밀번호에 한 글자 이상 입력해주세요");
			return "login";
		} catch (SQLException e) {
			System.out.println("db에러!");
			model.addAttribute("error", "db 에러");
			return "login";
		}
	}

}
