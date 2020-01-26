package com.whm.assistant.action;

import cn.hutool.core.date.DateUtil;
import com.opensymphony.xwork2.Action;
import com.whm.assistant.entity.Recruit;
import com.whm.assistant.service.RecruitService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import java.util.ArrayList;
import java.util.List;

/**
 * @program: com.whm.assistant.action
 * @ClassName: RecruitAction
 * @Date: 2019/12/12 13:20
 * @Author: 王海明 (1378832252@qq.com)
 * @Description:
 */
@Controller("recruitAction")
@Scope("prototype")
public class RecruitAction extends BaseAction<Recruit> {

    @Autowired
    private RecruitService recruitService;

    /**
     * 实验室技术员去到招聘计划信息页面
     *
     * @return
     * @throws Exception
     */
    public String toPage() throws Exception {
        return "toPage";
    }

    /**
     * 添加招聘计划信息
     *
     * @return
     * @throws Exception
     */
    public String add() throws Exception {
        //当前时间字符串，格式：yyyy-MM-dd HH:mm:ss
        String now = DateUtil.now();
        //去除字符串时间的横杠、空格、冒号
        String replaceAll = now.replaceAll("[[\\s-:punct:]]", "");
        //定义招聘计划编号(规则：ZP+时间)
        String recruitId = "ZP" + replaceAll;
        t.setRecruitId(recruitId);
        //实验室技术员编号是否为空
        if (t.getUser().getUserId() == "") {
            result = "false";
        } else {
            //实验室技术员编号不为空则保存招聘计划信息
            recruitService.add(t);
            result = "true";
        }
        return Action.SUCCESS;
    }

    /**
     * 分页显示招聘计划信息
     *
     * @return
     * @throws Exception
     */
    public String findPageList() throws Exception {
        //分页查询招聘信息
        List<Recruit> list = recruitService.findPage(page, limit);
        //总记录数
        int count = recruitService.findCount();
        //给json工具类封装数据
        this.jsonConvert(count, list);
        return "findPageList";
    }

    /**
     * 根据实验室技术员编号分页显示实验室技术员所填写招聘计划信息
     *
     * @return
     * @throws Exception
     */
    public String pageList() throws Exception {
        //根据外键userId分页查询招聘信息：
        //第一步：设置外键userId对应表的名称
        String userId = "user.userId";
        //第二步：设置外键userId对应的值
        Object value = t.getUser().getUserId();
        //判断外键userId对应的值是否为空
        if (value == "") {
            list = new ArrayList<Recruit>();
        } else {
            //根据外键userId作为条件查询总记录数：
            //第三步：调用相应的方法查询出总记录数
            count = recruitService.findCount(userId, value);
            //第四步：调用相应的方法查询出查询招聘信息，分页显示
            list = recruitService.page(userId, value, t, page, limit);
        }
        //给json工具类封装数据
        this.jsonConvert(count, list);
        return "pageList";
    }

    /**
     * 修改招聘计划信息
     *
     * @return
     * @throws Exception
     */
    public String edit() throws Exception {
        recruitService.update(t);
        result = "true";
        return Action.SUCCESS;
    }

    /**
     * 删除招聘计划信息
     *
     * @return
     * @throws Exception
     */
    public String del() throws Exception {
        recruitService.delete(t);
        result = "true";
        return Action.SUCCESS;
    }

}
