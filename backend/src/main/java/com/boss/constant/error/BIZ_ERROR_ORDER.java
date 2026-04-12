package com.boss.constant.error;

/**
 * 订单错误常量
 * 30000-39999
 */
public enum BIZ_ERROR_ORDER implements IBizError {
    CUSTOM_ERROR(30000, "{0}"),
    STOCK_LOW(30001, "商品库存不足"),
    ORDER_EXPIRED(30002, "订单支付超时已关闭"),
    ORDER_NOT_PAYABLE(30003, "当前订单状态不可支付");
    // ... 可以写上百个
    
    private final int code;
    private final String message;
    BIZ_ERROR_ORDER(int code, String message) { this.code = code; this.message = message; }
    @Override public int getCode() { return code; }
    @Override public String getMessage() { return message; }
}
