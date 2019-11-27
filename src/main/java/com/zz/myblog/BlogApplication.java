package com.zz.myblog;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan("com.zz.myblog.dao")
public class BlogApplication {
    public static void main( String[] args ) {
        SpringApplication.run(BlogApplication.class, args);
    }
}
