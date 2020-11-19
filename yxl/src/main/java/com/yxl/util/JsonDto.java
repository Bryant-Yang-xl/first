package com.yxl.util;

import com.yxl.entity.Page;

import java.io.Serializable;
import java.util.List;

/**
 * <p>Title: ssm</p>
 * <p>Description: ${Des}</p>
 * <p>Package: com.wuyang.util</p>
 * <p>Company: 四川华迪信息技术有限公司</p>
 *
 * @author 吴杨
 * @version 1.0
 * Copyright (c) 2020, wy53780@126.com All Rights Reserved.
 * @date 2020/6/26  13:13
 */

public class JsonDto implements Serializable {
    private static final long serialVersionUID = 1L;
    private int code=0;
    private int count;
    private String msg="";
    private List<?> data;

    private JsonDto() {
    }

    public JsonDto(Page page, List<?> data) {
        this.setCount(page.getTotalResult());
        this.setData(data);
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public List<?> getData() {
        return data;
    }

    public void setData(List<?> data) {
        this.data = data;
    }
}
