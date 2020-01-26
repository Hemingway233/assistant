package com.whm.assistant.action;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.whm.assistant.entity.User;
import com.whm.assistant.service.UserService;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import javax.servlet.http.HttpSession;
import java.util.Map;

/**
 * @program: assistant
 * @Date: 2019/11/30 13:30
 * @Author: Hemingway
 * @Description:
 */
@Controller("userAction")
@Scope("prototype")
public class UserAction extends ActionSupport implements ModelDriven<User> {

    //依赖注入
    @Autowired
    /**
     * userService
     */
    private UserService userService;

    /**
     * 结果：true or false
     */
    private String result;

    //模型驱动封装
    private User user = new User();

    @Override
    public User getModel() {
        return user;
    }

    /**
     * 登录
     * @return
     * @throws Exception
     */
    public String login() throws Exception {
        user = userService.login(user);
        if(user == null){
            //登录失败
            result = "false";
        }else{
            //登录成功
            result = "true";
            ServletActionContext.getRequest().getSession(true).setMaxInactiveInterval(15000);
            ServletActionContext.getRequest().getSession(true).setAttribute("user", user);
        }
        return Action.SUCCESS;
    }

    /**
     * 注销
     *
     * @return
     * @throws Exception
     */
    public String logout() throws Exception {

        // 跳转到登录页面并且注销当前会话
        ServletActionContext.getRequest().getSession().invalidate();
        return "logout";
    }

    public String getResult() {
        return result;
    }

    public void setResult(String result) {
        this.result = result;
    }
}
