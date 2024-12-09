package vn.iostar;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;

import vn.iostar.configs.CustomSiteMeshFilter;

@SpringBootApplication
public class FootballMgmtSysApplication {

	public static void main(String[] args) {
		SpringApplication.run(FootballMgmtSysApplication.class, args);
	}

	@Bean
	public FilterRegistrationBean<CustomSiteMeshFilter> siteMeshFilter() {
		FilterRegistrationBean<CustomSiteMeshFilter> filterRegistrationBean = new FilterRegistrationBean<CustomSiteMeshFilter>();
		filterRegistrationBean.setFilter(new CustomSiteMeshFilter()); // adding sitemesh filter ??
		filterRegistrationBean.addUrlPatterns("/*");
		return filterRegistrationBean;
	}
}
