package com.zz.myblog.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.autoconfigure.condition.ConditionalOnMissingBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.web.csrf.CsrfFilter;
import org.springframework.web.filter.CharacterEncodingFilter;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.zz.myblog.util.ClassPathTldsLoader;




@Configuration
@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter implements WebMvcConfigurer{
	@Autowired
	private MyAuthenticationProvider provider;
	
	@Value("${web.upload.path}")
	private String uploadPath;
	

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		//http.authorizeRequests()
		//	.antMatchers(HttpMethod.GET,"/static/css/**","/static/js/**","/**/favicon.ico","/jt/home").permitAll()
//			.antMatchers(HttpMethod.POST,"/static/css/**","/static/js/**","/**/favicon.ico","/jt/home").permitAll()
//			.anyRequest().authenticated()
//			.and().formLogin()
//			.loginPage("/login")
//			.loginProcessingUrl("/user/login")
//			.defaultSuccessUrl("/home").failureUrl("/fail")
//			.and().logout().invalidateHttpSession(true).clearAuthentication(true)
//			.logoutRequestMatcher(new AntPathRequestMatcher("/user/logout","POST"))
//			.permitAll().logoutSuccessUrl("/login")
//			.and().csrf().disable().cors().and().headers()
//			.frameOptions().and()
//			.addFilter(new JwtLoginFilter(authenticationManager()))
//			.addFilter(new JwtAuthenticationFilter(authenticationManager()));
		
		
		http.cors().and().authorizeRequests()
		 	.antMatchers(HttpMethod.GET,"/static/css/**","/static/js/**","/**/favicon.ico","/articles","/aboutme","/").permitAll()
		 	.antMatchers(HttpMethod.POST,"/static/css/**","/static/js/**","/**/favicon.ico","/articles","/aboutme","/").permitAll()
		 	.anyRequest().authenticated()
			.and()
			.csrf().disable()
			.formLogin().loginPage("/login")
			.loginProcessingUrl("/user/login")
			.defaultSuccessUrl("/home").failureUrl("/fail")
			.permitAll();
			//验证登陆
			//.and().addFilter(new JwtLoginFilter(authenticationManager()))
			//验证token
			//.addFilter(new JwtAuthenticationFilter(authenticationManager())).headers().frameOptions();
			
		
		
		//解决中文乱码的问题
		CharacterEncodingFilter filter = new CharacterEncodingFilter();
		filter.setEncoding("UTF-8");
		filter.setForceEncoding(true);
		http.addFilterBefore(filter, CsrfFilter.class);
	}
	
	@Override
	public void configure(AuthenticationManagerBuilder auth) throws Exception{
		auth.authenticationProvider(provider);
	}
	
	/**
	 * 解决静态文件css等不加载问题
	 */
	@Override
	public void configure(WebSecurity web) throws Exception {
		web.ignoring().antMatchers("/resources/**");
	}
	
	/**
	 * 自动加载 security.tld
	 * @return
	 */
	@Bean
	@ConditionalOnMissingBean(ClassPathTldsLoader.class)
	public ClassPathTldsLoader classPathTldsLoader() {
		return new ClassPathTldsLoader();
	}
/*	
	@Bean
	CorsConfigurationSource corsConfigurationSource() {
		CorsConfiguration configuration = new CorsConfiguration();
		configuration.setAllowedOrigins(Arrays.asList("http://localost:8081"));
		configuration.setAllowedMethods(Arrays.asList("GET","POST"));
		UrlBasedCorsConfigurationSource source = new UrlBasedCorsConfigurationSource();
		source.registerCorsConfiguration("/**", configuration);
		return source;
		
	}*/
	
	/**
	 * 映射本地路径
	 */
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/**")
				//.addResourceLocations("classpath:/META-INF/resources/")
				.addResourceLocations("file:"+uploadPath);
		
		WebMvcConfigurer.super.addResourceHandlers(registry);
	}
	
	
	
    

	
	
	
	
	
	
	
	
}
