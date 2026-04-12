package com.boss.model.vo;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

@Data
@Schema(description = "图形验证码响应对象")
public class GetCaptchaVo {

    @Schema(description = "图片base64",example = "data:image/png;base64,...")
    private String image;

    @Schema(description = "图形验证码唯一id",example = "xxxx-yyyy")
    private String key;
}
