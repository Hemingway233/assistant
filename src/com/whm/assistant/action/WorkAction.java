package com.whm.assistant.action;

import com.opensymphony.xwork2.Action;
import com.whm.assistant.entity.EntryForm;
import com.whm.assistant.entity.Work;
import com.whm.assistant.service.EntryFormService;
import com.whm.assistant.service.WorkService;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import java.util.ArrayList;

/**
 * @program: com.whm.assistant.action
 * @ClassName: WorkAction
 * @Date: 2019/12/20 10:50
 * @Author: 王海明 (1378832252@qq.com)
 * @Description:
 */
@Controller("workAction")
@Scope("prototype")
public class WorkAction extends BaseAction<Work>{

    @Autowired
    private WorkService workService;
    @Autowired
    private EntryFormService entryFormService;

    private String userId;

    /**
     * 安全卫生检查页面
     * @return
     */
    public String toWorkPage() throws Exception{
        //第一步：接收学号对应的值，并设置
        String stuId = "1";
        EntryForm one = entryFormService.findOne(stuId);
        //获取实验室技术员编号
        String userId = one.getRecruit().getUser().getUserId();
        ServletActionContext.getRequest().getSession(true).setAttribute("userId", userId);
        return "toWorkPage";
    }

    /**
     * 实验室技术员打开安全卫生检查页面
     * @return
     */
    public String toTechWorkPage() throws Exception{
        return "toTechWorkPage";
    }

    /**
     * 添加工作内容信息
     * @return
     */
    public String add(){
        workService.add(t);
        return Action.SUCCESS;
    }

    /**
     * 根据实验室技术员编号分页显示工作内容信息
     * @return
     * @throws Exception
     */
    public String userIdPage() throws Exception{
        //第一步：接收实验室技术员编号对应的值，并设置
        String userId = result;
        //判断外键userId对应的值是否为空
        if (userId == "") {
            count = 0;
            list = new ArrayList<EntryForm>();
        } else {
            //第二步：调用相应的方法查询出总记录数
            count = workService.userIdFindCount(userId);
            //第三步：调用相应的方法查询出工作内容信息，分页显示
            list = workService.userIdPage(userId, t, page, limit);
        }
        //第四步：给json工具类封装数据
        this.jsonConvert(count, list);
        return "jsonData";
    }

    /**
     * 根据学号分页显示工作内容信息
     * @return
     * @throws Exception
     */
    public String stuIdPage() throws Exception{
        //第一步：接收学号对应的值，并设置
        String stuId = result;
        //判断外键学号对应的值是否为空
        if (stuId == "") {
            count = 0;
            list = new ArrayList<EntryForm>();
        } else {
            //第二步：调用相应的方法查询出总记录数
            count = workService.stuIdFindCount(stuId);
            //第三步：调用相应的方法查询出工作内容信息，分页显示
            list = workService.stuIdPage(stuId, t, page, limit);
        }
        //第四步：给json工具类封装数据
        this.jsonConvert(count, list);
        return "jsonData";
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }
}
