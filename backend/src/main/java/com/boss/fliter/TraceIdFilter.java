package com.boss.fliter;

import jakarta.servlet.*;
import org.slf4j.MDC;
import org.springframework.core.Ordered;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;

import java.io.IOException;
import java.util.concurrent.ThreadLocalRandom;

@Component
@Order(Ordered.HIGHEST_PRECEDENCE) // 保证在最外层执行
public class TraceIdFilter implements Filter {
    
    private static final String TRACE_ID = "traceId";

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) 
            throws IOException, ServletException {
        // 1. 生成你刚才确定的高性能 ID
        String traceId = System.currentTimeMillis()
                       + Long.toUnsignedString(ThreadLocalRandom.current().nextLong(), 16);
        
        // 2. 存入日志上下文
        MDC.put(TRACE_ID, traceId);
        
        try {
            chain.doFilter(request, response);
        } finally {
            // 3. 关键：请求结束后清理，防止内存泄漏或线程污染
            MDC.remove(TRACE_ID);
        }
    }
}
