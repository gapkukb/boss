package com.boss;

import com.baomidou.mybatisplus.core.toolkit.ClassUtils;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

import java.math.BigInteger;
import java.util.concurrent.ThreadLocalRandom;

@SpringBootTest
class BossApplicationTests {

    @Test
    void contextLoads() {
        System.out.println(ClassUtils.getPackageName(BossApplication.class));
        System.out.println(new BigInteger(128, ThreadLocalRandom.current()).toString(32));
    }

}
