package com.boss.fliter;

import com.boss.context.ULocaleContext;
import com.boss.context.ULocaleContextHolder;
import com.ibm.icu.util.ULocale;
import jakarta.servlet.*;
import jakarta.servlet.http.HttpServletRequest;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

/**
 * 国际化过滤器
 *
 * @author fanfan
 */
@Slf4j
@Component
public class ULocaleFilter implements Filter {

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {

        HttpServletRequest httpRequest = (HttpServletRequest) request;
        String acceptLanguage = httpRequest.getHeader("Accept-Language");

        if (acceptLanguage != null && !acceptLanguage.isEmpty()) {
            ULocale uLocale = determineBestULocale(acceptLanguage);
            log.info("这个用户的语言是: {}", uLocale.getLanguage());
            log.info("这个用户的国家是: {}", uLocale.getCountry());
            log.info("这个用户的语言环境的完整名称是: {}", uLocale.getDisplayName());

            ULocaleContextHolder.setULocaleContext(new ULocaleContext(uLocale));
        } else {
            ULocaleContextHolder.setULocaleContext(new ULocaleContext(ULocale.US));
            log.info("没有找到用户的语言信息，使用默认: 美国英文");
        }

        try {
            chain.doFilter(request, response);
        } finally {
            ULocaleContextHolder.resetULocaleContext();
        }
    }

    private ULocale determineBestULocale(String acceptLanguage) {
        String[] locales = acceptLanguage.split(",");
        Map<Double, List<ULocale>> weightedLocales = new TreeMap<>((a, b) -> b.compareTo(a)); // 按权重从高到低排序

        for (String localeStr : locales) {
            String[] parts = localeStr.trim().split(";q=");
            ULocale locale = ULocale.forLanguageTag(parts[0]);
            double weight = parts.length > 1 ? Double.parseDouble(parts[1]) : 1.0;
            weightedLocales.computeIfAbsent(weight, k -> new ArrayList<>()).add(locale);
        }

        return weightedLocales.values().stream().flatMap(List::stream).findFirst().orElse(ULocale.getDefault());
    }

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        // 初始化配置
    }

    @Override
    public void destroy() {
        // 销毁过滤器
    }
}

