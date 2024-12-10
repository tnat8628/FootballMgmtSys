package vn.iostar.configs;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer{
	@Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        // Ánh xạ URL /uploads/** tới thư mục C:/WebProgramming/upload
		 registry.addResourceHandler("/uploads/**")
         .addResourceLocations("file:C:/WebProgramming/upload/");
    }
	

}
