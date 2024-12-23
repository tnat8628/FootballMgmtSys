package vn.iostar.configs;

import org.sitemesh.builder.SiteMeshFilterBuilder;
import org.sitemesh.config.ConfigurableSiteMeshFilter;

public class CustomSiteMeshFilter extends ConfigurableSiteMeshFilter {

	@Override
	protected void applyCustomConfiguration(SiteMeshFilterBuilder builder) {
		// Cấu hình decorator cho các trang bình thường
        builder.addDecoratorPath("/**", "/web.jsp")  // Dùng cho tất cả các trang web, ngoại trừ trang admin
                // Cấu hình decorator riêng cho admin
                .addDecoratorPath("/admin/**", "/admin.jsp")
                // Loại trừ các trang không cần sử dụng decorator
                .addExcludedPath("/login*")
                .addExcludedPath("/register*")
                .addExcludedPath("/login/*")
                .addExcludedPath("/verify-reset/*")
                .addExcludedPath("/verify-reset*")
                .addExcludedPath("/forgot-password/*")
                .addExcludedPath("/forgot-password*")
                .addExcludedPath("/process-forgot-password*")
                .addExcludedPath("/process-forgot-password/*")
                .addExcludedPath("/profile*")
                .addExcludedPath("/profile/*")
                .addExcludedPath("/alogin*")
                .addExcludedPath("/alogin/*")
                .addExcludedPath("/api/**");

	}
	

}
