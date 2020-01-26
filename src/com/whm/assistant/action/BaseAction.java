package com.whm.assistant.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import java.lang.reflect.*;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @program: com.whm.assistant.util
 * @ClassName: BaseAction
 * @Date: 2019/12/16 2:36
 * @Author: 王海明 (1378832252@qq.com)
 * @Description: BaseAction
 */
public class BaseAction<T> extends ActionSupport implements ModelDriven<T>{

    /**
     * 模型驱动封装实体类T
     */
    protected T t;

    @Override
    public T getModel() {
        if(t == null){
            try {
                //实例化T对象
                t = (T) pClass.newInstance();

            } catch (InstantiationException e) {
                e.printStackTrace();
            } catch (IllegalAccessException e) {
                e.printStackTrace();
            }
        }
        return t;
    }

    /**
     * 记录数
     */
    protected int count = 0;

    /**
     * ?信息集合
     */
    protected List<?> list;

    /**
     * 结果：true or false
     */
    protected String result;

    /**
     * 当前页
     */
    protected int page;

    /**
     * 每页显示记录数
     */
    protected int limit;

    /**
     * 类名称
     */
    private Class pClass;

    public BaseAction(){
        //第一步、得到当前运行类Class
        Class clazz = this.getClass();
        //第二步、得到运行类的父类的参数化类型BaseDaoImpl<T>
        Type type = clazz.getGenericSuperclass();
        //转换成子接口ParameterizedType
        ParameterizedType pType = (ParameterizedType) type;
        //得到实际类型参数<T>里的T
        Type[] types = pType.getActualTypeArguments();
        Class tClass = (Class) types[0];
        this.pClass = tClass;
    }

    /**
     * json格式转换，并封装到数据表格
     * @param count 总记录数
     * @param list  数据
     */
    public void jsonConvert(int count, List<?> list){
        Map<String, Object> result = new HashMap<String, Object>();
        result.put("code", 0);
        result.put("msg", "");
        result.put("count", count);
        JSONArray array = JSONArray.fromObject(list);
        result.put("data", array);
        // 将其转换为JSON数据，并压入值栈返回
        ActionContext.getContext().getValueStack().set("jsonData", JSONObject.fromObject(result));
    }

    public String getResult() {
        return result;
    }

    public void setResult(String result) {
        this.result = result;
    }

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public int getLimit() {
        return limit;
    }

    public void setLimit(int limit) {
        this.limit = limit;
    }

}
