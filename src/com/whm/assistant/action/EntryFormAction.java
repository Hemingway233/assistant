package com.whm.assistant.action;

import cn.hutool.core.date.DateUtil;
import com.opensymphony.xwork2.Action;
import com.whm.assistant.entity.EntryForm;
import com.whm.assistant.service.EntryFormService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import java.util.ArrayList;

/**
 * @program: com.whm.assistant.action
 * @ClassName: EntryFormAction
 * @Date: 2019/12/18 0:58
 * @Author: 王海明 (1378832252@qq.com)
 * @Description:
 */
@Controller("entryFormAction")
@Scope("prototype")
public class EntryFormAction extends BaseAction<EntryForm> {

    @Autowired
    private EntryFormService entryFormService;

    private int rid;

    private int amount;

    /**
     * 保存实验室助理报名信息
     *
     * @return
     * @throws Exception
     */
    public String entryFormAdd() throws Exception {
        //当前时间字符串，格式：yyyy-MM-dd HH:mm:ss
        String now = DateUtil.now();
        //去除字符串时间的横杠、空格、冒号
        String replaceAll = now.replaceAll("[[\\s-:punct:]]", "");
        //定义报名编号(规则：ZP+时间)
        String entryId = "BM" + replaceAll;
        t.setEntryId(entryId);
        entryFormService.add(t);
        result = "true";
        return Action.SUCCESS;
    }

    /**
     * 修改实验室助理报名信息
     *
     * @return
     * @throws Exception
     */
    public String entryFormEdit() throws Exception {
        entryFormService.update(t);
        result = "true";
        return Action.SUCCESS;
    }

    /**
     * 根据学号分页显示学生自己的报名信息（学生查看自己的报名情况）
     *
     * @return
     * @throws Exception
     */
    public String toEntryPage() throws Exception {
        //第一步：接收学号对应的值，并设置
        Object value = result;
        //判断外键学号对应的值是否为空
        if (value == null || value == "") {
            count = 0;
            list = new ArrayList<EntryForm>();
        } else {
            //第二步：调用相应的方法查询出总记录数
            count = entryFormService.stuIdFindCount(value);
            //第三步：调用相应的方法查询出（审核status已通过）的招聘计划信息，分页显示
            list = entryFormService.stuIdPage(value, t, page, limit);
        }
        //第四步：给json工具类封装数据
        this.jsonConvert(count, list);
        return "toEntryPage";
    }

    /**
     * 根据招聘计划信息主键rid分页显示学生的报名信息（实验室技术员查看报名情况）
     *
     * @return
     * @throws Exception
     */
    public String toRidEntryPage() throws Exception {
        //第一步：接收招聘计划信息主键rid对应的值，并设置
        Object a = result;
        //转为int类型
        int value = Integer.parseInt(String.valueOf(a));
        //第二步：调用相应的方法查询出总记录数
        count = entryFormService.ridFindCount(value);
        //第三步：调用相应的方法查询出学生信息，分页显示
        list = entryFormService.ridPage(value, t, page, limit);
        //第四步：给json工具类封装数据
        this.jsonConvert(count, list);
        return "toRidEntryPage";
    }

    public String toStuIdEntryPage() throws Exception {

        return "toStuIdEntryPage";
    }

    //验证报名人数是否超过招聘数量
    public String studAmount() throws Exception {
        count = entryFormService.ridFindCount(rid);
        System.out.println("count....." + count);
        //如果报名人数等于招聘数量
        if (count >= amount) {
            result = "false";
        } else {
            result = "true";
        }
        System.out.println("result....." + result);
        return Action.SUCCESS;
    }

    public int getRid() {
        return rid;
    }

    public void setRid(int rid) {
        this.rid = rid;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }
}
