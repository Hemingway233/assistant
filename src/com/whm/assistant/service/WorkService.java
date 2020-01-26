package com.whm.assistant.service;

import com.whm.assistant.dao.WorkDao;
import com.whm.assistant.entity.Work;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @program: com.whm.assistant.service
 * @ClassName: WorkService
 * @Date: 2019/12/20 10:49
 * @Author: 王海明 (1378832252@qq.com)
 * @Description:
 */
@Service("workService")
@Transactional(rollbackFor = Exception.class)
public class WorkService {

    @Autowired
    private WorkDao workDao;

    /**
     * 添加工作内容信息
     * @param work
     */
    public void add(Work work){
        workDao.add(work);
    }

    /**
     * 根据学号查询工作内容信息
     * @param value  学号对应的值
     * @param work  工作内容信息实体类
     * @param page  当前页
     * @param limit  每页记录数
     * @return
     */
    public List<Work> stuIdPage(Object value, Work work, int page, int limit) {
        //对应数据库的lab_work表的外键stuId的字段名称
        String stuId = "student.stuId";
        return workDao.page(stuId, value, work, page, limit);
    }

    /**
     * 根据学号查询lab_work表的总记录数
     * @param value  外键stuId对应的值
     * @return
     */
    public int stuIdFindCount(String value) {
        //对应数据库的lab_work表的外键stuId的字段名称
        String stuId = "stuId";
        return workDao.findCount(stuId,value);
    }

    /**
     * 根据userId查询lab_work表的总记录数
     * @param value
     * @return
     */
    public int userIdFindCount(String value) {
        //对应数据库的lab_work表的外键userId的字段名称
        String userId = "userId";
        return workDao.findCount(userId,value);
    }

    /**
     *
     * @param value
     * @param work
     * @param page
     * @param limit
     * @return
     */
    public List<Work> userIdPage(Object value, Work work, int page, int limit) {
        //对应数据库的lab_work表的外键userId的字段名称
        String userId = "user.userId";
        return workDao.page(userId, value, work, page, limit);
    }
}
