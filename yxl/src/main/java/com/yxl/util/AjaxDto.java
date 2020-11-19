package com.yxl.util;

import java.io.Serializable;

/**
 * <p>Title: ssm</p>
 * <p>Description: ${Des}</p>
 * <p>Package: com.wuyang.util</p>
 * <p>Company: 四川华迪信息技术有限公司</p>
 *
 * @author 吴杨
 * @version 1.0
 * Copyright (c) 2020, wy53780@126.com All Rights Reserved.
 * @date 2020/6/28  15:03
 */
public class AjaxDto implements Serializable {
    private static final long serialVersionUID = 1L;
    private int statusCode;
    private String message;

    public AjaxDto() {
    }

    public int getStatusCode() {
        return this.statusCode;
    }

    public void setStatusCode(int statusCode) {
        this.statusCode = statusCode;
    }

    public String getMessage() {
        return this.message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
