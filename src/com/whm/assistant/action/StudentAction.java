package com.whm.assistant.action;

import com.opensymphony.xwork2.Action;
import com.whm.assistant.entity.EntryForm;
import com.whm.assistant.entity.Recruit;
import com.whm.assistant.entity.Student;
import com.whm.assistant.entity.User;
import com.whm.assistant.service.EntryFormService;
import com.whm.assistant.service.StudentService;
import com.whm.assistant.service.UserService;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import java.util.ArrayList;

/**
 * @author 王海明
 */
@Controller("studentAction")
@Scope("prototype")
public class StudentAction extends BaseAction<Student> {

    @Autowired
    private StudentService studentService;

    @Autowired
    private UserService userService;

    @Autowired
    private EntryFormService entryFormService;

    /**
     * 实例化recruit对象
     */
    private Recruit recruit = new Recruit();

    /**
     * 实例化entryForm对象
     */
    private EntryForm entryForm = new EntryForm();

    /**
     * 学生去到实验室助理招聘计划信息页面
     *
     * @return
     * @throws Exception
     */
    public String toRecruitPage() throws Exception {
        //接收学号对应的值
        Object value = result;
        //判断外键学号对应的值是否为空
        if (value == "" || value == null) {
            //学生没有登录，设置为-1
            count = -1;
        }else {
            count = entryFormService.stuIdFindCount(value);
        }
        //把值传到域对象
        ServletActionContext.getRequest().getSession().setAttribute("count", count);
        return "toRecruitPage";
    }

    /**
     * 学生注册
     *
     * @return
     * @throws Exception
     */
    public String register() throws Exception {
        //添加学生到student表
        studentService.add(t);

        //添加学生到user表
        String stuId = t.getStuId();
        String stuName = t.getStuName();
        String password = t.getPassword();
        //设置登录类型为：学生
        String userType = "3";
        User user = new User();
        user.setUserId(stuId);
        user.setUserName(stuName);
        user.setPassword(password);
        user.setUserType(userType);
        userService.add(user);

        result = "true";
        return Action.SUCCESS;
    }

    /**
     * 修改学生信息
     *
     * @return
     * @throws Exception
     */
    public String edit() throws Exception {
        //修改学生信息
        studentService.edit(t);

        //修改学生的user表的用户类型userType为1（实验室助理）
        String stuId = t.getStuId();
        String stuName = t.getStuName();
        String password = t.getPassword();
        String userType = "1";
        //设置登录类型为：学生
        User user = new User();
        user.setUserId(stuId);
        user.setUserName(stuName);
        user.setPassword(password);
        user.setUserType(userType);
        userService.edit(user);

        result = "true";
        return Action.SUCCESS;
    }

    /**
     * 验证学号是否存在
     *
     * @return
     * @throws Exception
     */
    public String verify() throws Exception {
        //获取学号
        String stuId = t.getStuId();
        Student student = studentService.findOne(stuId);
        if (student != null) {
            //学号存在返回true
            result = "true";
        } else {
            //学号不存在返回false
            result = "false";
        }
        return Action.SUCCESS;
    }

    /**
     * 学生查看查看已经审核通过的实验室助理招聘计划信息
     *
     * @return
     * @throws Exception
     */
    public String studPageList() throws Exception {
        //根据审核状态status分页查询招聘信息：
        //第一步：设置审核状态status对应表的名称
        String status = "status";
        //第二步：设置（审核状态status已通过）的对应的值
        Object value = 1;
        //根据审核状态status作为条件查询总记录数：
        //第三步：调用相应的方法查询出总记录数
        count = studentService.findCount(status, value);
        //第四步：调用相应的方法查询出（审核status已通过）的招聘计划信息，分页显示
        list = studentService.page(status, value, recruit, page, limit);
        //给json工具类封装数据
        this.jsonConvert(count, list);
        return "studPageList";
    }

}
