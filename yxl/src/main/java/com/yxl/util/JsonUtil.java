package com.yxl.util;

import com.alibaba.druid.util.StringUtils;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.serializer.SerializerFeature;

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
 * @date 2020/6/26  13:37
 */
public class JsonUtil {
    public JsonUtil() {
    }

    public static Object parse(String text) {
        return JSON.parse(text);
    }

    public static <T> T parseObject(String text, Class<T> classtype) {
        return JSONObject.parseObject(text, classtype);
    }

    public static <T> List<T> parseList(String text, Class<T> classtype) {
        return JSONObject.parseArray(text, classtype);
    }

    public static String toJSONString(Object obj) {
        return JSONObject.toJSONString(obj);
    }

    public static <T> String toJSONString(List<T> list) {
        return JSONObject.toJSONString(list);
    }

    public static String toJSONStringWithDateFormat(Object obj, String dateFormat) {
        if (StringUtils.isEmpty(dateFormat)) {
            dateFormat = "yyyy-MM-dd HH:mm:ss";
        }

        return JSONObject.toJSONStringWithDateFormat(obj, dateFormat, new SerializerFeature[0]);
    }

    public static <T> String toJSONStringWithDateFormat(List<T> list, String dateFormat) {
        if (StringUtils.isEmpty(dateFormat)) {
            dateFormat = "yyyy-MM-dd HH:mm:ss";
        }

        return JSONObject.toJSONStringWithDateFormat(list, dateFormat, new SerializerFeature[0]);
    }
}
