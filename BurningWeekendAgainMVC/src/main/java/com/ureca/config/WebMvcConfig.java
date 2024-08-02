package com.ureca.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.ureca.interceptor.SessionConfirmInterceptor;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer {

	@Autowired
	private SessionConfirmInterceptor confirmInterceptor;

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(confirmInterceptor) // 인터셉터 등록
				.addPathPatterns("/task/list");
		// 인터셉터가 가로챌 요청의 url 패턴 지정
	}
}