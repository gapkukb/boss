package com.boss;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Import;

@SpringBootApplication
@MapperScan("com.boss.mapper")
@Import(cn.hutool.extra.spring.SpringUtil.class)
public class BossApplication {

    public static void main(String[] args) {
        SpringApplication.run(BossApplication.class, args);
    }

}
